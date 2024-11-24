
#ifndef CA_BASE_HPP
#define CA_BASE_HPP

#include "grid.hpp"
#include "update_funcs.hpp"

class CA {
   protected:
    size_t generation;
    Grid &grid, next_grid;
    update_func_t update_func;

    virtual void simulate_single() = 0;

   public:
    CA(Grid &grid, update_func_t update_func = seq_update_func)
        : generation(0),
          grid(grid),
          update_func(update_func),
          next_grid(grid.get_rows(), grid.get_cols()) {};

    ~CA() {};

    virtual void simulate(unsigned steps);
    size_t get_generation() { return generation; };
    const Grid &get_grid() const { return grid; };
};

void CA::simulate(unsigned steps = 1) {
    for (size_t i = 0; i < steps; i++) {
        simulate_single();
    }
}

#endif