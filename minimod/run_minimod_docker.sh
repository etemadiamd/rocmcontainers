#!/bin/sh -x
#************************************************************************************************
# Usage: sudo sh run_minimod_docker.sh                                                        
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.                         
# This script is used to run AMD Infiniy MiniMod Docker Container                                
# Contact info: roohollah.etemadi@amd.com                                                       
# Version: V1.0                                                                                  
# Modified: 2022-05-30                                                                          
# Version History:                                                                              
# V1.0: amdih/minimod:1.0.0 docker image                                             
#************************************************************************************************
echo "Start Test:`date`"

echo "==== Pull docker image  ===="
echo "docker pull amdih/minimod:1.0.0"
docker pull amdih/minimod:1.0.0
echo "==== Pull complete  ===="

echo "==== Run Test ===="
echo "docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined amdih/minimod:1.0.0 benchmark-acousticISO"
docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined amdih/minimod:1.0.0 benchmark-acousticISO
echo "==== Complete Test ===="

echo "End Test:`date`"
