#!/bin/sh -x
#************************************************************************************************
# Usage: sudo sh run_relion_docker.sh
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.
# This script is used to run AMD Infiniy RELION Docker Container
# Contact info: sanjay.tripathi@amd.com
# Version: V1.0
# Modified: 2022-12-19
# Version History:
# V1.0: Run docker image amddcgpuce/relion:4.0_25 
#************************************************************************************************
echo "Start Test:`date`"

echo "==== Pull RELION docker image  ===="
echo "docker pull amddcgpuce/relion:4.0_25"
docker pull amddcgpuce/relion:4.0_25
echo "==== Pull complete  ===="

# update /home/amd to the ${HOME}
echo "==== Run 3D Test on 8 GPUs ===="
echo "docker run --rm --ipc=host --device /dev/kfd --device /dev/dri --security-opt seccomp=unconfined -v /home/amd/relion_benchmark:/dataset:ro -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amddcgpuce/relion:4.0_25 run-benchmark --class 3d -g 8 -n 9 -j 4 -p 10 --iters 25 -i /dataset"
docker run --rm --ipc=host --device /dev/kfd --device /dev/dri --security-opt seccomp=unconfined -v /home/amd/relion_benchmark:/dataset:ro -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amddcgpuce/relion:4.0_25 run-benchmark --class 3d -g 8 -n 9 -j 4 -p 10 --iters 25 -i /dataset
echo "==== Complete 3D Test on 8 GPUs ==== RELION v4.0_25 "

echo "==== Run 3D Test on 2 GPUs ===="
echo "docker run --rm --ipc=host --device /dev/kfd --device /dev/dri --security-opt seccomp=unconfined -v /home/amd/relion_benchmark:/dataset:ro -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amddcgpuce/relion:4.0_25 run-benchmark --class 3d -g 2 -n 7 -j 6 -p 10 --iters 25 -i /dataset"
docker run --rm --ipc=host --device /dev/kfd --device /dev/dri --security-opt seccomp=unconfined -v /home/amd/relion_benchmark:/dataset:ro -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amddcgpuce/relion:4.0_25 run-benchmark --class 3d -g 2 -n 7 -j 6 -p 10 --iters 25 -i /dataset
echo "==== Complete 3D Test on 2 GPUs ==== RELION v4.0_25 "

echo "==== Run 2D Test on 8 GPUs ===="
echo "docker run --rm --ipc=host --device /dev/kfd --device /dev/dri --security-opt seccomp=unconfined -v /home/amd/relion_benchmark:/dataset:ro -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amddcgpuce/relion:4.0_25 run-benchmark --class 2d -g 8 -n 25 -j 1 -p 10 --iters 25 -i /dataset"
docker run --rm --ipc=host --device /dev/kfd --device /dev/dri --security-opt seccomp=unconfined -v /home/amd/relion_benchmark:/dataset:ro -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amddcgpuce/relion:4.0_25 run-benchmark --class 2d -g 8 -n 25 -j 1 -p 10 --iters 25 -i /dataset
echo "==== Complete 2D Test on 8 GPUs ==== RELION v4.0_25 "

echo "==== Run 2D Test on 2 GPUs ===="
echo "docker run --rm --ipc=host --device /dev/kfd --device /dev/dri --security-opt seccomp=unconfined -v /home/amd/relion_benchmark:/dataset:ro -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amddcgpuce/relion:4.0_25 run-benchmark --class 2d -g 2 -n 13 -j 1 -p 10 --iters 25 -i /dataset"
docker run --rm --ipc=host --device /dev/kfd --device /dev/dri --security-opt seccomp=unconfined -v /home/amd/relion_benchmark:/dataset:ro -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amddcgpuce/relion:4.0_25 run-benchmark --class 2d -g 2 -n 13 -j 1 -p 10 --iters 25 -i /dataset
echo "==== Complete 2D Test on 2 GPUs ==== RELION v4.0_25 "

echo "End Test:`date`"
