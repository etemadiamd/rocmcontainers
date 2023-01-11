#!/bin/sh -x
#************************************************************************************************
# Usage: sudo sh run_openfoam_singularity.sh
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.
# This script is used to run AMD Infinity-Hub OpenFOAM Singularity Container
# Contact info: anand.raghavendra@amd.com
# Version: V1.0
# Modified: 2023-1-11
# Version History:
# 	V1.0: Run docker image amddcgpuce/openfoam:2206.1.amd3_45 using Singularity
#************************************************************************************************
echo "Date: `date`"

echo "==== Pull OpenFOAM docker image to build Singularity container  ===="
echo "singularity pull openfoam_2206.1.amd3_45.sif docker://amddcgpuce/openfoam_2206.1.amd3_45"
singularity pull --docker-login openfoam_2206.1.amd3_45.sif docker://amddcgpuce/openfoam:2206.1.amd3_45
echo "==== Pull complete  ===="

echo "==== Running LDC Benchmark on 1 GPU ==== "
echo "singularity run --pwd /benchmark --writable-tmpfs --no-home openfoam_2206.1.amd3_45.sif ./bench-lid-driven-cavity.sh -g 1 -v"
singularity run --pwd /benchmark --writable-tmpfs --no-home openfoam_2206.1.amd3_45.sif ./bench-lid-driven-cavity.sh -g 1 -v 
echo "==== Running HPC Motorbike Benchmark on 1 GPU ==== "
echo "singularity run --pwd /benchmark --writable-tmpfs --no-home openfoam_2206.1.amd3_45.sif ./bench-hpc-motorbike.sh -g 1 -v"
singularity run --pwd /benchmark --writable-tmpfs --no-home openfoam_2206.1.amd3_45.sif ./bench-hpc-motorbike.sh -g 1 -v 
echo "==== Run on 1 GPU complete ===="

echo "==== Running LDC Benchmark on 2 GPUs ==== "
echo "singularity run --pwd /benchmark --writable-tmpfs --no-home openfoam_2206.1.amd3_45.sif ./bench-lid-driven-cavity.sh -g 2 -v"
singularity run --pwd /benchmark --writable-tmpfs --no-home openfoam_2206.1.amd3_45.sif ./bench-lid-driven-cavity.sh -g 2 
echo "==== Running HPC Motorbike Benchmark on 2 GPUs ==== "
echo "singularity run --pwd /benchmark --writable-tmpfs --no-home openfoam_2206.1.amd3_45.sif ./bench-hpc-motorbike.sh -g 2 -v"
singularity run --pwd /benchmark --writable-tmpfs --no-home openfoam_2206.1.amd3_45.sif ./bench-hpc-motorbike.sh -g 2 -v 
echo "==== Run on 2 GPUs complete ===="

echo "==== Running LDC Benchmark on 4 GPUs ==== "
echo "singularity run --pwd /benchmark --writable-tmpfs --no-home openfoam_2206.1.amd3_45.sif ./bench-lid-driven-cavity.sh -g 4 -v"
singularity run --pwd /benchmark --writable-tmpfs --no-home openfoam_2206.1.amd3_45.sif ./bench-lid-driven-cavity.sh -g 4 -v 
echo "==== Running HPC Motorbike Benchmark on 4 GPUs ==== "
echo "singularity run --pwd /benchmark --writable-tmpfs --no-home openfoam_2206.1.amd3_45.sif ./bench-hpc-motorbike.sh -g 4 -v"
singularity run --pwd /benchmark --writable-tmpfs --no-home openfoam_2206.1.amd3_45.sif ./bench-hpc-motorbike.sh -g 4 -v 
echo "==== Run on 4 GPUs complete ===="

echo "==== Running LDC Benchmark on 8 GPUs ==== "
echo "singularity run --pwd /benchmark --writable-tmpfs --no-home openfoam_2206.1.amd3_45.sif ./bench-lid-driven-cavity.sh -g 8 -v"
singularity run --pwd /benchmark --writable-tmpfs --no-home openfoam_2206.1.amd3_45.sif ./bench-lid-driven-cavity.sh -g 8 -v 
echo "==== Running HPC Motorbike Benchmark on 8 GPUs ==== "
echo "singularity run --pwd /benchmark --writable-tmpfs --no-home openfoam_2206.1.amd3_45.sif ./bench-hpc-motorbike.sh -g 8 -v"
singularity run --pwd /benchmark --writable-tmpfs --no-home openfoam_2206.1.amd3_45.sif ./bench-hpc-motorbike.sh -g 8 -v 
echo "==== Run on 8 GPUs complete ===="

echo "==== All the Runs are complete ===="
echo "Date: `date`"
