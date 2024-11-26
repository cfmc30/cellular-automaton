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
#define DONE 2

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
    size_t each_cols = cols / world_size;

    size_t Start, End;

    if (world_rank == 0){

        for (int i = 1; i < world_size; i++){
            Start = (i - 1) * each_cols;
            End = Start + each_cols;
            MPI_Send(&Start, 1, my_MPI_SIZE_T, i, END, MPI_COMM_WORLD);
            MPI_Send(&End, 1, my_MPI_SIZE_T, i, START, MPI_COMM_WORLD);
        }

        for (size_t i = 0; i < rows; i++) {
            /* Iterator over row increase by vector size */
            for (size_t j = (world_size - 1) * each_cols; j < cols; j += 32) {
                uint8_t *center = grid.get_data(i, j);
                uint8_t *out = next_grid.get_data(i, j);
                auto neighbors = grid.get_neighbors(i, j);
                update_func(center, neighbors, out);
            }
        }

        MPI_Request requests[world_size - 1];
        int* dones = new int[world_size - 1];

        for (int i = 1; i < world_size; i++){
            MPI_Irecv(&dones[i - 1], 1, MPI_INT, i, DONE, MPI_COMM_WORLD, &requests[i - 1]);
        }

        MPI_Waitall(world_size - 1, &requests[0], MPI_STATUS_IGNORE);

        swap(grid, next_grid);
        generation++;
        
    }
    else{

        MPI_Recv(&Start, 1, my_MPI_SIZE_T, 0, END, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
        MPI_Recv(&End, 1, my_MPI_SIZE_T, 0, START, MPI_COMM_WORLD, MPI_STATUS_IGNORE);

        for (size_t i = 0; i < rows; i++) {
            /* Iterator over row increase by vector size */
            for (size_t j = Start; j < End; j += 32) {
                uint8_t *center = grid.get_data(i, j);
                uint8_t *out = next_grid.get_data(i, j);
                auto neighbors = grid.get_neighbors(i, j);
                update_func(center, neighbors, out);
            }
        }
        int done = 1;

        MPI_Send(&done, 1, MPI_INT, 0, DONE, MPI_COMM_WORLD);

    }

}

#endif