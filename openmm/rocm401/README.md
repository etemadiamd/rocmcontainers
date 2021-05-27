```
# Copyright (c) 2021 Advanced Micro Devices, Inc. All Rights Reserved.
```
# OpenMM ROCm Docker and Singularity Example

### Build ROCm OpenMM Singularity container from amddcgpuce docker hub image
```
# Download OpenMM singularity definition file for ROCm 4.0.1
wget -O openmm.rocm401.ubuntu18.sdf --no-check-certificate https://raw.githubusercontent.com/amddcgpuce/rocmcontainers/main/openmm/rocm401/openmm.rocm401.ubuntu18.sdf

# Build singularity image, bootstrap from docker image built earlier
# (replace path to singularity installation as appropriate)
sudo /usr/local/bin/singularity build openmm.rocm401.ubuntu18.sif openmm.rocm401.ubuntu18.sdf
```

## Example run of singularity ROCm 4.0.1 created above
### Help
```
singularity run-help openmm.rocm401.ubuntu18.sif

    singularity run openmm.rocm401.ubuntu18.sif $HOME/Documents/openmm-test/openmmtest.py
    singularity run openmm.rocm401.ubuntu18.sif ./TestHipBrownianIntegrator

```

### Run built-in HIP Test
```
singularity run openmm.rocm401.ubuntu18.sif ./TestHipBrownianIntegrator

Container was created Wed Feb 24 07:47:43 UTC 2021
CWD: /opt/openmm/build Launching: ./TestHipBrownianIntegrator
Done

```

### Run simple OpenMM Python Script: cat $HOME/Documents/openmm-test/openmmtest.py
```
#!/usr/bin/env python3

from simtk import openmm

print(openmm.__version__)

```

### Add execute permission to openmmtest.py
```
chmod +x $HOME/Documents/openmm-test/openmmtest.py
```

### Run the test script with ROCm OpenMM singularity container
```
singularity run openmm.rocm401.ubuntu18.sif $HOME/Documents/openmm-test/openmmtest.py

Container was created Wed Feb 24 07:47:43 UTC 2021
CWD: /opt/openmm/build Launching: /home/master/Documents/openmm-test/openmmtest.py
7.5

```

### (Optional) Build ROCm OpenMM docker image or use image from docker hub
```
# Download the ROCm 4.0.1 Dockerfile for Ubuntu 18.04
wget -O openmm.rocm401.ubuntu18.Dockerfile --no-check-certificate https://raw.githubusercontent.com/amddcgpuce/rocmcontainers/main/openmm/rocm401/openmm.rocm401.ubuntu18.Dockerfile

# Build docker image, tag it amddcgpuce/openmm_rocm401_ubuntu18:version1
sudo docker build -t amddcgpuce/openmm_rocm401_ubuntu18:version1 -f openmm.rocm401.ubuntu18.Dockerfile .
```

