function filtros = banco_decodificador(muestreo, frecuencias, orden)
    % Generardor de coeficientes de polinómio de filtros BP Butterworth

    for freq = frecuencias
        % Establecer frecuencias de corte
        fc_low = freq - 40;
        fc_high = freq + 40;

        % Establecer coeficientes para filtro pasa-banda actual
        [a, b] = butter(orden / 2, [fc_low fc_high] / (muestreo / 2));

        % Generar nombre de variable correspondiente
        % a cada arreglo de coeficientes
        temp_num = strcat('f_', num2str(freq), '_num');
        temp_den = strcat('f_', num2str(freq), '_den');

        % Guardar coeficientes
        filtros.(temp_num) = a;
        filtros.(temp_den) = b;
    end

end
