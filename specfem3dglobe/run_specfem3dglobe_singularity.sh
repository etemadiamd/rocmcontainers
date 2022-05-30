#!/bin/sh -x
#************************************************************************************************
# Usage: sh run_specfem3dglobe_singularity.sh                                                           
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.                        
# This script is used to run AMD Infiniy SPECFEM3D Globe singularity commands                            
# Contact info: roohollah.etemadi@amd.com                                                      
# Version: V1.0                                                                                  
# Modified: 2022-05-26                                                                      
# Version History:                                                                              
# V1.0: run amdih/specfem3d_globe:1ee10977-20210321 singularity commands                                   
#************************************************************************************************
echo "Start Test: `date`"

echo "==== Pull singularity image ===="
echo "singularity pull specfem3d_globe1ee10977-20210321.sif docker://amdih/specfem3d_globe:1ee10977-20210321"
singularity pull specfem3d_globe1ee10977-20210321.sif docker://amdih/specfem3d_globe:1ee10977-20210321
echo "==== Pull complete ===="

echo "==== Run Test ===="
echo "singularity run specfem3d_globe1ee10977-20210321.sif /bin/bash -c \"cp -r /opt/specfem3d_globe ./\""
singularity run specfem3d_globe1ee10977-20210321.sif /bin/bash -c "cp -r /opt/specfem3d_globe ./"

echo "singularity run --bind ./specfem3d_globe:/opt/specfem3d_globe specfem3d_globe1ee10977-20210321.sif /bin/bash -c \"benchmark global_s362ani_shakemovie -o /tmp/out\""
singularity run --bind ./specfem3d_globe:/opt/specfem3d_globe specfem3d_globe1ee10977-20210321.sif /bin/bash -c "benchmark global_s362ani_shakemovie -o /tmp/out"

echo "singularity run --bind ./specfem3d_globe:/opt/specfem3d_globe specfem3d_globe1ee10977-20210321.sif /bin/bash -c \"cd /opt/specfem3d_globe/EXAMPLES/regional_Greece_small; ./run_this_example.sh\""
singularity run --bind ./specfem3d_globe:/opt/specfem3d_globe specfem3d_globe1ee10977-20210321.sif /bin/bash -c "cd /opt/specfem3d_globe/EXAMPLES/regional_Greece_small; ./run_this_example.sh"
echo "==== Complete Test ===="

echo "End Test: `date`"
