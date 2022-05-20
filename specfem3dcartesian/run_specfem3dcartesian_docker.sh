#!/bin/sh -x
#************************************************************************************************
# Usage: sudo sh run_specfem3dcartesian_docker.sh                                                        
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.                         
# This script is used to run AMD Infiniy SPECFEM3D Cartesian Docker Container                                
# Contact info: roohollah.etemadi@amd.com                                                       
# Version: V1.0                                                                                  
# Modified: 2022-05-17                                                                          
# Version History:                                                                              
# V1.0: run amdih/specfem3d:9c0626d1-20201122 Docker image                                             
#************************************************************************************************
echo "Start Test:`date`"

echo "==== Pull Chroma docker image  ===="
echo "docker pull amdih/specfem3d:9c0626d1-20201122"
docker pull amdih/specfem3d:9c0626d1-20201122
echo "==== Pull complete  ===="

echo "==== Run test on 1 GPU"
echo "docker run --rm -it --ipc=host --device=/dev/dri --device=/dev/kfd --security-opt seccomp=unconfined amdih/specfem3d:9c0626d1-20201122 /bin/bash -c \"export OMPI_ALLOW_RUN_AS_ROOT=1; export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1; benchmark cartesian -g 1 -c 0 -s 288x256\""
docker run --rm -it --ipc=host --device=/dev/dri --device=/dev/kfd --security-opt seccomp=unconfined amdih/specfem3d:9c0626d1-20201122 /bin/bash -c "export OMPI_ALLOW_RUN_AS_ROOT=1; export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1; benchmark cartesian -g 1 -c 0 -s 288x256"
echo "==== Complete test on 1 GPU ===="

echo "==== Run test on 2 GPUs"
echo "docker run --rm -it --ipc=host --device=/dev/dri --device=/dev/kfd --security-opt seccomp=unconfined amdih/specfem3d:9c0626d1-20201122 /bin/bash -c \"export OMPI_ALLOW_RUN_AS_ROOT=1; export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1; benchmark cartesian -g 2 -c 0 -s 288x256\""
docker run --rm -it --ipc=host --device=/dev/dri --device=/dev/kfd --security-opt seccomp=unconfined amdih/specfem3d:9c0626d1-20201122 /bin/bash -c "export OMPI_ALLOW_RUN_AS_ROOT=1; export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1; benchmark cartesian -g 2 -c 0 -s 288x256"
echo "==== Complete test on 2 GPUs ===="

echo "==== Run test on 4 GPUs"
echo "docker run --rm -it --ipc=host --device=/dev/dri --device=/dev/kfd --security-opt seccomp=unconfined amdih/specfem3d:9c0626d1-20201122 /bin/bash -c \"export OMPI_ALLOW_RUN_AS_ROOT=1; export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1; benchmark cartesian -g 4 -c 0 -s 288x256\""
docker run --rm -it --ipc=host --device=/dev/dri --device=/dev/kfd --security-opt seccomp=unconfined amdih/specfem3d:9c0626d1-20201122 /bin/bash -c "export OMPI_ALLOW_RUN_AS_ROOT=1; export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1; benchmark cartesian -g 4 -c 0 -s 288x256"
echo "==== Complete test on 4 GPUs ===="

echo "==== Run test on 8 GPUs"
echo "docker run --rm -it --ipc=host --device=/dev/dri --device=/dev/kfd --security-opt seccomp=unconfined amdih/specfem3d:9c0626d1-20201122 /bin/bash -c \"export OMPI_ALLOW_RUN_AS_ROOT=1; export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1; benchmark cartesian -g 8 -c 0 -s 288x256\""
docker run --rm -it --ipc=host --device=/dev/dri --device=/dev/kfd --security-opt seccomp=unconfined amdih/specfem3d:9c0626d1-20201122 /bin/bash -c "export OMPI_ALLOW_RUN_AS_ROOT=1; export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1; benchmark cartesian -g 8 -c 0 -s 288x256"
echo "==== Complete test on 8 GPUs ===="

