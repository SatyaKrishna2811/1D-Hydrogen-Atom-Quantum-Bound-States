clc; clear; close all;

% Constants
hbar = 1.0545718e-34;
m = 9.10938356e-31;
e = 1.602176634e-19;
eps0 = 8.854187817e-12;
A = e^2 / (4 * pi * eps0);

% Domain
x = linspace(-5e-10, 5e-10, 1000);
n_values = 1:5;

figure;
hold on;
title('Probability Density |\psi_n(x)|^2 vs. x');
xlabel('x (m)'); ylabel('|\psi_n(x)|^2');

for n = n_values
    kappa = m * A / (hbar^2 * n);
    psi = sqrt(kappa) * sign(x) .* 2 * kappa .* abs(x) .* exp(-kappa * abs(x));
    prob_density = abs(psi).^2;
    plot(x, prob_density, 'DisplayName', ['n = ' num2str(n)]);
end
legend(); grid on;
hold off;