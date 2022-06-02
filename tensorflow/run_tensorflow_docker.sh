#!/bin/sh -x
#************************************************************************************************
# Usage: sudo sh run_tensorflow_docker.sh                                                        
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.                         
# This script is used to run AMD Tensorflow Docker Container                                
# Contact info: roohollah.etemadi@amd.com                                                       
# Version: V1.0                                                                                  
# Modified: 2022-06-2                                                                          
# Version History:                                                                              
# V1.0: rocm/tensorflow:rocm5.1-tf2.8-dev docker image                                             
#************************************************************************************************
echo "Start Test:`date`"

echo "==== Pull docker image  ===="
echo "docker pull rocm/tensorflow:rocm5.1-tf2.8-dev"
docker pull rocm/tensorflow:rocm5.1-tf2.8-dev
echo "==== Pull complete  ===="

echo "==== Run ResNet50 Benchmark ===="

echo "***** One GPU *****"
echo "docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c \"export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=resnet50  --num_gpus=1 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu\""
docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c "export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=resnet50  --num_gpus=1 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu"
echo "***** Complete One GPU *****"

echo "***** One GPU FP16*****"
echo "docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c \"export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=resnet50  --num_gpus=1 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu --use_fp16=True\""
docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c "export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=resnet50  --num_gpus=1 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu --use_fp16=True"
echo "***** Complete One GPU FP16*****"

echo "***** Two GPUs *****"
echo "docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c \"export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=resnet50  --num_gpus=2 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu\""
docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c "export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=resnet50  --num_gpus=2 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu"
echo "***** Complete Two GPUs *****"

echo "***** Two GPUs FP16*****"
echo "docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c \"export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=resnet50  --num_gpus=2 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu --use_fp16=True\""
docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c "export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=resnet50  --num_gpus=2 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu --use_fp16=True"
echo "***** Complete Two GPUs FP16*****"


echo "***** Four GPUs *****"
echo "docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c \"export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=resnet50  --num_gpus=4 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu\""
docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c "export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=resnet50  --num_gpus=4 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu"
echo "***** Complete Four GPUs *****"

echo "***** Four GPUs FP16*****"
echo "docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c \"export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=resnet50  --num_gpus=4 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu --use_fp16=True\""
docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c "export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=resnet50  --num_gpus=4 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu --use_fp16=True"
echo "***** Complete Four GPUs FP16*****"

echo "***** Eight GPUs *****"
echo "docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c \"export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=resnet50  --num_gpus=8 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu\""
docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c "export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=resnet50  --num_gpus=8 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu"
echo "***** Complete Eight GPUs *****"

echo "***** Eight GPUs FP16*****"
echo "docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c \"export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=resnet50  --num_gpus=8 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu --use_fp16=True\""
docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c "export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=resnet50  --num_gpus=8 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu --use_fp16=True"
echo "***** Complete Eight GPUs FP16*****"
echo "==== Complete Run ResNet50 Benchmark ===="

echo "==== Run inception3 Benchmark ===="
echo "***** One GPU *****"
echo "docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c \"export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=inception3  --num_gpus=1 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu\""
docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c "export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=inception3  --num_gpus=1 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu"
echo "***** Complete One GPU *****"

echo "***** One GPU FP16*****"
echo "docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c \"export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=inception3  --num_gpus=1 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu --use_fp16=True\""
docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c "export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=inception3  --num_gpus=1 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu --use_fp16=True"
echo "***** Complete One GPU FP16*****"

echo "***** Two GPUs *****"
echo "docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c \"export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=inception3  --num_gpus=2 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu\""
docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c "export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=inception3  --num_gpus=2 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu"
echo "***** Complete Two GPUs *****"

echo "***** Two GPUs FP16*****"
echo "docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c \"export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=inception3  --num_gpus=2 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu --use_fp16=True\""
docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c "export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=inception3  --num_gpus=2 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu --use_fp16=True"
echo "***** Complete Two GPUs FP16*****"

echo "***** Four GPUs *****"
echo "docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c \"export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=inception3  --num_gpus=4 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu\""
docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c "export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=inception3  --num_gpus=4 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu"
echo "***** Complete Four GPUs *****"

echo "***** Four GPUs FP16*****"
echo "docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c \"export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=inception3  --num_gpus=4 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu --use_fp16=True\""
docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c "export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=inception3  --num_gpus=4 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu --use_fp16=True"
echo "***** Complete Four GPUs FP16*****"

echo "***** Eight GPUs *****"
echo "docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c \"export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=inception3  --num_gpus=8 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu\""
docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c "export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=inception3  --num_gpus=8 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu"
echo "***** Complete Eight GPUs *****"

