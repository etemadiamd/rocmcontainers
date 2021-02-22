# ROCm Docker and Singularity Example

### Using the Dockerfile build a docker image for ROCm
```

# Download the ROCm 4.0.1 Dockerfile for Ubuntu 18.04
wget -O rocm401.ubuntu18.Dockerfile --no-check-certificate https://raw.githubusercontent.com/srinivamd/rocmcontainers/main/rocm/rocm401.ubuntu18.Dockerfile

# Build docker image, tag it amdgpuce/rocm401_ubuntu18:version1
sudo docker build -t amdgpuce/rocm401_ubuntu18:version1 - < rocm401.ubuntu18.Dockerfile 

# Download singularity definition file for ROCm 4.0.1, uses above docker tag
wget -O rocm401.ubuntu18.Dockerfile --no-check-certificate https://raw.githubusercontent.com/srinivamd/rocmcontainers/main/rocm/rocm401.ubuntu18.sdf

# Build singularity image, bootstrap from docker image built earlier
# (replace path to singularity installation as appropriate)
sudo /usr/local/bin/singularity build rocm401.ubuntu18.sif rocm401.ubuntu18.sdf

```

## Example run of singularity ROCm 4.0.1 created above
### Help
```
singularity run-help rocm401.ubuntu18.sif
    singularity run rocm401.ubuntu18.sif /bin/bash -c "cp -r /opt/rocm-4.0.1/hip/samples/ $HOME/Documents"
    singularity run rocm401.ubuntu18.sif /bin/bash -c "cd $HOME/Documents/0_Intro/bit_extract; make HIP_PATH=/opt/rocm-4.0.1/hip; ./bit_extract"
```

### Copy HIP samples to $HOME/Documents
```
singularity run rocm401.ubuntu18.sif /bin/bash -c "cp -r /opt/rocm-4.0.1/hip/samples/ $HOME/Documents"
Container was created Mon Feb 22 20:34:04 UTC 2021
CWD: /home/USERHOME Launching: /bin/bash -c cp -r /opt/rocm-4.0.1/hip/samples/ /home/USERHOME/Documents
```

### Build and run bit_extract HIP sample
```
  singularity run rocm401.ubuntu18.sif /bin/bash -c "cd $HOME/Documents/0_Intro/bit_extract; make HIP_PATH=/opt/rocm-4.0.1/hip; ./bit_extract"
  Container was created Mon Feb 22 20:34:04 UTC 2021
  CWD: /home/USERHOME Launching: /bin/bash -c cd /home/USERHOME/Documents/0_Intro/bit_extract; make HIP_PATH=/opt/rocm-4.0.1/hip; ./bit_extract
  /opt/rocm-4.0.1/hip/bin/hipcc  bit_extract.cpp -o bit_extract
  info: running on device #0 Device 66a1
  info: allocate host mem (  7.63 MB)
  info: allocate device mem (  7.63 MB)
  info: copy Host2Device
  info: launch 'bit_extract_kernel' 
  info: copy Device2Host
  info: check result
  PASSED!
```
