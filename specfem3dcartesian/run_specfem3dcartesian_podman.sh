#!/bin/sh -x
#************************************************************************************************
# Usage: sudo sh run_specfem3dcartesian_podman.sh                                                        
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.                         
# This script is used to run AMD Infiniy SPECFEM3D Cartesian Docker Container using Podman CLI                                
# Contact info: roohollah.etemadi@amd.com; anand.raghavendra@amd.com                                                       
# Version: V1.1                                                                                  
# Modified: 2023-01-17                                                                          
# Version History:
# V1.1: run amddcgpuce/specfem3d:2022.11.amd2_41 docker image                                                                               
# V1.0: run amdih/specfem3d:9c0626d1-20201122 docker image                                             
#************************************************************************************************
echo "Start Test:`date`"

echo "==== Pull SPECFEM3D Cartesian docker image  ===="
echo "podman pull amddcgpuce/specfem3d:2022.11.amd2_41"
podman pull amddcgpuce/specfem3d:2022.11.amd2_41
echo "==== Pull complete  ===="

echo "==== Run test on 1 GPU"
echo "podman run --rm -it --ipc=host --device=/dev/dri --device=/dev/kfd --security-opt seccomp=unconfined amddcgpuce/specfem3d:2022.11.amd2_41 /bin/bash -c \"export OMPI_ALLOW_RUN_AS_ROOT=1; export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1; benchmark cartesian -g 1 -c 0 -s 288x256\""
podman run --rm -it --ipc=host --device=/dev/dri --device=/dev/kfd --security-opt seccomp=unconfined amddcgpuce/specfem3d:2022.11.amd2_41 /bin/bash -c "export OMPI_ALLOW_RUN_AS_ROOT=1; export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1; benchmark cartesian -g 1 -c 0 -s 288x256"
echo "==== Complete test on 1 GPU ===="

echo "==== Run test on 2 GPUs"
echo "podman run --rm -it --ipc=host --device=/dev/dri --device=/dev/kfd --security-opt seccomp=unconfined amddcgpuce/specfem3d:2022.11.amd2_41 /bin/bash -c \"export OMPI_ALLOW_RUN_AS_ROOT=1; export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1; benchmark cartesian -g 2 -c 0 -s 288x256\""
podman run --rm -it --ipc=host --device=/dev/dri --device=/dev/kfd --security-opt seccomp=unconfined amddcgpuce/specfem3d:2022.11.amd2_41 /bin/bash -c "export OMPI_ALLOW_RUN_AS_ROOT=1; export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1; benchmark cartesian -g 2 -c 0 -s 288x256"
echo "==== Complete test on 2 GPUs ===="

echo "==== Run test on 4 GPUs"
echo "podman run --rm -it --ipc=host --device=/dev/dri --device=/dev/kfd --security-opt seccomp=unconfined amddcgpuce/specfem3d:2022.11.amd2_41 /bin/bash -c \"export OMPI_ALLOW_RUN_AS_ROOT=1; export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1; benchmark cartesian -g 4 -c 0 -s 288x256\""
podman run --rm -it --ipc=host --device=/dev/dri --device=/dev/kfd --security-opt seccomp=unconfined amddcgpuce/specfem3d:2022.11.amd2_41 /bin/bash -c "export OMPI_ALLOW_RUN_AS_ROOT=1; export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1; benchmark cartesian -g 4 -c 0 -s 288x256"
echo "==== Complete test on 4 GPUs ===="

echo "==== Run test on 8 GPUs"
echo "podman run --rm -it --ipc=host --device=/dev/dri --device=/dev/kfd --security-opt seccomp=unconfined amddcgpuce/specfem3d:2022.11.amd2_41 /bin/bash -c \"export OMPI_ALLOW_RUN_AS_ROOT=1; export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1; benchmark cartesian -g 8 -c 0 -s 288x256\""
podman run --rm -it --ipc=host --device=/dev/dri --device=/dev/kfd --security-opt seccomp=unconfined amddcgpuce/specfem3d:2022.11.amd2_41 /bin/bash -c "export OMPI_ALLOW_RUN_AS_ROOT=1; export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1; benchmark cartesian -g 8 -c 0 -s 288x256"
echo "==== Complete test on 8 GPUs ===="

