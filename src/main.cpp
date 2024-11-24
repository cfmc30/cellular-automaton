#include <ca.hpp>

#include <unistd.h>

int main()
{
    Grid grid(30, 100);
    grid(0, 1) = Grid::ALIVE;
    grid(1, 2) = Grid::ALIVE;
    grid(2, 0) = Grid::ALIVE;
    grid(2, 1) = Grid::ALIVE;
    grid(2, 2) = Grid::ALIVE;

    grid(10, 10 + 30) = Grid::ALIVE;
    grid(10, 11 + 30) = Grid::ALIVE;
    grid(10, 12 + 30) = Grid::ALIVE;

    Seq seq(grid);
    for (int i = 0; i < 10000; i++) {
        std::cout << grid << std::endl;
        // print grid.data() address
        std::cout << (void *)grid.get_data(0, 0) << std::endl;

        seq.simulate(1);
        usleep(100000);
    }
    
    return 0;
}