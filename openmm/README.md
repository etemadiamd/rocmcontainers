# OpenMM ROCm Docker and Singularity Example

### Using Dockerfile to build ROCm OpenMM docker image
```
# Download the ROCm 4.0.1 Dockerfile for Ubuntu 18.04
wget -O openmm.rocm401.ubuntu18.Dockerfile --no-check-certificate https://raw.githubusercontent.com/srinivamd/rocmcontainers/main/openmm/openmm.rocm401.ubuntu18.Dockerfile

# Build docker image, tag it amdgpuce/rocm401_ubuntu18:version1
sudo docker build -t amdgpuce/openmm.rocm401_ubuntu18:version1 - < openmm.rocm401.ubuntu18.Dockerfile 

# Download singularity definition file for ROCm 4.0.1, uses above docker tag
wget -O openmm.rocm401.ubuntu18.sdf --no-check-certificate https://raw.githubusercontent.com/srinivamd/rocmcontainers/main/openmm/openmm.rocm401.ubuntu18.sdf

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
Container was created Mon Feb 22 23:07:54 UTC 2021
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
singularity run openmm.rocm401.ubuntu18.sif $HOME/Documents/openmm-test/openmmtest.pyContainer was created Mon Feb 22 23:07:54 UTC 2021
CWD: /opt/openmm/build Launching: /home/master/Documents/openmm-test/openmmtest.py
7.5
```

