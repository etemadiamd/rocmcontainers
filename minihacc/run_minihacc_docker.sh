#!/bin/sh -x
#************************************************************************************************
# Usage: sudo sh run_minihacc_docker.sh                                                        
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.                         
# This script is used to run AMD Infiniy Mini-Hacc Docker Container                                
# Contact info: roohollah.etemadi@amd.com                                                       
# Version: V1.0                                                                                  
# Modified: 2022-05-16                                                                          
# Version History:                                                                              
# V1.0: run docker pull amdih/minihacc:1.0.0 docker image                                             
#************************************************************************************************
echo "Start Test:`date`"

echo "==== Pull Mini-Hacc docker image  ===="
echo "docker pull amdih/minihacc:1.0.0"
docker pull amdih/minihacc:1.0.0
echo "==== Pull complete  ===="

echo "==== Run FP32 Test ===="
echo "docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined amdih/minihacc:1.0.0 mini-HACC"
docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined amdih/minihacc:1.0.0 mini-HACC
echo "==== Complete FP32 Test ===="

echo "==== Run FP64 Test ===="
echo "docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined amdih/minihacc:1.0.0 mini-HACC-fp64"
docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined amdih/minihacc:1.0.0 mini-HACC-fp64
echo "==== Complete FP64 Test ===="

echo "End Test:`date`"
