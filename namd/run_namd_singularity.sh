#!/bin/sh -x
#************************************************************************************************
# Usage: sudo sh run_namd_singularity.sh                                                           
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.                        
# This script is used to run AMD Infiniy NAMD singularity commands                            
# Contact info: roohollah.etemadi@amd.com                                                      
# Version: V1.1                                                                                  
# Modified: 2022-05-30                                                                      
# Version History:                                                                              
# V1.1: removed writable-tmpfs 
# V1.0: run amdih/namd:2.15a2-20211101 singularity commands                                   
#************************************************************************************************
echo "Start Test: `date`"

echo "==== Pull singularity image ===="
echo "singularity pull namd2.15a2-20211101.sif docker://amdih/namd:2.15a2-20211101"
singularity pull namd2.15a2-20211101.sif docker://amdih/namd:2.15a2-20211101
echo "==== Pull complete ===="

echo "==== Run test on 1 GPU ===="
echo "singularity run namd2.15a2-20211101.sif cp -r /examples ./"
singularity run namd2.15a2-20211101.sif cp -r /examples ./
echo "singularity run --bind ./examples:/examples --pwd /examples namd2.15a2-20211101.sif /opt/namd/bin/namd2 jac/jac.namd +p64 +setcpuaffinity +devices 0 > jac.log"
singularity run --bind ./examples:/examples --pwd /examples namd2.15a2-20211101.sif /opt/namd/bin/namd2 jac/jac.namd +p64 +setcpuaffinity +devices 0 > jac.log  

echo "singularity run --bind ./examples:/examples --pwd /examples namd2.15a2-20211101.sif /opt/namd/bin/namd2 apoa1/apoa1.namd +p64 +setcpuaffinity +devices 0 > apoa1.log"
singularity run --bind ./examples:/examples --pwd /examples namd2.15a2-20211101.sif /opt/namd/bin/namd2 apoa1/apoa1.namd +p64 +setcpuaffinity +devices 0 > apoa1.log

echo "singularity run --bind ./examples:/examples --pwd /examples namd2.15a2-20211101.sif /opt/namd/bin/namd2 f1atpase/f1atpase.namd +p64 +setcpuaffinity +devices 0 > f1atpase.log"
singularity run --bind ./examples:/examples --pwd /examples namd2.15a2-20211101.sif /opt/namd/bin/namd2 f1atpase/f1atpase.namd +p64 +setcpuaffinity +devices 0 > f1atpase.log

echo "singularity run --bind ./examples:/examples --pwd /examples namd2.15a2-20211101.sif /opt/namd/bin/namd2 stmv/stmv.namd +p64 +setcpuaffinity +devices 0 > stmv.log"
singularity run --bind ./examples:/examples --pwd /examples namd2.15a2-20211101.sif /opt/namd/bin/namd2 stmv/stmv.namd +p64 +setcpuaffinity +devices 0 > stmv.log
echo "==== Complete test on 1 GPU ===="

echo "End Test: `date`"
