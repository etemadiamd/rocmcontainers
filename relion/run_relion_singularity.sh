#!/bin/sh -x
#************************************************************************************************
# Usage: sudo sh run_relion_singularity.sh
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.
# This script is used to run AMD Infiniy RELION Docker Container
# Contact info: sanjay.tripathi@amd.com
# Version: V1.1
# Modified: 2022-12-29
# Version History:
# V1.1: Added 4-GPU support, changed number of GPUs order
# V1.0: Run docker image amddcgpuce/relion:4.0_25 using Singularity
#************************************************************************************************
echo "Date: `date`"

echo "==== Pull RELION docker image to build Singularity container  ===="
echo "singularity pull relion_4.0_25.sif docker://amddcgpuce/relion:4.0_25"
singularity pull relion_4.0_25.sif docker://amddcgpuce/relion:4.0_25
echo "==== Pull complete  ===="

echo "Date: `date`"

RELION_BENCHMARK_HOME=${HOME}
LOGDIR=${HOME}/relion-logs-$$

echo "==== Run 2D Benchmark on 2 GPUs ==== "
mkdir -p $LOGDIR
echo "singularity run --bind ${HOME}/relion_benchmark:/dataset:ro --pwd /benchmark relion_4.0_25.sif run-benchmark --class 2d -g 2 -n 13 -j 1 -p 10 --iters 25 -i /dataset -o $LOGDIR"
singularity run --bind ${HOME}/relion_benchmark:/dataset:ro --pwd /benchmark relion_4.0_25.sif run-benchmark --class 2d -g 2 -n 13 -j 1 -p 10 --iters 25 -i /dataset -o $LOGDIR
# Save logfile from the benchmark run and remove temp-files from the run
cp $LOGDIR/log.txt ${PWD}/log.txt-relion-2gpu-2d-`date +"%y-%m-%d-%H-%M-%S"`
rm -rf $LOGDIR

echo "Date: `date`"

echo "==== Run 2D Benchmark on 4 GPUs ==== "
mkdir -p $LOGDIR
echo "singularity run --bind ${HOME}/relion_benchmark:/dataset:ro --pwd /benchmark relion_4.0_25.sif run-benchmark --class 2d -g 4 -n 25 -j 1 -p 10 --iters 25 -i /dataset -o $LOGDIR"
singularity run --bind ${HOME}/relion_benchmark:/dataset:ro --pwd /benchmark relion_4.0_25.sif run-benchmark --class 2d -g 4 -n 25 -j 1 -p 10 --iters 25 -i /dataset -o $LOGDIR
# Save logfile from the benchmark run and remove temp-files from the run
cp $LOGDIR/log.txt ${PWD}/log.txt-relion-4gpu-2d-`date +"%y-%m-%d-%H-%M-%S"`
rm -rf $LOGDIR

echo "Date: `date`"

echo "==== Run 2D Benchmark on 8 GPUs ==== "
mkdir -p $LOGDIR
echo "singularity run --bind ${HOME}/relion_benchmark:/dataset:ro --pwd /benchmark relion_4.0_25.sif run-benchmark --class 2d -g 8 -n 25 -j 1 -p 10 --iters 25 -i /dataset -o $LOGDIR"
singularity run --bind ${HOME}/relion_benchmark:/dataset:ro --pwd /benchmark relion_4.0_25.sif run-benchmark --class 2d -g 8 -n 25 -j 1 -p 10 --iters 25 -i /dataset -o $LOGDIR
# Save logfile from the benchmark run and remove temp-files from the run
cp $LOGDIR/log.txt ${PWD}/log.txt-relion-8gpu-2d-`date +"%y-%m-%d-%H-%M-%S"`
rm -rf $LOGDIR

echo "Date: `date`"

echo "==== Run 3D Benchmark on 2 GPUs ==== "
mkdir -p $LOGDIR
echo "singularity run --bind ${HOME}/relion_benchmark:/dataset:ro --pwd /benchmark relion_4.0_25.sif run-benchmark --class 3d -g 2 -n 7 -j 6 -p 10 --iters 25 -i /dataset -o $LOGDIR"
singularity run --bind ${HOME}/relion_benchmark:/dataset:ro --pwd /benchmark relion_4.0_25.sif run-benchmark --class 3d -g 2 -n 7 -j 6 -p 10 --iters 25 -i /dataset -o $LOGDIR
# Save logfile from the benchmark run and remove temp-files from the run
cp $LOGDIR/log.txt ${PWD}/log.txt-relion-2gpu-3d-`date +"%y-%m-%d-%H-%M-%S"`
rm -rf $LOGDIR

echo "Date: `date`"

echo "==== Run 3D Benchmark on 4 GPUs ==== "
mkdir -p $LOGDIR
echo "singularity run --bind ${HOME}/relion_benchmark:/dataset:ro --pwd /benchmark relion_4.0_25.sif run-benchmark --class 3d -g 4 -n 9 -j 4 -p 10 --iters 25 -i /dataset -o $LOGDIR"
singularity run --bind ${HOME}/relion_benchmark:/dataset:ro --pwd /benchmark relion_4.0_25.sif run-benchmark --class 3d -g 4 -n 9 -j 4 -p 10 --iters 25 -i /dataset -o $LOGDIR
# Save logfile from the benchmark run and remove temp-files from the run
cp $LOGDIR/log.txt ${PWD}/log.txt-relion-4gpu-3d-`date +"%y-%m-%d-%H-%M-%S"`
rm -rf $LOGDIR

echo "Date: `date`"

echo "==== Run 3D Benchmark on 8 GPUs ==== "
mkdir -p $LOGDIR
echo "singularity run --bind ${HOME}/relion_benchmark:/dataset:ro --pwd /benchmark relion_4.0_25.sif run-benchmark --class 3d -g 8 -n 9 -j 4 -p 10 --iters 25 -i /dataset -o $LOGDIR"
singularity run --bind ${HOME}/relion_benchmark:/dataset:ro --pwd /benchmark relion_4.0_25.sif run-benchmark --class 3d -g 8 -n 9 -j 4 -p 10 --iters 25 -i /dataset -o $LOGDIR
# Save logfile from the benchmark run and remove temp-files from the run
cp $LOGDIR/log.txt ${PWD}/log.txt-relion-8gpu-3d-`date +"%y-%m-%d-%H-%M-%S"`
rm -rf $LOGDIR

echo "Date: `date`"

echo "==== Run complete ===="
