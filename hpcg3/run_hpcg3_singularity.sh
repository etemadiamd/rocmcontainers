#!/bin/sh -x
#************************************************************************************************
# Usage: sh run_hpcg3_singularity.sh                                                            
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.                          
# This script is used to run AMD Infiniy HPCG 3.0 singularity commands                           
# Contact info: roohollah.etemadi@amd.com                                                       
# Version: V1.0                                                                                  
# Modified: 2022-05-24                                                                          
# Version History:                                                                              
# V1.0: run amdih/rochpcg:3.1.0_97 singularity commands                                           
#************************************************************************************************
echo "Date: `date`"

echo "==== Pull singularity image ===="
echo "singularity pull rochpcg3.1.0_97.sif docker://amdih/rochpcg:3.1.0_97"
singularity pull rochpcg3.1.0_97.sif docker://amdih/rochpcg:3.1.0_97
echo "==== Pull complete ===="

echo "==== Run test on 1 GPU ===="
echo "singularity run rochpcg3.1.0_97.sif mpirun -np 1 hpcg 280 280 280 1860"
singularity run rochpcg3.1.0_97.sif mpirun -np 1 hpcg 280 280 280 1860
echo "==== Complete test on 1 GPU ===="

echo "==== Run test on 4 GPUs ===="
echo "singularity run rochpcg3.1.0_97.sif mpirun -np 4 hpcg 280 280 280 1860"
singularity run rochpcg3.1.0_97.sif mpirun -np 4 hpcg 280 280 280 1860
echo "==== Complete test on 4 GPUs ===="
