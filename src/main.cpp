#include <unistd.h>

#include <ca.hpp>

int main() {
    Grid grid(50000, 50000);
    grid(0, 1) = Grid::ALIVE;
    grid(1, 2) = Grid::ALIVE;
    grid(2, 0) = Grid::ALIVE;
    grid(2, 1) = Grid::ALIVE;
    grid(2, 2) = Grid::ALIVE;

    grid(10, 10 + 30) = Grid::ALIVE;
    grid(10, 11 + 30) = Grid::ALIVE;
    grid(10, 12 + 30) = Grid::ALIVE;

    // Seq ca(grid, seq_update_func);
    // Seq ca(grid, simd_update_func);
    Omp ca(grid, simd_update_func);
    // Omp ca(grid, seq_update_func);
    ca.simulate(1);

    return 0;
}