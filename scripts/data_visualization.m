clc; clear all; close all;

scriptDir = fileparts(mfilename("fullpath"));
projectDir = fileparts(scriptDir);
csvPath = fullfile(projectDir, "data", "CPU_measures.csv");

cpu_measures = readtable(csvPath);

t_seconds = cpu_measures.Time_s;
package = cpu_measures.Temperature_C;
package_power = cpu_measures.Power_W;
rpm = cpu_measures.Fan_RPM;

t_load = 106;
t_cooling = 496;

figure;
tiledlayout(3, 1);

% Temperature
nexttile;
plot(t_seconds, package, 'r');
title("CPU Package");
xline(t_load, '--m', 'Load Start', 'LineWidth', 2);
xline(t_cooling, '--m', 'Cooling Start', 'LineWidth', 2);
ylabel("Temperature [°C]");
grid on;

% Power
nexttile;
plot(t_seconds, package_power, 'b');
title("CPU Package Power");
xline(t_load, '--m', 'Load Start', 'LineWidth', 2);
xline(t_cooling, '--m', 'Cooling Start', 'LineWidth', 2);
ylabel("Power [W]");
grid on;

% Fan speed
nexttile;
plot(t_seconds, rpm, 'g');
title("CPU Fans");
xline(t_load, '--m', 'Load Start', 'LineWidth', 2);
xline(127, '-.k', 'RPM Increase', 'LineWidth', 2);
xline(t_cooling, '--m', 'Cooling Start', 'LineWidth', 2);
xlabel("Time [s]");
ylabel("Fan speed [RPM]");
grid on;
