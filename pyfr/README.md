```
Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.
Revision: V1.0
V1.0: add docker singualrity commands
```
# PyFR

## Pull Command

```
sudo docker pull amdih/pyfr:1.13.0_44
```
## Running Containers
### Using Docker
In order to assess the performance of the containerized application, standard benchmark systems were made available in the /examples folder. There is a convenience script included to run each benchmark

Begin by launching the container interactively:
```
sudo docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined amdih/pyfr:1.13.0_44 /bin/bash
```
The run-benchmark script run the BFS benchmark on a single GPU as:
```
run-benchmark BSF --ngpus 1
```
The above script will utilize the dataset under /examples to run the BFS benchmark. The above script will make PyFR boot up the benchmark, compile the GPU kernels, and execute the simulation. The user can track progress through a built-in progress bar in the application. It is not possible to run the BFS input set with more than one GPU currently.

For the tgv example, the user needs to convert the mesh to a PyFR mesh first and run it afterwards. As a convenience, this is performed in the benchmark script:
```
run-benchmark tgv --ngpus 1
```
It is possible to run the tgv benchmark with two GPUs.
```
run-benchmark tgv --ngpus 2
```
### Using Singularity
To run the test using Singularity, the docker image needs to be pulled and converted to singularity image format as:
```
singularity pull pyfr1.13.0_44.sif docker://amdih/pyfr:1.13.0_44
```
Then, run the sinqularity container using:
```
singularity run pyfr1.13.0_44.sif /bin/bash -c "cp -r /benchmark ./"
singularity run --bind ./benchmark:/benchmark pyfr1.13.0_44.sif /bin/bash
```
Next, run BSF and tgv benchmarks. For example, the command below run BSF on one GPU:
```
run-benchmark BSF --ngpus 1
```

## Run Using Scripts
The Docker test commands can be executed by:
```
sudo sh run_pyfr_docker.sh
``` 
Similarly, the Singularity commands can be performed by running:
```
sh run_pyfr_singularity.sh
```
