
#ifndef CA_BASE_HPP
#define CA_BASE_HPP

#include <functional>
#include <grid.hpp>

using update_func_t =
    std::function<void(uint8_t *, uint8_t *, uint8_t *, uint8_t *, uint8_t *,
                       uint8_t *, uint8_t *, uint8_t *, uint8_t *, uint8_t *)>;

#endif