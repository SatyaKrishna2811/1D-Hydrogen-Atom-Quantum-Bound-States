clc; clear all; close all;

% MATLAB Code: Enhanced Bohr's Atomic Model Simulation for Lithium
% Incorporates Linear Algebra (eigenvectors) and Mechanics concepts.

% Parameters
n_electrons_K = 2;  % Number of electrons in K shell
n_electrons_L = 1;  % Number of electrons in L shell
radius_K = 1;       % Radius of K shell
radius_L = 2;       % Radius of L shell
angular_speed_K = 2 * pi; % Angular speed of electrons in K shell (rad/s)
angular_speed_L = pi;     % Angular speed of electrons in L shell (rad/s)
time_step = 0.01;         % Time step for simulation (seconds)
total_time = 20;          % Total simulation time (seconds)

% Time vector
t = 0:time_step:total_time;

% Eigenvector matrix for electron dynamics
rotation_matrix_K = [cos(angular_speed_K) -sin(angular_speed_K); sin(angular_speed_K) cos(angular_speed_K)];
rotation_matrix_L = [cos(angular_speed_L) -sin(angular_speed_L); sin(angular_speed_L) cos(angular_speed_L)];

% Mechanics: Centripetal force computation (m*r*omega^2)
mass_electron = 9.10938356e-31; % Mass of an electron (kg)
centripetal_force_K = mass_electron * radius_K * angular_speed_K^2;
centripetal_force_L = mass_electron * radius_L * angular_speed_L^2;

% Initialize figure
figure;
hold on;
axis equal;
axis([-2.5 2.5 -2.5 2.5 -2.5 2.5]);
grid on;
xlabel('X-axis'); ylabel('Y-axis'); zlabel('Z-axis');
title('Enhanced Bohr Atomic Model for Lithium');

% Draw nucleus
plot3(0, 0, 0, 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'k');

% Colors for electrons
colors_K = lines(n_electrons_K);
colors_L = lines(n_electrons_L);

% Simulation loop
for ti = 1:length(t)
    % Clear previous electron positions
    cla;
    hold on;

    % Redraw nucleus
    plot3(0, 0, 0, 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'k');

    % K shell: x-y plane using eigenvector rotation
    for e = 1:n_electrons_K
        angle_K = angular_speed_K * t(ti) + (e - 1) * (2 * pi / n_electrons_K);
        position_K = [radius_K * cos(angle_K); radius_K * sin(angle_K)];
        rotated_position_K = rotation_matrix_K * position_K;
        x_K = rotated_position_K(1);
        y_K = rotated_position_K(2);
        z_K = 0;
        plot3(x_K, y_K, z_K, 'o', 'MarkerSize', 8, 'MarkerFaceColor', colors_K(e, :));
    end

    % L shell: y-z plane using eigenvector rotation
    for e = 1:n_electrons_L
        angle_L = angular_speed_L * t(ti) + (e - 1) * (2 * pi / n_electrons_L);
        position_L = [radius_L * cos(angle_L); radius_L * sin(angle_L)];
        rotated_position_L = rotation_matrix_L * position_L;
        x_L = 0;
        y_L = rotated_position_L(1);
        z_L = rotated_position_L(2);
        plot3(x_L, y_L, z_L, 'o', 'MarkerSize', 8, 'MarkerFaceColor', colors_L(e, :));
    end

    % Draw orbits using parametric equations
    theta = linspace(0, 2 * pi, 100);
    plot3(radius_K * cos(theta), radius_K * sin(theta), zeros(size(theta)), 'b--'); % K shell
    plot3(zeros(size(theta)), radius_L * cos(theta), radius_L * sin(theta), 'r--'); % L shell

    % Display centripetal force values
    text(-2.3, 2.3, 2.3, sprintf('Centripetal Force (K): %.2e N', centripetal_force_K), 'FontSize', 10);
    text(-2.3, 2.3, 2.0, sprintf('Centripetal Force (L): %.2e N', centripetal_force_L), 'FontSize', 10);

    % Update plot
    drawnow;
end

% Add legend
legend({'Nucleus', 'Electron in K shell', 'Electron in L shell', 'K shell path', 'L shell path'}, ...
       'Location', 'northeastoutside');

