```
Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.
Revision: V1.0
V1.0: add docker commands
```
# Tensorflow

## Pull Command

```
sudo docker pull rocm/tensorflow:rocm5.1-tf2.8-dev
```
## Running Containers
### Using Docker
Start the Docker container using the following command:
```
sudo docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined -v ~:/datadisk-docker rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash
```
#### tf_cnn_benchmarks: High performance benchmarks
tf_cnn_benchmarks contains several popular convolutional models which can be performed both on a single machine or in distributed mode across multiple hosts. To commands belwo run ResNet50 on 1,2,4, and 8 GPUs.
First, inside the docker container execute:
```
export TF_ROCM_FUSION_ENABLE=1
cd ~/benchmarks/scripts/tf_cnn_benchmarks
```
Then, launch the ResNet50 benchmark on one GPU with single-precision floating-point (FP32) as:

```
python3 tf_cnn_benchmarks.py --model=resnet50  --num_gpus=1 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu
```
To run on one GPU with half-precision floating-point (FP16)
```
python3 tf_cnn_benchmarks.py --model=resnet50  --num_gpus=1 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu --use_fp16=True
```
To run the test on 2,4, and 8 gpus, change "--num_gpus" flag.

To see a list of flags to run the benckmark using tf_cnn_benchmarks.py, run:
```
python3 tf_cnn_benchmarks.py --help
```
The followings are some important flags:
- model: Model to use, e.g. resnet50, inception3, vgg16, googlenet, densenet, and alexnet.
- num_gpus: Number of GPUs to use.
- variable_update: The method to manage variables and can be:  parameter_server ,replicated, distributed_replicated, independent
- batch_size: Batch size for each GPU.
- local_parameter_device: Device to use as parameter server: cpu or gpu.

For example, the command below uses  the "--optimizer" flag to run the ResNet50 benchmark with "momentum" optimizer instade of "sgd" as the defualt optimizer in the above commands.
```
python3 tf_cnn_benchmarks.py --data_format=NCHW --batch_size=256 --model=resnet50 --optimizer=momentum --variable_update=replicated --nodistortions --gradient_repacking=8 --num_gpus=4 --num_epochs=90 --weight_decay=1e-4 --use_fp16=True
```
### Run Using Script:
The run_tensorflow_docker.sh script runs the docker commands for ResNet50, Inception3, VGG16, and AlexNet on 1,2,4, and 8 GPUs by runing:
```
sudo sh run_tensorflow_docker.sh
```
