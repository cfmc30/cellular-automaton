#ifndef GRID_HPP
#define GRID_HPP

#include <cstdint>
#include <cstddef>
#include <iostream>

class Grid {
private:
    int rows;
    int cols;
    uint8_t *data;
public:
    Grid(int rows, int cols);
    ~Grid();

    uint8_t operator()(int row, int col) const;
    uint8_t& operator()(int row, int col);

    uint8_t* get_data() { return data; }
    size_t get_rows() { return rows; }
    size_t get_cols() { return cols; }

    // overload << to print
    friend std::ostream& operator<<(std::ostream& os, const Grid& grid);

};

std::ostream& operator<<(std::ostream& os, const Grid& grid) {
    for (int i = 0; i < grid.rows; i++) {
        for (int j = 0; j < grid.cols; j++) {
            os << (grid(i, j) ? '*' : ' ');
        }
        os << std::endl;
    }
    return os;
}

Grid::Grid(int rows, int cols) : rows(rows), cols(cols) {
    data = new uint8_t[rows * cols];
}

Grid::~Grid() {
    delete[] data;
}

uint8_t Grid::operator()(int row, int col) const {
    return data[row * cols + col];
}

uint8_t& Grid::operator()(int row, int col) {
    return data[row * cols + col];
}

#endif