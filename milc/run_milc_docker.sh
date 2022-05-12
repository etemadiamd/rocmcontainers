#!/bin/sh -x
#************************************************************************************************
# Usage: sudo sh run_milc_docker.sh                                                             *
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.                          *
# This script is used to run AMD Infiniy MILC Docker Container                                  *
# Contact info: roohollah.etemadi@amd.com                                                       *
# Version: V1.0                                                                                 * 
# Modified: 2022-05-12                                                                          *
# Version History:                                                                              *
# V1.0: run amdih/milc:c30ed15e1-20210420                                                       *
#************************************************************************************************
echo "Date:`date`"

echo "==== Pull MILC docker image  ===="
echo "docker pull amdih/milc:c30ed15e1-20210420"
docker pull amdih/milc:c30ed15e1-20210420
echo "==== Pull complete  ===="

echo "==== Enable transparent huge pages (THP) ===="
echo "sh -c 'echo always > /sys/kernel/mm/transparent_hugepage/enabled'"
sh -c 'echo always > /sys/kernel/mm/transparent_hugepage/enabled'
echo "cat /sys/kernel/mm/transparent_hugepage/enabled"
cat /sys/kernel/mm/transparent_hugepage/enabled

echo "==== Run MILC docker image in a noninteractive way  ===="
echo "*** Run on One GPU ***"
echo "docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined amdih/milc:c30ed15e1-20210420 /bin/bash -c \"cd /benchmark; run-benchmark -o milc-benchmark.out; cat milc-benchmark.out\""
docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined amdih/milc:c30ed15e1-20210420 /bin/bash -c "cd /benchmark; run-benchmark -o milc-benchmark.out; cat milc-benchmark.out"

echo "*** Run on Two GPUs ***"
echo "docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined amdih/milc:c30ed15e1-20210420 /bin/bash -c \"cd /benchmark; run-benchmark --ngpus 2 -o milc-benchmark_gpu2.out; cat milc-benchmark_gpu2.out\""
docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined amdih/milc:c30ed15e1-20210420 /bin/bash -c "cd /benchmark; run-benchmark --ngpus 2 -o milc-benchmark_gpu2.out; cat milc-benchmark_gpu2.out"

echo "==== Complete the test on date:`date` ===="


