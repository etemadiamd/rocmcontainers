#!/bin/sh -x
#************************************************************************************************
# Usage: sudo sh run_namd3_singularity.sh                                                           
# Copyright (c) 2022 Advanced Micro Devices, Inc. All Rights Reserved.                        
# This script is used to run AMD Infiniy NAMD 3.0 singularity commands                            
# Contact info: roohollah.etemadi@amd.com                                                      
# Version: V1.0                                                                                  
# Modified: 2022-05-25                                                                      
# Version History:                                                                              
# V1.0: run amdih/namd3:3.0a9 singularity commands                                   
#************************************************************************************************
echo "Start Test: `date`"

echo "==== Pull singularity image ===="
echo "singularity pull namd3_3.0a9.sif docker://amdih/namd3:3.0a9"
singularity pull namd3_3.0a9.sif docker://amdih/namd3:3.0a9
echo "==== Pull complete ===="

echo "==== Run Test on 1 GPU ===="
echo "singularity run --writable-tmpfs --pwd /examples namd3_3.0a9.sif namd3 jac/jac.namd +p1 +setcpuaffinity --CUDASOAintegrate on +devices 0 > jac.log"
singularity run --writable-tmpfs --pwd /examples namd3_3.0a9.sif namd3 jac/jac.namd +p1 +setcpuaffinity --CUDASOAintegrate on +devices 0 > jac.log

echo "singularity run --writable-tmpfs --pwd /examples namd3_3.0a9.sif namd3 apoa1/apoa1.namd +p1 +setcpuaffinity --CUDASOAintegrate on +devices 0 > apoa1.log"
singularity run --writable-tmpfs --pwd /examples namd3_3.0a9.sif namd3 apoa1/apoa1.namd +p1 +setcpuaffinity --CUDASOAintegrate on +devices 0 > apoa1.log

echo "singularity run --writable-tmpfs --pwd /examples namd3_3.0a9.sif namd3 f1atpase/f1atpase.namd +p1 +setcpuaffinity --CUDASOAintegrate on +devices 0 > f1atpase.log"
singularity run --writable-tmpfs --pwd /examples namd3_3.0a9.sif namd3 f1atpase/f1atpase.namd +p1 +setcpuaffinity --CUDASOAintegrate on +devices 0 > f1atpase.log

echo "singularity run --writable-tmpfs --pwd /examples namd3_3.0a9.sif namd3 stmv/stmv.namd +p1 +setcpuaffinity --CUDASOAintegrate on +devices 0 > stmv.log"
singularity run --writable-tmpfs --pwd /examples namd3_3.0a9.sif namd3 stmv/stmv.namd +p1 +setcpuaffinity --CUDASOAintegrate on +devices 0 > stmv.log
echo "==== Complete Test on 1 GPU ===="

echo "==== Run Test on 4 GPUs ===="
echo "singularity run --writable-tmpfs --pwd /examples namd3_3.0a9.sif namd3 jac/jac.namd +p4 +pemap 0-3 --CUDASOAintegrate on +devices 0,1,2,3 > jac_4gpus.log"
singularity run --writable-tmpfs --pwd /examples namd3_3.0a9.sif namd3 jac/jac.namd +p4 +pemap 0-3 --CUDASOAintegrate on +devices 0,1,2,3 > jac_4gpus.log

echo "singularity run --writable-tmpfs --pwd /examples namd3_3.0a9.sif namd3 apoa1/apoa1.namd +p4 +pemap 0-3 --CUDASOAintegrate on +devices 0,1,2,3 > apoa1_4gpus.log"
singularity run --writable-tmpfs --pwd /examples namd3_3.0a9.sif namd3 apoa1/apoa1.namd +p4 +pemap 0-3 --CUDASOAintegrate on +devices 0,1,2,3 > apoa1_4gpus.log

echo "singularity run --writable-tmpfs --pwd /examples namd3_3.0a9.sif namd3 f1atpase/f1atpase.namd +p4 +pemap 0-3 --CUDASOAintegrate on +devices 0,1,2,3 > f1atpase_4gpus.log"
singularity run --writable-tmpfs --pwd /examples namd3_3.0a9.sif namd3 f1atpase/f1atpase.namd +p4 +pemap 0-3 --CUDASOAintegrate on +devices 0,1,2,3 > f1atpase_4gpus.log

echo "singularity run --writable-tmpfs --pwd /examples namd3_3.0a9.sif namd3 stmv/stmv.namd +p4 +pemap 0-3 --CUDASOAintegrate on +devices 0,1,2,3 > stmv_4gpus.log"
singularity run --writable-tmpfs --pwd /examples namd3_3.0a9.sif namd3 stmv/stmv.namd +p4 +pemap 0-3 --CUDASOAintegrate on +devices 0,1,2,3 > stmv_4gpus.log
echo "==== Complete Test on 4 GPUs ===="

echo "End Test:`date`"
