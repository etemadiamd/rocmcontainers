```
Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.
Revision: V2.0
V2.0: update for new image minihacc:1.0.amd3_129
V1.0: add docker and singualrity commands
```
# Mini-Hacc

## Pull Command

```
sudo docker pull amdih/minihacc:1.0.amd3_129
```
## Running Containers
There are two benchmarks: fp32 and fp64 which can be ran using following commands:

FP32:
```
sudo docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined amdih/minihacc:1.0.amd3_129 mini-HACC
```
FP64:
```
sudo docker run --rm -it --ipc=host --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined amdih/minihacc:1.0.amd3_129 mini-HACC-fp64
```
## Run Using Singularity
This section assumes that an up-to-date version of Singularity is installed on your system and properly configured for your system. Please consult with your system administrator or view official Singularity documentations.

Pull and convert docker image to singularity image format:
```
singularity pull minihacc.sif docker://amdih/minihacc:1.0.amd3_129
```
You can then use examples from the preceding section to use the image. To run FP32 benchmark:
```
singularity run ./minihacc.sif mini-HACC
```
To run FP64 benchmark:
```
singularity run ./minihacc.sif mini-HACC-fp64
```
## Run Using Scripts
The Docker test commands can be executed by:
```
sudo sh run_minihacc_docker.sh
``` 
Similarly, the Singularity commands can be performed by running:
```
sh run_minihacc_singularity.sh
```
