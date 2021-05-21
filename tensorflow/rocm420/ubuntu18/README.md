# ROCm-4.2.0-based Tensorflow Container

## 1.0 How to Use Docker Container
#### On Ubuntu 18/20 HWE, CentOS/RHEL 7.x, or SLES 15 SP2, use docker:
```
# Launch container in interactive mode, bash shell
sudo docker run -it --privileged --ipc=host --network=host --device=/dev/kfd --device=/dev/dri --group-add video --cap-add=SYS_PTRACE --security-opt seccomp=unconfined amddcgpuce/tensorflow_2.4-rocm420-ubuntu18 bash
```
#### On CentOS/RHEL 8.x, use podman:
```
# Launch container in interactive mode, bash shell
sudo podman run -it --privileged docker://amddcgpuce/tensorflow_2.4-rocm420-ubuntu18 bash
```
##### Image Name + Tag | Description
```
    tensorflow_2.4-rocm420-ubuntu18   -->   Tensorflow-2.4 based on ROCm v4.2.0 On Ubuntu18
```

## 2.0 Steps to build Singularity container from docker image
#### Download Singularity Definition File
```
# Download Singularity Definition file
wget -O tensorflow_2.4.rocm420.ubuntu18.sdf --no-check-certificate https://raw.githubusercontent.com/amddcgpuce/rocmcontainers/main/tensorflow/rocm420/ubuntu18/tensorflow_2.4.rocm420.ubuntu18.sdf
```
#### Build Singularity Image File (SIF)
##### On Ubuntu 18.04/20.04 HWE with singularity installed under /usr/local/bin
```
sudo /usr/local/bin/singularity build tensorflow_2.4.rocm420.ubuntu18.sif tensorflow_2.4.rocm420.ubuntu18.sdf
```
##### On CentOS/RHEL 8 with singularity RPM installed
```
sudo singularity build tensorflow_2.4.rocm420.ubuntu18.sif tensorflow_2.4.rocm420.ubuntu18.sdf
```
	
## 3.0 Example Usage of Tensorflow Docker Container
#### Tensorflow Examples
```
# Launch container in interactive mode, bash shell on a Ubuntu18 system
sudo docker run -it --privileged --ipc=host --network=host --device=/dev/kfd --device=/dev/dri --group-add video --cap-add=SYS_PTRACE --security-opt seccomp=unconfined amddcgpuce/tensorflow_2.4-rocm420-ubuntu18 bash

# Example benchmarks: 
export TF_ROCM_FUSION_ENABLE=1
python3 tf_cnn_benchmarks.py --model=resnet50 --num_gpus=1 --num_batches=100 --batch_size=256 --print_training_accuracy=True
python3 tf_cnn_benchmarks.py --model=resnet50 --num_gpus=1 --num_batches=100 --batch_size=256 --print_training_accuracy=True --use_fp16=True

# Examples with XGMI setup : 
cd /opt/tensorflow/benchmarks/scripts/tf_cnn_benchmarks
python3 tf_cnn_benchmarks.py --model=resnet50  --num_gpus=4 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu   
python3 tf_cnn_benchmarks.py --model=resnet50  --num_gpus=4 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu --use_fp16=True
python3 tf_cnn_benchmarks.py --model=resnet50  --num_gpus=8 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu   
python3 tf_cnn_benchmarks.py --model=resnet50  --num_gpus=8 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu --use_fp16=True  

# Examples with non-XGMI setup : 
cd /opt/tensorflow/benchmarks/scripts/tf_cnn_benchmarks
python3 tf_cnn_benchmarks.py --model=resnet50  --num_gpus=4 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=cpu   
python3 tf_cnn_benchmarks.py --model=resnet50  --num_gpus=4 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=cpu --use_fp16=True
python3 tf_cnn_benchmarks.py --model=resnet50  --num_gpus=8 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=cpu   
python3 tf_cnn_benchmarks.py --model=resnet50  --num_gpus=8 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=cpu --use_fp16=True
```

