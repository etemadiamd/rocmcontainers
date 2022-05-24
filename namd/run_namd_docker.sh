#!/bin/sh -x
#************************************************************************************************
# Usage: sudo sh run_namd_docker.sh                                                        
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.                         
# This script is used to run AMD Infiniy NAMD Docker Container                                
# Contact info: roohollah.etemadi@amd.com                                                       
# Version: V1.0                                                                                  
# Modified: 2022-05-24                                                                          
# Version History:                                                                              
# V1.0: amdih/namd:2.15a2-20211101 docker image                                             
#************************************************************************************************
echo "Start Test:`date`"

echo "==== Pull NAMD docker image  ===="
echo "docker pull amdih/namd:2.15a2-20211101"
docker pull amdih/namd:2.15a2-20211101
echo "==== Pull complete  ===="

echo "==== Run Test on 1 GPU ===="
echo "docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri -w /examples --security-opt seccomp=unconfined  amdih/namd:2.15a2-20211101 /opt/namd/bin/namd2 jac/jac.namd +p64 +setcpuaffinity +devices 0 > jac.log"
docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri -w /examples --security-opt seccomp=unconfined  amdih/namd:2.15a2-20211101 /opt/namd/bin/namd2 jac/jac.namd +p64 +setcpuaffinity +devices 0 > jac.log

echo "docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri -w /examples --security-opt seccomp=unconfined  amdih/namd:2.15a2-20211101 /opt/namd/bin/namd2 apoa1/apoa1.namd +p64 +setcpuaffinity +devices 0 > apoa1.log"
docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri -w /examples --security-opt seccomp=unconfined  amdih/namd:2.15a2-20211101 /opt/namd/bin/namd2  apoa1/apoa1.namd +p64 +setcpuaffinity +devices 0 > apoa1.log

echo "docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri -w /examples --security-opt seccomp=unconfined  amdih/namd:2.15a2-20211101 /opt/namd/bin/namd2 f1atpase/f1atpase.namd +p64 +setcpuaffinity +devices 0 > f1atpase.log"
docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri -w /examples --security-opt seccomp=unconfined  amdih/namd:2.15a2-20211101 /opt/namd/bin/namd2 f1atpase/f1atpase.namd +p64 +setcpuaffinity +devices 0 > f1atpase.log

echo "docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri -w /examples --security-opt seccomp=unconfined  amdih/namd:2.15a2-20211101  /opt/namd/bin/namd2 stmv/stmv.namd +p64 +setcpuaffinity +devices 0 > stmv.log"
docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri -w /examples --security-opt seccomp=unconfined  amdih/namd:2.15a2-20211101 /opt/namd/bin/namd2 stmv/stmv.namd +p64 +setcpuaffinity +devices 0 > stmv.log

echo "==== Complete Test on 1 GPU ===="

echo "End Test:`date`"
