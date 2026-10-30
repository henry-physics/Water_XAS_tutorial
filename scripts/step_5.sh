#!/bin/bash
#SBATCH -N 2
#SBATCH -q regular
#SBATCH -J water
#SBATCH -t 1:30:0
#SBATCH -A 
#SBATCH -L scratch
#SBATCH -C cpu
#
module load PrgEnv-intel/8.5.0
module load cray-fftw/3.3.10.6
module load cray-libsci/23.12.5

#
#OpenMP settings:
export OMP_NUM_THREADS=2
export OMP_PLACES=threads
export OMP_PROC_BIND=spread
export LD_LIBRARY_PATH=$CRAY_LD_LIBRARY_PATH:$LD_LIBRARY_PATH

#
PW=../executables/pw.x
CP=../executables/cp.x

srun -n 108 -c 4 --cpu_bind=cores $CP < 5_gw.in > 5_gw.out

