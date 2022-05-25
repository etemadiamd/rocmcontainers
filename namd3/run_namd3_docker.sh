#!/bin/sh -x
#************************************************************************************************
# Usage: sudo sh run_namd3_docker.sh                                                        
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.                         
# This script is used to run AMD Infiniy NAMD 3.0 Docker Container                                
# Contact info: roohollah.etemadi@amd.com                                                       
# Version: V1.0                                                                                  
# Modified: 2022-05-24                                                                          
# Version History:                                                                              
# V1.0: amdih/namd3:3.0a9 docker image                                             
#************************************************************************************************
echo "Start Test:`date`"

echo "==== Pull NAMD 3.0 docker image  ===="
echo "docker pull amdih/namd3:3.0a9"
docker pull amdih/namd3:3.0a9
echo "==== Pull complete  ===="

echo "==== Run Test on 1 GPU ===="
echo "docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri -w /examples --security-opt seccomp=unconfined  amdih/namd3:3.0a9 namd3 jac/jac.namd +p1 +setcpuaffinity --CUDASOAintegrate on +devices 0 > jac.log"
docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri -w /examples --security-opt seccomp=unconfined  amdih/namd3:3.0a9 namd3 jac/jac.namd +p1 +setcpuaffinity --CUDASOAintegrate on +devices 0 > jac.log

echo "docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri -w /examples --security-opt seccomp=unconfined  amdih/namd3:3.0a9 namd3 apoa1/apoa1.namd +p1 +setcpuaffinity --CUDASOAintegrate on +devices 0 > apoa1.log"
docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri -w /examples --security-opt seccomp=unconfined  amdih/namd3:3.0a9 namd3 apoa1/apoa1.namd +p1 +setcpuaffinity --CUDASOAintegrate on +devices 0 > apoa1.log

echo "docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri -w /examples --security-opt seccomp=unconfined  amdih/namd3:3.0a9 namd3 f1atpase/f1atpase.namd +p1 +setcpuaffinity --CUDASOAintegrate on +devices 0 > f1atpase.log"
docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri -w /examples --security-opt seccomp=unconfined  amdih/namd3:3.0a9 namd3 f1atpase/f1atpase.namd +p1 +setcpuaffinity --CUDASOAintegrate on +devices 0 > f1atpase.log

echo "docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri -w /examples --security-opt seccomp=unconfined  amdih/namd3:3.0a9 namd3 stmv/stmv.namd +p1 +setcpuaffinity --CUDASOAintegrate on +devices 0 > stmv.log"
docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri -w /examples --security-opt seccomp=unconfined  amdih/namd3:3.0a9 namd3 stmv/stmv.namd +p1 +setcpuaffinity --CUDASOAintegrate on +devices 0 > stmv.log
echo "==== Complete Test on 1 GPU ===="

echo "==== Run Test on 4 GPUs ===="
echo "docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri -w /examples --security-opt seccomp=unconfined  amdih/namd3:3.0a9 namd3 jac/jac.namd +p4 +pemap 0-3 --CUDASOAintegrate on +devices 0,1,2,3 > jac_4gpus.log"
docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri -w /examples --security-opt seccomp=unconfined  amdih/namd3:3.0a9 namd3 jac/jac.namd +p4 +pemap 0-3 --CUDASOAintegrate on +devices 0,1,2,3 > jac_4gpus.log

echo "docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri -w /examples --security-opt seccomp=unconfined  amdih/namd3:3.0a9 namd3 apoa1/apoa1.namd +p4 +pemap 0-3 --CUDASOAintegrate on +devices 0,1,2,3 > apoa1_4gpus.log"
docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri -w /examples --security-opt seccomp=unconfined  amdih/namd3:3.0a9 namd3 apoa1/apoa1.namd +p4 +pemap 0-3 --CUDASOAintegrate on +devices 0,1,2,3 > apoa1_4gpus.log

echo "docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri -w /examples --security-opt seccomp=unconfined  amdih/namd3:3.0a9 namd3 f1atpase/f1atpase.namd +p4 +pemap 0-3 --CUDASOAintegrate on +devices 0,1,2,3 > f1atpase_4gpus.log"
docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri -w /examples --security-opt seccomp=unconfined  amdih/namd3:3.0a9 namd3 f1atpase/f1atpase.namd +p4 +pemap 0-3 --CUDASOAintegrate on +devices 0,1,2,3 > f1atpase_4gpus.log

echo "docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri -w /examples --security-opt seccomp=unconfined  amdih/namd3:3.0a9 namd3 stmv/stmv.namd +p4 +pemap 0-3 --CUDASOAintegrate on +devices 0,1,2,3 > stmv_4gpus.log"
docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri -w /examples --security-opt seccomp=unconfined  amdih/namd3:3.0a9 namd3 stmv/stmv.namd +p4 +pemap 0-3 --CUDASOAintegrate on +devices 0,1,2,3 > stmv_4gpus.log
echo "==== Complete Test on 4 GPUs ===="

echo "End Test:`date`"
