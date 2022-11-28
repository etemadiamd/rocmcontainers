#************************************************************************************************
#Usage: sudo sh run_rochpl_podman.sh                                                        
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.                         
# This script is used to run AMD Infiniy rocHPL Docker Container on MI200 GPUs using podman                               
# Contact info: roohollah.etemadi@amd.com                                                       
# Version: V1.0                                                                                  
# Modified: 2022-08-23                                                                          
# Version History:                                                                              
# V1.0: amdih/rochpl:5.0.5_49 docker image                                             
#************************************************************************************************
#!/bin/sh -x

echo "Start Test:`date`"

echo "1 gpu"
echo "podman run -it --ipc=host --network=host --device=/dev/kfd --device=/dev/dri --group-add video  --security-opt seccomp=unconfined -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amdih/rochpl:5.0.5_49 /bin/bash -c mpirun_rochpl -P 1 -Q 1 -N 90112 --NB 512"
podman run -it --ipc=host --network=host --device=/dev/kfd --device=/dev/dri --group-add video  --security-opt seccomp=unconfined -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amdih/rochpl:5.0.5_49 /bin/bash -c "mpirun_rochpl -P 1 -Q 1 -N 90112 --NB 512"

echo "2 gpu"
echo "podman run -it --ipc=host --network=host --device=/dev/kfd --device=/dev/dri --group-add video  --security-opt seccomp=unconfined -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amdih/rochpl:5.0.5_49 /bin/bash -c mpirun_rochpl -P 2 -Q 1 -N 128000 --NB 512"
podman run -it --ipc=host --network=host --device=/dev/kfd --device=/dev/dri --group-add video  --security-opt seccomp=unconfined -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amdih/rochpl:5.0.5_49 /bin/bash -c "mpirun_rochpl -P 2 -Q 1 -N 128000 --NB 512"

echo "4 gpu"
echo "podman run -it --ipc=host --network=host --device=/dev/kfd --device=/dev/dri --group-add video  --security-opt seccomp=unconfined -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amdih/rochpl:5.0.5_49 /bin/bash -c mpirun_rochpl -P 2 -Q 2 -N 180224 --NB 512"
podman run -it --ipc=host --network=host --device=/dev/kfd --device=/dev/dri --group-add video  --security-opt seccomp=unconfined -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amdih/rochpl:5.0.5_49 /bin/bash -c "mpirun_rochpl -P 2 -Q 2 -N 180224 --NB 512"

echo "8 gpu"
echo "podman run -it --ipc=host --network=host --device=/dev/kfd --device=/dev/dri --group-add video  --security-opt seccomp=unconfined -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amdih/rochpl:5.0.5_49 /bin/bash -c mpirun_rochpl -P 2 -Q 4 -N 256000 --NB 512"
podman run -it --ipc=host --network=host --device=/dev/kfd --device=/dev/dri --group-add video  --security-opt seccomp=unconfined -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amdih/rochpl:5.0.5_49 /bin/bash -c "mpirun_rochpl -P 2 -Q 4 -N 256000 --NB 512"

echo "16 gpu"
echo "podman run -it --ipc=host --network=host --device=/dev/kfd --device=/dev/dri --group-add video  --security-opt seccomp=unconfined -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amdih/rochpl:5.0.5_49 /bin/bash -c mpirun_rochpl -P 4 -Q 4 -N 360448 --NB 512"
podman run -it --ipc=host --network=host --device=/dev/kfd --device=/dev/dri --group-add video  --security-opt seccomp=unconfined -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amdih/rochpl:5.0.5_49 /bin/bash -c "mpirun_rochpl -P 4 -Q 4 -N 360448 --NB 512"

echo "End Test:`date`"
