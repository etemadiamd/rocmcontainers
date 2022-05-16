#!/bin/sh -x
#************************************************************************************************
# Usage: sh run_cp2k_singularity.sh                                                           
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.                        
# This script is used to run AMD Infiniy CP2K singularity commands                            
# Contact info: roohollah.etemadi@amd.com                                                      
# Version: V1.0                                                                                  
# Modified: 2022-05-16                                                                          
# Version History:                                                                              
# V1.0: run amdih/cp2k:8.2 singularity commands                                   
#************************************************************************************************
echo "Start Test: `date`"

echo "==== Pull singularity image ===="
echo "singularity pull cp2k.sif docker://amdih/cp2k:8.2"
singularity pull cp2k.sif docker://amdih/cp2k:8.2
echo "==== Pull complete ===="

echo "==== Run Test on 8 GPUs ===="
echo "mkdir -p out8gpus"
mkdir -p out8gpus
echo "singularity run --writable-tmpfs --bind $(pwd)/out8gpus:/out ./cp2k.sif benchmark 32-H2O-RPA --arch VEGA908 --gpu-count 8 --cpu-count 128 --omp-thread-count 8 --ranks 8 --rank-stride 16 --output /out/32-H2O-RPA-8GPU.txt"
singularity run --writable-tmpfs --bind $(pwd)/out8gpus:/out ./cp2k.sif benchmark 32-H2O-RPA --arch VEGA908 --gpu-count 8 --cpu-count 128 --omp-thread-count 8 --ranks 8 --rank-stride 16 --output /out/32-H2O-RPA-8GPU.txt
echo "Elapsed time:"
grep "CP2K       " out8gpus/32-H2O-RPA-8GPU*
echo "==== Complete Test on 8 GPUs ===="

echo "==== Run Test on 4 GPUs ===="
echo "mkdir -p out4gpus"
mkdir -p out4gpus
echo "singularity run --writable-tmpfs --bind $(pwd)/out4gpus:/out ./cp2k.sif benchmark 32-H2O-RPA --arch VEGA908 --gpu-count 4 --cpu-count 64 --omp-thread-count 4 --ranks 16 --rank-stride 4 --output /out/32-H2O-RPA-4GPU.txt"
singularity run --writable-tmpfs --bind $(pwd)/out4gpus:/out ./cp2k.sif benchmark 32-H2O-RPA --arch VEGA908 --gpu-count 4 --cpu-count 64 --omp-thread-count 4 --ranks 16 --rank-stride 4 --output /out/32-H2O-RPA-4GPU.txt
echo "Elapsed time:"
grep "CP2K       " out4gpus/32-H2O-RPA-4GPU*
echo "==== Complete Test on 4 GPUs ===="
echo "End Test: `date`"
