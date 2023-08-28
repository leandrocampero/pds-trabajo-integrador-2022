close all
clear
clc

Fs = 44000; % frecuencia de Muestreo Fs=44000 Hz
Ts = 1 / Fs;
orden = 2;

% Frecuencias de corte deseadas en el dominio analógico
f_analog_bp = [300, 3500]; % Pasa Banda
f_analog_sp = [700, 1500]; % Rechaza Banda

% Calcular la frecuencia pre-warped para cada frecuencia de corte
f_warp_bp = (2 * Fs) .* tan(pi * f_analog_bp * Ts);
f_warp_sp = (2 * Fs) .* tan(pi * f_analog_sp * Ts);

% Diseño analógico de un filtro Butterworth de 2do orden (banda de paso)
[b, a] = butter(orden / 2, f_warp_bp, 's');

% Respuesta en frecuencia del filtro Butterworth analógico
[h, f] = freqs(b, a);
figure;
subplot(3, 1, 1);
plot(f / (2 * pi), abs(h));
title('Respuesta Butterworth - Analógico');
xlabel('Frecuencia (Hz)');
ylabel('Amplitud');
xlim([0, 10000]);
grid on;

% Diseño analógico de un filtro Butterworth de 2do orden (atenuación)
[B, A] = butter(orden / 2, f_warp_sp, 'stop', 's');

% Respuesta en frecuencia del filtro de atenuación (analógico)
[h, f] = freqs(B, A);
hold on;
plot(f / (2 * pi), abs(h), 'r');
legend('Canal', 'Atenuación');
xlabel('Frecuencia (Hz)');
ylabel('Amplitud');
xlim([0, 10000]);
grid on;

% Convolución de los coeficientes para obtener el canal con atenuación
num = conv(b, B);
den = conv(a, A);

% Respuesta en frecuencia del canal con atenuación (analógico)
[h, f] = freqs(num, den);
subplot(3, 1, 2);
plot(f / (2 * pi), abs(h));
title('Respuesta Canal con Atenuación - Analógico');
xlabel('Frecuencia (Hz)');
ylabel('Amplitud');
xlim([0, 10000]);
grid on;

% Función de transferencia del canal con atenuación (analógico)
sysa = tf(num, den);

% Transformación Bilineal para convertir a dominio discreto
[numd, dend] = bilinear(num, den, Fs);

% Función de transferencia del canal con atenuación (discreto)
sysd = tf(numd, dend, 1 / Fs);

% Respuesta en frecuencia discreta usando las frecuencias del filtro analógico
hd = freqz(numd, dend, f, Fs);

% Gráfica comparativa de respuestas en frecuencia
subplot(3, 1, 3);
plot(f, abs(hd), 'r');
title('Respuesta Canal con Atenuación - Digital');
xlabel('Frecuencia (Hz)');
ylabel('Amplitud');
xlim([0, 10000]);
grid on;

sgtitle('Análisis del Canal con Atenuación en Frecuencia');

% Diagrama de polos y ceros
figure;
subplot(3, 1, 1);
pzmap(tf(numd, dend, 1));
title('Diagrama de Polos y Ceros');

% Respuesta al impulso
subplot(3, 1, 2);
impulse_response = impz(numd, dend, 200);
stem(impulse_response);
title('Respuesta al Impulso');
xlabel('Muestras');
ylabel('Amplitud');
grid on;

% Respuesta al escalón
subplot(3, 1, 3);
step_response = stepz(numd, dend, 200);
stem(step_response);
title('Respuesta al Escalón');
xlabel('Muestras');
ylabel('Amplitud');
grid on;

sgtitle('Establidad del Canal con Fallas');
