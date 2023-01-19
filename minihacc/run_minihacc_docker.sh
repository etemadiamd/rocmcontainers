#!/bin/sh -x
#************************************************************************************************
# Usage: sudo sh run_minihacc_docker.sh                                                        
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.                         
# This script is used to run AMD Infiniy Mini-Hacc Docker Container                                
# Contact info: roohollah.etemadi@amd.com                                                       
# Version: V2.0                                                                                  
# Modified: 2023-01-19                                                                          
# Version History:    
# V2.0: run docker pull amddcgpuce/minihacc:1.0.amd3_129 docker image
# V1.0: run docker pull amdih/minihacc:1.0.0 docker image                                             
#************************************************************************************************
echo "Start Test:`date`"
docker_tag=amddcgpuce/minihacc:1.0.amd3_129
echo "==== Pull Mini-Hacc docker image  ===="
echo "docker pull $docker_tag"
docker pull $docker_tag
echo "==== Pull complete  ===="

echo "==== Run FP32 Test `date` ===="
echo "docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined $docker_tag mini-HACC"
docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined $docker_tag mini-HACC
echo "==== Complete FP32 Test `date`===="

echo "==== Run FP64 Test `date` ===="
echo "docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined $docker_tag mini-HACC-fp64"
docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined $docker_tag mini-HACC-fp64
echo "==== Complete FP64 Test `date` ===="

echo "End Test:`date`"
