clc
close all
clear

num_digital = [8.4953e-3 0 -8.4954e-3];
den_digital = [1 -1.9732 0.9830];

% Crear el sistema discreto
sys_digital = tf(num_digital, den_digital, 1); % Periodo de muestreo de 1

% Obtener la respuesta al impulso y al escalón
impulse_response = impz(num_digital, den_digital);
step_response = step(sys_digital);

% Crear el tiempo discreto para los gráficos
n_impulse = 0:length(impulse_response) - 1;
n_step = 0:length(step_response) - 1;

% Gráfico de respuesta al impulso y al escalón en 2 filas
figure;
subplot(2, 1, 1);
stem(n_impulse, impulse_response);
title('Respuesta al Impulso');
xlabel('n (Muestras)');
ylabel('Amplitud');
grid on;

subplot(2, 1, 2);
stem(n_step, step_response);
title('Respuesta al Escalón');
xlabel('n (Muestras)');
ylabel('Amplitud');
grid on;

sgtitle('Respuestas al Impulso y al Escalón de un Filtro Digital');
