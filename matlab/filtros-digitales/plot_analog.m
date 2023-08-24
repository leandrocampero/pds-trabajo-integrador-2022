a = [0 1 0];
b = [1.32e-3 1 25.22e3];
[h, w] = freqs(a, b, 5000);
phase = angle(h);
phasedeg = phase * 180 / pi;
mag = abs(h);

subplot(2, 1, 1)
loglog(w, mag)
grid on
xlabel('Frecuencia (rad/s)')
ylabel('Magnitud')
xlim([3500, 5500])
ylim([0.2, 1.2])

subplot(2, 1, 2)
semilogx(w, phasedeg)
grid on
xlabel('Frecuencia (rad/s)')
ylabel('Fase (grados)')
xlim([3500, 5500])
ylim('auto')
