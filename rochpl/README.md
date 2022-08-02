```
Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.
Revision: V1.0
V1.0: added docker and singularity commands
```
# HPL

## Pull Command

```
sudo docker pull amdih/rochpl:5.0.5_49
```
## Running Containers

### Using Docker 
#### Intractive 
The HPL docker image can be performed in intractive way as:
``` 
sudo docker run --rm -it --ipc=host --device /dev/kfd --device /dev/dri --security-opt seccomp=unconfined -e OMPI_ALLOW_RUN_AS_ROOT=1  -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1  amdih/rochpl:5.0.5_49  /bin/bash
```
Once you are in the interactive session, the benchmark may be run using the command mpirun_rochpl with your specific options.

For example:
```
mpirun_rochpl -P 1 -Q 1 -N 45312
```
#### Non-Intractive
To run the benchmark non-interactively, use the mpirun_rochpl command as part of the command line.

For example:
```
sudo docker run --rm --ipc=host  --device /dev/kfd --device /dev/dri --security-opt seccomp=unconfined  -e OMPI_ALLOW_RUN_AS_ROOT=1  -e OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 amdih/rochpl:5.0.5_49  mpirun_rochpl -P 1 -Q 1 -N 45312
```
### Using Singularity
This section assumes that an up-to-date version of Singularity is installed on your system and properly configured for your system. Please consult with your system administrator or view official Singularity documentation.

Pull and convert the docker image to a singularity image format:
```
singularity pull rochpl.sif docker://amdih/rochpl:5.0.5_49
```
You can then use the information from the Running Application section to run a benchmark.

Launch a container:
```
singularity run --pwd /tmp --writable-tmpfs rochpl.sif /bin/bash
```
Then run the benchmark as desired. For example using a single GPU:
```
mpirun_rochpl -P 1 -Q 1 -N 45312
```
## Running Application

rocHPL provides a helpful wrapper script in mpirun_rochpl. This script has two distinct run modes:
```
mpirun_rochpl -P <P> -Q <P> -N <N> --NB <NB> -f <frac>
# where
# P - is the number of rows in the MPI grid
# Q - is the number of columns in the MPI grid
# N - is the total number of rows/columns of the global matrix
# NB - is the panel size in the blocking algorithm
# frac - is the split-update fraction (important for hiding some MPI communication)
```
This run script will launch a total of np=PxQ MPI processes.

The second runmode takes an input file together with a number of MPI processes:
```
mpirun_rochpl -P <p> -Q <q> -i <input> -f <frac>
# where
# P - is the number of rows in the MPI grid
# Q - is the number of columns in the MPI grid
# input - is the input filename (default HPL.dat)
# frac - is the split-update fraction (important for hiding some MPI communication)
```
The input file accepted by the rochpl executable follows the format below:
```
HPLinpack benchmark input file
Innovative Computing Laboratory, University of Tennessee
HPL.out output file name (if any)
0            device out (6=stdout,7=stderr,file)
1            # of problems sizes (N)
45312        Ns
1            # of NBs
512          NBs
1            PMAP process mapping (0=Row-,1=Column-major)
1            # of process grids (P x Q)
1            Ps
1            Qs
16.0         threshold
1            # of panel fact
2            PFACTs (0=left, 1=Crout, 2=Right)
1            # of recursive stopping criterium
16           NBMINs (>= 1)
1            # of panels in recursion
2            NDIVs
1            # of recursive panel fact.
2            RFACTs (0=left, 1=Crout, 2=Right)
1            # of broadcast
0            BCASTs (0=1rg,1=1rM,2=2rg,3=2rM,4=Lng,5=LnM)
1            # of lookahead depth
1            DEPTHs (>=0)
1            SWAP (0=bin-exch,1=long,2=mix)
64           swapping threshold
1            L1 in (0=transposed,1=no-transposed) form
0            U in (0=transposed,1=no-transposed) form
0            Equilibration (0=no,1=yes)
8            memory alignment in double (> 0
```
## Performance evaluation
rocHPL is typically weak scaled so that the global matrix fills all available VRAM on all GPUs. The matrix size N is usually selected to be a multiple of the blocksize NB. Optimal parameters typically depend on the CPUs and GPUs of the system. Some example run lines for some AMD Instinct GPUs are the following:

### MI50/MI60 16 GB
* 1 GPU: 
```mpirun_rochpl -P 1 -Q 1 -N 44928 --NB 384```
* 2 GPU: 
```mpirun_rochpl -P 1 -Q 2 -N 63744 --NB 384```
* 4 GPU: 
```mpirun_rochpl -P 2 -Q 2 -N 89856 --NB 384```
* 8 GPU: 
```mpirun_rochpl -P 2 -Q 4 -N 127488 --NB 384```

### MI50/MI60 32 GB
* 1 GPU: 
```mpirun_rochpl -P 1 -Q 1 -N 64512 --NB 512```
* 2 GPU: 
```mpirun_rochpl -P 1 -Q 2 -N 90112 --NB 512```
* 4 GPU: 
```mpirun_rochpl -P 2 -Q 2 -N 126976 --NB 512```
* 8 GPU: 
```mpirun_rochpl -P 2 -Q 4 -N 180224 --NB 512```

### MI100
* 1 GPU: 
```mpirun_rochpl -P 1 -Q 1 -N 64000 --NB 512```
* 2 GPU: 
```mpirun_rochpl -P 1 -Q 2 -N 90112 --NB 512```
* 4 GPU: 
```mpirun_rochpl -P 2 -Q 2 -N 126976 --NB 512```
* 8 GPU: 
```mpirun_rochpl -P 2 -Q 4 -N 180224 --NB 512```

### MI210/MI250/MI250X
* 1 GCD: 
```mpirun_rochpl -P 1 -Q 1 -N 90112 --NB 512```
* 2 GCD: 
```mpirun_rochpl -P 2 -Q 1 -N 128000 --NB 512```
* 4 GCD: 
```mpirun_rochpl -P 2 -Q 2 -N 180224 --NB 512```
* 8 GCD: 
```mpirun_rochpl -P 2 -Q 4 -N 256000 --NB 512```
* 16 GCD: 
```mpirun_rochpl -P 4 -Q 4 -N 360448 --NB 512```

Overall performance of the benchmark is measured in 64-bit floating point operations (FLOPs) per second. Performance is reported at the end of the run to the user's specified output (by default the performance is printed to stdout and a results file HPL.out).

## Testing rocHPL
At the end of each benchmark run, residual error checking is computed, and PASS or FAIL is printed to output.

The simplest suite of tests should run configurations from 1 to 4 GPUs to exercise different communication code paths. For example the tests:
```
mpirun_rochpl -P 1 -Q 1 -N 43008
mpirun_rochpl -P 1 -Q 2 -N 43008
mpirun_rochpl -P 2 -Q 1 -N 43008
mpirun_rochpl -P 2 -Q 2 -N 43008
```
should all report PASSED.

Please note that for successful testing, a device with at least 16GB of device memory is required.

## Troubleshooting

HPL is installed under /opt/rochpl and the scripts are located under /opt/rochpl/build.
ROCm is installed under /opt/rocm.

## Known Issues / Errata



