#include <sys/time.h>
#include <unistd.h>
#include <mpi.h>
#include <ca.hpp>
#include <cassert>
#include <math.h>

struct Simulate{
    const int times;
    Simulate(int t) : times(t){}
};

void print_result(bool result);

bool test_ca(CA &ca, std::string ca_name, std::string fn_name, Grid &ans, const int times) {
    struct timeval start, end;
    gettimeofday(&start, NULL);
    ca.simulate(times);
    gettimeofday(&end, NULL);

    std::cout << ca_name << " " << "Update func: " << fn_name << " Time: "
              << (end.tv_sec - start.tv_sec) +
                     (double)(end.tv_usec - start.tv_usec) / (1000 * 1000)
              << " sec" << std::endl;
    bool result = ca.get_grid() == ans;
    // std::cout << ca.get_grid() << std::endl << ans << std::endl;
    print_result(result);
    return ca.get_grid() == ans;
}

void print_result(bool result) {
    if (result == false) {
        // red color
        std::cout << "\033[31m";
        std::cout << "Test failed" << std::endl;
        std::cout << "\033[0m";
    }
    else {
        // green color
        std::cout << "\033[32m";
        std::cout << "Test passed" << std::endl;
        std::cout << "\033[0m";
    }
}

int main(int argc, char **argv) {

    MPI_Init(NULL, NULL);
    int world_rank, world_size;
    MPI_Comm_size(MPI_COMM_WORLD, &world_size);
    MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);

    if (world_rank > 0) return 0;

    Simulate simulate(atoi(argv[1]));
    srand(time(NULL));
    const size_t rows = 1000;
    const size_t cols = 1000;

    Grid grid(rows, cols);
    // grid(0, 1) = Grid::ALIVE;
    // grid(1, 2) = Grid::ALIVE;
    // grid(2, 0) = Grid::ALIVE;
    // grid(2, 1) = Grid::ALIVE;
    // grid(2, 2) = Grid::ALIVE;

    // grid(10, 10 + 30) = Grid::ALIVE;
    // grid(10, 11 + 30) = Grid::ALIVE;
    // grid(10, 12 + 30) = Grid::ALIVE;

    // random generate input
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            grid(i, j) = rand() % 2;
        }
    }

    Grid ref_grid = grid;
    Grid ans_grid = grid;
    Seq ref_ca(ans_grid, seq_update_func);

    std::cout << "Generating random testcase and its solution..." << std::endl;

    ref_ca.simulate_single_with_output(argv[2], simulate.times);
    //ref_ca.simulate(simulate.times);

    std::vector<update_func_t> funcs = {seq_update_func, simd_update_func};
    std::vector<std::string> func_names = {"seq", "simd"};
    // test seq with simd
    
    std::cout << "Start testing..." << std::endl;
    
    // test seq
    for (size_t i = 0; i < funcs.size(); i++) {
        Grid grid = ref_grid;
        // std::cout << grid << std::endl;
        Seq seq_ca(grid, funcs[i]);
        test_ca(seq_ca, "Seq", func_names[i], ans_grid, simulate.times);
        
    }
    // test omp
    for (size_t i = 0; i < funcs.size(); i++) {
        Grid grid = ref_grid;
        // std::cout << grid << std::endl;
        Omp omp_ca(grid, funcs[i]);
        test_ca(omp_ca, "Omp", func_names[i], ans_grid, simulate.times);
    }

    // test multi_thread
    for (size_t i = 0; i < funcs.size(); i++) {
        Grid grid = ref_grid;
        // std::cout << grid << std::endl;
        MultiThread mt_ca(grid, funcs[i]);
        test_ca(mt_ca, "MultiThread", func_names[i], ans_grid, simulate.times);
    }

    //test mpi
    for (size_t i = 0; i < funcs.size(); i++) {
        Grid grid = ref_grid;
        // std::cout << grid << std::endl;
        Seq seq_ca(grid, funcs[i]);
        test_ca(seq_ca, "Mpi", func_names[i], ans_grid, simulate.times);
        
    }

    // Omp ca(grid, simd_update_func);
    // Omp ca(grid, seq_update_func);

    return 0;
}