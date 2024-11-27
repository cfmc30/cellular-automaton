#include <benchmark/benchmark.h>
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

class NullReporter : public ::benchmark::BenchmarkReporter {
public:
  NullReporter() {}
  virtual bool ReportContext(const Context &) {return true;}
  virtual void ReportRuns(const std::vector<Run> &) {}
  virtual void Finalize() {}
};


auto BM_CA = [](benchmark::State& state, auto ca) {
  for (auto _ : state){
    //state.PauseTiming();
    ca.simulate();
    //state.ResumeTiming();
  }
};

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

int main(int argc, char** argv) {     

  MPI_Init(NULL, NULL);
  int world_rank, world_size;
  MPI_Comm_size(MPI_COMM_WORLD, &world_size);
  MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);

  char arg0_default[] = "benchmark";                                  
  char* args_default = arg0_default;                                  
  if (!argv) {                                                        
    argc = 1;                                                         
    argv = &args_default;                                             
  }                                                                   

  int IsOutputGIF = atoi(argv[argc-1]);

  Simulate simulate(atoi(argv[argc-2 - IsOutputGIF]));
  const size_t rows = atoi(argv[argc-4 - IsOutputGIF]);
  const size_t cols = atoi(argv[argc-3 - IsOutputGIF]);

  srand(time(NULL));

  Grid grid(rows, cols);

  /*
  grid(0, 1) = Grid::ALIVE;
  grid(1, 2) = Grid::ALIVE;
  grid(2, 0) = Grid::ALIVE;
  grid(2, 1) = Grid::ALIVE;
  grid(2, 2) = Grid::ALIVE;
  */

  // grid(10, 10 + 30) = Grid::ALIVE;
  // grid(10, 11 + 30) = Grid::ALIVE;
  // grid(10, 12 + 30) = Grid::ALIVE;

  // random generate input
  for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
          grid(i, j) = rand() % 2;
      }
  }

  Grid grid_ref = grid;
  Seq ref_ca(grid_ref, seq_update_func);

  if (IsOutputGIF){
    ref_ca.simulate_single_with_output(argv[argc-2], simulate.times);
  }else{
    ref_ca.simulate(simulate.times);
  }

  
  Grid grid_seq_seq = grid, grid_seq_simd = grid;
  Seq seq_seq_ca(grid_seq_seq, seq_update_func);
  Seq seq_simd_ca(grid_seq_simd, simd_update_func);
  ::benchmark::RegisterBenchmark("SEQ_SEQ", BM_CA, seq_seq_ca)->Iterations(simulate.times);
  ::benchmark::RegisterBenchmark("SEQ_SIMD", BM_CA, seq_simd_ca)->Iterations(simulate.times);

  Grid grid_omp_seq = grid, grid_omp_simd = grid;
  Omp omp_seq_ca(grid_omp_seq, seq_update_func);
  Omp omp_simd_ca(grid_omp_simd, simd_update_func);
  ::benchmark::RegisterBenchmark("OMP_SEQ", BM_CA, omp_seq_ca)->Iterations(simulate.times);
  ::benchmark::RegisterBenchmark("OMP_SIMD", BM_CA, omp_simd_ca)->Iterations(simulate.times);

  Grid grid_multi_thread_seq = grid, grid_multi_thread_simd = grid;
  MultiThread multi_thread_seq_ca(grid_multi_thread_seq, seq_update_func);
  MultiThread multi_thread_simd_ca(grid_multi_thread_simd, simd_update_func);
  ::benchmark::RegisterBenchmark("MULTI_THREAD_SEQ", BM_CA, multi_thread_seq_ca)->Iterations(simulate.times);
  ::benchmark::RegisterBenchmark("MULTI_THREAD_SIMD", BM_CA, multi_thread_simd_ca)->Iterations(simulate.times);

  Grid grid_mpi_seq = grid, grid_mpi_simd = grid;
  Mpi mpi_seq_ca(grid_mpi_seq, seq_update_func);
  Mpi mpi_simd_ca(grid_mpi_simd, simd_update_func);
  ::benchmark::RegisterBenchmark("MPI_SEQ", BM_CA, mpi_seq_ca)->Iterations(simulate.times);
  ::benchmark::RegisterBenchmark("MPI_SIMD", BM_CA, mpi_simd_ca)->Iterations(simulate.times);

  ::benchmark::Initialize(&argc, argv);   

  if (world_rank == 0){
    
    std::cout << "Generating random testcase and its solution..." << std::endl;
    std::cout << "Start testing..." << std::endl;

    ::benchmark::RunSpecifiedBenchmarks(); 

    std::cout << "seq Update func: seq" << std::endl;
    print_result(grid_seq_seq == grid_ref);
    std::cout << "seq Update func: simd" << std::endl;
    print_result(grid_seq_simd == grid_ref);
    std::cout << "omp Update func: seq" << std::endl;
    print_result(grid_omp_seq == grid_ref);
    std::cout << "omp Update func: simd" << std::endl;
    print_result(grid_omp_simd == grid_ref);
    std::cout << "multi_thread Update func: seq" << std::endl;
    print_result(grid_multi_thread_seq == grid_ref);
    std::cout << "multi_thread Update func: simd" << std::endl;
    print_result(grid_multi_thread_simd == grid_ref);
    std::cout << "mpi Update func: seq" << std::endl;
    print_result(grid_mpi_seq == grid_ref);
    std::cout << "mpi Update func: simd" << std::endl;
    print_result(grid_mpi_simd == grid_ref);

  }
  else{
    NullReporter null;
    ::benchmark::RunSpecifiedBenchmarks(&null);
  }

  ::benchmark::Shutdown();  

  MPI_Finalize();

  return 0;                                                           
} 