#!/bin/bash
#SBATCH -N 1
#SBATCH -q regular
#SBATCH -J water
#SBATCH -t 0:4:0
#SBATCH -A  
#SBATCH -L scratch
#SBATCH -C cpu

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

srun -n 64 -c 4 --cpu_bind=cores $CP < 2_cp_scf.in > 2_cp_scf.out

cp -r ./out/water_50.save ./out/water_36.save
mv ./out/water_50.save ./out/water_cp_scf.save

tail -128 ./out/water.wfc > fort.408

#----------------------------------------------------------
# end of step 2
#----------------------------------------------------------
srun -n 64 -c 4 --cpu_bind=cores $PW < 3_pw_nscf.in > 3_pw_nscf.out
cp -r ./out/water.save ./out/water_50.save

#----------------------------------------------------------
# end of step 3
#----------------------------------------------------------
srun -n 64 -c 4 --cpu_bind=cores $CP < 4_cp_nscf.in > 4_cp_nscf.out
cp -r ./out/water_50.save ./out/water_cp_nscf.save 
tail -256  ./out/water.wfc > fort.407

# save this file for plotting QPWF
cp out/water.save/data-file.xml data-file_step3.xml

#----------------------------------------------------------
# end of step 4
#----------------------------------------------------------
