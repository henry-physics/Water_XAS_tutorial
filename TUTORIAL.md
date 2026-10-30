Steps 1-5 each have .in, .out, and .sh files 

A word about hard-coded naming conventions:

water.save is read and write for pw.x 
water_50.save is read and write for cp.x 
water_37.save is read for calculation='cohsex' <-- step 5. 

The numbers referenced (like 128 bands) are specific to this tutorial because it uses 32 waters. 

1 PW SCF: 

calculates 128 occupied bands then "cp -r ./out/water.save ./out/water_50.save" hands off to step 2. 

2 CP WF: 

reads water_50.save 
writes water_50.save 
water.wfc <-- 128 Wannier centers 
and 128 valence wannier centers to fort.408

take note of the cp, mv, and tail commands in "step_2_4.sh". 

3 PW NSCF:

128 unoccupied bands 

reads water.save
writes water.save
"cp -r ./out/water.save ./out/water_50.save" hands off to step 4. 

4 CP WF: 

Again, produces localized Wannier functions, this time for the full 256 band manifold (128+128)

adds 256 more Wannier centers to water.wfc 
256 centers written to fort.407

5 COHSEX: 

reads water_50.save, water_36.save, fort.407, and fort.408 

6 Diag: 

reads cp_lambda.dat (from step 5) and fort.11 (total bands, valence bands, number of G-vectors) 
writes eig.dat (128 valence and 128 conduction eigenvalues)
diag_lambda.dat: eigenvectors 
tail -128 eig.dat > eigc.dat (the conduction eigenvalues) 

7 XAS: 

reads cp_wf.dat, g.dat, eigc.dat, dig_lambda.dat, fort.10, fort.11, fort.87-90
writes tm.dat (energy, |TM|^2), fort.20, pxas.log 

At this stage, you could take tm.dat, broaden the y-axis (intensity) treat the x-axis as arbitrary and plot to get the spectra for a single water molecule. 
The procedure for combining many different calculations will be described later. 

Files needed for plotting QP wavefunctions: 

cp_wf.dat (orbitals), diag_lambda.dat (qp eigenvectors from step 6), g.dat (G-vectors), data-file_step3.xml (from step 3, gives the FFT grid, cell, atom positions, num bands, and num electrons) 






