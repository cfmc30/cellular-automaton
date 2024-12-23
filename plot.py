import json
import matplotlib.pyplot as plt
from enum import Enum

file_name = "out.json"

name_list = ["SEQ_SEQ","SEQ_SIMD","OMP_SEQ","OMP_SIMD","MULTI_THREAD_SEQ","MULTI_THREAD_SIMD","MPI_SEQ","MPI_SIMD",]
num_thread_list = [1,2,3,4,5,6]
iteration_list = [100, 200,300]
grid_size_list = [500,1000,1500]
num_thread_list = [str(item) for item in num_thread_list]
iteration_list = [str(item) for item in iteration_list]
grid_size_list = [str(item) for item in grid_size_list]

with open(file_name, 'r') as file:
    data = json.load(file)

class Axis(Enum):
    NUM_THREAD = 0
    ITERATION = 1
    GRID_SIZE = 2

def plot(nids, axis, file_name):
    file_name += ".jpg"
    if axis == Axis.NUM_THREAD:
        x = num_thread_list
        name = "number of threads"
    elif axis == Axis.ITERATION:
        x = iteration_list
        name = "iteration"
    elif axis == Axis.GRID_SIZE:
        x = grid_size_list
        name = "grid size"
    
    for nid in nids:
        tmp_list = []
        for it in x:
            arg = ["4", "100", "1000"]
            arg[axis.value] = it
            tmp_list.append(data[name_list[nid]][arg[0]][arg[1]][arg[2]])
        plt.plot(x, tmp_list, label=name_list[nid], marker='o')
    plt.xlabel(name)
    plt.ylabel("real time (ms)")
    plt.title("")
    plt.legend()
    plt.grid(True)
    plt.savefig(file_name, format='jpg', dpi=300)
    plt.clf()
    plt.close('all')

    


# SIMD vs Non-SIMD
for nid in [0,2,4,6]:
    plot([nid, nid+1], Axis.ITERATION, f"simd_vs_non_simd{nid}")

# omp vs pthread
for axis in Axis:
    plot([2,4], axis, f"omp_vs_pthread{axis.value}")

# mpi
for axis in [Axis.NUM_THREAD, Axis.ITERATION]:
    plot([6], axis, f"mpi{axis.value}")

# all
for axis in Axis:
    if axis == Axis.NUM_THREAD:
        nids = range(2,8)
    else:
        nids = range(8)
    plot(nids, axis, f"all{axis.value}")