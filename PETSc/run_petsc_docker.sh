#!/bin/sh -x
#************************************************************************************************
# Usage: sudo sh run_petsc_docker.sh
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.
# This script is used to run AMD Infiniy PETSc Docker Container
# Contact info: anand.raghavendra@amd.com
# Version: V1.0
# Modified: 2022-12-28
# Version History:
# 	V1.0: Run docker image amddcgpuce/petsc:3.18.amd4_44 
#************************************************************************************************
echo "Date: `date`"

echo "==== Pull PETSc docker image  ===="
echo "docker pull amddcgpuce/petsc:3.18.amd4_44"
docker pull amddcgpuce/petsc:3.18.amd4_44
echo "==== Pull complete  ===="

echo "==== Running Benchmark on 1 GPU ==== "
echo "docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined -w  /opt/petsc amddcgpuce/petsc:3.18.amd4_44  ./run-benchmark.sh -g 1"
docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined -w  /opt/petsc amddcgpuce/petsc:3.18.amd4_44  ./run-benchmark.sh -g 1 2>&1  | tee petsc:3.18.amd4_44_1GPU_`date +"%y-%m-%d-%H-%M-%S"`.log
echo "==== Run on 1 GPU complete ===="

echo "==== Running Benchmark on 2 GPUs ==== "
echo "docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined -w  /opt/petsc amddcgpuce/petsc:3.18.amd4_44  ./run-benchmark.sh -g 2"
docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined -w  /opt/petsc amddcgpuce/petsc:3.18.amd4_44  ./run-benchmark.sh -g 2 2>&1  | tee petsc:3.18.amd4_44_2GPU_`date +"%y-%m-%d-%H-%M-%S"`.log
echo "==== Run on 2 GPUs complete ===="

echo "==== Running Benchmark on 4 GPUs ==== "
echo "docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined -w  /opt/petsc amddcgpuce/petsc:3.18.amd4_44  ./run-benchmark.sh -g 4"
docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined -w  /opt/petsc amddcgpuce/petsc:3.18.amd4_44  ./run-benchmark.sh -g 4 2>&1  | tee petsc:3.18.amd4_44_4GPU_`date +"%y-%m-%d-%H-%M-%S"`.log
echo "==== Run on 4 GPUs complete ===="

echo "==== Running Benchmark on 8 GPUs ==== "
echo "docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined -w  /opt/petsc amddcgpuce/petsc:3.18.amd4_44  ./run-benchmark.sh -g 8"
docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined -w  /opt/petsc amddcgpuce/petsc:3.18.amd4_44  ./run-benchmark.sh -g 8 2>&1  | tee petsc:3.18.amd4_44_8GPU_`date +"%y-%m-%d-%H-%M-%S"`.log
echo "==== Run on 8 GPUs complete ===="

echo "==== All the Runs are complete ===="