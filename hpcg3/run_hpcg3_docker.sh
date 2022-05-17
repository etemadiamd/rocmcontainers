#!/bin/sh -x
#************************************************************************************************
# Usage: sudo sh run_hpcg3_docker.sh                                                        
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.                         
# This script is used to run AMD Infiniy HPCG 3.0 Docker Container                                
# Contact info: roohollah.etemadi@amd.com                                                       
# Version: V1.0                                                                                  
# Modified: 2022-05-17                                                                          
# Version History:                                                                              
# V1.0: run docker commands                                             
#************************************************************************************************
echo "Start Test:`date`"

echo "==== Pull HPCG 3.0 docker image  ===="
echo "docker pull amdih/rochpcg:3.1.0_97"
docker pull amdih/rochpcg:3.1.0_97
echo "==== Pull complete  ===="

echo "==== Run Test on 1 GPU ===="
echo "docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 --security-opt seccomp=unconfined  amdih/rochpcg:3.1.0_97 /bin/bash -c \"mpirun -np 1 hpcg 280 280 280 1860\""
docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 --security-opt seccomp=unconfined  amdih/rochpcg:3.1.0_97 /bin/bash -c "mpirun -np 1 hpcg 280 280 280 1860"
echo "==== Complete Test on 1 GPU ===="

echo "==== Run Test on 4 GPUs ===="
echo "docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 --security-opt seccomp=unconfined  amdih/rochpcg:3.1.0_97 /bin/bash -c \"mpirun -np 4 hpcg 280 280 280 1860\""
docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 --security-opt seccomp=unconfined  amdih/rochpcg:3.1.0_97 /bin/bash -c "mpirun -np 4 hpcg 280 280 280 1860"
echo "==== Complete Test on 4 GPUs ===="

echo "End Test:`date`"
