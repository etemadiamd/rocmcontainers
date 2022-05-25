```
Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.
Revision: V1.1
V1.1: add singularity commands
V1.0: add docker commands 
```

# NAMD 3.0

## Pull Command

```
sudo docker pull amdih/namd3:3.0a9
```

## Running Containers
### Using Docker
In order to assess performance of the container image, NAMD standard benchmark systems were made available in the /examples folder, with sizes ranging from 23 thousand up to a million atoms. If the user wants to collect figure of merit numbers (nanoseconds of simulated time per day) on a machine containing 64-cores and one AMD GPU, it is possible to do it in the following way.

Begin by launching a container interactively using:
```
sudo docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined  amdih/namd3:3.0a9 /bin/bash
```
Then in the container navigate into the examples directory and run the benchmarks. The commands below run the benchmarcks on GPU 0:
```
cd /examples
namd3 jac/jac.namd +p1 +setcpuaffinity --CUDASOAintegrate on +devices 0 > jac.log
namd3 apoa1/apoa1.namd +p1 +setcpuaffinity --CUDASOAintegrate on +devices 0 > apoa1.log
namd3 f1atpase/f1atpase.namd +p1 +setcpuaffinity --CUDASOAintegrate on +devices 0 > f1atpase.log
namd3 stmv/stmv.namd +p1 +setcpuaffinity --CUDASOAintegrate on +devices 0 > stmv.log
```
The following commands generate NAMD log files with timing information for each one of the benchmarks and averages that information using the ns_per_day.py, calculating the overall nanoseconds of simulated time per day on that run.

Benchmarking everything might take many minutes depending on how fast your computational resources are.
```
./ns_per_day.py jac.log
./ns_per_day.py apoa1.log
./ns_per_day.py f1atpase.log
./ns_per_day.py stmv.log
```
For multiple-GPU simulations,  NAMD 3.0 needs to run with exactly one CPU core per GPU. For a 4-GPU simulation, here’s how one would invoke NAMD 3.0 in GPU-resident mode.
```
cd /examples
namd3 stmv/stmv.namd +p4 +pemap 0-3 --CUDASOAintegrate on +devices 0,1,2,3 > stmv.log
```
Benchmarking everything might take many minutes depending on how fast your computational resources are.
### Using Singularity
To run the test using Singularity, pull and convert the docker image to Singularity image by running:
```
singularity pull namd3_3.0a9.sif docker://amdih/namd3:3.0a9
``` 
The singularity container runs as follows:
```
sudo singularity run --writable-tmpfs namd3_3.0a9.sif /bin/bash
```
Then, the benchmarks in the previous section can be executed inside the container. The following commands, for instance, run benchmark jac on a single GPU, and compute the FOM (figure of merit) for the test:  
```
cd /examples
namd3 jac/jac.namd +p1 +setcpuaffinity --CUDASOAintegrate on +devices 0 > jac.log
./ns_per_day.py jac.log
```
## Run Using Scripts
The tests using docker commands can be executed by running:
```
sudo sh run_namd3_docker.sh
```
Run singularity commands using run_namd3_singularity.sh as:
```
sudo sh run_namd3_singularity.sh
```
