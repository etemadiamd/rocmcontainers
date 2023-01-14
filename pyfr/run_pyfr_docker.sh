#!/bin/sh -x
#************************************************************************************************
# Usage: sudo sh run_pyfr_docker.sh                                                        
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.                         
# This script is used to run AMD Infiniy PyFr Docker Container                                
# Contact info: roohollah.etemadi@amd.com                                                       
# Contact info: anand.raghavendra@amd.com                                   
# Version: V1.1                                                                                  
# Modified: 2023-01-14                                                                          
# Version History:                                                                              
# V1.1: added the docker commands for NACA0021 benchmark 
# Version: V1.0                                                                                  
# Modified: 2022-05-26                                                                          
# Version History:                                                                              
# V1.0: amdih/pyfr:1.13.0_44 docker image                                             
#************************************************************************************************
echo "Start PyFR:`date`"

echo "==== Pull docker image  ===="
echo "docker pull amdih/pyfr:1.13.0_44"
docker pull amdih/pyfr:1.13.0_44
echo "==== Pull complete  ===="

echo "==== Run BSF, TGV and NACA0021 Benchmarks on 1 GPU ===="
echo "docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined amdih/pyfr:1.13.0_44 /bin/bash -c \"run-benchmark BSF --ngpus 1\""
docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined amdih/pyfr:1.13.0_44 /bin/bash -c "run-benchmark BSF --ngpus 1"

echo "docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined amdih/pyfr:1.13.0_44 /bin/bash -c \"run-benchmark tgv --ngpus 1\""
docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined amdih/pyfr:1.13.0_44 /bin/bash -c "run-benchmark tgv --ngpus 1"

echo "docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined amdih/pyfr:1.13.0_44 /bin/bash -c \"run-benchmark naca0021 --ngpus 1\""
docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined amdih/pyfr:1.13.0_44 /bin/bash -c "run-benchmark naca0021 --ngpus 1"
echo "==== Completed tests on 1 GPU ===="

echo "==== Run TGV and NACA0021 Benchmarks on 2 GPUs ===="
echo "docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined amdih/pyfr:1.13.0_44 /bin/bash -c \"run-benchmark tgv --ngpus 2\""
docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined amdih/pyfr:1.13.0_44 /bin/bash -c "run-benchmark tgv --ngpus 2"

echo "docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined amdih/pyfr:1.13.0_44 /bin/bash -c \"run-benchmark naca0021 --ngpus 2\""
docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined amdih/pyfr:1.13.0_44 /bin/bash -c "run-benchmark naca0021 --ngpus 2"
echo "==== Completed Test on 2 GPUs ===="

echo "End Test:`date`"
