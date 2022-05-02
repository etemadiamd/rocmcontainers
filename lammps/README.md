```
Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.
Revision: V1.0
V1.0: add docker and singualrity commands 
```

# LAMMPS

## Pull Command

```
sudo docker pull amdih/lammps:2021.5.14_121
```

## Running Containers
Launch the container using:
```
sudo docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined -w /benchmark -e OMPI_ALLOW_RUN_AS_ROOT=1 -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amdih/lammps:2021.5.14_121 /bin/bash
```
The container contains an example benchmark problem, in the /benchmark directory, that can be executed as follows on MI200 GPUs.

To run using a single GPU, use:
```
./benchmark.sh --mode run --prefix /opt/lammps --gpu-aware-mpi --comm device --with-mpi /opt/lammps/tpl/openmpi --kokkos-gpu-arch VEGA90a --memsize 32 --ngpus 1 --out-label /tmp/gpu1
```
The benchmark will be executed and ran on a single GPU. Upon completion, `gpu1/**/fom` will figure of merit (FOM) for all benchmarks.

Similarly, to run on 2 gpus, use:
```
./benchmark.sh --mode run --prefix /opt/lammps --gpu-aware-mpi --comm device --with-mpi /opt/lammps/tpl/openmpi --kokkos-gpu-arch VEGA90a --memsize 32 --ngpus 2 --out-label /tmp/gpu2
```
For 4 gpus,
```
./benchmark.sh --mode run --prefix /opt/lammps --gpu-aware-mpi --comm device --with-mpi /opt/lammps/tpl/openmpi --kokkos-gpu-arch VEGA90a --memsize 32 --ngpus 4 --out-label /tmp/gpu4
```
For 8 gpus,
```
./benchmark.sh --mode run --prefix /opt/lammps --gpu-aware-mpi --comm device --with-mpi /opt/lammps/tpl/openmpi --kokkos-gpu-arch VEGA90a --memsize 32 --ngpus 8 --out-label /tmp/gpu8
```

## Run Using Singularity

This section assumes that an up-to-date version of Singularity is installed on your system and properly configured for your system. Please consult with your system administrator or view official Singularity documentation.

Pull and convert docker image to singularity image format:
```
singularity pull lammps.sif docker://amdih/lammps:2021.5.14_121
```
You can then use examples from the preceding section to use the image on MI200 GPUs. For example, to run the benchmark problem, you may do:

Launch a container:
```
singularity run --pwd /benchmark --writable-tmpfs lammps.sif /bin/bash
```
Then run the benchmarks as in the previous section. For example, to run using a single GPU, use:
```
./benchmark.sh --mode run --prefix /opt/lammps --gpu-aware-mpi --comm device --with-mpi /opt/lammps/tpl/openmpi --kokkos-gpu-arch VEGA90a --ngpus 1 --memsize 32 --out-label /tmp/gpu1
```
Similarly, to run on 2 gpus, use:
```
./benchmark.sh --mode run --prefix /opt/lammps --gpu-aware-mpi --comm device --with-mpi /opt/lammps/tpl/openmpi --kokkos-gpu-arch VEGA90a --ngpus 2 --memsize 32 --out-label /tmp/gpu2
```
For 4 gpus, use:
```
./benchmark.sh --mode run --prefix /opt/lammps --gpu-aware-mpi --com device --with-mpi /opt/lammps/tpl/openmpi --kokkos-gpu-arch VEGA90a --ngpus 4 --memsize 32 --out-label /tmp/gpu4
```
For 8 gpus, use:
```
./benchmark.sh --mode run --prefix /opt/lammps --gpu-aware-mpi --comm device --with-mpi /opt/lammps/tpl/openmpi --kokkos-gpu-arch VEGA90a --ngpus 8 --memsize 32 --out-label /tmp/gpu8
```
## Run Using Scripts
Script run_lammps_docker.sh runs the docker commands by performing:
```
sudo sh run_lammps_docker.sh
```
Similarly, script run_lammps_singularity.sh executes the singularity commands as follows:
```
sh run_lammps_singularity.sh
```
