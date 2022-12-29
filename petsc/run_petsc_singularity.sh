#!/bin/sh -x
#************************************************************************************************
# Usage: sudo sh run_petsc_singularity.sh
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.
# This script is used to run AMD Infiniy-Hub PETSc Singularity Container
# Contact info: anand.raghavendra@amd.com
# Version: V1.0
# Modified: 2022-12-28
# Version History:
# 	V1.0: Run docker image amddcgpuce/petsc:3.18.amd4_44 using Singularity
#************************************************************************************************
echo "Date: `date`"

echo "==== Pull PETSc docker image to build Singularity container  ===="
echo "singularity pull petsc:3.18.amd4_44.sif docker://amddcgpuce/petsc:3.18.amd4_44"
singularity pull --docker-login petsc:3.18.amd4_44.sif docker://amddcgpuce/petsc:3.18.amd4_44
echo "==== Pull complete  ===="

echo "==== Running Benchmark on 1 GPU ==== "
echo "singularity run --pwd /opt/petsc --writable-tmpfs petsc:3.18.amd4_44.sif ./run-benchmark.sh -g 1"
singularity run --pwd /opt/petsc --writable-tmpfs petsc:3.18.amd4_44.sif ./run-benchmark.sh -g 1 2>&1  | tee petsc:3.18.amd4_44_1GPU_`date +"%y-%m-%d-%H-%M-%S"`.log
echo "==== Run on 1 GPU complete ===="

echo "==== Running Benchmark on 2 GPUs ==== "
echo "singularity run --pwd /opt/petsc --writable-tmpfs petsc:3.18.amd4_44.sif ./run-benchmark.sh -g 2"
singularity run --pwd /opt/petsc --writable-tmpfs petsc:3.18.amd4_44.sif ./run-benchmark.sh -g 2 2>&1  | tee petsc:3.18.amd4_44_2GPU_`date +"%y-%m-%d-%H-%M-%S"`.log
echo "==== Run on 2GPUs complete ===="

echo "==== Running Benchmark on 4 GPUs ==== "
echo "singularity run --pwd /opt/petsc --writable-tmpfs petsc:3.18.amd4_44.sif ./run-benchmark.sh -g 4"
singularity run --pwd /opt/petsc --writable-tmpfs petsc:3.18.amd4_44.sif ./run-benchmark.sh -g 4 2>&1  | tee petsc:3.18.amd4_44_4GPU_`date +"%y-%m-%d-%H-%M-%S"`.log
echo "==== Run on 4GPUs complete ===="

echo "==== Running Benchmark on 8 GPUs ==== "
echo "singularity run --pwd /opt/petsc --writable-tmpfs petsc:3.18.amd4_44.sif ./run-benchmark.sh -g 8"
singularity run --pwd /opt/petsc --writable-tmpfs petsc:3.18.amd4_44.sif ./run-benchmark.sh -g 8 2>&1  | tee petsc:3.18.amd4_44_8GPU_`date +"%y-%m-%d-%H-%M-%S"`.log
echo "==== Run on 8GPUs complete ===="

echo "==== All the Runs are complete ===="






