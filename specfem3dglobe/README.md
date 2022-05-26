```
Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.
Revision: V1.0
V1.0: add docker and singualrity commands
```
# SPECFEM3D Globe

## Pull Command

```
sudo docker pull amdih/specfem3d_globe:1ee10977-20210321
```
## Running Containers
### Using Docker
Start the Docker container using the following command:
```
sudo docker run --rm -it --ipc=host --device=/dev/dri --device=/dev/kfd --security-opt seccomp=unconfined amdih/specfem3d_globe:1ee10977-20210321 /bin/bash
```
Please refer to SpecFEM3D Globe documentation for working with specfem3d globe. 

There is a convenience benchmark script included. This benchmark problem requires a dual socket server with 6 GPUs and at least 70 GB of free storage space. After starting the container, you may execute it as follows:
```
export OMPI_ALLOW_RUN_AS_ROOT=1
export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1
benchmark global_s362ani_shakemovie -o /tmp/out
```
This will write the output files to /tmp/out.

To run other examples, you may also navigate into EXAMPLES directory of specfem3d globe. Please note that different examples may have different hardware requirements, for example, some examples may require 6 GPUs.

Consider running a single rank example:
```
cd /opt/specfem3d_globe/EXAMPLES/regional_Greece_small
export OMPI_ALLOW_RUN_AS_ROOT=1
export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1
./run_this_example.sh
```
Please note that specfem3d requires recompilation of the solver given input files. The above script will compile the mesher and solver and run the analysis.
### Using Singularity
This section assumes that an up-to-date version of Singularity is installed on your system and properly configured for your system. Please consult with your system administrator or view official Singualrity documentation.

Pull and convert docker image to singularity image format:
```
singularity pull specfem3d_globe.sif docker://amdih/specfem3d_globe:1ee10977
``` 

Run the singularity container
```
singularity run --writable-tmpfs singularity_globe.sif /bin/bash
```
You can follow steps from preceding section to run an existing example within the container, for example, you may run an example:
```
cd /opt/specfem3d_globe/EXAMPLES/regional_Greece_small
./run_this_example.sh
```
## Run Using Scripts
The Docker test commands can be executed by:
```
sudo sh run_specfem3dglobe_docker.sh
``` 
Similarly, the Singularity commands can be performed by running:
```
sh run_specfem3dglobe_singularity.sh
