#!/bin/sh -x
#************************************************************************************************
# Usage: sh run_specfem3dcartesian_singularity.sh                                                           
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.                        
# This script is used to run AMD Infiniy SPECFEM3D Cartesian singularity commands                            
# Contact info: roohollah.etemadi@amd.com                                                      
# Version: V1.0                                                                                  
# Modified: 2022-05-24                                                                          
# Version History:                                                                              
# V1.0: run amdih/specfem3d:9c0626d1-20201122 singularity commands                                   
#************************************************************************************************
echo "Start Test: `date`"

echo "==== Pull singularity image ===="
echo "singularity pull specfem3d_9c0626d1-20201122.sif docker://amdih/specfem3d:9c0626d1-20201122"
singularity pull specfem3d_9c0626d1-20201122.sif docker://amdih/specfem3d:9c0626d1-20201122
echo "==== Pull complete ===="

echo "==== Run Test ===="
echo "singularity run --pwd /opt/specfem3d/EXAMPLES/homogeneous_poroelastic --writable-tmpfs specfem3d_9c0626d1-20201122.sif /bin/bash ./run_this_example.sh"
singularity run --pwd /opt/specfem3d/EXAMPLES/homogeneous_poroelastic --writable-tmpfs specfem3d_9c0626d1-20201122.sif /bin/bash ./run_this_example.sh
echo "==== Complete Test ===="

echo "End Test: `date`"
