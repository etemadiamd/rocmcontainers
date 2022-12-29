# Trilinos

### Description

Trilinos is a portable toolkit for scientific computing developed at Sandia National Laboratory. Trilinos is built on top of the Kokkos portability layer, which means it has support for all manner of architectures using a MPI+X methodology where MPI handles communication between distributed memory spaces, and local compute can be handled using a variety of CPU/GPU parallelization APIs such as OpenMP, CUDA, and HIP, as well as more experimental backends including HPX and SYCL, all of which is hidden by the Kokkos abstraction layer.

### Labels

* HPC
* ODE/PDE (Ordinary/Partial Differential Equation) Support
* Discretization Tools
* Math Library
* (Non-)Linear Algebra/Solvers
* Graph Analysis/Partitioning
* Optimization

### Pull Command
```
docker pull amdih/trilinos:1.7_36
```
_NOTE: Internal pull command to removed before publish to InfinityHub._

```
docker pull 10.194.116.23:5000/aasg/trilinos:1.7_36
```

# Single-Node Server Requirements
________________________________________

| CPUs | GPUs | Operating Systems | ROCm™ Driver | Container Runtimes |
| -----| ------ | ----------------- | ------------ | ------------------ |
| X86_64 CPU(s) | AMD Instinct MI200 GPU(s) <br> AMD Instinct MI100 GPU(s) <br> Radeon Instinct MI50(S) | Ubuntu 20.04 <br> RedHat 9 | ROCm v5.x compatibility | [Docker Engine](https://docs.docker.com/engine/install/) <br> [Singularity](https://sylabs.io/docs/) |


Trilinos natively supports Serial, OpenMP, CUDA (NVidia), and HIP (AMD) layers for CPUs and associated accelerators. To run the benchmark within this container, a supported AMD GPU must be available. To build against the Trilinos installed in this container, a valid GPU is not required, however it will be required to run the resulting binary. The server must also have a Docker Engine installed to run the container. 

Please visit the Docker Engine install web site at https://docs.docker.com/engine/install/ to install the latest Docker Engine for the operating system installed on the server. 

Please visit the Singularity Documentation site at https://sylabs.io/docs/ for the latest Singularity install documentation.

Please visit [Introduction to AMD ROCm Installation Guide for Linux](https://docs.amd.com/bundle/ROCm-Installation-Guide-v5.3/page/Introduction_to_AMD_ROCm_Installation_Guide_for_Linux.html) for information on the ROCm driver installation and compatibility with AMD GPUs.

# How to run
The benchmark provided in this container is an algebraic multiigrid (AMG) preconditioned conjugant gradient (CG) solve applied to a 27 point structured finite-difference stencil. By default it operates on a 256x256x256 grid of points using 10 CG solver iterations with a Chebyshev smoother. Output timing includes the fastest AMG preconditioner setup time, CG solve time, and the total benchmark time which is the sum of the setup and solve times. This benchmark is included as a test of the linear solver components of Trilinos for the purposes of testing linear sovler operations (e.g. SpMV, SpGEMM) as well as scaling performance on AMD hardware. The benchmark can be found in the `/benchmark` directory, and is not included as a component of Trilinos itself.

## Using Docker

### INTERACTIVE
To run the container interactively, run 
```
docker run --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined --cap-add CAP_SYS_PTRACE --shm-size=8g -e HIP_VISIBLE_DEVICES=0 -it amdih/trilinos:1.7_36 /bin/bash
```
At this point you can move to the benchmark directory, and run the benchmark directly using the command:
```
cd /benchmark
mpirun -n 1 ./run_benchmark --mx=1 --my=1 --mz=1 --kokkos-num-devices=1
```

To run the benchmark on multiple GPUs (e.g. 4) launch the docker container and define the GPUs to targe using the variable `HIP_VISIBLE_DEVICES`
```
docker run --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined --cap-add CAP_SYS_PTRACE --shm-size=8g -e HIP_VISIBLE_DEVICES=0,1,2,3 -it amdih/trilinos:1.7_36 /bin/bash
```
then run the benchmark, but be sure to set the partitioning of the mesh along x, y, and z (using `--mx`, `--my`, and `--mz`) and tell kokkos to assign the GPUs to the different MPI ranks in a round-robin fashion (using `--kokkos-num-devices`):
```
cd /benchmark
mpirun -n 4 ./run_benchmark --mx=2 --my=2 --mz=1 --kokkos-num-devices=4
```

### NON-INTERACTIVE
To run the benchmark for 1, 2, 4, and 8 GPUs, use the commands:

#### 1 GPU
```
docker run --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined --cap-add CAP_SYS_PTRACE --shm-size=8g -e HIP_VISIBLE_DEVICES=0 amdih/trilinos:1.7_36 mpirun -n 1 /benchmark/run_benchmark --mx=1 --my=1 --mz=1 --kokkos-num-devices=1
```

#### 2 GPUs
```
docker run --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined --cap-add CAP_SYS_PTRACE --shm-size=8g -e HIP_VISIBLE_DEVICES=0,1 amdih/trilinos:1.7_36 mpirun -n 2 /benchmark/run_benchmark --mx=2 --my=1 --mz=1 --kokkos-num-devices=2
```

#### 4 GPUs
```
docker run --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined --cap-add CAP_SYS_PTRACE --shm-size=8g -e HIP_VISIBLE_DEVICES=0,1,2,3 amdih/trilinos:1.7_36 mpirun -n 4 /benchmark/run_benchmark --mx=2 --my=2 --mz=1 --kokkos-num-devices=4
```

#### 8 GPUs
```
docker run --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined --cap-add CAP_SYS_PTRACE --shm-size=8g -e HIP_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 amdih/trilinos:1.7_36 mpirun -n 8 /benchmark/run_benchmark --mx=2 --my=2 --mz=2 --kokkos-num-devices=8
```

## Using Singularity

This section assumes that an up-to-date version of Singularity is installed on your system and properly configured for your system. Please consult with your system administrator or view official Singularity documentation.

Pull and convert docker image to singularity image format:
```
singularity pull trilinos.sif docker://amdih/trilinos:1.7_36
```
You can then use examples from the preceding section to use the image. For example, to run the benchmark problem, launch a container in interactive-mode:
```
singularity run --pwd /benchmark --writable-tmpfs Trilinos.sif /bin/bash
```

From within the singularity container or replace `/bin/bash` with the following commands to execute the benchmarks:
#### 1 GPU
```
mpirun -n 1 /benchmark/run_benchmark --mx=1 --my=1 --mz=1 --kokkos-num-devices=1
```

#### 2 GPUs
```
mpirun -n 2 /benchmark/run_benchmark --mx=2 --my=1 --mz=1 --kokkos-num-devices=2
```

#### 4 GPUs
```
mpirun -n 4 /benchmark/run_benchmark --mx=2 --my=2 --mz=1 --kokkos-num-devices=4
```

#### 8 GPUs
```
mpirun -n 8 /benchmark/run_benchmark --mx=2 --my=2 --mz=2 --kokkos-num-devices=8
```
