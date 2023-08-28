clc
close all
clear

addpath('desarrollo');

orden = 6;
muestreo = 44000;
freq = 697;
fc_low = freq - 40;
fc_high = freq + 40;

[a, b] = butter(orden / 2, [fc_low fc_high] / (muestreo / 2));
analisis_filtro(a, b, muestreo, [fc_low fc_high] + [-200 200], 2000)

rmpath('desarrollo');
