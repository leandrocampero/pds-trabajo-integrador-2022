% Parámetros de la señal
frecuencia_portadora = 1000; % Frecuencia de la portadora en Hz
frecuencia_muestreo = 10000; % Frecuencia de muestreo en Hz
tiempo_total = 1; % Tiempo total de la señal en segundos

% Generar señal de información (señal base)
tiempo = linspace(0, tiempo_total, tiempo_total * frecuencia_muestreo);
frecuencia_info = 5; % Frecuencia de la señal de información en Hz
amplitud_info = 0.5; % Amplitud de la señal de información
senal_info = amplitud_info * sin(2 * pi * frecuencia_info * tiempo);

% Generar señal portadora
senal_portadora = sin(2 * pi * frecuencia_portadora * tiempo);

% Modulación de amplitud (AM)
senal_modulada = (1 + senal_info) .* senal_portadora;

% Demodulación de amplitud (AM)
senal_demodulada = (senal_modulada .* senal_portadora) - amplitud_info;

% Filtrar la señal demodulada (opcional)
% Aquí puedes aplicar un filtro paso bajo para eliminar la componente de alta frecuencia y suavizar la señal.
% Por ejemplo, puedes utilizar el filtro butterworth:
orden_filtro = 4; % Orden del filtro
frecuencia_corte = 100; % Frecuencia de corte del filtro en Hz
frecuencia_normalizada = frecuencia_corte / (frecuencia_muestreo / 2);
[b, a] = butter(orden_filtro, frecuencia_normalizada, 'low');
senal_filtrada = filtfilt(b, a, senal_demodulada);

% Graficar la señal demodulada
plot(tiempo, senal_filtrada)
title('Señal Demodulada')
xlabel('Tiempo (s)')
ylabel('Amplitud')

% Ajustar el tamaño del gráfico
set(gcf, 'Position', get(0, 'Screensize'));

% Mostrar el gráfico completo
grid on
