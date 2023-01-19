#!/bin/sh -x
#************************************************************************************************
# Usage: sudo sh run_babelstream_docker.sh                                                        
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.                         
# This script is used to run AMD Infiniy Babelstream Docker Container                                
# Contact info: roohollah.etemadi@amd.com                                                       
# Version: V1.0                                                                                  
# Modified: 2023-01-19                                                                          
# Version History:                                                                              
# V1.0: amddcgpuce/babelstream:4.amd0_6 docker image                                             
#************************************************************************************************
echo "Start Test:`date`"

docker_tag=amddcgpuce/babelstream:4.amd0_6

echo "==== Pull docker image  ===="
echo "docker pull $docker_tag"
docker pull $docker_tag
echo "==== Pull complete  ===="

echo "==== Run Test on 1 GPU ===="
echo `date`
echo "docker run --rm --ipc=host --device=/dev/kfd --device=/dev/dri -v $(pwd):/datadisk-docker $docker_tag bash -c \"mpirun -np 1 ./run_babelstream.sh -s 268435456 -n 100 -w -o results_1gpu; cp /opt/babelstream/build/results* /datadisk-docker\""
docker run --rm --ipc=host --device=/dev/kfd --device=/dev/dri -v $(pwd):/datadisk-docker $docker_tag bash -c "mpirun -np 1 ./run_babelstream.sh -s 268435456 -n 100 -w -o results_1gpu; cp /opt/babelstream/build/results* /datadisk-docker"
echo "==== Complete Test on 1 GPU ===="

echo "==== Run Test on 2 GPU ===="
echo `date`
echo "docker run --rm --ipc=host --device=/dev/kfd --device=/dev/dri -v $(pwd):/datadisk-docker $docker_tag bash -c \"mpirun -np 2 ./run_babelstream.sh -s 268435456 -n 100 -w -o results_2gpu; cp /opt/babelstream/build/results* /datadisk-docker\""
docker run --rm --ipc=host --device=/dev/kfd --device=/dev/dri -v $(pwd):/datadisk-docker $docker_tag bash -c "mpirun -np 2 ./run_babelstream.sh -s 268435456 -n 100 -w -o results_2gpu; cp /opt/babelstream/build/results* /datadisk-docker"
echo "==== Complete Test on 2 GPU ===="


echo "==== Run Test on 4 GPU ===="
echo `date`
echo "docker run --rm --ipc=host --device=/dev/kfd --device=/dev/dri -v $(pwd):/datadisk-docker $docker_tag bash -c \"mpirun -np 4 ./run_babelstream.sh -s 268435456 -n 100 -w -o results_4gpu; cp /opt/babelstream/build/results* /datadisk-docker\""
docker run --rm --ipc=host --device=/dev/kfd --device=/dev/dri -v $(pwd):/datadisk-docker $docker_tag bash -c "mpirun -np 4 ./run_babelstream.sh -s 268435456 -n 100 -w -o results_4gpu; cp /opt/babelstream/build/results* /datadisk-docker"
echo "==== Complete Test on 4 GPU ===="

echo "==== Run Test on 8 GPU ===="
echo `date`
echo "docker run --rm --ipc=host --device=/dev/kfd --device=/dev/dri -v $(pwd):/datadisk-docker $docker_tag bash -c \"mpirun -np 8 ./run_babelstream.sh -s 268435456 -n 100 -w -o results_8gpu; cp /opt/babelstream/build/results* /datadisk-docker\""
docker run --rm --ipc=host --device=/dev/kfd --device=/dev/dri -v $(pwd):/datadisk-docker $docker_tag bash -c "mpirun -np 8 ./run_babelstream.sh -s 268435456 -n 100 -w -o results_8gpu; cp /opt/babelstream/build/results* /datadisk-docker"
echo "==== Complete Test on 8 GPU ===="
