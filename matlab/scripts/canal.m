% Canal con atenuacion en frecunecia, para el apartado "e" analisis.
% PDS 2022- FACEt-UNT
close all
[b, a] = butter(2, [300, 3500], 's'); % Diseño analogico 2 orden

[h, f] = freqs(b, a); % Respuesta en frecuencia
plot(f, abs(h))
title(' Respuesta Butterworth')

% simula atenuacion entre 700 hz y 1500 hz, verificar con otras frecuencias
[B, A] = butter(2, [700 1500], 'stop', 's')

[h, f] = freqs(B, A); % respuesta atenuada (falla del canal)
hold on
plot(f, abs(h), 'r') %grafica superpuesta
legend('Canal', 'atenuacion')
num = conv(b, B); %  Convoluciona numerdor
den = conv(a, A); % convolucina denominador

[h, f] = freqs(num, den); % respuesta del canal con falla
figure
plot(f, abs(h))

sysa = tf(num, den) % funcion transferencia del canal con falla

[numd, dend] = bilinear(num, den, 44000)
% pasa a filtro digital utilizando Transformada Bilineal
% este es el canal con falla a utilizar para probar el sistema (punto e).

Fs = 44000; % frecuencia de Muestre Fs=44000 hz
sysd = tf(numd, dend, 1 / Fs) % transferencia discreta digital

% obtiene la respuesta en frecuencia usando las frecuncias f (del analalogico) para comparar
[hd] = freqz(numd, dend, f, 44000);

hold on
plot(f * 6.28, abs(hd), 'r') % grafica la respuesta en freuceuncia discreta para control

legend('Analogo', 'discreto')
