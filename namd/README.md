# ROCm-based NAMD Singularity Container Example With ROCm 4.0.1

### Building NAMD singularity container from amddcgpuce docker image
```

# Download NAMD singularity definition file, bootstrap docker
wget -O namd.rocm401.ubuntu18.sdf --no-check-certificate https://raw.githubusercontent.com/amddcgpuce/rocmcontainers/main/rocm/namd.rocm401.ubuntu18.sdf

# Build singularity image, bootstrap from amddcgpuce docker image
# (replace path to singularity installation as appropriate)
sudo /usr/local/bin/singularity build namd.rocm401.ubuntu18.sif namd.rocm401.ubuntu18.sdf

```

## ROCm-based NAMD Singularity Container Examples
### Run Help
```
singularity run-help namd.rocm401.ubuntu18.sif

    singularity run namd.rocm401.ubuntu18.sif /bin/bash -c "cd /opt/namd; cp -r NAMD_benchmarks $HOME/Documents/"
    singularity run namd.rocm401.ubuntu18.sif /bin/bash -c "cd $HOME/Documents/NAMD_benchmarks; LD_LIBRARY_PATH=/opt/rocm/lib python3 run_benchmarks.py -b apoa1 -c 2-64:2 -d 0"

```

### Copy NAMD benchmark samples to $HOME/Documents
```
singularity run namd.rocm401.ubuntu18.sif /bin/bash -c "cd /opt/namd; cp -r NAMD_benchmarks $HOME/Documents/"

Container was created Wed Feb 24 05:52:10 UTC 2021
CWD: /opt/namd Launching: /bin/bash -c cd /opt/namd; cp -r NAMD_benchmarks /home/USERHOME/Documents/

```

### Running sample benchmark after above copy
```
singularity run namd.rocm401.ubuntu18.sif /bin/bash -c "cd $HOME/Documents/NAMD_benchmarks; LD_LIBRARY_PATH=/opt/rocm/lib python3 run_benchmarks.py -b apoa1 -c 2-64:2 -d 0"

Container was created Wed Feb 24 05:52:10 UTC 2021
CWD: /opt/namd Launching: /bin/bash -c cd /home/USERHOME/Documents/NAMD_benchmarks; LD_LIBRARY_PATH=/opt/rocm/lib python3 run_benchmarks.py -b apoa1 -c 2-64:2 -d 0
Executing: /opt/namd/Linux-x86_64-g++.hip/namd2 /home/USERHOME/Documents/NAMD_benchmarks/apoa1/apoa1_nve_cuda.namd +p 2 +pemap 0-1 +setcpuaffinity +isomalloc_sync +devices 0
Depth set on single layer image geometry.

....output snipped...

```
