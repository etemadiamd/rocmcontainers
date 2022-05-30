#!/bin/sh -x
#************************************************************************************************
# Usage: sh run_pyfr_singularity.sh                                                           
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.                        
# This script is used to run AMD Infiniy PyFr singularity commands                            
# Contact info: roohollah.etemadi@amd.com                                                      
# Version: V1.0                                                                                  
# Modified: 2022-05-28                                                                      
# Version History:                                                                              
# V1.0: run  amdih/pyfr:1.13.0_44 singularity commands                                   
#************************************************************************************************
echo "Start Test: `date`"

echo "==== Pull singularity image ===="
echo "singularity pull pyfr1.13.0_44.sif docker://amdih/pyfr:1.13.0_44"
singularity pull pyfr1.13.0_44.sif docker://amdih/pyfr:1.13.0_44
echo "==== Pull complete ===="

echo "==== Run Test on 1 GPU ===="
echo "singularity run pyfr1.13.0_44.sif /bin/bash -c \"cp -r /benchmark ./\""
singularity run pyfr1.13.0_44.sif /bin/bash -c "cp -r /benchmark ./"
echo "singularity run --bind ./benchmark:/benchmark pyfr1.13.0_44.sif /bin/bash -c \"run-benchmark BSF --ngpus 1\""
singularity run --bind ./benchmark:/benchmark pyfr1.13.0_44.sif /bin/bash -c "run-benchmark BSF --ngpus 1"

echo "singularity run --bind ./benchmark:/benchmark pyfr1.13.0_44.sif /bin/bash -c \"run-benchmark tgv --ngpus 1\""
singularity run --bind ./benchmark:/benchmark pyfr1.13.0_44.sif /bin/bash -c "run-benchmark tgv --ngpus 1"
echo "==== Complete Test on 1 GPU ===="

echo "==== Run Test on 2 GPUs ===="
echo "singularity run --bind ./benchmark:/benchmark pyfr1.13.0_44.sif /bin/bash -c \"run-benchmark tgv --ngpus 2\""
singularity run --bind ./benchmark:/benchmark pyfr1.13.0_44.sif /bin/bash -c "run-benchmark tgv --ngpus 2"
echo "==== Run Test on 2 GPUs ===="

echo "End Test: `date`"
