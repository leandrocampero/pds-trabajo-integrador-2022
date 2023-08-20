function filtros = banco_decodificador(muestreo, frecuencias, orden)
    % Generador de coeficientes de polinomio de filtros BP Butterworth

    % Crear una figura para la gráfica de respuesta en frecuencia
    figure;

    % Crear variables para almacenar las respuestas en frecuencia
    % y las frecuencias
    all_responses = [];
    all_frequencies = [];

    for idx = 1:length(frecuencias)
        freq = frecuencias(idx);

        % Establecer frecuencias de corte
        fc_low = freq - 40;
        fc_high = freq + 40;

        % Establecer coeficientes para el filtro pasa-banda actual
        [a, b] = butter(orden / 2, [fc_low fc_high] / (muestreo / 2));

        % Generar nombre de variable correspondiente
        % a cada arreglo de coeficientes
        temp_num = strcat('f_', num2str(freq), '_num');
        temp_den = strcat('f_', num2str(freq), '_den');

        % Guardar coeficientes
        filtros.(temp_num) = a;
        filtros.(temp_den) = b;

        % Calcular la respuesta en frecuencia
        [h, w] = freqz(a, b, 10000, muestreo);

        % Agregar los datos a las variables de almacenamiento
        all_responses = [all_responses, abs(h)];
        all_frequencies = [all_frequencies, w];

    end

    % Graficar todas las respuestas en frecuencia en una misma gráfica
    plot(all_frequencies, all_responses);
    title('Respuestas en Frecuencia de Filtros Butterworth Pasa-Banda');
    xlabel('Frecuencia (Hz)');
    ylabel('Magnitud');
    grid on;
    legend(cellstr(num2str(frecuencias', 'Filtro en %d Hz')));

    % Ajustar el rango del eje x
    xlim([500, 1700]);
end
