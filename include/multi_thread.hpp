
#ifndef MT_HPP
#define MT_HPP

#include <pthread.h>
#include <semaphore.h>

#include <queue>
#include <vector>

#include "ca_base.hpp"
#include "update_funcs.hpp"


struct ThreadData {
    size_t start;
    size_t end;
    Grid *grid;
    Grid *next_grid;
    sem_t *wake;
    pthread_barrier_t *barrier;
    update_func_t update_func;
    bool is_done;
};

class MultiThread : public CA {
   protected:
    void simulate_single();

    static void *worker(void *arg) {
        // std::cout << "worker" << std::endl;
        ThreadData *data = (ThreadData *)arg;
        // wait for signal
        while (true) {
            sem_wait(data->wake);
            if (data->is_done) {
                break;
            }
            size_t start = data->start;
            size_t end = data->end;
            size_t rows = data->grid->get_rows();
            size_t cols = data->grid->get_cols();
            Grid &grid = *data->grid;
            Grid &next_grid = *data->next_grid;
            update_func_t update_func = data->update_func;
            for (size_t i = start; i < end; i++) {
                /* Iterator over row increase by vector size */
                for (size_t j = 0; j < cols; j += 32) {
                    uint8_t *center = grid.get_data(i, j);
                    uint8_t *out = next_grid.get_data(i, j);
                    auto neighbors = grid.get_neighbors(i, j);
                    update_func(center, neighbors, out);
                }
            }
            pthread_barrier_wait(data->barrier);
        }
        return NULL;
    }

   public:
    MultiThread(Grid &grid, update_func_t update_func = seq_update_func)
        : CA(grid, update_func) {};

    void simulate(unsigned steps = 1) override;

    ~MultiThread() {};
};

void MultiThread::simulate(unsigned steps) {
    const size_t num_threads = 16;
    std::vector<pthread_t> threads(num_threads);
    // semaphores
    std::vector<sem_t> sems(num_threads);
    for (size_t i = 0; i < num_threads; i++) {
        sem_init(&sems[i], 0, 0);
    }

    std::vector<ThreadData> thread_data(num_threads);
    // initialize thread data
    pthread_barrier_t barrier;
    pthread_barrier_init(&barrier, NULL, num_threads);
    for (size_t i = 0; i < num_threads; i++) {
        thread_data[i].start = i * grid.get_rows() / num_threads;
        thread_data[i].end = (i + 1) * grid.get_rows() / num_threads;
        thread_data[i].grid = &grid;
        thread_data[i].next_grid = &next_grid;
        thread_data[i].wake = &sems[i];
        thread_data[i].update_func = update_func;
        thread_data[i].is_done = false;
        thread_data[i].barrier = &barrier;
    }
    if (grid.get_rows() % num_threads != 0) {
        thread_data[num_threads - 1].end = grid.get_rows();
    }
    
    for (size_t i = 0; i < num_threads; i++) {
        pthread_create(&threads[i], NULL, MultiThread::worker,
                        &thread_data[i]);
    }
    for (size_t s = 0; s < steps; s++) {
        // 兄弟快工作
        for (size_t i = 0; i < num_threads; i++) {
            sem_post(&sems[i]);
        }

        // wait for all threads to finish
        pthread_barrier_wait(&barrier);

        swap(grid, next_grid);
        generation++;
    }
    // 兄弟們收工
    for (size_t i = 0; i < num_threads; i++) {
        thread_data[i].is_done = true;
        sem_post(&sems[i]);
    }
    
}

void MultiThread::simulate_single() {
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

#endif