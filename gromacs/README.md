```
Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.
Revision: V1.0
V1.0: add docker and singualrity commands
```
# GROMACS

## Pull Command

```
sudo docker pull amdih/gromacs:2021.1
```

## Running Containers
Start the Gromacs container using:
```
sudo docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined amdih/gromacs:2021.1 /bin/bash
```
Then, set the following environment variables:
```
export GMX_GPU_DD_COMMS=true
export GMX_GPU_PME_PP_COMMS=true
export GMX_FORCE_UPDATE_DEFAULT_GPU=true
``` 
Next run appropriate benchmark problem using commands below:

### Example With Threaded MPI 

The following commands can be used to run AD_DODEC benchmark:
```
cd /benchmarks/adh_dodec
tar -xvf adh_dodec.tar.gz

# using one GPU (or GCD)
gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 1 -ntomp 64 -noconfout -nb gpu -bonded cpu -pme gpu -v -nstlist 100 -gpu_id 0 -s topol.tpr
 
# using two GPUs(or GCDs)
gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 2 -ntomp 32 -noconfout -nb gpu -bonded gpu -pme gpu -npme 1 -v -nstlist 200 -gpu_id 01 -s topol.tpr
 
# Using four GPUs (or GCDs)
gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 4 -ntomp 16 -noconfout -nb gpu -bonded gpu -pme gpu -npme 1 -v -nstlist 200 -gpu_id 0123 -s topol.tpr

# Using eight GPUs (or GCDs)
gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 8 -ntomp 8 -noconfout -nb gpu -bonded gpu -pme gpu -npme 1 -v -nstlist 150 -gpu_id 01234567 -s topol.tpr
```

Similarly, CELLULOSE_NVE benckmark can be performed by:
```
cd /benchmarks/cellulose_nve
tar -xvf cellulose_nve.tar.gz

# using one GPU (or GCD)
gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 1 -ntomp 64 -noconfout -nb gpu -bonded cpu -pme gpu -v -nstlist 100 -gpu_id 0 -s topol.tpr
 
# using two GPUs(or GCDs)
gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 4 -ntomp 16 -noconfout -nb gpu -bonded gpu -pme gpu -npme 1 -v -nstlist 200 -gpu_id 01 -s topol.tpr
 
# Using four GPUs (or GCDs)
gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 4 -ntomp 16 -noconfout -nb gpu -bonded gpu -pme gpu -npme 1 -v -nstlist 200 -gpu_id 0123 -s topol.tpr

# Using eight GPUs (or GCDs)
gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 8 -ntomp 8 -noconfout -nb gpu -bonded gpu -pme gpu -npme 1 -v -nstlist 200 -gpu_id 01234567 -s topol.tpr
```

To run STMV benchmark use:
```
cd /benchmarks/stmv
tar -xvf stmv.tar.gz

# using one GPU (or GCD)
gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 1 -ntomp 64 -noconfout -nb gpu -bonded cpu -pme gpu -v -nstlist 200 -gpu_id 0 -s topol.tpr
 
# using two GPUs(or GCDs)
gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 8 -ntomp 8 -noconfout -nb gpu -bonded gpu -pme gpu -npme 1 -v -nstlist 200 -gpu_id 01 -s topol.tpr
 
# Using four GPUs (or GCDs)
gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 8 -ntomp 8 -noconfout -nb gpu -bonded gpu -pme gpu -npme 1 -v -nstlist 400 -gpu_id 0123 -s topol.tpr

# Using eight GPUs (or GCDs)
gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 8 -ntomp 8 -noconfout -nb gpu -bonded gpu -pme gpu -npme 1 -v -nstlist 400 -gpu_id 01234567 -s topol.tpr
```
### Example With MPI 

NOTE: It is strongly recommended to use the threaded MPI version of Gromacs for single node applications as performance will be much better. If users wish to try out the MPI version, below are some example usage
The test on stmv benchmark can be executed as:
```
cd /benchmarks/stmv
tar -xvf stmv.tar.gz

# Single GPU (or GCD)
mpirun --allow-run-as-root -np 1 gmx_mpi mdrun -nsteps 100000 -resetstep 90000 -ntomp 64 -noconfout -nb gpu -bonded cpu -pme gpu -v -nstlist 100 -gpu_id 0 -s topol.tpr

# Two GPUs (or GCDs)
mpirun --allow-run-as-root -np 4 gmx_mpi mdrun -pin on -nsteps 100000 -resetstep 90000 -ntomp 16 -noconfout -nb gpu -bonded cpu -pme gpu -npme 1 -v -nstlist 200 -gpu_id 01 -s topol.tpr

# Four GPUs (or GCDs)
mpirun --allow-run-as-root -np 4 gmx_mpi mdrun -pin on -nsteps 100000 -resetstep 90000 -ntomp 16 -noconfout -nb gpu -bonded cpu -pme gpu -npme 1 -v -nstlist 400 -gpu_id 0123

# Eight GPUs (or GCDs)
mpirun --allow-run-as-root -np 8 gmx_mpi mdrun -pin on -nsteps 100000 -resetstep 90000 -ntomp 8 -noconfout -nb gpu -bonded cpu -pme gpu -npme 1 -v -nstlist 400 -gpu_id 01234567
```
## Run Using Singularity

This section assumes that an up-to-date version of Singularity is installed on your system. Please consult with your system administrator or view official Singularity documentations.
``` 
singularity pull gromacs.sif docker://amdih/gromacs:2021.1
```
 
### Example With Threaded MPI 
The test with threaded MPI on STMV benchmark runs by:
``` 
singularity run ./gromacs.sif tar -xvf /benchmarks/stmv/stmv.tar.gz
singularity run ./gromacs.sif gmx mdrun -pin on -nsteps 100000 -resetstep 90000 -ntmpi 8 -ntomp 8 -noconfout -nb gpu -bonded gpu -pme gpu -v -gpu_id 01234567 -npme 1 -s topol.tpr -nstlist 400
```
### Example With MPI
The test with MPI on STMV benchmark performs using:
``` 
singularity run ./gromacs.sif tar -xvf /benchmarks/stmv/stmv.tar.gz
singularity run ./gromacs.sif mpirun -np 8 gmx_mpi mdrun -nsteps 100000 -resetstep 90000 -ntomp 8 -noconfout -nb gpu -bonded cpu -pme gpu -npme 1 -v -nstlist 400 -gpu_id 01234567 -s topol.tpr
```
## Run Using Scripts
The docker test commands can be run using run_gromacs_docker.sh script as:
```
sudo sh run_gromacs_docker.sh
``` 
Similarly, run_gromacs_singularity.sh script executes the singularity commands by running:
```
sh run_gromacs_singularity.sh
```
Script run_gromacs_podman.sh executes the commands using Podman as:
```
sudo sh run_gromacs_podman.sh
```
## Note On Performance Tuning
Optimal performance for each benchmark and GPU/GCD configuration can be tuned by modifying the MPI ranks/threads (-ntmpi), OpenMP threads (-ntomp), GPUs (-gpu_id), neighbor list update frequency (-nstlist), and more. Users are encourage to visit https://manual.gromacs.org/documentation/current/user-guide/mdrun-performance.html for further tips and tricks.
