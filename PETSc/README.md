# PETSc

### Description
PETSc, the Portable, Extensible Toolkit for Scientific Computation, pronounced PET-see (the S is silent), is a suite of data structures and routines for the scalable (parallel) solution of scientific applications modeled by partial differential equations. It supports MPI, and GPUs through CUDA, HIP or OpenCL, as well as hybrid MPI-GPU parallelism; it also supports the NEC-SX Tsubasa Vector Engine. PETSc (sometimes called PETSc/TAO) also contains the TAO, the Toolkit for Advanced Optimization, software library.

### Pull Command
```
docker pull amddcgpuce/petsc:3.18.amd4_44
```
_NOTE: The above command will only work if you have access to that repository (internal use only):_


### Overview
PETSc, the Portable, Extensible Toolkit for Scientific Computation, pronounced PET-see (the S is silent), is a suite of data structures and routines for the scalable (parallel) solution of scientific applications modeled by partial differential equations. It supports MPI, and GPUs through CUDA, HIP or OpenCL, as well as hybrid MPI-GPU parallelism; it also supports the NEC-SX Tsubasa Vector Engine. PETSc (sometimes called PETSc/TAO) also contains the TAO, the Toolkit for Advanced Optimization, software library.

## Single-Node Server Requirements
________________________________________

