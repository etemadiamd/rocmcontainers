#!/bin/sh -x
#************************************************************************************************
# Usage: sudo sh run_specfem3dglobe_docker.sh                                                        
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.                         
# This script is used to run AMD Infiniy SPECFEM3D Globe Docker Container                                
# Contact info: roohollah.etemadi@amd.com                                                       
# Version: V1.0                                                                                  
# Modified: 2022-05-26                                                                          
# Version History:                                                                              
# V1.0: amdih/specfem3d_globe:1ee10977-20210321 docker image                                             
#************************************************************************************************
echo "Start Test:`date`"

echo "==== Pull docker image  ===="
echo "docker pull amdih/specfem3d_globe:1ee10977-20210321"
docker pull amdih/specfem3d_globe:1ee10977-20210321
echo "==== Pull complete  ===="

echo "==== Run Test ===="
echo "docker run --rm -it --ipc=host --device=/dev/dri --device=/dev/kfd --security-opt seccomp=unconfined amdih/specfem3d_globe:1ee10977-20210321 /bin/bash -c \"export OMPI_ALLOW_RUN_AS_ROOT=1; export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1; benchmark global_s362ani_shakemovie -o /out/out\""
docker run --rm -it --ipc=host --device=/dev/dri --device=/dev/kfd --security-opt seccomp=unconfined amdih/specfem3d_globe:1ee10977-20210321 /bin/bash -c "export OMPI_ALLOW_RUN_AS_ROOT=1; export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1; benchmark global_s362ani_shakemovie -o /out/out"

echo "docker run --rm -it --ipc=host --device=/dev/dri --device=/dev/kfd -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 -w /opt/specfem3d_globe/EXAMPLES/regional_Greece_small --security-opt seccomp=unconfined amdih/specfem3d_globe:1ee10977-20210321 /bin/bash ./run_this_example.sh"
docker run --rm -it --ipc=host --device=/dev/dri --device=/dev/kfd -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 -w /opt/specfem3d_globe/EXAMPLES/regional_Greece_small --security-opt seccomp=unconfined amdih/specfem3d_globe:1ee10977-20210321 /bin/bash ./run_this_example.sh
echo "==== Complete Test ===="

echo "End Test:`date`"
