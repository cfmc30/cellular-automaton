#ifndef GRID_HPP
#define GRID_HPP

#include <array>
#include <cstddef>
#include <cstdint>
#include <iostream>

class Grid {
   private:
    size_t rows, cols;
    size_t real_rows, real_cols;
    size_t margin_rows, margin_cols;
    uint8_t *data;

   public:
    using neighbor_t = std::array<uint8_t *, 8>;

    enum state : uint8_t { DEAD = 0, ALIVE = 1 };

    Grid(int rows, int cols);
    Grid(const Grid &);
    Grid(Grid &&);
    ~Grid();

    uint8_t operator()(int row, int col) const;
    uint8_t &operator()(int row, int col);

    // uint8_t* get_data() { return data; }
    uint8_t *get_data(int row, int col) {
        return data + (row + 1) * real_cols + col + 1;
    }
    uint8_t *get_data_by_row(int row) {
        return data + (row + 1) * real_cols + 1;
    }

    size_t get_rows() { return rows; }
    size_t get_cols() { return cols; }
    size_t get_real_rows() { return real_rows; }
    size_t get_real_cols() { return real_cols; }
    void swap(Grid &other) noexcept {
        std::swap(rows, other.rows);
        std::swap(cols, other.cols);
        std::swap(real_rows, other.real_rows);
        std::swap(real_cols, other.real_cols);
        std::swap(margin_rows, other.margin_rows);
        std::swap(margin_cols, other.margin_cols);
        std::swap(data, other.data);
    }

    neighbor_t get_neighbors(int row, int col) {
        // +----+-----------+----+
        // | TL(0) |     T (1)     | TR (2) |
        // +----+-----------+----+
        // | L (3)  | (row,col) | R (4) |
        // +----+-----------+----+
        // | BL (5) |     B (6)    | BR (7) |
        // +----+-----------+----+
        return {get_data(row - 1, col - 1), get_data(row - 1, col),
                get_data(row - 1, col + 1), get_data(row, col - 1),
                get_data(row, col + 1),     get_data(row + 1, col - 1),
                get_data(row + 1, col),     get_data(row + 1, col + 1)};
    }

    // overload << to print
    friend std::ostream &operator<<(std::ostream &os, const Grid &grid);
};

std::ostream &operator<<(std::ostream &os, const Grid &grid) {
    for (int i = 0; i < grid.rows; i++) {
        for (int j = 0; j < grid.cols; j++) {
            os << (grid(i, j) ? '*' : ' ');
            // os << (int)grid(i, j);
        }
        os << std::endl;
    }
    return os;
}

void swap(Grid &lhs, Grid &rhs) noexcept { lhs.swap(rhs); }

Grid::Grid(int rows, int cols) : rows(rows), cols(cols) {
    /* Compute margin size */
    const size_t vec_size = 32;
    margin_rows = 1 + rows % vec_size + 1;
    margin_cols = 1 + cols % vec_size + 1;
    real_rows = rows + margin_rows;
    real_cols = cols + margin_cols;
    data = new uint8_t[(rows + margin_rows) * (cols + margin_cols)];
    std::fill(data, data + (rows + margin_rows) * (cols + margin_cols), 0);
}

Grid::~Grid() { delete[] data; }

uint8_t Grid::operator()(int row, int col) const {
    return data[(row + 1) * real_cols + col + 1];
}

uint8_t &Grid::operator()(int row, int col) {
    return data[(row + 1) * real_cols + col + 1];
}

#endif