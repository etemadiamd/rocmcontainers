```
Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.
Revision: V1.0
V1.0: add docker and singualrity commands 
```

# CP2K

## Pull Command

```
sudo docker pull amdih/cp2k:8.2
```

## Running Containers
### Interactive
To run the container interactively, run
```
sudo docker run --rm -it --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined --ipc=host -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amdih/cp2k:8.2 /bin/bash
```
Benchmarks can then be run by invoking the 'benchmark' script, e.g.
```
export OMPI_ALLOW_RUN_AS_ROOT=1
export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1
```
Command to run with 8 GPUs:
```
benchmark H2O-DFT-LS-NREPS2 --arch VEGA908 --rank-stride 8 --omp-thread-count 8 --ranks 16 --gpu-count 8 --cpu-count 128 -o /tmp/H2O-DFT-LS-NREP2-8GPU.txt
```
In the above examples, the job is run with 8 MPI ranks, each using a GPU, and 8 OpenMP threads on a dual socket server with 8 MI100 GPUs and 128 physical cores. The rank-stride option allows the ranks to evenly spread out on the node across the two sockets.

Command to run with 4 GPUs:
```
benchmark H2O-DFT-LS-NREPS2 --arch VEGA908 --rank-stride 4 --omp-thread-count 4 --ranks 16 --gpu-count 4 --cpu-count 64 -o /tmp/H2O-DFT-LS-NREP2-4GPU.txt
```
### Non-Interactive

Where applicable, you may also run the container non-interactively from the host. For example, you may run a benchmark non-interactively as follows.

Command to run with 8 GPUs:
```
mkdir -p out
sudo docker run --rm --device /dev/dri --device /dev/kfd -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 --ipc=host --security-opt seccomp=unconfined -v $(pwd)/out:/out amdih/cp2k:8.2 benchmark H2O-DFT-LS-NREPS2 --arch VEGA908 --rank-stride 8 --omp-thread-count 8 --ranks 16 --gpu-count 8 --cpu-count 128 -o /out/H2O-DFT-LS-NREP2-8GPU.txt
```
Command to run with 4 GPUs:
```
mkdir -p out
sudo docker run --rm --device /dev/dri --device /dev/kfd -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 --ipc=host --security-opt seccomp=unconfined -v $(pwd)/out:/out amdih/cp2k:8.2 benchmark H2O-DFT-LS-NREPS2 --arch VEGA908 --rank-stride 4 --omp-thread-count 4 --ranks 16 --gpu-count 4 --cpu-count 64 -o /out/H2O-DFT-LS-NREP2-4GPU.txt
```
An indication of a successful run is a summary table of timings printed at the end of the output log file. A search of "CP2K " must print elapsed time for the run.
```
grep "CP2K       " out/H2O-DFT-LS-NREP2*
```
## Run Using Singularity
This section assumes that an up-to-date version of Singularity is installed on your system and properly configured for your system. Please consult with your system administrator or view the official Singularity documentation.

Pull and convert docker image to singularity image format:
```
singularity pull cp2k.sif docker://amdih/cp2k:8.2
```
You can then use examples from the preceding section to use the image. For example, to run a benchmark, you may do

Command for 8 GPUs:
```
singularity run --writable-tmpfs --bind $(pwd):/tmp ./cp2k.sif benchmark 32-H2O-RPA --arch VEGA908 --gpu-count 8 --cpu-count 128 --omp-thread-count 8 --ranks 8 --rank-stride 16 --output /tmp/32-H2O-RPA-8GPU
```
Command for 4 GPUs:
```
singularity run --writable-tmpfs --bind $(pwd):/tmp ./cp2k.sif benchmark 32-H2O-RPA --arch VEGA908 --gpu-count 4 --cpu-count 64 --omp-thread-count 4 --ranks 16 --rank-stride 4 --output /tmp/32-H2O-RPA-4GPU
```
Now, the ${PWD} directory on the host will contain the log files due to the --bind mapping we provided in the above command.

## Run Using Scripts
The test using Docker commands can be executed by:
```
sudo sh run_cp2k_docker.sh
``` 
To run the test using Singularity commands, execute the run_cp2k_singularity.sh script as:
```
sh run_cp2k_singularity.sh
```
