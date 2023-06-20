num=[1 2 1];
den=[1 1.472 0.585];
[h,w]=freqz(num,den);
plot (w*2500/pi, abs(h)/max(abs(h))) % 2500 representa la máxima frecuencia
title('Gráfica del filtro prototipo')
xlabel ('Frecuencia'), ylabel ('Amplitud'), grid on

x = abs(h)
