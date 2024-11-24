
#ifndef OMP_HPP
#define OMP_HPP

#include <omp.h>

#include "ca_base.hpp"
#include "update_funcs.hpp"

class Omp : public CA {
   protected:
    void simulate_single();

   public:
    Omp(Grid &grid, update_func_t update_func = seq_update_func)
        : CA(grid, update_func) {};
    ~Omp() {};
};

void Omp::simulate_single() {
    size_t rows = grid.get_rows();
    size_t cols = grid.get_cols();

#pragma omp parallel for collapse(2)
    for (size_t i = 0; i < rows; i++) {
        /* Iterator over row increase by vector size */
        for (size_t j = 0; j < cols; j += 32) {
            uint8_t *center = grid.get_data(i, j);
            uint8_t *out = next_grid.get_data(i, j);
            auto neighbors = grid.get_neighbors(i, j);
            update_func(center, neighbors, out);
        }
    }

    swap(grid, next_grid);
    generation++;
}

#endif