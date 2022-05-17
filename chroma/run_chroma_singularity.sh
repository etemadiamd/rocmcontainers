#!/bin/sh -x
#************************************************************************************************
# Usage: sh run_chroma_singularity.sh                                                           
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.                        
# This script is used to run AMD Infiniy Chroma singularity commands                            
# Contact info: roohollah.etemadi@amd.com                                                      
# Version: V1.0                                                                                  
# Modified: 2022-05-16                                                                          
# Version History:                                                                              
# V1.0: run amdih/chroma:3.43.0-20211118 singularity commands                                   
#************************************************************************************************
echo "Start Test: `date`"

echo "==== Pull singularity image ===="
echo "singularity pull chroma_3.43.0-20211118.sif docker://amdih/chroma:3.43.0-20211118"
singularity pull chroma_3.43.0-20211118.sif docker://amdih/chroma:3.43.0-20211118
echo "==== Pull complete ===="

echo "==== Run Test on 1 GPU ===="
echo "singularity run --pwd /benchmark --writable-tmpfs chroma_3.43.0-20211118.sif run-benchmark --ngpus 1"
singularity run --pwd /benchmark --writable-tmpfs chroma_3.43.0-20211118.sif run-benchmark --ngpus 1
echo "==== Complete Test on 1 GPU ===="

echo "==== Run Test on 2 GPUs ===="
echo "singularity run --pwd /benchmark --writable-tmpfs chroma_3.43.0-20211118.sif run-benchmark --ngpus 2"
singularity run --pwd /benchmark --writable-tmpfs chroma_3.43.0-20211118.sif run-benchmark --ngpus 2
echo "==== Complete Test on 2 GPUs ===="

echo "==== Run Test on 4 GPUs ===="
echo "singularity run --pwd /benchmark --writable-tmpfs chroma_3.43.0-20211118.sif run-benchmark --ngpus 4"
singularity run --pwd /benchmark --writable-tmpfs chroma_3.43.0-20211118.sif run-benchmark --ngpus 4
echo "==== Complete Test on 4 GPUs ===="

echo "==== Run Test on 8 GPUs ===="
echo "singularity run --pwd /benchmark --writable-tmpfs chroma_3.43.0-20211118.sif run-benchmark --ngpus 8"
singularity run --pwd /benchmark --writable-tmpfs chroma_3.43.0-20211118.sif run-benchmark --ngpus 8
echo "==== Complete Test on 8 GPUs ===="

echo "End Test: `date`"
