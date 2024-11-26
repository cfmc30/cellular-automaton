# PP-F24 Final Project Cellular-Automaton (CA)
A cool parallelization CA, which is able to generate Conway's Game of Life and output it as GIF format <br> <br> <br>
![alt-text](https://github.com/cfmc30/cellular-automaton/blob/dev/result_gif/simulate300.gif)
# Implementation
* non-parallel (sequence)
* SIMD
* Multi-thread
* OMP
* MPI
# Setup
```bash
git clone https://github.com/cfmc30/cellular-automaton.git
cd cellular-automaton
chmod 755 CA
./CA -n NUM_SIMULATION [-o GIF_FILENAME] [-s ROWS COLS] [-t s|ms|us|ns] [-f csv|json FILENAME] 
```
# Report
# Others
# Reference
<https://github.com/gerzin/parallel-cellular-automata> <br>
<https://github.com/charlietangora/gif-h>
