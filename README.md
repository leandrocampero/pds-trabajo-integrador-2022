# Procesamiento Digital de Señales<br>Trabajo Integrador

## Sistema de Transmision AM con Codificacion DTMF

Este repositorio es para realizar el informe del trabajo integrador utilizando VSCODE y LaTeX.

## Instrucciones

- [¿Cómo utilizar instalar MiTek (procesador basado en LaTeX)?](https://miktex.org/download)
- Instalar [extensión](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) para [VSCode](https://code.visualstudio.com/download)
- Instalar [formateador](https://github.com/cmhughes/latexindent.pl#getting-started) para archivos `.tex` (OPCIONAL)
- Cuando se agregan entradas al glosario hay que ejecutar el comando `makeglossaries informe`
- Cuando se agregan entradas a las referencias bibliográficas hay que ejecutar el comando `bibtex informe`

## Estructura

- `images`: contiene las imagenes que van a ser catalogadas como figuras del informe
- `chapters`: contiene los archivos separados de cada capítulo del informe, para mayor prolijidad
- `resources`: contiene los documentos provistos para llevar a cabo este proyecto
- `matlab`: contiene los scripts de matlab

## Enunciado

La modulación en amplitud (AM), permite la transmisión de una señal de baja frecuencia superpuesta a una onda de alta frecuencia. Este sistema de modulación permite enviar mensajes en la forma de envolventes de la onda portadora, ya sea por un canal de aire o fı́sico utilizando un enlace cableado.
El sistema de codificación DTMF (Doble Tonos Múltiples Frecuencias), utiliza una combinación de tonos de frecuencia audibles pera representar el conjunto de números del 0 al 9 disponible en el teclado telefónico, con lo cual es posible enviar una codificación numérica por la lı́nea telefónica. El modelo de trabajo está representado en la Figura 1.1, correspondientes al Modulador y Demodulador AM, el canal de cable telefónico, y las etapas de codificación y decodificación DTMF.

Figura 1.1:

![Diagrama de bloques](./images/diagramas-bloques.png "Diagrama de bloques")

El objetivo principal de este proyecto integrador es la implementación del sistema mostrado en la Figura 1.1, utilizando MATLAB, SIMULINK, o la combinación de ambos recursos de modelado computacional, para el envı́o de números (0-9) codificados en DTMF bajo modulación AM, y la detección del número enviado a la salida (uno número cada por vez).
A modo de referencia, el Cuadro 1.1, muestra la combinación de tonos audibles asociados al conjunto numérico, y en el enlace indicado se encuentra la información ampliada sobre la codificación DTMF.

Cuadro 1.1

| Frecuencia Baja | Frecuencia Alta | Digito |
| --------------- | --------------- | ------ |
| 697             | 1209            | 1      |
| 697             | 1336            | 2      |
| 697             | 1477            | 3      |
| 770             | 1209            | 4      |
| 770             | 1336            | 5      |
| 770             | 1477            | 6      |
| 852             | 1209            | 7      |
| 852             | 1336            | 8      |
| 852             | 1477            | 9      |
| 941             | 1336            | 0      |

Se pide:

1. A nivel simulación se deberán sintetizar los tonos asociados a cada digito numérico seleccionando la frecuencia de muestreo Fs apropiada (Teorema de Nyquist-Shannon).
2. El decodificador DTMF deberá ser implementado mediante filtros digitales pasa bandas, con un orden y respuestas apropiadas. El modo de indicar cuál fue el digito enviado queda a criterio del grupo de trabajo (vamos a usar butterworth, usando filtros pasabajos para luego transformarlos en pasa bandas).
3. Para el modelo de trasmisión AM (enlace cableado) se deberán establecer y sintetizar la frecuencia de portadora RF el ı́ndice de modulación apropiados (recordando que la Fs es única en todo el sistema).
4. El canal de transmisión se corresponde al de un filtro analógico (transformado a digital) pasa banda con un rango de 300 Hz a 3400 Hz, respuesta plana y orden apropiado. Se considera el rango útil asignado a la frecuencia telefónica, aunque el cable telefónico de cobre tipo AWG-24, por ejemplo, supera este ancho de banda a 1Mz en distancias inferiores a 200 Mts.