echo "***** Eight GPUs FP16*****"
echo "docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c \"export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=inception3  --num_gpus=8 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu --use_fp16=True\""
docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c "export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=inception3  --num_gpus=8 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu --use_fp16=True"
echo "***** Complete Eight GPUs FP16*****"
echo "==== Complete Run inception3 Benchmark ===="

echo "==== Run vgg16 Benchmark ===="
echo "***** One GPU *****"
echo "docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c \"export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=vgg16  --num_gpus=1 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu\""
docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c "export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=vgg16  --num_gpus=1 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu"
echo "***** Complete One GPU *****"

echo "***** One GPU FP16*****"
echo "docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c \"export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=vgg16  --num_gpus=1 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu --use_fp16=True\""
docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c "export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=vgg16  --num_gpus=1 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu --use_fp16=True"
echo "***** Complete One GPU FP16*****"

echo "***** Two GPUs *****"
echo "docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c \"export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=vgg16  --num_gpus=2 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu\""
docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c "export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=vgg16  --num_gpus=2 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu"
echo "***** Complete Two GPUs *****"

echo "***** Two GPUs FP16*****"
echo "docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c \"export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=vgg16  --num_gpus=2 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu --use_fp16=True\""
docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c "export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=vgg16  --num_gpus=2 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu --use_fp16=True"
echo "***** Complete Two GPUs FP16*****"

echo "***** Four GPUs *****"
echo "docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c \"export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=vgg16  --num_gpus=4 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu\""
docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c "export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=vgg16  --num_gpus=4 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu"
echo "***** Complete Four GPUs *****"

echo "***** Four GPUs FP16*****"
echo "docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c \"export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=vgg16  --num_gpus=4 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu --use_fp16=True\""
docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c "export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=vgg16  --num_gpus=4 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu --use_fp16=True"
echo "***** Complete Four GPUs FP16*****"

echo "***** Eight GPUs *****"
echo "docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c \"export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=vgg16  --num_gpus=8 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu\""
docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c "export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=vgg16  --num_gpus=8 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu"
echo "***** Complete Eight GPUs *****"

echo "***** Eight GPUs FP16*****"
echo "docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c \"export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=vgg16  --num_gpus=8 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu --use_fp16=True\""
docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c "export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=vgg16  --num_gpus=8 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu --use_fp16=True"
echo "***** Complete Eight GPUs FP16*****"
echo "==== Complete Run vgg16 Benchmark ===="

echo "==== Run alexnet Benchmark ===="
echo "***** One GPU *****"
echo "docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c \"export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=alexnet  --num_gpus=1 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu\""
docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c "export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=alexnet  --num_gpus=1 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu"
echo "***** Complete One GPU *****"

echo "***** One GPU FP16*****"
echo "docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c \"export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=alexnet  --num_gpus=1 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu --use_fp16=True\""
docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c "export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=alexnet  --num_gpus=1 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu --use_fp16=True"
echo "***** Complete One GPU FP16*****"

echo "***** Two GPUs *****"
echo "docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c \"export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=alexnet  --num_gpus=2 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu\""
docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c "export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=alexnet  --num_gpus=2 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu"
echo "***** Complete Two GPUs *****"

echo "***** Two GPUs FP16*****"
echo "docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c \"export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=alexnet  --num_gpus=2 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu --use_fp16=True\""
docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c "export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=alexnet  --num_gpus=2 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu --use_fp16=True"
echo "***** Complete Two GPUs FP16*****"

echo "***** Four GPUs *****"
echo "docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c \"export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=alexnet  --num_gpus=4 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu\""
docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c "export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=alexnet  --num_gpus=4 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu"
echo "***** Complete Four GPUs *****"

echo "***** Four GPUs FP16*****"
echo "docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c \"export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=alexnet  --num_gpus=4 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu --use_fp16=True\""
docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c "export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=alexnet  --num_gpus=4 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu --use_fp16=True"
echo "***** Complete Four GPUs FP16*****"

echo "***** Eight GPUs *****"
echo "docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c \"export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=alexnet  --num_gpus=8 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu\""
docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c "export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=alexnet  --num_gpus=8 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu"
echo "***** Complete Eight GPUs *****"

echo "***** Eight GPUs FP16*****"
echo "docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c \"export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=alexnet  --num_gpus=8 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu --use_fp16=True\""
docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --group-add video  --security-opt seccomp=unconfined  rocm/tensorflow:rocm5.1-tf2.8-dev /bin/bash -c "export TF_ROCM_FUSION_ENABLE=1; cd ~/benchmarks/scripts/tf_cnn_benchmarks; python3 tf_cnn_benchmarks.py --model=alexnet  --num_gpus=8 --batch_size=256 --num_batches=100 --print_training_accuracy=True --variable_update=parameter_server --local_parameter_device=gpu --use_fp16=True"
echo "***** Complete Eight GPUs FP16*****"
echo "==== Complete Run alexnet Benchmark ===="
echo "End Test:`date`"
