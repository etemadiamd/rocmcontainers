#!/bin/sh -x
#************************************************************************************************
# Usage: sudo sh run_gromacs_docker.sh                                                                 *
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.                          *
# This script is used to run AMD Infiniy Gromacs Docker Container                                *
# Contact info: roohollah.etemadi@amd.com                                                       *
# Version: V1.0                                                                                   * 
# Modified: 2022-05-05                                                                          *
# Version History:                                                                              *
# V1.0: run amdih/gromacs:2021.1                                             *
#************************************************************************************************
echo "Date:`date`"

echo "==== Pull Gromacs docker image  ===="
echo "docker pull amdih/gromacs:2021.1"
docker pull amdih/gromacs:2021.1
echo "==== Pull complete  ===="

echo "==== Run Gromacs docker image in a noninteractive way  ===="
echo "*** Example With Threaded MPI: AD_DODEC benchmark on One GPU ***"
echo "docker run --rm -it --device=/dev/kfd --device=/dev/dri --ipc=host --security-opt seccomp=unconfined -e GMX_GPU_DD_COMMS=true -e GMX_GPU_PME_PP_COMMS=true -e GMX_FORCE_UPDATE_DEFAULT_GPU=true amdih/gromacs:2021.1 /bin/bash -c \"cd /benchmarks/adh_dodec; tar -xvf adh_dodec.tar.gz; gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 1 -ntomp 64 -noconfout -nb gpu -bonded cpu -pme gpu -v -nstlist 100 -gpu_id 0 -s topol.tpr\""
docker run --rm -it --device=/dev/kfd --device=/dev/dri --ipc=host --security-opt seccomp=unconfined -e GMX_GPU_DD_COMMS=true -e GMX_GPU_PME_PP_COMMS=true -e GMX_FORCE_UPDATE_DEFAULT_GPU=true amdih/gromacs:2021.1 /bin/bash -c "cd /benchmarks/adh_dodec; tar -xvf adh_dodec.tar.gz; gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 1 -ntomp 64 -noconfout -nb gpu -bonded cpu -pme gpu -v -nstlist 100 -gpu_id 0 -s topol.tpr"

echo "*** Example With Threaded MPI: AD_DODEC benchmark on Two GPUs ***"
echo "docker run --rm -it --device=/dev/kfd --device=/dev/dri --ipc=host --security-opt seccomp=unconfined -e GMX_GPU_DD_COMMS=true -e GMX_GPU_PME_PP_COMMS=true -e GMX_FORCE_UPDATE_DEFAULT_GPU=true amdih/gromacs:2021.1 /bin/bash -c \"cd /benchmarks/adh_dodec; tar -xvf adh_dodec.tar.gz; gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 2 -ntomp 32 -noconfout -nb gpu -bonded gpu -pme gpu -npme 1 -v -nstlist 200 -gpu_id 01 -s topol.tpr\""
docker run --rm -it --device=/dev/kfd --device=/dev/dri --ipc=host --security-opt seccomp=unconfined -e GMX_GPU_DD_COMMS=true -e GMX_GPU_PME_PP_COMMS=true -e GMX_FORCE_UPDATE_DEFAULT_GPU=true amdih/gromacs:2021.1 /bin/bash -c "cd /benchmarks/adh_dodec; tar -xvf adh_dodec.tar.gz; gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 2 -ntomp 32 -noconfout -nb gpu -bonded gpu -pme gpu -npme 1 -v -nstlist 200 -gpu_id 01 -s topol.tpr"

echo "*** Example With Threaded MPI: AD_DODEC benchmark on Four GPUs ***"
echo "docker run --rm -it --device=/dev/kfd --device=/dev/dri --ipc=host --security-opt seccomp=unconfined -e GMX_GPU_DD_COMMS=true -e GMX_GPU_PME_PP_COMMS=true -e GMX_FORCE_UPDATE_DEFAULT_GPU=true amdih/gromacs:2021.1 /bin/bash -c \"cd /benchmarks/adh_dodec; tar -xvf adh_dodec.tar.gz; gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 4 -ntomp 16 -noconfout -nb gpu -bonded gpu -pme gpu -npme 1 -v -nstlist 200 -gpu_id 0123 -s topol.tpr\""
docker run --rm -it --device=/dev/kfd --device=/dev/dri --ipc=host --security-opt seccomp=unconfined -e GMX_GPU_DD_COMMS=true -e GMX_GPU_PME_PP_COMMS=true -e GMX_FORCE_UPDATE_DEFAULT_GPU=true amdih/gromacs:2021.1 /bin/bash -c "cd /benchmarks/adh_dodec; tar -xvf adh_dodec.tar.gz; gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 4 -ntomp 16 -noconfout -nb gpu -bonded gpu -pme gpu -npme 1 -v -nstlist 200 -gpu_id 0123 -s topol.tpr"

