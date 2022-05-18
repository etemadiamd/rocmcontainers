#!/bin/sh -x
#************************************************************************************************
# Usage: sudo sh run_grid_docker.sh                                                        
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.                         
# This script is used to run AMD Infiniy GRID Docker Container                                
# Contact info: roohollah.etemadi@amd.com                                                       
# Version: V1.0                                                                                  
# Modified: 2022-05-17                                                                          
# Version History:                                                                              
# V1.0: amdih/grid:0.8.2-20211213 docker image                                             
#************************************************************************************************
echo "Start Test:`date`"

echo "==== Pull GRID docker image  ===="
echo "docker pull amdih/grid:0.8.2-20211213"
docker pull amdih/grid:0.8.2-20211213
echo "==== Pull complete  ===="

echo "==== Run Test on 1 GPU ===="
echo "docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amdih/grid:0.8.2-20211213 /bin/bash -c \"Benchmark_ITT --accelerator-threads 8\""
docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amdih/grid:0.8.2-20211213 /bin/bash -c "Benchmark_ITT --accelerator-threads 8"
echo "==== Complete Test on 1 GPU ===="

echo "==== Run Test on 2 GPUs ===="
echo "docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amdih/grid:0.8.2-20211213 /bin/bash -c \"mpirun -np 2  /benchmark/gpu_bind.sh Benchmark_ITT --accelerator-threads 8 --mpi 1.1.1.2\""
docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amdih/grid:0.8.2-20211213 /bin/bash -c "mpirun -np 2  /benchmark/gpu_bind.sh Benchmark_ITT --accelerator-threads 8 --mpi 1.1.1.2"
echo "==== Complete Test on 2 GPUs ===="

echo "==== Run Test on 4 GPUs ===="
echo "docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amdih/grid:0.8.2-20211213 /bin/bash -c \"mpirun -np 4  /benchmark/gpu_bind.sh Benchmark_ITT --accelerator-threads 8 --mpi 1.1.1.4\""
docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amdih/grid:0.8.2-20211213 /bin/bash -c "mpirun -np 4  /benchmark/gpu_bind.sh Benchmark_ITT --accelerator-threads 8 --mpi 1.1.1.4"
echo "==== Complete Test on 4 GPUs ===="

echo "==== Run Test on 8 GPUs ===="
echo "docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amdih/grid:0.8.2-20211213 /bin/bash -c \"mpirun -np 8  /benchmark/gpu_bind.sh Benchmark_ITT --accelerator-threads 8 --mpi 1.1.1.8\""
docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amdih/grid:0.8.2-20211213 /bin/bash -c "mpirun -np 8  /benchmark/gpu_bind.sh Benchmark_ITT --accelerator-threads 8 --mpi 1.1.1.8"
echo "==== Complete Test on 8 GPUs ===="

echo "End Test:`date`"
