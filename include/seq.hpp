
#ifndef SEQ_HPP
#define SEQ_HPP

#include "ca_base.hpp"
#include "update_funcs.hpp"
#include "gif.hpp"

class Seq : public CA {
   public:
    void simulate_single_with_output(const char* filename, unsigned steps);

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

void Seq::simulate_single_with_output(const char* filename, unsigned steps = 1) {

    size_t rows = grid.get_rows();
    size_t cols = grid.get_cols();

    static uint8_t* image;
    image = new uint8_t[rows * cols * 4];
    GifWriter writer = {};
    GifBegin( &writer, filename, cols, rows, 5, 8, true );

    std::cout << "Output GIF file:" << std::endl;

    for (int step = 0; step < steps; step++){

        for (size_t i = 0; i < rows; i++) {
            /* Iterator over row increase */
            for (size_t j = 0; j < cols; j+=32) {
                uint8_t *center = grid.get_data(i, j);
                uint8_t *out = next_grid.get_data(i, j);
                auto neighbors = grid.get_neighbors(i, j);

                for (int k = 0; k < 32; k++){
                    int sum = 0;
                    for (auto n: neighbors){
                        sum+=n[k];
                    }
                    out[k] = (sum == 3 || (sum == 2 && center[k]));

                    /* Making frames */
                    uint8_t* pixel = &image[(i * rows + j + k) * 4];
                
                    if (center[k]){
                        pixel[0] = 0;
                        pixel[1] = 0;
                        pixel[2] = 0;
                        pixel[3] = 0;
                    }else{
                        pixel[0] = 255;
                        pixel[1] = 255;
                        pixel[2] = 255;
                        pixel[3] = 255;
                    }

                }


            }
        }

        std::cout << "Writing frame " << step << "..." << std::endl;
        GifWriteFrame( &writer, image, cols, rows, 2, 8, true );

        swap(grid, next_grid);
        generation++;

    }

    std::cout << "Writing frame " << steps << "..." << std::endl;
    GifWriteFrame( &writer, image, cols, rows, 2, 8, true );

    GifEnd(&writer);

}

#endif