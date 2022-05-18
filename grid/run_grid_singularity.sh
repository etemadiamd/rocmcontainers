#!/bin/sh -x
#************************************************************************************************
# Usage: sh run_grid_singularity.sh                                                           
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.                        
# This script is used to run AMD Infiniy GRID singularity commands                            
# Contact info: roohollah.etemadi@amd.com                                                      
# Version: V1.0                                                                                  
# Modified: 2022-05-18                                                                          
# Version History:                                                                              
# V1.0: run amdih/grid:0.8.2-20211213 singularity commands                                   
#************************************************************************************************
echo "Start Test: `date`"

echo "==== Pull singularity image ===="
echo "singularity pull grid.sif docker://amdih/grid:0.8.2-20211213"
singularity pull grid.sif docker://amdih/grid:0.8.2-20211213
echo "==== Pull complete ===="

echo "==== Run Test on 1 GPU ===="
echo "singularity run grid.sif Benchmark_ITT --accelerator-threads 8"
singularity run grid.sif Benchmark_ITT --accelerator-threads 8
echo "==== Complete Test on 1 GPU ===="

echo "==== Run Test on 2 GPUs ===="
echo "singularity run grid.sif mpirun -np 2  /benchmark/gpu_bind.sh Benchmark_ITT --accelerator-threads 8 --mpi 1.1.1.2"
singularity run grid.sif mpirun -np 2  /benchmark/gpu_bind.sh Benchmark_ITT --accelerator-threads 8 --mpi 1.1.1.2
echo "==== Complete Test on 2 GPUs ===="

echo "==== Run Test on 4 GPUs ===="
echo "singularity run grid.sif mpirun -np 4  /benchmark/gpu_bind.sh Benchmark_ITT --accelerator-threads 8 --mpi 1.1.1.4"
singularity run grid.sif mpirun -np 4  /benchmark/gpu_bind.sh Benchmark_ITT --accelerator-threads 8 --mpi 1.1.1.4
echo "==== Complete Test on 4 GPUs ===="

echo "==== Run Test on 8 GPUs ===="
echo "singularity run grid.sif mpirun -np 8  /benchmark/gpu_bind.sh Benchmark_ITT --accelerator-threads 8 --mpi 1.1.1.8"
singularity run grid.sif mpirun -np 8  /benchmark/gpu_bind.sh Benchmark_ITT --accelerator-threads 8 --mpi 1.1.1.8
echo "==== Complete Test on 8 GPUs ===="

echo "End Test: `date`"
