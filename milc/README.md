```
Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.
Revision: V1.0
V1.0: add docker and singularity commands 
```

# MILC

## Pull Command

```
sudo docker pull amdih/milc:c30ed15e1-20210420
```

## Running Containers

For running MILC containers, please enable transparent huge pages (THP) on your system. On common systems you may enable THP temporarily by running
```
sudo sh -c 'echo always > /sys/kernel/mm/transparent_hugepage/enabled'
```
Please consult your operating system manual for details.

Launch the container using
```
sudo docker run --rm -it --ipc=host --device /dev/dri --device /dev/kfd --security-opt seccomp=unconfined amdih/milc:c30ed15e1-20210420 /bin/bash
```
The container contains an example benchmark problem, which can be executed as follows
```
cd /benchmark
run-benchmark -o milc-benchmark.out
```
The benchmark will be executed and ran on a single GPU. File milc-benchmark.out will contain the results of the benchmark including total execution time. Depending on hardware specs, the single gpu benchmark may take over an hour to complete.

Please note that in the first iteration, a tuning step will be ran. Rerunning the above command will use the generated tune files and you can expect an improved performance in the second run.

You can run the same benchmark using 2, 4, and 8 gpus. For example, to run using 2 gpus:
```
cd /benchmark
run-benchmark --ngpus 2 -o milc-benchmark_gpu2.out
```
## Running Singularity
This section assumes that an up-to-date version of Singularity is installed on your system and properly configured for your system. Please consult with your system administrator or view official Singularity documentation.

Pull and convert docker image to singularity image format:
```
singularity pull milc_c30ed15e1.sif docker://amdih/milc:c30ed15e1-20210420
```
You can then use examples from the preceding section to use the image. For example, to run the benchmark problem, you may do:

Launch a container:
```
singularity run --pwd /benchmark --writable-tmpfs milc_c30ed15e1.sif /bin/bash
```
Then run the benchmarks as in the previous section. For example, using a single gpu:
```
run-benchmark --ngpus 1 -o bench-gpu1.txt
```
Or using 2 gpus:
```
run-benchmark --ngpus 2 -o bench-gpu2.txt
```
## Run Using Scripts
The Docker test commands can be run using run_milc_docker.sh script as:
```
sudo sh run_milc_docker.sh
``` 
Similarly, run_milc_singularity.sh script executes the Singularity commands by running:
```
sh run_milc_singularity.sh
```

## Known Issues
- Multi-gpu runs with MI100 GPUs using ROCm 4.5.0 gpu driver, MILC benchmarks may freeze and not return with an exit code upon completion of the benchmark.

