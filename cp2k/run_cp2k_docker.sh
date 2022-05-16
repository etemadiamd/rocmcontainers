#!/bin/sh -x
#************************************************************************************************
# Usage: sudo sh run_cp2k_docker.sh                                                        
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.                         
# This script is used to run AMD Infiniy CP2K Docker Container                                
# Contact info: roohollah.etemadi@amd.com                                                       
# Version: V1.0                                                                                  
# Modified: 2022-05-16                                                                          
# Version History:                                                                              
# V1.0: run docker pull amdih/cp2k:8.2 docker image                                             
#************************************************************************************************
echo "Start Test:`date`"

echo "==== Pull CP2K docker image  ===="
echo "docker pull amdih/cp2k:8.2"
docker pull amdih/cp2k:8.2
echo "==== Pull complete  ===="

echo "==== Run Test on 8 GPUs ===="
echo "mkdir -p out8gpu"
mkdir -p out8gpu
echo "docker run --rm --device /dev/dri --device /dev/kfd -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 --ipc=host --security-opt seccomp=unconfined -v $(pwd)/out8gpu:/out amdih/cp2k:8.2 benchmark H2O-DFT-LS-NREPS2 --arch VEGA908 --rank-stride 8 --omp-thread-count 8 --ranks 16 --gpu-count 8 --cpu-count 128 -o /out/H2O-DFT-LS-NREP2-8GPU.txt"
docker run --rm --device /dev/dri --device /dev/kfd -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 --ipc=host --security-opt seccomp=unconfined -v $(pwd)/out8gpu:/out amdih/cp2k:8.2 benchmark H2O-DFT-LS-NREPS2 --arch VEGA908 --rank-stride 8 --omp-thread-count 8 --ranks 16 --gpu-count 8 --cpu-count 128 -o /out/H2O-DFT-LS-NREP2-8GPU.txt
echo "Elapsed time::"
grep "CP2K       " out8gpu/H2O-DFT-LS-NREP2*
echo "==== Complete Test on 8 GPUs ===="

echo "==== Run Test on 4 GPUs ===="
echo "mkdir -p out4gpu"
mkdir -p out4gpu
echo "docker run --rm --device /dev/dri --device /dev/kfd -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 --ipc=host --security-opt seccomp=unconfined -v $(pwd)/out4gpu:/out amdih/cp2k:8.2 benchmark H2O-DFT-LS-NREPS2 --arch VEGA908 --rank-stride 4 --omp-thread-count 4 --ranks 16 --gpu-count 4 --cpu-count 64 -o /out/H2O-DFT-LS-NREP2-4GPU.txt"
docker run --rm --device /dev/dri --device /dev/kfd -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 --ipc=host --security-opt seccomp=unconfined -v $(pwd)/out4gpu:/out amdih/cp2k:8.2 benchmark H2O-DFT-LS-NREPS2 --arch VEGA908 --rank-stride 4 --omp-thread-count 4 --ranks 16 --gpu-count 4 --cpu-count 64 -o /out/H2O-DFT-LS-NREP2-4GPU.txt
echo "Elapsed time::"
grep "CP2K       " out4gpu/H2O-DFT-LS-NREP2*
echo "==== Completet on 4 GPUs ===="

echo "End Test:`date`"
