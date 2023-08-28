clc
close all
clear

num_analog = [0 1 0];
den_analog = [1.32e-3 1 25.22e3];

num_digital = [8.4953e-3 0 -8.4954e-3];
den_digital = [1 -1.9732 0.9830];

% Filtro analógico
sys_analog = tf(num_analog, den_analog)
poles_analog = pole(sys_analog)
zeros_analog = zero(sys_analog)

% Filtro digital
% El "1" indica un periodo de muestreo de 1
sys_digital = tf(num_digital, den_digital, 1)
poles_digital = pole(sys_digital)
zeros_digital = zero(sys_digital)

% Gráfica de polos y ceros en ambos planos
figure;

% Plano de Laplace (plano S)
subplot(1, 2, 1);
pzplot(sys_analog);
title('Plano S - Polos y Ceros (Filtro Analógico)');
grid on;

% Plano de Digital (plano Z)
subplot(1, 2, 2);
pzmap(sys_digital);
title('Plano Z - Polos y Ceros (Filtro Digital)');
grid on;

sgtitle('Análisis de Polos y Ceros');
