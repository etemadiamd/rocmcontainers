#!/bin/sh -x
#************************************************************************************************
# Usage: sh run_gromacs_singularity.sh                                                            *
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.                          *
# This script is used to run AMD Infiniy Gromacs singularity commands                            *
# Contact info: roohollah.etemadi@amd.com                                                       *
# Version: V1.0                                                                                   * 
# Modified: 2022-05-05                                                                          *
# Version History:                                                                              *
# V1.0: run amdih/gromacs:2021.1 singularity commands                                                *
#************************************************************************************************
echo "Date: `date`"

echo "==== Pull singularity image ===="
echo "singularity pull gromacs.sif docker://amdih/gromacs:2021.1"
singularity pull gromacs.sif docker://amdih/gromacs:2021.1
echo "==== Pull complete ===="

echo "==== Example With Threaded MPI:  STMV Benchmark ===="
echo "**** Eight GPUs ****"
echo "singularity run ./gromacs.sif tar -xvf /benchmarks/stmv/stmv.tar.gz"
singularity run ./gromacs.sif tar -xvf /benchmarks/stmv/stmv.tar.gz
echo "singularity run ./gromacs.sif gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 8 -ntomp 8 -noconfout -nb gpu -bonded gpu -pme gpu -v -gpu_id 01234567 -npme 1 -s topol.tpr -nstlist 400"
singularity run ./gromacs.sif gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 8 -ntomp 8 -noconfout -nb gpu -bonded gpu -pme gpu -v -gpu_id 01234567 -npme 1 -s topol.tpr -nstlist 400

echo "==== Example With MPI:  STMV Benchmark ===="
echo "**** Eight GPUs ****"
echo "singularity run ./gromacs.sif tar -xvf /benchmarks/stmv/stmv.tar.gz"
singularity run ./gromacs.sif tar -xvf /benchmarks/stmv/stmv.tar.gz
echo "singularity run ./gromacs.sif mpirun -np 8 gmx_mpi mdrun -nsteps 100000 -resetstep 90000 -ntomp 8 -noconfout -nb gpu -bonded cpu -pme gpu -npme 1 -v -nstlist 400 -gpu_id 01234567 -s topol.tpr"
singularity run ./gromacs.sif mpirun -np 8 gmx_mpi mdrun -nsteps 100000 -resetstep 90000 -ntomp 8 -noconfout -nb gpu -bonded cpu -pme gpu -npme 1 -v -nstlist 400 -gpu_id 01234567 -s topol.tpr

echo "==== Run complete ====" 
