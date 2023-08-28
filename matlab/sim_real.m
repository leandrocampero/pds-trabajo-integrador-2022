clc
close all
clear

% Agrega el directorio donde se encuentra
% banco_decodificador.m al path de MATLAB
addpath('desarrollo');

% Frecuencia de muestreo
Fs = 44000;

% Arreglo con frecuencias centrales a filtrar
frecuencias_centrales = [697, 770, 852, 941, 1209, 1336, 1477];

% Orden de cada filtro pasa-banda del banco de filtros
orden = 6;

% Coeficientes del filtro pasa-bajos para filtrar la frecuencia portadora
[f_portadora_num, f_portadora_den] = butter(orden, 1500 / (Fs / 2));

% Coeficientes del filtro pasa-banda para emular el canal telefónico
[f_canal_num, f_canal_den] = butter(1, [300, 3500] / (Fs / 2));

% Estructura de datos para generar y guardar
% los coeficientes del banco de filtros
filtros = banco_decodificador(Fs, frecuencias_centrales, orden)

rmpath('desarrollo');
