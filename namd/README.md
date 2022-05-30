```
Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.
Revision: V1.2
V1.2: fixed singularity commands by removing sudo, writable-tmpfs
V1.1: add singularity commands 
```

# NAMD

## Pull Command

```
sudo docker pull amdih/namd:2.15a2-20211101
```
## Running Containers
### Using Docker
In order to assess performance of the container image, NAMD standard benchmark systems were made available in the /examples directory, with sizes ranging from 23 thousand up to a million atoms. If the user wants to collect figure of merit numbers (nanoseconds of simulated time per day) on a machine containing 64-cores and one AMD GPU, it is possible to do it in the following way:

Begin by launching a container interactively
```
sudo docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined  amdih/namd:2.15a2-20211101 /bin/bash
```
Then in the container navigate into the examples directory and run the benchmarks
```
cd /examples
/opt/namd/bin/namd2 jac/jac.namd +p64 +setcpuaffinity +devices 0 > jac.log
/opt/namd/bin/namd2 apoa1/apoa1.namd +p64 +setcpuaffinity +devices 0 > apoa1.log
/opt/namd/bin/namd2 f1atpase/f1atpase.namd +p64 +setcpuaffinity +devices 0 > f1atpase.log
/opt/namd/bin/namd2 stmv/stmv.namd +p64 +setcpuaffinity +devices 0 > stmv.log
```
The following commands generate NAMD log files with timing information for each one of the benchmarks and averages that information using the ns_per_day.py, calculating the overall nanoseconds of simulated time per day on that run.
Benchmarking everything might take many minutes depending on how fast your computational resources are.
```
./ns_per_day.py jac.log
./ns_per_day.py apoa1.log
./ns_per_day.py f1atpase.log
./ns_per_day.py stmv.log 
```
### Using Singularity
To run the test using Singularity, pull and convert the Docker image to Singularity image format by:
```
singularity pull namd2.15a2-20211101.sif docker://amdih/namd:2.15a2-20211101
```
Then run a Singularity container as:
```
singularity run namd2.15a2-20211101.sif cp -r /examples ./
singularity run --bind ./examples:/examples namd2.15a2-20211101.sif /bin/bash
```
Next, the tests in the previous section can be performed inside the container. For example, the commands below run benchmark jac, and compute the FOM (figure of merit) of the test:
```
cd /examples
/opt/namd/bin/namd2 jac/jac.namd +p64 +setcpuaffinity +devices 0 > jac.log
./ns_per_day.py jac.log
```
## Run Using the Scripts 
The tests using docker commands can be performed using run_namd_docker.sh script as:
```
sudo sh run_namd_docker.sh
``` 
The tests using singularity commands can be ran as:
```
sh run_namd_singularity.sh
```
