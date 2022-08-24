#************************************************************************************************
# Usage: sh run_rochpl_singularity.sh                                                           
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.                        
# This script is used to run AMD Infiniy rocHPL singularity commands on MI200 GPUs                            
# Contact info: roohollah.etemadi@amd.com                                                      
# Version: V1.0                                                                                  
# Modified: 2022-08-19                                                                          
# Version History:                                                                              
# V1.0: run amdih/amdih/rochpl:5.0.5_49 singularity commands                                   
#************************************************************************************************

#!/bin/sh -x
echo "Start Test: `date`"

echo "==== Pull singularity image ===="
echo "singularity pull rochpl.sif docker://amdih/rochpl:5.0.5_49"
singularity pull rochpl.sif docker://amdih/rochpl:5.0.5_49
echo "==== Pull complete ===="

echo "1 gpu"
echo "singularity run rochpl.sif mpirun_rochpl -P 1 -Q 1 -N 90112 --NB 512"
singularity run rochpl.sif mpirun_rochpl -P 1 -Q 1 -N 90112 --NB 512

echo "2 gpu"
echo "singularity run rochpl.sif mpirun_rochpl -P 2 -Q 1 -N 128000 --NB 512"
singularity run rochpl.sif mpirun_rochpl -P 2 -Q 1 -N 128000 --NB 512

echo "4 gpu"
echo "singularity run rochpl.sif mpirun_rochpl -P 2 -Q 2 -N 180224 --NB 512"
singularity run rochpl.sif mpirun_rochpl -P 2 -Q 2 -N 180224 --NB 512

echo "8 gpu"
echo "singularity run rochpl.sif mpirun_rochpl -P 2 -Q 4 -N 256000 --NB 512"
singularity run rochpl.sif mpirun_rochpl -P 2 -Q 4 -N 256000 --NB 512

echo "16 gpu"
echo "singularity run rochpl.sif mpirun_rochpl -P 4 -Q 4 -N 360448 --NB 512"
singularity run rochpl.sif mpirun_rochpl -P 4 -Q 4 -N 360448 --NB 512


echo "End Test:`date`"
