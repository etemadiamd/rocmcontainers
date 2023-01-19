#!/bin/sh -x
#************************************************************************************************
# Usage: sh run_minihacc_singularity.sh                                                           
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.                        
# This script is used to run AMD Infiniy Mini-Hacc singularity commands                            
# Contact info: roohollah.etemadi@amd.com                                                      
# Version: V2.0                                                                                  
# Modified: 2023-01-19                                                                          
# Version History:    
# V2.0: run amddcgpuce/minihacc:1.0.amd3_129 singularity commands
# V1.0: run amdih/minihacc:1.0.0 singularity commands                                   
#************************************************************************************************
echo "Start Test: `date`"

docker_tag=amddcgpuce/minihacc:1.0.amd3_129
singularity_tag=minihacc_1.0.amd3_129.sif

echo "==== Pull singularity image ===="
echo "singularity pull $singularity_tag docker://$docker_tag"
singularity pull $singularity_tag docker://$docker_tag
echo "==== Pull complete ===="

echo "==== Run FP32 Test `date`===="
echo "singularity run ./$singularity_tag mini-HACC"
singularity run ./$singularity_tag mini-HACC
echo "==== Complete FP32 Test `date`===="

echo "==== Run FP64 Test `date`===="
echo "singularity run ./$singularity_tag mini-HACC-fp64"
singularity run ./$singularity_tag mini-HACC-fp64
echo "==== Complete FP64 Test `date`===="
echo "End Test: `date`"