echo "*** Example With Threaded MPI: AD_DODEC benchmark on Eight GPUs ***"
echo "docker run --rm -it --device=/dev/kfd --device=/dev/dri --ipc=host --security-opt seccomp=unconfined -e GMX_GPU_DD_COMMS=true -e GMX_GPU_PME_PP_COMMS=true -e GMX_FORCE_UPDATE_DEFAULT_GPU=true amdih/gromacs:2021.1 /bin/bash -c \"cd /benchmarks/adh_dodec; tar -xvf adh_dodec.tar.gz; gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 8 -ntomp 8 -noconfout -nb gpu -bonded gpu -pme gpu -npme 1 -v -nstlist 150 -gpu_id 01234567 -s topol.tpr\""
docker run --rm -it --device=/dev/kfd --device=/dev/dri --ipc=host --security-opt seccomp=unconfined -e GMX_GPU_DD_COMMS=true -e GMX_GPU_PME_PP_COMMS=true -e GMX_FORCE_UPDATE_DEFAULT_GPU=true amdih/gromacs:2021.1 /bin/bash -c "cd /benchmarks/adh_dodec; tar -xvf adh_dodec.tar.gz; gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 8 -ntomp 8 -noconfout -nb gpu -bonded gpu -pme gpu -npme 1 -v -nstlist 150 -gpu_id 01234567 -s topol.tpr"

echo "*** Example With Threaded MPI: CELLULOSE_NVE benchmark on One GPU ***"
echo "docker run --rm -it --device=/dev/kfd --device=/dev/dri --ipc=host --security-opt seccomp=unconfined -e GMX_GPU_DD_COMMS=true -e GMX_GPU_PME_PP_COMMS=true -e GMX_FORCE_UPDATE_DEFAULT_GPU=true amdih/gromacs:2021.1 /bin/bash -c \"cd /benchmarks/cellulose_nve; tar -xvf cellulose_nve.tar.gz; gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 1 -ntomp 64 -noconfout -nb gpu -bonded cpu -pme gpu -v -nstlist 100 -gpu_id 0 -s topol.tpr\""
docker run --rm -it --device=/dev/kfd --device=/dev/dri --ipc=host --security-opt seccomp=unconfined -e GMX_GPU_DD_COMMS=true -e GMX_GPU_PME_PP_COMMS=true -e GMX_FORCE_UPDATE_DEFAULT_GPU=true amdih/gromacs:2021.1 /bin/bash -c "cd /benchmarks/cellulose_nve; tar -xvf cellulose_nve.tar.gz; gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 1 -ntomp 64 -noconfout -nb gpu -bonded cpu -pme gpu -v -nstlist 100 -gpu_id 0 -s topol.tpr"

echo "*** Example With Threaded MPI: CELLULOSE_NVE benchmark on Two GPUs ***"
echo "docker run --rm -it --device=/dev/kfd --device=/dev/dri --ipc=host --security-opt seccomp=unconfined -e GMX_GPU_DD_COMMS=true -e GMX_GPU_PME_PP_COMMS=true -e GMX_FORCE_UPDATE_DEFAULT_GPU=true amdih/gromacs:2021.1 /bin/bash -c \"cd /benchmarks/cellulose_nve; tar -xvf cellulose_nve.tar.gz; gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 4 -ntomp 16 -noconfout -nb gpu -bonded gpu -pme gpu -npme 1 -v -nstlist 200 -gpu_id 01 -s topol.tpr\""
docker run --rm -it --device=/dev/kfd --device=/dev/dri --ipc=host --security-opt seccomp=unconfined -e GMX_GPU_DD_COMMS=true -e GMX_GPU_PME_PP_COMMS=true -e GMX_FORCE_UPDATE_DEFAULT_GPU=true amdih/gromacs:2021.1 /bin/bash -c "cd /benchmarks/cellulose_nve; tar -xvf cellulose_nve.tar.gz; gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 4 -ntomp 16 -noconfout -nb gpu -bonded gpu -pme gpu -npme 1 -v -nstlist 200 -gpu_id 01 -s topol.tpr"

