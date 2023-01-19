```
Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.
Revision: V1.0
V1.0: add docker and singualrity commands 
```
# BabelStream

### Description

BabelStream is a synthetic GPU benchmark based on the original [STREAM](https://www.cs.virginia.edu/stream/) benchmark for CPUs. The benchmark specifically measures memory transfer rates (bandwidth) to and from global device memory, and supports a wide range of programming models (e.g. OpenMP, CUDA, HIP, Kokkos, RAJA, and more).
This container provides a HIP build of the benchmark.

### Labels
* high performance computing
* HPC
* synthetic benchmark
* memory bandwidth

### Pull Command
```
docker pull amdih/babelstream:4.amd0_6
```
## Overview 

BabelStream, formerly known as GPU-STREAM, is a synthetic GPU benchmark based on the original [STREAM](https://www.cs.virginia.edu/stream/) benchmark for CPUs. It is maintained by the [High-Performance Computing Group](http://uob-hpc.github.io/) at the University of Bristol. The official repository can be found here: https://github.com/UoB-HPC/BabelStream.

In version 4.0, BabelStream implements the four kernels from the original CPU STREAM benchmark (Copy, Mul, Add, and Triad), along with dot-product and "n-stream" kernels
from the [Parallel Research Kernels (PRK)](https://github.com/ParRes/Kernels) repository.

Key differences from STREAM and other GPU memory bandwidth benchmarks are that:

* PCIe transfer time is not included in measurements
* the arrays are allocated on the heap
* the problem size is unknown at compile time
* wider platform and programming model support

More information about BabelStream can be found by visiting the following references:

* [Evaluating attainable memory bandwidth of parallel programming models via BabelStream](https://dl.acm.org/doi/abs/10.5555/3292750.3292751)
* [GPU-STREAM v2.0: Benchmarking the achievable memory bandwidth of many-core processors across diverse parallel programming models](https://research-information.bris.ac.uk/en/publications/gpu-stream-v20-benchmarking-the-achievable-memory-bandwidth-of-ma)

# Single-Node Server Requirements
________________________________________

| CPUs | GPUs | Operating Systems | ROCm™ Driver | Container Runtimes | 
| ---- | ---- | ----------------- | ------------ | ------------------ | 
| X86_64 CPU(s) | AMD Instinct MI200 GPU(s) <br>  AMD Instinct MI100 GPU(s) <br> Radeon Instinct MI50(S) | Ubuntu 20.04 <br> RedHat 8 | ROCm v5.x compatibility | [Docker Engine](https://docs.docker.com/engine/install/) <br> [Singularity](https://sylabs.io/docs/) |

For ROCm installation procedures and validation checks, see:
* [ROCm Installation Guide](https://docs.amd.com/).
* [Testing the ROCm Installation](https://rocmdocs.amd.com/en/latest/Installation_Guide/Installation-Guide.html#testing-the-rocm-installation)


# How to run

## Running Containers
This section describes how to launch the container. It is assumed that up-to-date versions of Docker and/or Singularity are installed on your system. If your system supports modules, you will need to load the sigularity module before running your singularity container. If needed, please consult with your system administrator or view official documentation.

### Docker
To run the container interactively, run 
```
docker run --rm --ipc=host --device=/dev/kfd --device=/dev/dri \
           --security-opt seccomp=unconfined \
           -it amdih/babelstream:4.amd0_6 bash
```
and run either the executable `hip-stream` or the helper script `run_babelstream.sh`. For non-interactive runs, simply replace `bash` with the desired run command. For example:

```
docker run --rm --ipc=host --device=/dev/kfd --device=/dev/dri \
           --security-opt seccomp=unconfined amdih/babelstream:4.amd0_6 ./run_babelstream.sh
```

#### Saving results to host
The script `run_babelstream.sh` is able to generate `.csv` files containing the benchmark results.
To extract the results and have them available on your local machine, one simply needs
to mount a local directory when instantiating the container using `-v`:

For example, if we want to mount the local working directory `$(pwd)` to save data into, simply run

```
docker run --rm --ipc=host -v $(pwd):/data \
           --device=/dev/kfd --device=/dev/dri \
           -it amdih/babelstream:4.amd0_6  bash
```

Here, the `-v` flag mounts the local working directory on the host machine `pwd` as a new
directory inside the container named `/data`. After generating output
(see the section "Benchmark runscript" for details), the files can be made available on the
host machine by simply running (inside the container): `cp *.csv /data`.

### Singularity

Download and save the singularity image locally:
```
singularity pull babelstream.sif docker://amdih/babelstream:4.amd0_6
```

Using singularity is similar to launching a Docker run; however, unlike Docker, the Singularity container does not land in the path where the executable resides, it is therefore necessary to specify it in the exec command:
```
singularity exec --writable-tmpfs --no-home --pwd /opt/babelstream/build/ babelstream.sif ./run_babelstream.sh
```
Examples of interactive and non-interactive sessions are given below.

## Running the benchmark

### INTERACTIVE

#### Running the executable

The are two ways to run BabelStream within the container. One is to use the compiled executable `hip-stream` directly, which can be run with the following arguments:

```
Usage: ./hip-stream [OPTIONS]

Options:
  -h  --help               Print the message
      --list               List available devices
      --device     INDEX   Select device at INDEX
  -s  --arraysize  SIZE    Use SIZE elements in the array
  -n  --numtimes   NUM     Run the test NUM times (NUM >= 2)
      --float              Use floats (rather than doubles)
      --triad-only         Only run triad
      --nstream-only       Only run nstream
      --csv                Output as csv table
      --mibibytes          Use MiB=2^20 for bandwidth calculation (default MB=10^6)
```

Running the executable without specifying either `--triad-only` or `--nstream-only` will run five kernels: Copy, Mul, Add, Triad, and Dot. It is important to note that the benchmark requires an array size that is divisible by 1024.

When running this benchmark as intended, arrays need to be suitably large such that data is streamed directly from device high bandwidth memory (HBM). On MI-100/200 devices, the following should more than suffice:

```
./hip-stream -s $((2**28))
```

#### Benchmark runscript

Once the container is active, a bash script, `run_babelstream.sh`, is provided that will run the BabelStream benchmark on one or multiple GPUs. The container comes with an OpenMPI build for running *simultaneous* instances of BabelStream on multiple devices.

The script can be running in the following format:
```
mpirun -np <number of GCDs> ./run_babelstream.sh -n <number of iterations> -s <arraysize per rank>  [additional arguments]
```

A complete list of BabelStream options can be viewed by running `./run_babelstream.sh -h`:
```
***********************************************************************************************
BabelStream run script usage:
mpirun -np <num-of-gcds> ./run_babelstream.sh [-h ] [-w ] [-d # -s # -n # -p <precision> -o filename]
***********************************************************************************************

    This script allows you to build and run BabelStream. Users should provide inputs from the list below: 

    -w                        Write output files recording the BabelStream results.

    -o filename               Output filename for results collection. If not specified, results will be written to 'results_gcd#.csv'.

    -d #                      The device index (e.g. GCD 0, 1, ...). If not specified, the local MPI rank will be selected.
                                  NOTE: If you are specifying a certain GCD to run the benchmark on, do not run this script with MPI.

    -s #                      Specify the array size for the benchmark. If not specified, a default value of 268435456 is used.

    -n #                      Specify the number of iterations for the benchmark. If not specified, each kernel is run 100 times.

    -p < single | double >    Specify the precision for the benchmark. If not specified, double precision is used.
```
The run script wraps most of the options for the BabelStream executable, and so many of the same arguments (e.g. array size, number of iterations, precision) can be specified using the bash script. The bash script also supports MPI invokations, which will run simultaneous instances of BabelStream, one for each MPI rank.

As an example, the following command will run BabelStream on 4 MI250 AMD Instinct GPUs (8 total GCDs), where each BabelStream instance uses an array size of 268435456 elements and runs all kernels for a total of 50 iterations:
```
mpirun -np 8 ./run_babelstream.sh -s 268435456 -n 50
```
All output is funneled to `stdout`, therefore it may be useful to save the results for each GCD. This can be done by specifying the `-w` flag for writing output and (optionally) a filename via `-o`:
```
mpirun -np 8 ./run_babelstream.sh -s 268435456 -n 50 -w -o results
```
The command above will save the BabelStream benchmark results (for all 8 GCDs) to csv files enumerated by the MPI rank / device index: `results_gcd#.csv`.

NOTE: The singularity container is non-writeable, thus, the -w option is not usable. Output will be sent to the screen only.

#### NON-INTERACTIVE

### Using Docker

All commands from the Interactive section can be executed in non-interactive mode by simply providing the run command at the outset. For example:
```
docker run --rm --ipc=host --device=/dev/kfd --device=/dev/dri amdih/babelstream:4.amd0_6 \
           mpirun -np 8 ./run_babelstream.sh -s 268435456 -n 50
```

### Using Singularity

Run the above example with the singularity image:
```
singularity exec --writable-tmpfs --no-home --pwd /opt/babelstream/build/ babelstream.sif \
            mpirun -np 8 ./run_babelstream.sh -s 268435456 -n 50
```

### Troubleshooting

### Known Issues / Errata

#### Validation failed on sum
There is a known upstream bug, where dot verification fails when running in single-precision (by passing `--float` to the executable).  The failure signature will be similar to the following with a message indicating "Validation failed on sum", where exact numerical values will vary:
```
0c41e914c6:/opt/babelstream/build# ./hip-stream --device 0 -s $((2**28)) --float
BabelStream
Version: 4.0
Implementation: HIP
Running kernels 100 times
Precision: float
Array size: 1073.7 MB (=1.1 GB)
Total size: 3221.2 MB (=3.2 GB)
Using HIP device  with index: 0
Driver: 50120532
Validation failed on sum. Error 0.000530533
Sum was 318.160766601562 but should be 318.329650878906
```

The issue is tracked in the BabelStream GitHub repository with "[Dot verification fails with single precision #20](https://github.com/UoB-HPC/BabelStream/issues/20)".


# Licensing Information

Your use of this application is subject to the terms of the applicable component-level license identified below. To the extent any subcomponent in this container requires an offer for corresponding source code, AMD hereby makes such an offer for corresponding source code form, which will be made available upon request. By accessing and using this application, you are agreeing to fully comply with the terms of this license. If you do not agree to the terms of this license, do not access or use this application. 

The application is provided in a container image format that includes the following separate and independent components: Ubuntu (License: Creative Commons CC-BY-SA version 3.0 UK licence), CMAKE (License: BSD 3), ROCm (License: Custom/MITx11/Apache V2.0/UIUC NCSA), and BabelStream (License: [custom, available here](https://github.com/UoB-HPC/BabelStream/blob/main/LICENSE)). Additional third-party content in this container may be subject to additional licenses and restrictions. The components are licensed to you directly by the party that owns the content pursuant to the license terms included with such content and is not licensed to you by AMD. ALL THIRD-PARTY CONTENT IS MADE AVAILABLE BY AMD “AS IS” WITHOUT A WARRANTY OF ANY KIND. USE OF THE CONTAINER IS DONE AT YOUR SOLE DISCRETION AND UNDER NO CIRCUMSTANCES WILL AMD BE LIABLE TO YOU FOR ANY THIRD-PARTY CONTENT. YOU ASSUME ALL RISK AND ARE SOLELY RESPONSIBLE FOR ANY DAMAGES THAT MAY ARISE FROM YOUR USE OF THE CONTAINER. 

## Disclaimer  

The information contained herein is for informational purposes only, and is subject to change without notice. In addition, any stated support is planned and is also subject to change. While every precaution has been taken in the preparation of this document, it may contain technical inaccuracies, omissions and typographical errors, and AMD is under no obligation to update or otherwise correct this information. Advanced Micro Devices, Inc. makes no representations or warranties with respect to the accuracy or completeness of the contents of this document, and assumes no liability of any kind, including the implied warranties of noninfringement, merchantability or fitness for particular purposes, with respect to the operation or use of AMD hardware, software or other products described herein. No license, including implied or arising by estoppel, to any intellectual property rights is granted by this document. Terms and limitations applicable to the purchase or use of AMD’s products are as set forth in a signed agreement between the parties or in AMD's Standard Terms and Conditions of Sale.   

## Notices and Attribution  

© 2022 Advanced Micro Devices, Inc. All rights reserved. AMD, the AMD Arrow logo, Instinct, Radeon Instinct, ROCm, and combinations thereof are trademarks of Advanced Micro Devices, Inc.  
Docker and the Docker logo are trademarks or registered trademarks of Docker, Inc. in the United States and/or other countries. Docker, Inc. and other parties may also have trademark rights in other terms used herein.  Linux® is the registered trademark of Linus Torvalds in the U.S. and other countries.    

All other trademarks and copyrights are property of their respective owners and are only mentioned for informative purposes.



