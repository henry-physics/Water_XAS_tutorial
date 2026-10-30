COHSEX XAS calculation tutorial for one excited oxygen from a cell containing 32 water molecules (from a 330K PI-DPMD trajectory, 8 beads, using SCAN pb model)

For a single oxygen, this as a 7 step process to get the important file tm.dat (which is essentially spikes on an energy grid which can be broadened to produce a plot of absorption intensity vs energy).

When you have performed this calculation for many excited oxygen then you can consider the need for core-hole-shift, alignment, averaging, and normalization, which will make it possible to compare to the experimental XAS spectra. 

For now, we will just focus on a single calculation which produces tm.dat as well as other files which can be used to plot the excited electron quasi-particle wave-function. 

1. PW SCF: ground state DFT calculation with a core hole on the absorbing oxygen (the OO atom) producing 128 occupied orbitals
2. CP SCF: maximally localized Wannier functions
3. PW NSCF: computes additional bands (empty conduction bands)
4. CP NSCF: occupied + unoccupied --> localized Wannier fnuctions
5. COHSEX: build the static COHSEX Hamiltonian
6. Diagonalize: diagonalize the Hamiltonian to get quasiparticle energies and eigenvectors
7. XAS: compute the O 1s -> conduction state dipole transition strengths.

 ####
The modified Quantum ESPRESSO 4.2.1 used here was 
developed by the groups of Roberto Car and Xifan Wu (L. Kong, J. Wang, F. Tang, et al.), 
with parts adapted from PARSEC. It is not an official Quantum ESPRESSO release.

 ####

   W. Chen, X. Wu, R. Car, "X-ray absorption signatures of the molecular
  environment in water and ice," Phys. Rev. Lett. 105, 017802 (2010).
  doi:10.1103/PhysRevLett.105.017802

  L. Kong, X. Wu, R. Car, "Role of quantum nuclei and local fields in the
  x-ray absorption spectra of water and ice," Phys. Rev. B 86, 134203 (2012).
  doi:10.1103/PhysRevB.86.134203

  Z. Sun, M. Chen, L. Zheng, J. Wang, B. Santra, H. Shen, L. Xu, W. Kang,
  M. L. Klein, X. Wu, "X-ray absorption of liquid water by advanced ab initio
  methods," Phys. Rev. B 96, 104202 (2017).
  doi:10.1103/PhysRevB.96.104202

  F. Tang, Z. Li, C. Zhang, S. G. Louie, R. Car, D. Y. Qiu, X. Wu,
  "Many-body effects in the X-ray absorption spectra of liquid water,"
  Proc. Natl. Acad. Sci. U.S.A. 119, e2201258119 (2022).
  doi:10.1073/pnas.2201258119
