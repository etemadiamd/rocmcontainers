# ROCm-4.1.0-based OpenMM Container

## 1.0 How to Use Docker Container
#### On Ubuntu 18/20 HWE, CentOS/RHEL 7.x, or SLES 15 SP2, use docker:
```
# Launch container in interactive mode, bash shell
sudo docker run -it --privileged --ipc=host --network=host --device=/dev/kfd --device=/dev/dri --group-add video --cap-add=SYS_PTRACE --security-opt seccomp=unconfined amddcgpuce/openmm-rocm410-ubuntu18 bash
```
#### On CentOS/RHEL 8.x, use podman:
```
# Launch container in interactive mode, bash shell
sudo podman run -it --privileged docker://amddcgpuce/openmm-rocm410-ubuntu18 bash
```
##### Image Name + Tag | Description
```
    openmm-rocm410-ubuntu18:version1   -->   OpenMM based on ROCm v4.1.0 On Ubuntu18 (Version 1)
```

## 2.0 Steps to build Singularity container from docker image
#### Download Singularity Definition File
```
# Download Singularity Definition file
wget -O openmm.rocm410.ubuntu18.sdf --no-check-certificate https://raw.githubusercontent.com/amddcgpuce/rocmcontainers/main/openmm/rocm410/ubuntu18/openmm.rocm410.ubuntu18.sdf
```
#### Build Singularity Image File (SIF)
##### On Ubuntu 18.04/20.04 HWE with singularity installed under /usr/local/bin
```
sudo /usr/local/bin/singularity build openmm.rocm410.ubuntu18.sif openmm.rocm410.ubuntu18.sdf
```
##### On CentOS/RHEL 8 with singularity RPM installed
```
sudo singularity build openmm.rocm410.ubuntu18.sif openmm.rocm410.ubuntu18.sdf
```

## 3.0 Example Usage of OpenMM Singularity Container
#### Run Help
```
singularity run-help openmm.rocm410.ubuntu18.sif
```
##### Output
```
    singularity run openmm.rocm410.ubuntu18.sif $HOME/Documents/openmm-test/openmmtest.py
    singularity run openmm.rocm410.ubuntu18.sif ./TestHipBrownianIntegrator
```
#### Running built-in HIP Test
```
singularity run openmm.rocm410.ubuntu18.sif ./TestHipBrownianIntegrator
```
##### Output
```
Container was created Wed Apr 14 17:49:13 UTC 2021
CWD: /opt/openmm/build Launching: ./TestHipBrownianIntegrator
Done
```

#### Run simple OpenMM Python Script: cat $HOME/Documents/openmm-test/openmmtest.py
```
#!/usr/bin/env python3

from simtk import openmm

print(openmm.__version__)
```
##### Add execute permission to openmmtest.py
```
chmod +x $HOME/Documents/openmm-test/openmmtest.py
```
#### Run the test script with ROCm OpenMM singularity container
```
singularity run openmm.rocm410.ubuntu18.sif $HOME/Documents/openmm-test/openmmtest.py
```
##### Output
```
singularity run openmm.rocm410.ubuntu18.sif $HOME/Documents/openmm-test/openmmtest.py
Container was created Wed Apr 14 17:49:13 UTC 2021
CWD: /opt/openmm/build Launching: /home/USERHOME/Documents/openmm-test/openmmtest.py
7.5
```
