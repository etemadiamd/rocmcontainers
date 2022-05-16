#!/bin/sh -x
#************************************************************************************************
# Usage: sh run_milc_singularity.sh                                                           
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.                        
# This script is used to run AMD Infiniy Milc singularity commands                            
# Contact info: roohollah.etemadi@amd.com                                                      
# Version: V1.0                                                                                  
# Modified: 2022-05-16                                                                          
# Version History:                                                                              
# V1.0: run amdih/milc:c30ed15e1-20210420 singularity commands                                   
#************************************************************************************************
echo "Start Test: `date`"

echo "==== Pull singularity image ===="
echo "singularity pull milc_c30ed15e1.sif docker://amdih/milc:c30ed15e1-20210420"
singularity pull milc_c30ed15e1.sif docker://amdih/milc:c30ed15e1-20210420
echo "==== Pull complete ===="

echo "==== Run on One GPU ===="
echo "singularity run --pwd /benchmark --writable-tmpfs milc_c30ed15e1.sif /bin/bash  -c \"run-benchmark --ngpus 1 -o bench-gpu1.txt\""
singularity run --pwd /benchmark --writable-tmpfs milc_c30ed15e1.sif /bin/bash  -c "run-benchmark --ngpus 1 -o bench-gpu1.txt"
echo "==== Complete on One GPU ===="

echo "==== Run on Two GPUs ===="
echo "singularity run --pwd /benchmark --writable-tmpfs milc_c30ed15e1.sif /bin/bash  -c \"run-benchmark --ngpus 2 -o bench-gpu2.txt\""
singularity run --pwd /benchmark --writable-tmpfs milc_c30ed15e1.sif /bin/bash  -c "run-benchmark --ngpus 2 -o bench-gpu2.txt"
echo "==== Complete on Two GPUs ===="
echo "End Test: `date`"
