#!/bin/sh -x
#************************************************************************************************
# Usage: sudo sh run_trilinos_docker.sh
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.
# This script is used to run AMD Infinity Hub Trilinos Docker Container
# Contact info: anand.raghavendra@amd.com
# Version: V1.0
# Modified: 2022-12-29
# Version History:
# 	V1.0: Run docker image amddcgpuce/trilinos:1.7_36 
#************************************************************************************************
container_version="trilinos:1.7_36"
echo "Date: `date`"

echo "==== Pull Trilinos docker image  ===="
echo "docker pull amddcgpuce/trilinos:1.7_36"
docker pull amddcgpuce/trilinos:1.7_36
echo "==== Pull complete  ===="

echo "==== Running Benchmark on 1 GPU ==== "
echo "sudo docker run --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined --cap-add CAP_SYS_PTRACE --shm-size=8g -e HIP_VISIBLE_DEVICES=0 amddcgpuce/trilinos:1.7_36 mpirun -n 1 /benchmark/run_benchmark --mx=1 --my=1 --mz=1 --kokkos-num-devices=1"
sudo docker run --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined --cap-add CAP_SYS_PTRACE --shm-size=8g -e HIP_VISIBLE_DEVICES=0 amddcgpuce/trilinos:1.7_36 mpirun -n 1 /benchmark/run_benchmark --mx=1 --my=1 --mz=1 --kokkos-num-devices=1 2>&1  | tee trilinos:1.7_36_1GPU_`date +"%y-%m-%d-%H-%M-%S"`.log
echo "==== Run on 1 GPU complete ===="

echo "==== Running Benchmark on 2 GPUs ==== "
echo "sudo docker run --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined --cap-add CAP_SYS_PTRACE --shm-size=8g -e HIP_VISIBLE_DEVICES=0,1 amddcgpuce/trilinos:1.7_36 mpirun -n 2 /benchmark/run_benchmark --mx=2 --my=1 --mz=1 --kokkos-num-devices=2"
sudo docker run --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined --cap-add CAP_SYS_PTRACE --shm-size=8g -e HIP_VISIBLE_DEVICES=0,1 amddcgpuce/trilinos:1.7_36 mpirun -n 2 /benchmark/run_benchmark --mx=2 --my=1 --mz=1 --kokkos-num-devices=2 2>&1  | tee trilinos:1.7_36_2GPU_`date +"%y-%m-%d-%H-%M-%S"`.log
echo "==== Run on 2 GPUs complete ===="

echo "==== Running Benchmark on 4 GPUs ==== "
echo "sudo docker run --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined --cap-add CAP_SYS_PTRACE --shm-size=8g -e HIP_VISIBLE_DEVICES=0,1,2,3 amddcgpuce/trilinos:1.7_36 mpirun -n 4 /benchmark/run_benchmark --mx=2 --my=2 --mz=1 --kokkos-num-devices=4"
sudo docker run --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined --cap-add CAP_SYS_PTRACE --shm-size=8g -e HIP_VISIBLE_DEVICES=0,1,2,3 amddcgpuce/trilinos:1.7_36 mpirun -n 4 /benchmark/run_benchmark --mx=2 --my=2 --mz=1 --kokkos-num-devices=4 2>&1  | tee trilinos:1.7_36_4GPU_`date +"%y-%m-%d-%H-%M-%S"`.log
echo "==== Run on 4 GPUs complete ===="

echo "==== Running Benchmark on 8 GPUs ==== "
echo "sudo docker run --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined --cap-add CAP_SYS_PTRACE --shm-size=8g -e HIP_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 amddcgpuce/trilinos:1.7_36 mpirun -n 8 /benchmark/run_benchmark --mx=2 --my=2 --mz=2 --kokkos-num-devices=8"
sudo docker run --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined --cap-add CAP_SYS_PTRACE --shm-size=8g -e HIP_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 amddcgpuce/trilinos:1.7_36 mpirun -n 8 /benchmark/run_benchmark --mx=2 --my=2 --mz=2 --kokkos-num-devices=8 2>&1  | tee trilinos:1.7_36_8GPU_`date +"%y-%m-%d-%H-%M-%S"`.log
echo "==== Run on 8 GPUs complete ===="

echo "==== All the Runs are complete ===="
echo "Date: `date`"


