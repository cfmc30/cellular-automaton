import subprocess
import json
import time


output_file_name = "out.json"
tmp_file_name = "tmp.json"

name_list = ["SEQ_SEQ","SEQ_SIMD","OMP_SEQ","OMP_SIMD","MULTI_THREAD_SEQ","MULTI_THREAD_SIMD","MPI_SEQ","MPI_SIMD",]
num_thread_list = [1,2,3,4,5,6]
iteration_list = [100, 200,300]
grid_size_list = [500,1000,1500]
num_thread_list = [str(item) for item in num_thread_list]
iteration_list = [str(item) for item in iteration_list]
grid_size_list = [str(item) for item in grid_size_list]

try:
    with open(output_file_name, 'r') as file:
        all_data_dict = json.load(file)
except:
    all_data_dict = dict()

for num_thread in num_thread_list:
    print("num_thread:", num_thread)
    for iteration in iteration_list:
        print("\titeration:",iteration)
        for grid_size in grid_size_list:
            print("\t\tgrid_size:",grid_size)
            num_thread_dict = all_data_dict.get(name_list[0], dict())
            iteration_dict = num_thread_dict.get(num_thread, dict())
            grid_size_dict = iteration_dict.get(iteration, dict())
            if grid_size_dict.get(grid_size) is not None:
                continue
            print("./CA","-f","json", tmp_file_name,"-p",str(num_thread),"-n",str(iteration),"-s",str(grid_size),str(grid_size),"-t","ms")
            result = subprocess.run(["./CA","-f","json", tmp_file_name,"-p",str(num_thread),"-n",str(iteration),"-s",str(grid_size),str(grid_size),"-t","ms"], capture_output=True, text=True)
            while True:
                try:
                    with open(tmp_file_name, 'r') as file:
                        data = json.load(file)
                    break
                except KeyboardInterrupt:
                    exit()
                except:
                    time.sleep(1)
            for benchmark in data["benchmarks"]:
                name = benchmark["name"].split("/")[0]
                real_time = benchmark["real_time"]
                num_thread_dict = all_data_dict.get(name, dict())
                iteration_dict = num_thread_dict.get(num_thread, dict())
                grid_size_dict = iteration_dict.get(iteration, dict())
                grid_size_dict[grid_size] = real_time
                iteration_dict[iteration] = grid_size_dict
                num_thread_dict[num_thread] = iteration_dict
                all_data_dict[name] = num_thread_dict

            
            # print(all_data_dict)
            with open(output_file_name, 'w') as file:
                json.dump(all_data_dict, file, indent=4)
