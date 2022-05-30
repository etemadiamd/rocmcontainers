#!/bin/sh -x
#************************************************************************************************
# Usage: sh run_minimod_singularity.sh                                                           
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.                        
# This script is used to run AMD Infiniy MiniMod singularity commands                            
# Contact info: roohollah.etemadi@amd.com                                                      
# Version: V1.0                                                                                  
# Modified: 2022-05-30                                                                      
# Version History:                                                                              
# V1.0: run  amdih/minimod:1.0.0 singularity commands                                   
#************************************************************************************************
echo "Start Test: `date`"

echo "==== Pull singularity image ===="
echo "singularity pull minimod.sif docker://amdih/minimod:1.0.0"
singularity pull minimod.sif docker://amdih/minimod:1.0.0
echo "==== Pull complete ===="

echo "==== Run test ===="
echo "singularity run minimod.sif benchmark-acousticISO"
singularity run minimod.sif benchmark-acousticISO
echo "==== Complete test ===="

echo "End Test: `date`"
