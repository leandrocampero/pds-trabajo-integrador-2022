function analisis_filtro(a, b, Fs, banda, muestras)
    % a: numerador del filtro digital
    % b: denominador del filtro digital
    % Fs: frecuencia de muestreo
    % banda: banda de gráfico
    % muestras: cantidad de muestras

    % Respuesta en frecuencia
    [h, w] = freqz(a, b, 10000, Fs);

    % Diagrama de polos y ceros
    figure;
    subplot(3, 2, 1);
    pzmap(tf(a, b, 1));
    title('Diagrama de Polos y Ceros');

    % Respuesta en frecuencia
    subplot(3, 2, 2);
    plot(w, abs(h));
    title('Respuesta en Frecuencia');
    xlabel('Frecuencia (Hz)');
    ylabel('Amplitud');
    xlim([banda(1), banda(2)])
    ylim('auto')
    grid on;

    % Respuesta al impulso
    subplot(3, 2, [3 4]);
    impulse_response = impz(a, b, muestras);
    stem(impulse_response);
    title('Respuesta al Impulso');
    xlabel('Muestras');
    ylabel('Amplitud');
    grid on;

    % Respuesta al escalón
    subplot(3, 2, [5 6]);
    step_response = stepz(a, b, muestras);
    stem(step_response);
    title('Respuesta al Escalón');
    xlabel('Muestras');
    ylabel('Amplitud');
    grid on;

    sgtitle('Análisis del Filtro');
end
