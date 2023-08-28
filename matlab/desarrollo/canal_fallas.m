function [numd, dend] = canal_fallas(orden, muestreo)
    % Diseño del canal de transmisión con fallas

    Ts = 1 / muestreo;

    % Frecuencias de corte deseadas en el dominio analógico
    f_analog_bp = [300, 3500]; % Pasa Banda
    f_analog_sp = [700, 1500]; % Rechaza Banda

    % Calcular la frecuencia pre-warped para cada frecuencia de corte
    f_warp_bp = (2 * muestreo) .* tan(pi * f_analog_bp * Ts);
    f_warp_sp = (2 * muestreo) .* tan(pi * f_analog_sp * Ts);

    % Diseño analógico de un filtro Butterworth de 2do orden (banda de paso)
    [b, a] = butter(orden / 2, f_warp_bp, 's');

    % Diseño analógico de un filtro Butterworth de 2do orden (atenuación)
    [B, A] = butter(orden / 2, f_warp_sp, 'stop', 's');

    % Convolución de los coeficientes para obtener el canal con atenuación
    num = conv(b, B);
    den = conv(a, A);

    % Transformación Bilineal para convertir a dominio discreto
    [numd, dend] = bilinear(num, den, muestreo);
end
