#!/bin/sh -x
#************************************************************************************************
# Usage: sudo sh run_chroma_docker.sh                                                        
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.                         
# This script is used to run AMD Infiniy Chroma Docker Container                                
# Contact info: roohollah.etemadi@amd.com                                                       
# Version: V1.0                                                                                  
# Modified: 2022-05-17                                                                          
# Version History:                                                                              
# V1.0: amdih/chroma:3.43.0-20211118 docker image                                             
#************************************************************************************************
echo "Start Test:`date`"

echo "==== Pull Chroma docker image  ===="
echo "docker pull amdih/chroma:3.43.0-20211118"
docker pull amdih/chroma:3.43.0-20211118
echo "==== Pull complete  ===="

echo "==== Run Test on 1 GPU ===="
echo "docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined amdih/chroma:3.43.0-20211118 /bin/bash -c \"cd /benchmark; run-benchmark --ngpus 1 \""
docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined amdih/chroma:3.43.0-20211118 /bin/bash -c "cd /benchmark; run-benchmark --ngpus 1"
echo "==== Complete Test on 1 GPU ===="

echo "==== Run Test on 2 GPUs ===="
echo "docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined amdih/chroma:3.43.0-20211118 /bin/bash -c \"cd /benchmark; run-benchmark --ngpus 2 \""
docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined amdih/chroma:3.43.0-20211118 /bin/bash -c "cd /benchmark; run-benchmark --ngpus 2"
echo "==== Complete Test on 2 GPUs ===="

echo "==== Run Test on 4 GPUs ===="
echo "docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined amdih/chroma:3.43.0-20211118 /bin/bash -c \"cd /benchmark; run-benchmark --ngpus 4 \""
docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined amdih/chroma:3.43.0-20211118 /bin/bash -c "cd /benchmark; run-benchmark --ngpus 4"
echo "==== Complete Test on 4 GPUs ===="

echo "==== Run Test on 8 GPUs ===="
echo "docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined amdih/chroma:3.43.0-20211118 /bin/bash -c \"cd /benchmark; run-benchmark --ngpus 8 \""
docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined amdih/chroma:3.43.0-20211118 /bin/bash -c "cd /benchmark; run-benchmark --ngpus 8"
echo "==== Complete Test on 8 GPUs ===="

echo "End Test:`date`"
