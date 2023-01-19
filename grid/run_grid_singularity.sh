#!/bin/sh -x
#************************************************************************************************
# Usage: sh run_grid_singularity.sh
# Copyright (c) 2023 Advanced Micro Devices, Inc. All Rights Reserved.
# This script is used to run AMD Infiniy GRID singularity commands
# Contact info: roohollah.etemadi@amd.com, sanjay.tripathi@amd.com
# Version: V1.1
# Modified: 2023-01-19
# Version History:
# V1.1: updated docker-tag as parameter, added timestamp after every benchmark run
# V1.0: run amdih/grid:0.8.2-20211213 singularity commands
#************************************************************************************************
echo "Start Test: `date`"

# Use docker-tag, if provided as parameter else exit
if [ "$#" -eq 0 ];
        then
                echo "Need Docker-Tag. Exiting."
                exit 1
        else
		tag=$1
fi

DOCKER_TAG=grid:$tag
SIF_FILENAME=grid_$tag.sif

echo "==== Pull singularity image ===="
echo "singularity pull $SIF_FILENAME docker://amddcgpuce/$DOCKER_TAG"
singularity pull --docker-login $SIF_FILENAME docker://amddcgpuce/$DOCKER_TAG
echo "==== Pull complete ===="

echo "==== Run Test on 1 GPU ===="
echo "singularity run --pwd /benchmark $SIF_FILENAME mpirun -np 1 gpu_bind.sh Benchmark_ITT --accelerator-threads 8"
singularity run --pwd /benchmark $SIF_FILENAME mpirun -np 1 gpu_bind.sh Benchmark_ITT --accelerator-threads 8
echo "==== Completed Test on 1 GPU ===="

echo "Date: `date`"

echo "==== Run Test on 2 GPUs ===="
echo "singularity run --pwd /benchmark $SIF_FILENAME mpirun -np 2 gpu_bind.sh Benchmark_ITT --accelerator-threads 8 --mpi 1.1.1.2"
singularity run --pwd /benchmark $SIF_FILENAME mpirun -np 2 gpu_bind.sh Benchmark_ITT --accelerator-threads 8 --mpi 1.1.1.2
echo "==== Completed Test on 2 GPUs ===="

echo "Date: `date`"

echo "==== Run Test on 4 GPUs ===="
echo "singularity run --pwd /benchmark $SIF_FILENAME mpirun -np 4 gpu_bind.sh Benchmark_ITT --accelerator-threads 8 --mpi 1.1.1.4"
singularity run --pwd /benchmark $SIF_FILENAME mpirun -np 4 gpu_bind.sh Benchmark_ITT --accelerator-threads 8 --mpi 1.1.1.4
echo "==== Completed Test on 4 GPUs ===="

echo "Date: `date`"

echo "==== Run Test on 8 GPUs ===="
echo "singularity run --pwd /benchmark $SIF_FILENAME mpirun -np 8 gpu_bind.sh Benchmark_ITT --accelerator-threads 8 --mpi 1.1.1.8"
singularity run --pwd /benchmark $SIF_FILENAME mpirun -np 8 gpu_bind.sh Benchmark_ITT --accelerator-threads 8 --mpi 1.1.1.8
echo "==== Completed Test on 8 GPUs ===="

echo "End Test: `date`"
