# ROCm-based LAMMPS Singularity Container Example With ROCm 4.0.1

### Building LAMMPS singularity container from amddcgpuce docker image
```

# Download LAMMPS singularity definition file, bootstrap docker
wget -O lammps.rocm401.ubuntu18.sdf --no-check-certificate https://raw.githubusercontent.com/amddcgpuce/rocmcontainers/main/lammps/lammps.rocm401.ubuntu18.sdf

# Build singularity image, bootstrap from amddcgpuce docker image
# (replace path to singularity installation as appropriate)
sudo /usr/local/bin/singularity build lammps.rocm401.ubuntu18.sif lammps.rocm401.ubuntu18.sdf

```

## ROCm-based LAMMPS Singularity Container Examples
### Run Help
```
singularity run-help lammps.rocm401.ubuntu18.sif

    singularity run lammps.rocm401.ubuntu18.sif /bin/bash -c "cd /opt/lammps_install/lammps; cp -r examples/melt $HOME/Documents/"
    singularity run lammps.rocm401.ubuntu18.sif /bin/bash -c "cd $HOME/Documents/melt; LD_LIBRARY_PATH=/opt/ompi/lib /opt/ompi/bin/mpirun -np 1 lmp  -in in.melt -sf gpu -pk gpu 1"

```

### Copy LAMMPS benchmark samples to $HOME/Documents
```
singularity run lammps.rocm401.ubuntu18.sif /bin/bash -c "cd /opt/lammps_install/lammps; cp -r examples/melt $HOME/Documents/"

Container was created Wed Feb 24 06:33:33 UTC 2021
CWD: /opt/lammps_install/lammps Launching: /bin/bash -c cd /opt/lammps_install/lammps; cp -r examples/melt /home/USERHOME/Documents/

```

### Running sample benchmark after above copy
```
singularity run lammps.rocm401.ubuntu18.sif /bin/bash -c "cd $HOME/Documents/melt; LD_LIBRARY_PATH=/opt/ompi/lib /opt/ompi/bin/mpirun -np 1 lmp  -in in.melt -sf gpu -pk gpu 1"

Container was created Wed Feb 24 06:33:33 UTC 2021
CWD: /opt/lammps_install/lammps Launching: /bin/bash -c cd /home/USERHOME/Documents/melt; LD_LIBRARY_PATH=/opt/ompi/lib /opt/ompi/bin/mpirun -np 1 lmp  -in in.melt -sf gpu -pk gpu 1
--------------------------------------------------------------------------

....output snipped...

```