echo "*** Example With Threaded MPI: CELLULOSE_NVE benchmark on Four GPUs ***"
echo "docker run --rm -it --device=/dev/kfd --device=/dev/dri --ipc=host --security-opt seccomp=unconfined -e GMX_GPU_DD_COMMS=true -e GMX_GPU_PME_PP_COMMS=true -e GMX_FORCE_UPDATE_DEFAULT_GPU=true amdih/gromacs:2021.1 /bin/bash -c \"cd /benchmarks/cellulose_nve; tar -xvf cellulose_nve.tar.gz; gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 4 -ntomp 16 -noconfout -nb gpu -bonded gpu -pme gpu -npme 1 -v -nstlist 200 -gpu_id 0123 -s topol.tpr\""
docker run --rm -it --device=/dev/kfd --device=/dev/dri --ipc=host --security-opt seccomp=unconfined -e GMX_GPU_DD_COMMS=true -e GMX_GPU_PME_PP_COMMS=true -e GMX_FORCE_UPDATE_DEFAULT_GPU=true amdih/gromacs:2021.1 /bin/bash -c "cd /benchmarks/cellulose_nve; tar -xvf cellulose_nve.tar.gz; gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 4 -ntomp 16 -noconfout -nb gpu -bonded gpu -pme gpu -npme 1 -v -nstlist 200 -gpu_id 0123 -s topol.tpr"

echo "*** Example With Threaded MPI: CELLULOSE_NVE benchmark on Eight GPUs ***"
echo "docker run --rm -it --device=/dev/kfd --device=/dev/dri --ipc=host --security-opt seccomp=unconfined -e GMX_GPU_DD_COMMS=true -e GMX_GPU_PME_PP_COMMS=true -e GMX_FORCE_UPDATE_DEFAULT_GPU=true amdih/gromacs:2021.1 /bin/bash -c \"cd /benchmarks/cellulose_nve; tar -xvf cellulose_nve.tar.gz; gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 8 -ntomp 8 -noconfout -nb gpu -bonded gpu -pme gpu -npme 1 -v -nstlist 200 -gpu_id 01234567 -s topol.tpr\""
docker run --rm -it --device=/dev/kfd --device=/dev/dri --ipc=host --security-opt seccomp=unconfined -e GMX_GPU_DD_COMMS=true -e GMX_GPU_PME_PP_COMMS=true -e GMX_FORCE_UPDATE_DEFAULT_GPU=true amdih/gromacs:2021.1 /bin/bash -c "cd /benchmarks/cellulose_nve; tar -xvf cellulose_nve.tar.gz; gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 8 -ntomp 8 -noconfout -nb gpu -bonded gpu -pme gpu -npme 1 -v -nstlist 200 -gpu_id 01234567 -s topol.tpr"

echo "*** Example With Threaded MPI: STMV benchmark on One GPU ***"
echo "docker run --rm -it --device=/dev/kfd --device=/dev/dri --ipc=host --security-opt seccomp=unconfined -e GMX_GPU_DD_COMMS=true -e GMX_GPU_PME_PP_COMMS=true -e GMX_FORCE_UPDATE_DEFAULT_GPU=true amdih/gromacs:2021.1 /bin/bash -c \"cd /benchmarks/stmv; tar -xvf stmv.tar.gz; gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 1 -ntomp 64 -noconfout -nb gpu -bonded cpu -pme gpu -v -nstlist 200 -gpu_id 0 -s topol.tpr \""
docker run --rm -it --device=/dev/kfd --device=/dev/dri --ipc=host --security-opt seccomp=unconfined -e GMX_GPU_DD_COMMS=true -e GMX_GPU_PME_PP_COMMS=true -e GMX_FORCE_UPDATE_DEFAULT_GPU=true amdih/gromacs:2021.1 /bin/bash -c " cd /benchmarks/stmv; tar -xvf stmv.tar.gz; gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 1 -ntomp 64 -noconfout -nb gpu -bonded cpu -pme gpu -v -nstlist 200 -gpu_id 0 -s topol.tpr"

echo "*** Example With Threaded MPI: STMV benchmark on Two GPUs ***"
echo "docker run --rm -it --device=/dev/kfd --device=/dev/dri --ipc=host --security-opt seccomp=unconfined -e GMX_GPU_DD_COMMS=true -e GMX_GPU_PME_PP_COMMS=true -e GMX_FORCE_UPDATE_DEFAULT_GPU=true amdih/gromacs:2021.1 /bin/bash -c \"cd /benchmarks/stmv; tar -xvf stmv.tar.gz; gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 8 -ntomp 8 -noconfout -nb gpu -bonded gpu -pme gpu -npme 1 -v -nstlist 200 -gpu_id 01 -s topol.tpr\""
docker run --rm -it --device=/dev/kfd --device=/dev/dri --ipc=host --security-opt seccomp=unconfined -e GMX_GPU_DD_COMMS=true -e GMX_GPU_PME_PP_COMMS=true -e GMX_FORCE_UPDATE_DEFAULT_GPU=true amdih/gromacs:2021.1 /bin/bash -c " cd /benchmarks/stmv; tar -xvf stmv.tar.gz; gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 8 -ntomp 8 -noconfout -nb gpu -bonded gpu -pme gpu -npme 1 -v -nstlist 200 -gpu_id 01 -s topol.tpr"

