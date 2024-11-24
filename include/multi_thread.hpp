
#ifndef MT_HPP
#define MT_HPP

#include <pthread.h>

#include <queue>

#include "ca_base.hpp"
#include "update_funcs.hpp"

class MultiThread : public CA {
   protected:
    void simulate_single();

   public:
    MultiThread(Grid &grid, update_func_t update_func = seq_update_func)
        : CA(grid, update_func) {};
    ~MultiThread() {};
};

void MultiThread::simulate_single() {
    size_t rows = grid.get_rows();
    size_t cols = grid.get_cols();

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