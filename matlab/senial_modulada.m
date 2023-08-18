% Parámetros de la señal
frecuencia_portadora = 1000; % Frecuencia de la portadora en Hz
amplitud_portadora = 1; % Amplitud de la portadora
frecuencia_muestreo = 10000; % Frecuencia de muestreo en Hz
tiempo_total = 1; % Tiempo total de la señal en segundos

% Generar señal de información (señal base)
tiempo = linspace(0, tiempo_total, tiempo_total * frecuencia_muestreo);
frecuencia_info = 5; % Frecuencia de la señal de información en Hz
amplitud_info = 0.5; % Amplitud de la señal de información
senal_info = amplitud_info * sin(2 * pi * frecuencia_info * tiempo);

% Generar señal portadora
senal_portadora = amplitud_portadora * sin(2 * pi * frecuencia_portadora * tiempo);

% Modulación de amplitud (AM)
senal_modulada = (1 + senal_info) .* senal_portadora;

% Graficar las señales en el dominio del tiempo
subplot(3, 1, 1)
plot(tiempo, senal_info)
title('Señal de Información')
xlabel('Tiempo (s)')
ylabel('Amplitud')

subplot(3, 1, 2)
plot(tiempo, senal_portadora)
title('Señal Portadora')
xlabel('Tiempo (s)')
ylabel('Amplitud')

subplot(3, 1, 3)
plot(tiempo, senal_modulada)
title('Señal Modulada (AM)')
xlabel('Tiempo (s)')
ylabel('Amplitud')

% Ajustar el tamaño de los subplots
set(gcf, 'Position', get(0, 'Screensize'));

% Mostrar el gráfico completo
grid on
