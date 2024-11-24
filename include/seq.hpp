
#ifndef SEQ_HPP
#define SEQ_HPP

#include <immintrin.h>

#include "ca_base.hpp"

// each pointer points to a 32 element array of uint8_t
update_func_t seq_update_func = [](uint8_t *center, Grid::neighbor_t &neighbors,
                                   uint8_t *out) {
    for (int i = 0; i < 32; i++) {
        int sum = 0;
        for (auto n : neighbors) {
            sum += n[i];
        }
        out[i] = (sum == 3 || (sum == 2 && center[i]));
    }
};

update_func_t simd_update_func = [](uint8_t *center,
                                    Grid::neighbor_t &neighbors, uint8_t *out) {
    __m256i sum = _mm256_setzero_si256();
    for (auto n : neighbors) {
        __m256i neighbor = _mm256_loadu_si256((__m256i *)n);
        sum = _mm256_add_epi8(sum, neighbor);
    }

    __m256i three = _mm256_set1_epi8(3);
    __m256i two = _mm256_set1_epi8(2);
    __m256i one = _mm256_set1_epi8(1);
    __m256i mask = _mm256_cmpeq_epi8(sum, three);
    __m256i mask2 = _mm256_and_si256(_mm256_cmpeq_epi8(sum, two),
                                     _mm256_loadu_si256((__m256i *)center));
    __m256i result = _mm256_or_si256(mask, mask2);
    result = _mm256_and_si256(result, one);

    _mm256_storeu_si256((__m256i *)out, result);
};

class Seq {
   private:
    size_t generation;
    Grid &grid, next_grid;
    update_func_t update_func;

    void simulate_single();

   public:
    Seq(Grid &grid, update_func_t update_func = seq_update_func)
        : generation(0),
          grid(grid),
          update_func(update_func),
          next_grid(grid.get_rows(), grid.get_cols()) {};

    ~Seq() = default;

    void simulate(unsigned steps);
    size_t get_generation();
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

void Seq::simulate(unsigned steps = 1) {
    for (size_t i = 0; i < steps; i++) {
        simulate_single();
    }
}

#endif