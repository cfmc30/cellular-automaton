
#ifndef SEQ_HPP
#define SEQ_HPP

#include "ca_base.hpp"


// each pointer points to a 32 element array of uint8_t
update_func_t seq_update_func = [](uint8_t *nw, uint8_t *n, uint8_t *ne, uint8_t *w, uint8_t *c, uint8_t *e, uint8_t *sw, uint8_t *s, uint8_t *se, uint8_t *out) {
    for (int i = 0; i < 32; i++) {
        int sum = nw[i] + n[i] + ne[i] + w[i] + e[i] + sw[i] + s[i] + se[i];
        out[i] = (sum == 3 || (sum == 2 && c[i]));
    }
};

class Seq {
   private:
    size_t generation;
    Grid &grid, next_grid;
    update_func_t update_func;

   public:
    Seq(Grid &grid, update_func_t update_func = seq_update_func) : generation(0), grid(grid), update_func(update_func) {
        next_grid = Grid(grid.get_rows(), grid.get_cols());
    };

    ~Seq();

    void simulate(unsigned steps = 1);
    size_t get_generation();
};

void Seq::simulate(unsigned steps = 1) {
    for (size_t i = 0; i < steps; i++) {
        size_t rows = grid.get_rows();
        size_t cols = grid.get_cols();
        uint8_t *data = grid.get_data();
        uint8_t *next_data = next_grid.get_data();


        std::swap(grid, next_grid);
        generation++;
    }
}

#endif