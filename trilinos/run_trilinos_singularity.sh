#!/bin/sh -x
#************************************************************************************************
# Usage: sudo sh run_trilinos_singularity.sh
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.
# This script is used to run AMD Infinity-Hub Trilinos Singularity Container
# Contact info: anand.raghavendra@amd.com
# Version: V1.0
# Modified: 2022-12-29
# Version History:
# 	V1.0: Run docker image amddcgpuce/trilinos:1.7_36 using Singularity
#************************************************************************************************
echo "Date: `date`"

echo "==== Pull Trilinos docker image to build Singularity container  ===="
echo "singularity pull trilinos:1.7_36.sif docker://amddcgpuce/trilinos:1.7_36"
singularity pull --docker-login trilinos:1.7_36.sif docker://amddcgpuce/trilinos:1.7_36
echo "==== Pull complete  ===="

echo "==== Running Benchmark on 1 GPU ==== "
echo "singularity run --pwd /benchmark --writable-tmpfs trilinos:1.7_36.sif mpirun -n 1 /benchmark/run_benchmark --mx=1 --my=1 --mz=1 --kokkos-num-devices=1"
singularity run --pwd /benchmark --writable-tmpfs trilinos:1.7_36.sif mpirun -n 1 /benchmark/run_benchmark --mx=1 --my=1 --mz=1 --kokkos-num-devices=1 2>&1  | tee trilinos:1.7_36_1GPU_`date +"%y-%m-%d-%H-%M-%S"`.log
echo "==== Run on 1 GPU complete ===="

echo "==== Running Benchmark on 2 GPUs ==== "
echo "singularity run --pwd /benchmark --writable-tmpfs trilinos:1.7_36.sif mpirun -n 2 /benchmark/run_benchmark --mx=2 --my=1 --mz=1 --kokkos-num-devices=2"
singularity run --pwd /benchmark --writable-tmpfs trilinos:1.7_36.sif mpirun -n 2 /benchmark/run_benchmark --mx=2 --my=1 --mz=1 --kokkos-num-devices=2 2>&1  | tee trilinos:1.7_36_2GPU_`date +"%y-%m-%d-%H-%M-%S"`.log
echo "==== Run on 2GPUs complete ===="

echo "==== Running Benchmark on 4 GPUs ==== "
echo "singularity run --pwd /benchmark --writable-tmpfs trilinos:1.7_36.sif mpirun -n 4 /benchmark/run_benchmark --mx=2 --my=2 --mz=1 --kokkos-num-devices=4"
singularity run --pwd /benchmark --writable-tmpfs trilinos:1.7_36.sif mpirun -n 4 /benchmark/run_benchmark --mx=2 --my=2 --mz=1 --kokkos-num-devices=4 2>&1  | tee trilinos:1.7_36_4GPU_`date +"%y-%m-%d-%H-%M-%S"`.log
echo "==== Run on 4GPUs complete ===="

echo "==== Running Benchmark on 8 GPUs ==== "
echo "singularity run --pwd /benchmark --writable-tmpfs trilinos:1.7_36.sif mpirun -n 8 /benchmark/run_benchmark --mx=2 --my=2 --mz=2 --kokkos-num-devices=8"
singularity run --pwd /benchmark --writable-tmpfs trilinos:1.7_36.sif mpirun -n 8 /benchmark/run_benchmark --mx=2 --my=2 --mz=2 --kokkos-num-devices=8 2>&1  | tee trilinos:1.7_36_8GPU_`date +"%y-%m-%d-%H-%M-%S"`.log
echo "==== Run on 8GPUs complete ===="

echo "==== All the Runs are complete ===="
echo "Date: `date`"


