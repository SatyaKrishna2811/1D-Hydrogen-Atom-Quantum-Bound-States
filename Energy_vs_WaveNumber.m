clc; clear; close all;

% Constants
hbar = 1.0545718e-34;
m = 9.10938356e-31;
e = 1.602176634e-19;
eps0 = 8.854187817e-12;
A = e^2 / (4 * pi * eps0);

% Quantum numbers
n_values = 1:5;

% Compute wave numbers and energies
kappa = m * A ./ (hbar^2 * n_values);
energy = -m * A^2 ./ (2 * hbar^2 * n_values.^2);

% Plot energy vs wave number
figure;
plot(kappa, energy, 'o-', 'LineWidth', 2);
title('Energy vs. Wave Number \kappa_n');
xlabel('\kappa_n (1/m)'); ylabel('Energy E_n (J)');
grid on;