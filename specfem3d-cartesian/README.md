```
Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.
Revision: V1.0
V1.0: add docker and singualrity commands
```
# SPECFEM3D Cartesian

## Pull Command

```
sudo docker pull amdih/specfem3d:9c0626d1-20201122
```
## Running Containers
### Using Docker
Start the Docker container using the following command:
```
sudo docker run --rm -it --ipc=host --device=/dev/dri --device=/dev/kfd --security-opt seccomp=unconfined amdih/specfem3d:9c0626d1-20201122 /bin/bash
```
There is a convenient benchmark script included. After starting the container, you may execute it as follows to run on a dual socket server with 64 core CPUs and 8 GPUs:
```
export OMPI_ALLOW_RUN_AS_ROOT=1
export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1
benchmark cartesian -g 8 -c 0 -s 288x256 -o /tmp/run1 --mpi-args='--bind-to cpu-list:ordered --cpu-list "0,8,16,24,64,72,80,88" --report-bindings'
```
Output files will be generated under the /tmp/run1_* directory.

The CPU list can be adjusted for systems with a different CPU core count, for example for two socket system with 32 cores per CPU, the cpu-list can be adjusted as:
```
benchmark cartesian -g 8 -c 0 -s 288x256 -o /tmp/run2 --mpi-args='--bind-to cpu-list:ordered --cpu-list "0,8,16,24,32,40,48,52" --report-bindings'
```
You may also navigate into EXAMPLES directory of specfem3d globe. Please note that different examples may have different hardware requirements, for example, some examples may require 6 or 8 GPUs.

Consider running a single rank example
```
cd /opt/specfem3d/EXAMPLES/homogeneous_poroelastic
export OMPI_ALLOW_RUN_AS_ROOT=1
export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1
./run_this_example.sh
```
### Using Singularity
This section assumes that an up-to-date version of Singularity is installed on your system and properly configured for your system. Please consult with your system administrator or view official Singularity documentation.

Pull and convert docker image to singularity image format:
```
singularity pull specfem3d_9c0626d1-20201122.sif docker://amdih/specfem3d:9c0626d1-20201122
```
Run the singularity container
```
singularity run --writable-tmpfs specfem3d_9c0626d1-20201122.sif /bin/bash
```
You can follow steps from preceding section to run an existing example within the container, for example, you may run an example:
```
cd /opt/specfem3d/EXAMPLES/homogeneous_poroelastic
./run_this_example.sh
```
## Run Using Scripts
The Docker test commands can be executed by:
```
sudo sh run_specfem3dcartesian_docker.sh
``` 
Similarly, the Singularity commands can be performed by running:
```
sh run_specfem3dcartesian_singularity.sh