## 4.0 Example Usage of Tensorflow Singularity Container
#### Run Help
```
singularity run-help tensorflow_2.4.rocm420.ubuntu18.sif
```
##### Output
```
    singularity run tensorflow_2.4.rocm420.ubuntu18.sif /bin/bash -c "cd /opt/tensorflow/benchmarks/scripts; cp -r tf_cnn_benchmarks $HOME/Documents/"
    singularity run tensorflow_2.4.rocm420.ubuntu18.sif /bin/bash -c "cd $HOME/Documents/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=resnet50 --num_gpus=1 --num_batches=100 --batch_size=256 --print_training_accuracy=True"
    singularity run tensorflow_2.4.rocm420.ubuntu18.sif /bin/bash -c "cd $HOME/Documents/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=resnet50 --num_gpus=1 --num_batches=100 --batch_size=256 --print_training_accuracy=True --use_fp16=True"
```
#### Copy Tensorflow benchmark samples from container to $HOME/Documents on host
```
singularity run tensorflow_2.4.rocm420.ubuntu18.sif /bin/bash -c "cd /opt/tensorflow/benchmarks/scripts; cp -r tf_cnn_benchmarks $HOME/Documents/"
```
##### Output
```
Container was created Fri May 21 00:53:10 UTC 2021
CWD: /opt/tensorflow Launching: /bin/bash -c cd /opt/tensorflow/benchmarks/scripts; cp -r tf_cnn_benchmarks /home/sanjay/Documents/
```
#### Running sample benchmark#1
```
singularity run tensorflow_2.4.rocm420.ubuntu18.sif /bin/bash -c "cd $HOME/Documents/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=resnet50 --num_gpus=1 --num_batches=100 --batch_size=256 --print_training_accuracy=True"
```
##### Output
```
Container was created Fri May 21 00:53:10 UTC 2021
CWD: /opt/tensorflow Launching: /bin/bash -c cd /home/sanjay/Documents/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=resnet50 --num_gpus=1 --num_batches=100 --batch_size=256 --print_training_accuracy=True
WARNING:tensorflow:From /usr/local/lib/python3.6/dist-packages/tensorflow/python/compat/v2_compat.py:96: disable_resource_variables (from tensorflow.python.ops.variable_scope) is deprecated and will be removed in a future version.
Instructions for updating:
non-resource variables are not supported in the long term
2021-05-20 18:00:14.873285: I tensorflow/compiler/jit/xla_gpu_device.cc:99] Not creating XLA devices, tf_xla_enable_xla_devices not set
2021-05-20 18:00:14.873606: I tensorflow/stream_executor/platform/default/dso_loader.cc:53] Successfully opened dynamic library libamdhip64.so
2021-05-20 18:00:15.637053: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1734] Found device 0 with properties:
pciBusID: 0000:c5:00.0 name: Vega 20     ROCm AMDGPU Arch: gfx906:sramecc+:xnack-
coreClock: 1.725GHz coreCount: 60 deviceMemorySize: 31.98GiB deviceMemoryBandwidth: 953.67GiB/s
2021-05-20 18:00:15.637139: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1734] Found device 1 with properties:
pciBusID: 0000:c8:00.0 name: Vega 20     ROCm AMDGPU Arch: gfx906:sramecc+:xnack-
...output snipped...
```
#### Running sample benchmark#2
```
singularity run tensorflow_2.4.rocm420.ubuntu18.sif /bin/bash -c "cd $HOME/Documents/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=resnet50 --num_gpus=1 --num_batches=100 --batch_size=256 --print_training_accuracy=True --use_fp16=True"
```
##### Output
```
Container was created Fri May 21 00:53:10 UTC 2021
CWD: /opt/tensorflow Launching: /bin/bash -c cd /home/sanjay/Documents/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=resnet50 --num_gpus=1 --num_batches=100 --batch_size=256 --print_training_accuracy=True --use_fp16=True
WARNING:tensorflow:From /usr/local/lib/python3.6/dist-packages/tensorflow/python/compat/v2_compat.py:96: disable_resource_variables (from tensorflow.python.ops.variable_scope) is deprecated and will be removed in a future version.
Instructions for updating:
non-resource variables are not supported in the long term
2021-05-20 18:01:59.948591: I tensorflow/compiler/jit/xla_gpu_device.cc:99] Not creating XLA devices, tf_xla_enable_xla_devices not set
2021-05-20 18:01:59.949197: I tensorflow/stream_executor/platform/default/dso_loader.cc:53] Successfully opened dynamic library libamdhip64.so
2021-05-20 18:02:00.647918: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1734] Found device 0 with properties:
pciBusID: 0000:c5:00.0 name: Vega 20     ROCm AMDGPU Arch: gfx906:sramecc+:xnack-
coreClock: 1.725GHz coreCount: 60 deviceMemorySize: 31.98GiB deviceMemoryBandwidth: 953.67GiB/s
2021-05-20 18:02:00.648006: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1734] Found device 1 with properties:
pciBusID: 0000:c8:00.0 name: Vega 20     ROCm AMDGPU Arch: gfx906:sramecc+:xnack-
coreClock: 1.725GHz coreCount: 60 deviceMemorySize: 31.98GiB deviceMemoryBandwidth: 953.67GiB/s
2021-05-20 18:02:00.648059: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1734] Found device 2 with properties:
pciBusID: 0000:8a:00.0 name: Vega 20     ROCm AMDGPU Arch: gfx906:sramecc+:xnack-
...output snipped...
```

## 5.0 Incompatible ROCm Environment Check Message (NEW)
### ROCm 4.1 Kernel Modules (rock-dkms, rock-dkms-firmware) or newer is required on MI50/MI60 platforms to run ROCm 4.1 or newer user space stack 

#### Docker Run Failure Message On Incompatible ROCm Environment
```
sudo docker run -it --privileged --ipc=host --network=host --device=/dev/kfd --device=/dev/dri --group-add video --cap-add=SYS_PTRACE --security-opt seccomp=unconfined amddcgpuce/tensorflow_2.4-rocm410-ubuntu18 bash
```
##### Output
```
Error: Incompatible ROCm environment. The Docker container
requires the latest kernel driver to operate correctly.

Upgrade the ROCm kernel to v4.1 or newer, or use a container
tagged for v4.0.1 or older.

To inspect the version of the installed kernel driver, run either:
      dpkg --status rock-dkms [Debian-based]
      rpm -ql rock-dkms [RHEL, SUSE, and others]

To install or update the driver, follow the installation instructions at:
    https://rocmdocs.amd.com/en/latest/Installation_Guide/Installation-Guide.html
```

#### Singularity Run Failure Message On Incompatible ROCm Environment
```
singularity run tensorflow_2.4.rocm420.ubuntu18.sif /bin/bash -c "cd /opt/tensorflow/benchmarks/scripts; cp -r tf_cnn_benchmarks $HOME/Documents/"
```
##### Output
```
Container was created Fri May 21 00:53:10 UTC 2021

Error: Incompatible ROCm environment. The Docker container 
requires the latest kernel driver to operate correctly.

Upgrade the ROCm kernel to v4.1 or newer, or use a container 
tagged for v4.0.1 or older.

To inspect the version of the installed kernel driver, run either:
    . dpkg --status rock-dkms [Debian-based]
    . rpm -ql rock-dkms [RHEL, SUSE, and others]

To install or update the driver, follow the installation instructions at:
    https://rocmdocs.amd.com/en/latest/Installation_Guide/Installation-Guide.html
```
