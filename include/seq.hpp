
#ifndef SEQ_HPP
#define SEQ_HPP

#include "ca_base.hpp"
#include "update_funcs.hpp"

class Seq : public CA {
   protected:
    void simulate_single();

   public:
    Seq(Grid &grid, update_func_t update_func = seq_update_func)
        : CA(grid, update_func) {};
    ~Seq() {};
};

void Seq::simulate_single() {
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