Fs=44000;
Ts=1/Fs;
num = [8.4953e-3 0 -8.4954e-3];
den = [1 -1.9732 0.9830];

[h,w]=freqz(num,den, 20000);
f=w/(2*pi);
plot(f*(Fs/2)/max(f),abs(h))
title('Filtro Butterworth')
xlabel('Hertz')
ylabel('Magnitud')
xlim([0, 1200])
ylim('auto')