| CPUs | GPUs | Operating Systems | ROCm™ Driver | Container Runtimes |
| -----| ------ | ----------------- | ------------ | ------------------ |
| X86_64 CPU(s) | AMD Instinct MI200 GPU(s) <br> AMD Instinct MI100 GPU(s) | Ubuntu 20.04 <br> RedHat 8 | ROCm v5.x compatibility | [Docker Engine](https://docs.docker.com/engine/install/) <br> [Singularity](https://sylabs.io/docs/) |

For ROCm installation procedures and validation checks, see:
* [ROCm Installation Guide](https://docs.amd.com/).
* [Testing the ROCm Installation](https://rocmdocs.amd.com/en/latest/Installation_Guide/Installation-Guide.html#testing-the-rocm-installation)

The PETSc container assumes that the server contains the required x86-64 CPU(s) and at least one of the listed AMD GPUs. Also, the server must have one of the required operating systems and the listed ROCm driver version installed to run the Docker container. The server must also have a Docker Engine installed to run the container. Please visit the Docker Engine install web site at https://docs.docker.com/engine/install/ to install the latest Docker Engine for the operating system installed on the server. If Singularity use is planned, please visit https://sylabs.io/docs/ for the latest Singularity install documentation.

### Labels
* HPC
* Linear Algebra
* Numerical Solvers
* Partial Differential Equations (PDEs)

## Running Containers
A 3D Poisson Solve is included with the source code and is designed to assess the performance characteristics of PETSc library. As of now, the benchmark can be located in the `src/ksp/ksp/tutorials/` directory. A `run-benchmark.sh` script is included which can be used to build and run the benchmark.

### Using Docker

#### INTERACTIVE
To run the container and build the benchmark interactively, use: 

``` 
docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined -w /opt/petsc amdih/petsc:3.18.amd4_44  /bin/bash
```

Use `pwd` to ensure the current directory is `/opt/petsc/`. If not, navigate to the directory with:
```
cd /opt/petsc
```
For the `run-benchmark.sh` bash script included here, the usage can be found by adding the `-h` which prints the different arguments that can be passed to the script. For example:

```
./run-benchmark.sh -h
```
will print the usage as: 
```
This script is designed to setup and run PETSc ksp_performance (3D Poisson Solve) benchmark on GPUs.
=================================
usage: ./run-benchmark.sh

       -h | --help      Prints the usage
       -c | --clean     Clean the case directory
       -r | --run-only  skip build, and directly run the benchmark
       -g | --ngpus     #GPUs to be used (between 1-10), defaults to 1
       -d | --gpu-support support for GPU offloading (e.g.: HIP or CUDA)
       -l | --log-view  Enables -log_view to see more details at end of PETSc solve
       -n | --mat-size  Prescribe a Mat size (e.g -n 200 will select a 200^3 matrix)
       -pc| --pc-type   Prescribe custom options for preconditioner
                        (default -pc_type bjacobi and -sub_pc_type ilu)
       -ksp|--ksp-options Prescribe custom options for KSP solvers
```
The `run-benchmark.sh` script configures and sets some parameters to run the PETSc benchmark (`bench_kspsolve`) on GPUs. A description of these parameters is included below for reference: 

| parameters| description/options   |
| --------- | --------------------- |
| -vec_type | type of backend (CPU/GPU) for **vec** class. <br> Options: <br> `seq` for single CPU-only, `mpi` for multiple-CPU <br> `hip` for single or multiple AMD GPUs with HIP <br> Similar `cuda`, `kokkos` available for CUDA and Kokkos.|
| -mat_type | type of backend (CPU/GPU) for **mat** class. <br> Options: <br> `aij` for single CPU-only, `mpiaij` for multiple-CPU <br> `aijhipsparse` for single or multiple AMD GPUs with HIP <br> Similar `aijcusparse`, `aijkokkos` available for CUDA and Kokkos.|
| -pc_type  | preconditioner type. E.g. `ilu`, `gamg`, etc. |
| -ksp_type | Krylov subspace method type. E.g. `cg`, `gmres`, etc. |

A full list of tuneable parameters and configurations can be found in PETSc [documentation](https://petsc.org/release/docs/manual/).

To run the benchmark on 1 GPU using the bash script, use the command:
```
./run-benchmark.sh -g 1
```
> NOTE
> * If the `-g` is not mentioned in commands above, by default the script will use 1 GPU. But for consistency, we recommend always adding the `-g` to prescribe #GPUs.
> * The number of GPUs can be altered to run on multiple GPUs. When #GPUs>1, the number of MPI ranks used will be equal to the number of GPUs. For example, when launched with 4 GPUs, 4 MPI ranks will be deployed. The script will automatically  adjust the MPI ranks to the number of GPUs.
> * It must be noted that the script is designed to run on a maximum of 10 GPUs at a time, and will require alteration if #GPUs>10 need to be used. One can also assign multiple-MPI ranks to each GPU, however that is not included in these bash scripts.
> * Problem size is define by the cube dimension, which can be varied using the `-n` option. By default the script uses `-n 200`, but a customized dimension can be provided with:
> ```
> ./run-benchmark.sh -g 1 -n 100
> ```
> * The KSP solver options and preconditioner type can be changed using the `-ksp` and `-pc` options respectively, and providing a string of options inside `""`. Default options are set by the `run-benchmark.sh` script. For example to use the `-pc_type gamg` preconditioner type, one can specify:
> ```
> ./run-benchmark.sh -g 1 -n 100 -pc "-pc_type gamg"
> ```
> * `-l` dumps a log at the end of the PETSc run and can be useful to investigate the statistics. To enable this, use the command: 
> ```
> ./run-benchmark.sh -g 1 -n 100 -pc "-pc_type gamg" -l
> ```

The benchmark script prints the result to the screen/terminal. A sample output can look like:
```
Running the benchmark with single GPU
===========================================
Test: KSP performance - Poisson
        Input matrix: 27-pt finite difference stencil
        -n 200
        DoFs = 8000000
        Number of nonzeros = 213847192

Step1  - creating Vecs and Mat...
Step2  - running KSPSolve()...
Step3  - calculating error norm...

Error norm:    1.375e+00
KSP iters:     103
KSPSolve:      4.65297 seconds
FOM:           1.719e+06 DoFs/sec
===========================================
```
#### NON-INTERACTIVE
To run the benchmark using docker in a non-interactive mode, use the following command:
```
docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined -w  /opt/petsc amdih/petsc:3.18.amd4_44  ./run-benchmark.sh -g 1
```

### Using Singularity
This section assumes that an up-to-date version of Singularity is installed on your system and properly configured for your system. Please consult with your system administrator or view official Singularity documentation.

Pull and convert docker image to singularity image format:
```
singularity pull petsc.sif docker://amdih/petsc:3.18.amd4_44
```
You can then use examples from the preceding section to use the image. For example, to run the benchmark problem, launch a container in interactive-mode:
```
singularity run --pwd /opt/petsc --writable-tmpfs petsc.sif /bin/bash
```
Then benchmarks can be run similar to the previous section. For example, to run on 1 GPU use the command: 
```
./run-benchmark.sh -g 1
```
Alternatievly, to directly run the benchmark on 1 GPU in a non-interactive mode, the following command can be used:
```
singularity run --pwd /opt/petsc --writable-tmpfs petsc.sif ./run-benchmark.sh -g 1
```
## Performance Considerations

PETSc has not previously provided a benchmark for performance evaluation, but the current benchmark was recently introduced to faciliate comparisons of performance as parameters and hardware are varied.  The figure of merit (FoM) used by the Poisson Solve benchmark is "Degrees of Freedom per second" (DoF/sec), with a larger DoF/sec indicating better performance.

PETSc examples in general have nearly infinite combinations of parameters (e.g., `-ksp_type`, `-pc_type`, `-ksp_rtol`, etc) suited for particular situations. For this particular performance benchmark the main parameter to tune is the cube dimension, specified with the `-n`parameter, e.g.: `-n <cube_dim>`.  The total number of degrees of freedom (aka cube size) is the value `-n <cube_dim>` cubed. The default value is **200** or 1e6 degrees of freedom. These guidelines should be followed:
 
1. The cube dimension should "saturate" hardware utilization.
1. Use the same cube dimension when comparing across different hardware.
1. Error norm should be the same for a given dimension and concurrency.
 
### Cube Dimension Guidance
Regarding the dimension to use to "saturate" hardware utilization, PETSc developers recommend using a "work-time spectrum" analysis to identify the range of optimal problem sizes for a particular solver.  In other words, with a fixed concurrency (e.g., _X_ GPUs) you incrementally increase the cube dimension (using `-n <cube_dim>`) until you see the DOF/Sec remain consistent. A dimension too small you'll likely see a small FoM because of low GPU utilization; a dimension too large you'll also see a small FoM either because of hardware limitations (e.g., cache misses) or suboptimal algorithmic convergence of the solver.
 
For example, for a single MI210 GPU a cube dimension around 200 will typically "saturate" hardware utilization, so testing with a range of 100 to 500 should confirm a value that is optimal for a test system with 1 MI210.  Ensure that the global cube size is large enough so that multiple GPUs and/or nodes still process an optimal subset of the cube.
 
Different hardware may have different "optimal" regions.  For a fair comparison of hardware devices, pick a cube dimension that universally "saturates" all the devices being compared.


