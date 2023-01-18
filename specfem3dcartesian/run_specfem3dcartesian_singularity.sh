#!/bin/sh -x
#************************************************************************************************
# Usage: sh run_specfem3dcartesian_singularity.sh                                                           
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.                        
# This script is used to run AMD Infiniy SPECFEM3D Cartesian singularity commands                            
# Contact info: roohollah.etemadi@amd.com; anand.raghavendra@amd.com                                                      
# Version: V1.1                                                                                  
# Modified: 2023-01-17                                                                          
# Version History:      
# V1.1: run amddcgpuce/specfem3d:2022.11.amd2_41 singularity commands                                                                        
# V1.0: run amdih/specfem3d:9c0626d1-20201122 singularity commands                                   
#************************************************************************************************
echo "Start Test: `date`"

echo "==== Pull singularity image ===="
echo "singularity pull specfem3d_2022.11.amd2_41.sif docker://amddcgpuce/specfem3d:2022.11.amd2_41"
singularity pull specfem3d_2022.11.amd2_41.sif docker://amddcgpuce/specfem3d:2022.11.amd2_41
echo "==== Pull complete ===="

echo "==== Run test on 1 GPU"
echo "singularity run --writable-tmpfs specfem3d_2022.11.amd2_41.sif /bin/bash \"export OMPI_ALLOW_RUN_AS_ROOT=1; export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1; benchmark cartesian -g 1 -c 0 -s 288x256\""
singularity run --writable-tmpfs specfem3d_2022.11.amd2_41.sif /bin/bash -c "export OMPI_ALLOW_RUN_AS_ROOT=1; export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1; benchmark cartesian -g 1 -c 0 -s 288x256"
echo "==== Complete test on 1 GPU ===="

echo "==== Run test on 2 GPU"
echo "singularity run --writable-tmpfs specfem3d_2022.11.amd2_41.sif /bin/bash \"export OMPI_ALLOW_RUN_AS_ROOT=1; export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1; benchmark cartesian -g 2 -c 0 -s 288x256\""
singularity run --writable-tmpfs specfem3d_2022.11.amd2_41.sif /bin/bash -c "export OMPI_ALLOW_RUN_AS_ROOT=1; export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1; benchmark cartesian -g 2 -c 0 -s 288x256"
echo "==== Complete test on 2 GPU ===="

echo "==== Run test on 4 GPU"
echo "singularity run --writable-tmpfs specfem3d_2022.11.amd2_41.sif /bin/bash \"export OMPI_ALLOW_RUN_AS_ROOT=1; export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1; benchmark cartesian -g 4 -c 0 -s 288x256\""
singularity run --writable-tmpfs specfem3d_2022.11.amd2_41.sif /bin/bash -c "export OMPI_ALLOW_RUN_AS_ROOT=1; export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1; benchmark cartesian -g 4 -c 0 -s 288x256"
echo "==== Complete test on 4 GPU ===="

echo "==== Run test on 8 GPU"
echo "singularity run --writable-tmpfs specfem3d_2022.11.amd2_41.sif /bin/bash \"export OMPI_ALLOW_RUN_AS_ROOT=1; export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1; benchmark cartesian -g 8 -c 0 -s 288x256\""
singularity run --writable-tmpfs specfem3d_2022.11.amd2_41.sif /bin/bash -c "export OMPI_ALLOW_RUN_AS_ROOT=1; export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1; benchmark cartesian -g 8 -c 0 -s 288x256"
echo "==== Complete test on 8 GPU ===="

echo "End Test: `date`"
