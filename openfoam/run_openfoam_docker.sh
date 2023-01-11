#!/bin/sh -x
#************************************************************************************************
# Usage: sudo sh run_openfoam_docker.sh
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.
# This script is used to run AMD Infinity-Hub OpenFOAM Docker Container
# Contact info: anand.raghavendra@amd.com
# Version: V1.0
# Modified: 2023-1-11
# Version History:
# 	V1.0: Run docker image amddcgpuce/openfoam:2206.1.amd3_45 
#************************************************************************************************
echo "Date: `date`"

echo "==== Pull OpenFOAM docker image  ===="
echo "docker pull amddcgpuce/openfoam:2206.1.amd3_45"
docker pull amddcgpuce/openfoam:2206.1.amd3_45
echo "==== Pull complete  ===="

echo "==== Running LDC Benchmark on 1 GPU ==== "
echo "sudo docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amddcgpuce/openfoam:2206.1.amd3_45 /benchmark/bench-lid-driven-cavity.sh -g 1 -v"
sudo docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amddcgpuce/openfoam:2206.1.amd3_45 /benchmark/bench-lid-driven-cavity.sh -g 1 -v
echo "==== Running HPC Motorbike Benchmark on 1 GPU ==== "
echo "sudo docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amddcgpuce/openfoam:2206.1.amd3_45 /benchmark/bench-hpc-motorbike.sh -g 1 -v"
sudo docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amddcgpuce/openfoam:2206.1.amd3_45 /benchmark/bench-hpc-motorbike.sh -g 1 -v
echo "==== Run on 1 GPU complete ===="

echo "==== Running LDC Benchmark on 2 GPUs ==== "
echo "sudo docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amddcgpuce/openfoam:2206.1.amd3_45 /benchmark/bench-lid-driven-cavity.sh -g 2 -v"
sudo docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amddcgpuce/openfoam:2206.1.amd3_45 /benchmark/bench-lid-driven-cavity.sh -g 2 -v
echo "==== Running HPC Motorbike Benchmark on 2 GPUs ==== "
echo "sudo docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amddcgpuce/openfoam:2206.1.amd3_45 /benchmark/bench-hpc-motorbike.sh -g 2 -v"
sudo docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amddcgpuce/openfoam:2206.1.amd3_45 /benchmark/bench-hpc-motorbike.sh -g 2 -v
echo "==== Run on 2 GPUs complete ===="

echo "==== Running LDC Benchmark on 4 GPUs ==== "
echo "sudo docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amddcgpuce/openfoam:2206.1.amd3_45 /benchmark/bench-lid-driven-cavity.sh -g 4 -v"
sudo docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amddcgpuce/openfoam:2206.1.amd3_45 /benchmark/bench-lid-driven-cavity.sh -g -v
echo "==== Running HPC Motorbike Benchmark on 4 GPUs ==== "
echo "sudo docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amddcgpuce/openfoam:2206.1.amd3_45 /benchmark/bench-hpc-motorbike.sh -g 4 -v"
sudo docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amddcgpuce/openfoam:2206.1.amd3_45 /benchmark/bench-hpc-motorbike.sh -g 4 -v
echo "==== Run on 4 GPUs complete ===="

echo "==== Running LDC Benchmark on 8 GPUs ==== "
echo "sudo docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amddcgpuce/openfoam:2206.1.amd3_45 /benchmark/bench-lid-driven-cavity.sh -g 8 -v"
sudo docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amddcgpuce/openfoam:2206.1.amd3_45 /benchmark/bench-lid-driven-cavity.sh -g 8 -v
echo "==== Running HPC Motorbike Benchmark on 8 GPUs ==== "
echo "sudo docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amddcgpuce/openfoam:2206.1.amd3_45 /benchmark/bench-hpc-motorbike.sh -g 8 -v"
sudo docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amddcgpuce/openfoam:2206.1.amd3_45 /benchmark/bench-hpc-motorbike.sh -g 8 -v
echo "==== Run on 8 GPUs complete ===="

echo "==== All the Runs are complete ===="
echo "Date: `date`"
