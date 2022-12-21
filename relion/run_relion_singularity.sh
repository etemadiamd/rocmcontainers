#!/bin/sh -x
#************************************************************************************************
# Usage: sudo sh run_relion_singularity.sh
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.
# This script is used to run AMD Infiniy RELION Docker Container
# Contact info: sanjay.tripathi@amd.com
# Version: V1.0
# Modified: 2022-12-19
# Version History:
# V1.0: Run docker image amddcgpuce/relion:4.0_25 using Singularity
#************************************************************************************************
echo "Start Test:`date`"

echo "==== Pull RELION image  ===="
echo "singularity pull relion-4.0_25.sif docker://amddcgpuce/relion:4.0_25"
#singularity pull relion-4.0_25.sif docker://amddcgpuce/relion:4.0_25
singularity build --docker-login relion-4.0_25.sif docker://amddcgpuce/relion:4.0_25

echo "==== Pull complete  ===="

echo "==== Run 3D Test on 8 GPUs ==== RELION v4.0_25"
echo "singularity run --bind /home/amd/relion_benchmark:/dataset:ro --pwd /benchmark relion-4.0_25.sif run-benchmark --class 3d -g 8 -n 9 -j 4 -p 10 --iters 25 -i /dataset"
singularity run --bind /home/amd/relion_benchmark:/dataset:ro --pwd /benchmark relion-4.0_25.sif run-benchmark --class 3d -g 8 -n 9 -j 4 -p 10 --iters 25 -i /dataset
echo "==== Completed 3D Test on 8 GPUs ==== RELION v4.0_25 "

echo "==== Run 3D Test on 2 GPUs ==== RELION v4.0_25"
echo "singularity run --bind /home/amd/relion_benchmark:/dataset:ro --pwd /benchmark relion-4.0_25.sif run-benchmark --class 3d -g 2 -n 7 -j 6 -p 10 --iters 25 -i /dataset"
singularity run --bind /home/amd/relion_benchmark:/dataset:ro --pwd /benchmark relion-4.0_25.sif run-benchmark --class 3d -g 2 -n 7 -j 6 -p 10 --iters 25 -i /dataset
echo "==== Completed 3D Test on 2 GPUs ==== RELION v4.0_25 "

echo "==== Run 2D Test on 8 GPUs ==== RELION v4.0_25"
echo "singularity run --bind /home/amd/relion_benchmark:/dataset:ro --pwd /benchmark relion-4.0_25.sif run-benchmark --class 2d -g 8 -n 25 -j 1 -p 10 --iters 25 -i /dataset"
singularity run --bind /home/amd/relion_benchmark:/dataset:ro --pwd /benchmark relion-4.0_25.sif run-benchmark --class 2d -g 8 -n 25 -j 1 -p 10 --iters 25 -i /dataset
echo "==== Completed 2D Test on 8 GPUs ==== RELION v4.0_25 "

echo "==== Run 2D Test on 2 GPUs ==== RELION v4.0_25"
echo "singularity run --bind /home/amd/relion_benchmark:/dataset:ro --pwd /benchmark relion-4.0_25.sif run-benchmark --class 2d -g 2 -n 13 -j 1 -p 10 --iters 25 -i /dataset"
singularity run --bind /home/amd/relion_benchmark:/dataset:ro --pwd /benchmark relion-4.0_25.sif run-benchmark --class 2d -g 2 -n 13 -j 1 -p 10 --iters 25 -i /dataset
echo "==== Completed 2D Test on 2 GPUs ==== RELION v4.0_25 "

echo "End Test:`date`"
