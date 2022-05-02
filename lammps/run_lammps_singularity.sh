#!/bin/sh -x
#************************************************************************************************
# Usage: sh run_lammps_singularity.sh                                                            *
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.                          *
# This script is used to run AMD Infiniy LAMMPS singularity commands                            *
# Contact info: roohollah.etemadi@amd.com                                                       *
# Version: V1.0                                                                                   * 
# Modified: 2022-05-02                                                                          *
# Version History:                                                                              *
# V1.0: run amdih/lammps:2021.5.14_121 singularity commands                                                *
#************************************************************************************************
echo "Date: `date`"

echo "==== Pull singularity image ===="
echo "singularity pull lammps.sif docker://amdih/lammps:2021.5.14_121"
singularity pull lammps.sif docker://amdih/lammps:2021.5.14_121
echo "==== Pull complete ===="

echo "==== Run singulariy test ===="
echo "**** Test on one MI200 GPU ****"
echo "singularity run --pwd /benchmark --writable-tmpfs lammps.sif ./benchmark.sh --mode run --prefix /opt/lammps --gpu-aware-mpi --comm device --with-mpi /opt/lammps/tpl/openmpi --kokkos-gpu-arch VEGA90a --ngpus 1 --memsize 32 --out-label /tmp/gpu1"
singularity run --pwd /benchmark --writable-tmpfs lammps.sif ./benchmark.sh --mode run --prefix /opt/lammps --gpu-aware-mpi --comm device --with-mpi /opt/lammps/tpl/openmpi --kokkos-gpu-arch VEGA90a --ngpus 1 --memsize 32 --out-label /tmp/gpu1

echo "**** Test on two MI200 GPUs ****"
echo "singularity run --pwd /benchmark --writable-tmpfs lammps.sif ./benchmark.sh --mode run --prefix /opt/lammps --gpu-aware-mpi --comm device --with-mpi /opt/lammps/tpl/openmpi --kokkos-gpu-arch VEGA90a --ngpus 2 --memsize 32 --out-label /tmp/gpu2"
singularity run --pwd /benchmark --writable-tmpfs lammps.sif ./benchmark.sh --mode run --prefix /opt/lammps --gpu-aware-mpi --comm device --with-mpi /opt/lammps/tpl/openmpi --kokkos-gpu-arch VEGA90a --ngpus 2 --memsize 32 --out-label /tmp/gpu2

echo "**** Test on four MI200 GPUs ****"
echo "singularity run --pwd /benchmark --writable-tmpfs lammps.sif ./benchmark.sh --mode run --prefix /opt/lammps --gpu-aware-mpi --comm device --with-mpi /opt/lammps/tpl/openmpi --kokkos-gpu-arch VEGA90a --ngpus 4 --memsize 32 --out-label /tmp/gpu4"
singularity run --pwd /benchmark --writable-tmpfs lammps.sif ./benchmark.sh --mode run --prefix /opt/lammps --gpu-aware-mpi --comm device --with-mpi /opt/lammps/tpl/openmpi --kokkos-gpu-arch VEGA90a --ngpus 4 --memsize 32 --out-label /tmp/gpu4

echo "**** Test on eight MI200 GPUs ****"
echo "singularity run --pwd /benchmark --writable-tmpfs lammps.sif ./benchmark.sh --mode run --prefix /opt/lammps --gpu-aware-mpi --comm device --with-mpi /opt/lammps/tpl/openmpi --kokkos-gpu-arch VEGA90a --ngpus 8 --memsize 32 --out-label /tmp/gpu8"
singularity run --pwd /benchmark --writable-tmpfs lammps.sif ./benchmark.sh --mode run --prefix /opt/lammps --gpu-aware-mpi --comm device --with-mpi /opt/lammps/tpl/openmpi --kokkos-gpu-arch VEGA90a --ngpus 8 --memsize 32 --out-label /tmp/gpu8

echo "==== Run complete ====" 
