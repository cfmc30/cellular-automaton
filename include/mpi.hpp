#ifndef MPI_HPP
#define MPI_HPP

#include <mpi.h>
#include "ca_base.hpp"
#include "update_funcs.hpp"

#include <limits.h>

#if SIZE_MAX == UCHAR_MAX
   #define my_MPI_SIZE_T MPI_UNSIGNED_CHAR
#elif SIZE_MAX == USHRT_MAX
   #define my_MPI_SIZE_T MPI_UNSIGNED_SHORT
#elif SIZE_MAX == UINT_MAX
   #define my_MPI_SIZE_T MPI_UNSIGNED
#elif SIZE_MAX == ULONG_MAX
   #define my_MPI_SIZE_T MPI_UNSIGNED_LONG
#elif SIZE_MAX == ULLONG_MAX
   #define my_MPI_SIZE_T MPI_UNSIGNED_LONG_LONG
#else
   #error "oh oh"
#endif

#define START 0
#define END 1
#define ROW 2
#define GRID 3

class Mpi : public CA {
   protected:
    void simulate_single();

   public:
    Mpi(Grid &grid, update_func_t update_func = seq_update_func)
        : CA(grid, update_func) {};
    ~Mpi() {};
};

void Mpi::simulate_single() {

    int world_rank, world_size;

    MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);
    MPI_Comm_size(MPI_COMM_WORLD, &world_size);

    size_t rows = grid.get_rows();
    size_t cols = grid.get_cols();
    size_t real_cols = grid.get_real_cols();
    size_t each_rows = rows / world_size;

    size_t Start, End;

    if (world_rank == 0){

        for (int i = 1; i < world_size; i++){
            Start = (i - 1) * each_rows;
            End = Start + each_rows;
            MPI_Send(&Start, 1, my_MPI_SIZE_T, i, END, MPI_COMM_WORLD);
            MPI_Send(&End, 1, my_MPI_SIZE_T, i, START, MPI_COMM_WORLD);
            MPI_Send(grid.get_data(0, 0), rows * real_cols, MPI_UINT8_T, i, GRID, MPI_COMM_WORLD);
        }

        for (size_t i = (world_size - 1) * each_rows; i < rows; i++) {
            /* Iterator over row increase by vector size */
            for (size_t j = 0; j < cols; j += 32) {
                uint8_t *center = grid.get_data(i, j);
                uint8_t *out = next_grid.get_data(i, j);
                auto neighbors = grid.get_neighbors(i, j);
                update_func(center, neighbors, out);
            }
        }

        MPI_Request requests[world_size - 1];

        for (int i = 1; i < world_size; i++){
            MPI_Irecv(&next_grid( (i-1) * each_rows, 0), each_rows * real_cols, MPI_UINT8_T, i, ROW, MPI_COMM_WORLD, &requests[i - 1]);
        }

        MPI_Waitall(world_size - 1, &requests[0], MPI_STATUS_IGNORE);

        swap(grid, next_grid);
        generation++;
        
    }
    else{

        MPI_Recv(&Start, 1, my_MPI_SIZE_T, 0, END, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
        MPI_Recv(&End, 1, my_MPI_SIZE_T, 0, START, MPI_COMM_WORLD, MPI_STATUS_IGNORE);

        Grid whole_grid(rows, cols);
        MPI_Recv(whole_grid.get_data(0, 0), rows * real_cols, MPI_UINT8_T, 0, GRID, MPI_COMM_WORLD, MPI_STATUS_IGNORE);

        Grid tmp(End - Start, cols);

        for (size_t i = Start; i < End; i++) {
            /* Iterator over row increase by vector size */
            for (size_t j = 0; j < cols; j += 32) {
                uint8_t *center = whole_grid.get_data(i, j);
                uint8_t *out = tmp.get_data(i - Start, j);
                auto neighbors = whole_grid.get_neighbors(i, j);
                update_func(center, neighbors, out);
            }
        }
        MPI_Send(tmp.get_data(0, 0), (End - Start) * real_cols, MPI_UINT8_T, 0, ROW, MPI_COMM_WORLD);

    }

}

#endif