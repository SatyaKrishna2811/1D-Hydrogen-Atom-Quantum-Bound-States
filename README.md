# Quantum-Confinement-1D-Coulomb-Potential

This repository explores the bound-state solutions of a one-dimensional (1D) hydrogen-like quantum system governed by a singular Coulomb potential. The project utilizes analytical derivations—including non-dimensionalization and power series expansions—and numerical simulations in MATLAB to investigate energy quantization and wavefunction spatial properties.

## 🔬 Theoretical Overview

The system is defined by the singular potential:
$$V(x) = -\frac{A}{|x|}, \quad A = \frac{e^2}{4\pi\epsilon_0}$$



### Managing the Singularity
Due to the divergence of this potential at the origin ($x=0$), the model focuses exclusively on **odd-parity wavefunctions**. By enforcing the boundary condition $\psi(0) = 0$, we ensure mathematical validity and prevent the non-physical "collapse" into the singularity that would occur in a classical system.

### Key Findings
* **Energy Quantization:** Derived energy eigenvalues follow a discrete spectrum mirroring the 3D case:
    $$E_n = -\frac{mA^2}{2\hbar^2 n^2}, \quad n = 1, 2, 3, \dots$$
* **Lack of Degeneracy:** The absence of angular momentum and rotational degrees of freedom in 1D removes the degeneracy present in 3D systems, resulting in a unique energy state for each quantum number $n$.
* **Localization:** Lower energy states ($n=1$) are more localized near the potential well, while higher $n$ states exhibit increased spatial uncertainty and $n-1$ internal nodes.

---

## 💻 Script Descriptions

This repository contains four primary MATLAB scripts. Each corresponds to a specific aspect of the 1D hydrogen-like atom model:

### 1. `Orthonormalization.m`
This is the core numerical script of the project. It constructs the "raw" wavefunctions based on the analytical solution $\psi(\rho) = e^{-\rho/2}\rho f(\rho)$. Since these raw functions may not be perfectly orthogonal when computed over a finite discrete domain, the script applies the **Gram-Schmidt Orthonormalization** process. It ensures that every state $\psi_n$ is normalized to 1 and is mathematically orthogonal to all other states. Finally, it generates an **Overlap Matrix** to verify the precision of the orthonormalization.

### 2. `Probability_Density.m`
This script visualizes the physical likelihood of finding the electron at any given position $x$. It plots $|\psi_n(x)|^2$ for the first five quantum levels ($n=1$ to $5$). The visualization clearly demonstrates two critical quantum behaviors: 
- **The "Nodal" Gap:** The probability is exactly zero at $x=0$, confirming the odd-parity boundary condition.
- **Spreading:** As the energy level $n$ increases, the probability peaks move further from the nucleus and the distribution broadens, illustrating weaker confinement.



### 3. `Energy_vs_WaveNumber.m`
This script analyzes the relationship between the energy eigenvalues ($E_n$) and the spatial decay constant ($\kappa_n$), often referred to as the wave number in bound states. It demonstrates how tighter spatial confinement (higher $\kappa$) correlates with more negative (deeper) energy states. This helps in understanding how the "size" of the atom in 1D is intrinsically linked to its binding energy.

### 4. `Energy_vs_QuantumNumber.m`
This script provides a direct verification of the Rydberg-like formula derived in the report. It plots the energy $E_n$ against the principal quantum number $n$. The resulting curve exhibits the classic $1/n^2$ behavior, where energy levels become increasingly crowded as they approach zero (the ionization limit). This confirms that the 1D model preserves the fundamental spectral structure of the real-world 3D hydrogen atom.

---

## 📊 Matrix Representation & Dynamics
The project employs a matrix-based formulation where the Hamiltonian operator $\hat{H}$ is represented as a diagonal matrix in the energy eigenbasis. This allows for:
* **Time Evolution:** Using the unitary operator $U(t) = e^{-i\hat{H}t/\hbar}$ to observe phase evolution.
* **Expectation Values:** Calculating the average energy $\langle E \rangle$ and variance $\sigma_E^2$ for superposed quantum states.

## 🎓 Academic Context
This research was conducted as part of the **23PHY11 Computational Mechanics 2** course at **Amrita Vishwa Vidyapeetham**.

**Contributors:**
* Vepuri Satya Krishna
* Alampally Karthik
* Nanduri Venkata Sesha Abhiram
* Tamilmani Saraswathi Sathyaa