echo "*** Example With Threaded MPI: STMV benchmark on Four GPUs ***"
echo "docker run --rm -it --device=/dev/kfd --device=/dev/dri --ipc=host --security-opt seccomp=unconfined -e GMX_GPU_DD_COMMS=true -e GMX_GPU_PME_PP_COMMS=true -e GMX_FORCE_UPDATE_DEFAULT_GPU=true amdih/gromacs:2021.1 /bin/bash -c \"cd /benchmarks/stmv; tar -xvf stmv.tar.gz; gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 8 -ntomp 8 -noconfout -nb gpu -bonded gpu -pme gpu -npme 1 -v -nstlist 400 -gpu_id 0123 -s topol.tpr\""
docker run --rm -it --device=/dev/kfd --device=/dev/dri --ipc=host --security-opt seccomp=unconfined -e GMX_GPU_DD_COMMS=true -e GMX_GPU_PME_PP_COMMS=true -e GMX_FORCE_UPDATE_DEFAULT_GPU=true amdih/gromacs:2021.1 /bin/bash -c " cd /benchmarks/stmv; tar -xvf stmv.tar.gz; gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 8 -ntomp 8 -noconfout -nb gpu -bonded gpu -pme gpu -npme 1 -v -nstlist 400 -gpu_id 0123 -s topol.tpr"

echo "*** Example With Threaded MPI: STMV benchmark on Eight GPUs ***"
echo "docker run --rm -it --device=/dev/kfd --device=/dev/dri --ipc=host --security-opt seccomp=unconfined -e GMX_GPU_DD_COMMS=true -e GMX_GPU_PME_PP_COMMS=true -e GMX_FORCE_UPDATE_DEFAULT_GPU=true amdih/gromacs:2021.1 /bin/bash -c \"cd /benchmarks/stmv; tar -xvf stmv.tar.gz; gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 8 -ntomp 8 -noconfout -nb gpu -bonded gpu -pme gpu -npme 1 -v -nstlist 400 -gpu_id 01234567 -s topol.tpr\""
docker run --rm -it --device=/dev/kfd --device=/dev/dri --ipc=host --security-opt seccomp=unconfined -e GMX_GPU_DD_COMMS=true -e GMX_GPU_PME_PP_COMMS=true -e GMX_FORCE_UPDATE_DEFAULT_GPU=true amdih/gromacs:2021.1 /bin/bash -c " cd /benchmarks/stmv; tar -xvf stmv.tar.gz; gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 8 -ntomp 8 -noconfout -nb gpu -bonded gpu -pme gpu -npme 1 -v -nstlist 400 -gpu_id 01234567 -s topol.tpr"


echo "*** Example With MPI: STMV benchmark on One GPU ***"
echo "docker run --rm -it --device=/dev/kfd --device=/dev/dri --ipc=host --security-opt seccomp=unconfined -e GMX_GPU_DD_COMMS=true -e GMX_GPU_PME_PP_COMMS=true -e GMX_FORCE_UPDATE_DEFAULT_GPU=true amdih/gromacs:2021.1 /bin/bash -c \" cd /benchmarks/stmv; tar -xvf stmv.tar.gz; mpirun --allow-run-as-root -np 1 gmx_mpi mdrun -nsteps 100000 -resetstep 90000 -ntomp 64 -noconfout -nb gpu -bonded cpu -pme gpu -v -nstlist 100 -gpu_id 0 -s topol.tpr\""
docker run --rm -it --device=/dev/kfd --device=/dev/dri --ipc=host --security-opt seccomp=unconfined -e GMX_GPU_DD_COMMS=true -e GMX_GPU_PME_PP_COMMS=true -e GMX_FORCE_UPDATE_DEFAULT_GPU=true amdih/gromacs:2021.1 /bin/bash -c "cd /benchmarks/stmv; tar -xvf stmv.tar.gz; mpirun --allow-run-as-root -np 1 gmx_mpi mdrun -nsteps 100000 -resetstep 90000 -ntomp 64 -noconfout -nb gpu -bonded cpu -pme gpu -v -nstlist 100 -gpu_id 0 -s topol.tpr"

