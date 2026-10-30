#!/bin/bash
#SBATCH -N 1
#SBATCH -q regular
#SBATCH -J water
#SBATCH -t 0:2:0
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

srun -n 64 -c 4 --cpu_bind=cores $PW < 1_pw_scf.in > 1_pw_scf.out

cp -r ./out/water.save ./out/water_50.save
