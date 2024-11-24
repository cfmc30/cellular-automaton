
#ifndef UPDATE_FN_HPP
#define UPDATE_FN_HPP

#include <immintrin.h>

#include <functional>
#include <grid.hpp>

using update_func_t =
    std::function<void(uint8_t *, Grid::neighbor_t &, uint8_t *)>;

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

#endif