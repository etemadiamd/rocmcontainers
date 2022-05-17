```
Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.
Revision: V1.0
V1.0: add docker and singualrity commands
```
# HPCG 3.0

## Pull Command

```
sudo docker pull amdih/rochpcg:3.1.0_97
```
## Running Containers
If the user wants to collect figure of merit numbers on a machine containing 64-cores and one AMD GPU, it is possible to do it in the following way. Begin by launching a container interactively using:
```
sudo docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined  amdih/rochpcg:3.1.0_97 /bin/bash
```
Then run the following commands inside the container:
```
export OMPI_ALLOW_RUN_AS_ROOT=1 
export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1
```
Then in the container run the benchmarks:
```
mpirun -np 1 hpcg <nx> <ny> <nz> <runtime>
```
Description of input parameters

<nx>      x-dimension of local domain

<ny>      y-dimension of local domain

<nz>      z-dimension of local domain

<runtime> desired runtime for benchmark in seconds (>1800s for official run)

Note that global domain is determined by the number of GPUs being used.

Examples of single and 4 GPU runs:
```
mpirun -np 1 hpcg 280 280 280 1860 
```
```
mpirun -np 4 hpcg 280 280 280 1860 
```
## Run Using Script
The Docker test commands can be executed using run_hpcg3_docker.sh script. To do so, download the script and run it as follows:
```
sudo sh run_hpcg3_docker.sh
```
