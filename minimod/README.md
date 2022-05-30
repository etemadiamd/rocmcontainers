```
Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.
Revision: V1.0
V1.0: add docker singualrity commands
```
# MiniMod

## Pull Command

```
sudo docker pull amdih/minimod:1.0.0
```
## Running Containers
### Using Docker
The benchmark acoustic_iso_cd can be run using the following command:
```
sudo docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined amdih/minimod:1.0.0 benchmark-acousticISO
```
To run the benchmark with specific command-line arguments, use
```
docker run --rm --device /dev/kfd --device /dev/dri --security-opt seccomp=unconfined \

<IMAGE ID> \

acousticISO \

--grid <GRID_SIZE> \

--gridZ_inner <GRID_Z> \

--nsteps <TIME_STEPS> \

--gpuID <GPU_ID>
```
| Command line argument | Description | Default value |
| :----- | :----- | :--- |
| GPU_ID | GPU Device ID to use | 0 |
| GRID_SIZE | Number of grid points in each direction | 100 |
| GRID_Z | Number of HIP blocks in the Z-direction | 20 |
| TIME_STEPS | Number of time steps to take | 1000 |

The benchmark has been optimized for GRID_SIZE=1000.

### Using Singularity
This section assumes that an up-to-date version of Singularity is installed on your system and properly configured for your system. Please consult with your system administrator or view official Singularity documentations.

Pull and convert docker image to singularity image format:
```
singularity pull minimod.sif docker://amdih/minimod:1.0.0
```
You can then use examples from the preceding section to use the image. To run the acoustic_iso_cd benchmark use:
```
singularity run minimod.sif benchmark-acousticISO
```
## Run Using Scripts
Script run_minimod_docker.sh runs the Docker test commands as:
```
sudo sh run_minimod_docker.sh
``` 
Similarly, the Singularity commands can be performed by running:
```
sh run_minimod_singularity.sh
```
