#!/bin/sh -x
#************************************************************************************************
# Usage: sudo sh run_lammps_docker.sh                                                                 *
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.                          *
# This script is used to run AMD Infiniy LAMMPS Docker Container                                *
# Contact info: roohollah.etemadi@amd.com                                                       *
# Version: V1.0                                                                                   * 
# Modified: 2022-05-02                                                                          *
# Version History:                                                                              *
# V1.0: run amdih/lammps:2021.5.14_121 docker image                                                *
#************************************************************************************************
echo "Date:`date`"

echo "==== Pull LAMMPS docker image  ===="
echo "docker pull amdih/lammps:2021.5.14_121"
docker pull amdih/lammps:2021.5.14_121
echo "==== Pull complete  ===="

echo "==== Run LAMMPS docker image in a noninteractive way  ===="
echo "****Test on one MI200 GPU****"
echo "docker run --rm --ipc=host --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined -w /benchmark -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amdih/lammps:2021.5.14_121 ./benchmark.sh --mode run --prefix /opt/lammps --gpu-aware-mpi --comm device --with-mpi /opt/lammps/tpl/openmpi --kokkos-gpu-arch VEGA90a --memsize 32 --ngpus 1 --out-label /tmp/gpu1"
docker run --rm --ipc=host --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined -w /benchmark -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amdih/lammps:2021.5.14_121 ./benchmark.sh --mode run --prefix /opt/lammps --gpu-aware-mpi --comm device --with-mpi /opt/lammps/tpl/openmpi --kokkos-gpu-arch VEGA90a --memsize 32 --ngpus 1 --out-label /tmp/gpu1

echo "****Test on two MI200 GPUs****"
echo "docker run --rm --ipc=host --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined -w /benchmark -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amdih/lammps:2021.5.14_121 ./benchmark.sh --mode run --prefix /opt/lammps --gpu-aware-mpi --comm device --with-mpi /opt/lammps/tpl/openmpi --kokkos-gpu-arch VEGA90a --memsize 32 --ngpus 2 --out-label /tmp/gpu2"
docker run --rm --ipc=host --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined -w /benchmark -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amdih/lammps:2021.5.14_121 ./benchmark.sh --mode run --prefix /opt/lammps --gpu-aware-mpi --comm device --with-mpi /opt/lammps/tpl/openmpi --kokkos-gpu-arch VEGA90a --memsize 32 --ngpus 2 --out-label /tmp/gpu2


echo "****Test on four MI200 GPUs****"
echo "docker run --rm --ipc=host --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined -w /benchmark -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amdih/lammps:2021.5.14_121 ./benchmark.sh --mode run --prefix /opt/lammps --gpu-aware-mpi --comm device --with-mpi /opt/lammps/tpl/openmpi --kokkos-gpu-arch VEGA90a --memsize 32 --ngpus 4 --out-label /tmp/gpu4"
docker run --rm --ipc=host --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined -w /benchmark -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amdih/lammps:2021.5.14_121 ./benchmark.sh --mode run --prefix /opt/lammps --gpu-aware-mpi --comm device --with-mpi /opt/lammps/tpl/openmpi --kokkos-gpu-arch VEGA90a --memsize 32 --ngpus 4 --out-label /tmp/gpu4

echo "****Test on eight MI200 GPUs****"
echo "docker run --rm --ipc=host --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined -w /benchmark -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amdih/lammps:2021.5.14_121 ./benchmark.sh --mode run --prefix /opt/lammps --gpu-aware-mpi --comm device --with-mpi /opt/lammps/tpl/openmpi --kokkos-gpu-arch VEGA90a --memsize 32 --ngpus 8 --out-label /tmp/gpu8"
docker run --rm --ipc=host --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined -w /benchmark -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amdih/lammps:2021.5.14_121 ./benchmark.sh --mode run --prefix /opt/lammps --gpu-aware-mpi --comm device --with-mpi /opt/lammps/tpl/openmpi --kokkos-gpu-arch VEGA90a --memsize 32 --ngpus 8 --out-label /tmp/gpu8

echo "==== Run complete ===="
