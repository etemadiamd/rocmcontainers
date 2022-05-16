#!/bin/sh -x
#************************************************************************************************
# Usage: sh run_minihacc_singularity.sh                                                           
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.                        
# This script is used to run AMD Infiniy Mini-Hacc singularity commands                            
# Contact info: roohollah.etemadi@amd.com                                                      
# Version: V1.0                                                                                  
# Modified: 2022-05-16                                                                          
# Version History:                                                                              
# V1.0: run amdih/minihacc:1.0.0 singularity commands                                   
#************************************************************************************************
echo "Start Test: `date`"

echo "==== Pull singularity image ===="
echo "singularity pull minihacc.sif docker://amdih/minihacc:1.0.0"
singularity pull minihacc.sif docker://amdih/minihacc:1.0.0
echo "==== Pull complete ===="

echo "==== Run FP32 Test ===="
echo "singularity run ./minihacc.sif mini-HACC"
singularity run ./minihacc.sif mini-HACC
echo "==== Complete FP32 Test ===="

echo "==== Run FP64 Test ===="
echo "singularity run ./minihacc.sif mini-HACC-fp64"
singularity run ./minihacc.sif mini-HACC-fp64
echo "==== Complete FP64 Test ===="
echo "End Test: `date`"