echo "*** Example With MPI: STMV benchmark on Two GPUs ***"
echo "docker run --rm -it --device=/dev/kfd --device=/dev/dri --ipc=host --security-opt seccomp=unconfined -e GMX_GPU_DD_COMMS=true -e GMX_GPU_PME_PP_COMMS=true -e GMX_FORCE_UPDATE_DEFAULT_GPU=true amdih/gromacs:2021.1 /bin/bash -c \" cd /benchmarks/stmv; tar -xvf stmv.tar.gz; mpirun --allow-run-as-root -np 4 gmx_mpi mdrun -pin on -nsteps 100000 -resetstep 90000 -ntomp 16 -noconfout -nb gpu -bonded cpu -pme gpu -npme 1 -v -nstlist 200 -gpu_id 01 -s topol.tpr\""
docker run --rm -it --device=/dev/kfd --device=/dev/dri --ipc=host --security-opt seccomp=unconfined -e GMX_GPU_DD_COMMS=true -e GMX_GPU_PME_PP_COMMS=true -e GMX_FORCE_UPDATE_DEFAULT_GPU=true amdih/gromacs:2021.1 /bin/bash -c "cd /benchmarks/stmv; tar -xvf stmv.tar.gz; mpirun --allow-run-as-root -np 4 gmx_mpi mdrun -pin on -nsteps 100000 -resetstep 90000 -ntomp 16 -noconfout -nb gpu -bonded cpu -pme gpu -npme 1 -v -nstlist 200 -gpu_id 01 -s topol.tpr"

echo "*** Example With MPI: STMV benchmark on Four GPUs ***"
echo "docker run --rm -it --device=/dev/kfd --device=/dev/dri --ipc=host --security-opt seccomp=unconfined -e GMX_GPU_DD_COMMS=true -e GMX_GPU_PME_PP_COMMS=true -e GMX_FORCE_UPDATE_DEFAULT_GPU=true amdih/gromacs:2021.1 /bin/bash -c \" cd /benchmarks/stmv; tar -xvf stmv.tar.gz; mpirun --allow-run-as-root -np 4 gmx_mpi mdrun -pin on -nsteps 100000 -resetstep 90000 -ntomp 16 -noconfout -nb gpu -bonded cpu -pme gpu -npme 1 -v -nstlist 400 -gpu_id 0123\""
docker run --rm -it --device=/dev/kfd --device=/dev/dri --ipc=host --security-opt seccomp=unconfined -e GMX_GPU_DD_COMMS=true -e GMX_GPU_PME_PP_COMMS=true -e GMX_FORCE_UPDATE_DEFAULT_GPU=true amdih/gromacs:2021.1 /bin/bash -c "cd /benchmarks/stmv; tar -xvf stmv.tar.gz; mpirun --allow-run-as-root -np 4 gmx_mpi mdrun -pin on -nsteps 100000 -resetstep 90000 -ntomp 16 -noconfout -nb gpu -bonded cpu -pme gpu -npme 1 -v -nstlist 400 -gpu_id 0123"

echo "*** Example With MPI: STMV benchmark on Eight GPUs ***"
echo "docker run --rm -it --device=/dev/kfd --device=/dev/dri --ipc=host --security-opt seccomp=unconfined -e GMX_GPU_DD_COMMS=true -e GMX_GPU_PME_PP_COMMS=true -e GMX_FORCE_UPDATE_DEFAULT_GPU=true amdih/gromacs:2021.1 /bin/bash -c \" cd /benchmarks/stmv; tar -xvf stmv.tar.gz; mpirun --allow-run-as-root -np 8 gmx_mpi mdrun -pin on -nsteps 100000 -resetstep 90000 -ntomp 8 -noconfout -nb gpu -bonded cpu -pme gpu -npme 1 -v -nstlist 400 -gpu_id 01234567\""
docker run --rm -it --device=/dev/kfd --device=/dev/dri --ipc=host --security-opt seccomp=unconfined -e GMX_GPU_DD_COMMS=true -e GMX_GPU_PME_PP_COMMS=true -e GMX_FORCE_UPDATE_DEFAULT_GPU=true amdih/gromacs:2021.1 /bin/bash -c "cd /benchmarks/stmv; tar -xvf stmv.tar.gz; mpirun --allow-run-as-root -np 8 gmx_mpi mdrun -pin on -nsteps 100000 -resetstep 90000 -ntomp 8 -noconfout -nb gpu -bonded cpu -pme gpu -npme 1 -v -nstlist 400 -gpu_id 01234567"
echo "==== Run complete ===="
