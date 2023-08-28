#!/bin/bash

# Definir las rutas de la carpeta origen y la carpeta destino
carpeta_destino="Proyecto-Sistema-DTMF"
archivo_zip="PDS-Proyecto-2022-Campero-Boeri-Villafane.zip"
nombre_informe="Proyecto_Integrador_PDS_2022-Campero-Boeri-Villafane.pdf"

# Crear la carpeta de destino
mkdir -p "$carpeta_destino"

# Lista de archivos específicos a copiar
archivos_a_copiar=(
  "matlab/analisis.m"
  "matlab/canal.m"
  "matlab/desarrollo/analisis_filtro.m"
  "matlab/desarrollo/banco_decodificador.m"
  "matlab/desarrollo/canal_fallas.m"
  "matlab/filtros-digitales/plot_analog.m"
  "matlab/filtros-digitales/plot_digital.m"
  "matlab/filtros-digitales/plot_impulse_step.m"
  "matlab/filtros-digitales/plot_pz.m"
  "matlab/sim_falla.m"
  "matlab/sim_ideal.m"
  "matlab/sim_real.m"
  "matlab/simulacion_completa.slx"
  "matlab/simulacion_sin_am.slx"
)

# Copiar los archivos a la carpeta de destino manteniendo la estructura de directorios
for archivo in "${archivos_a_copiar[@]}"; do
  directorio=$(dirname "$archivo")
  mkdir -p "$carpeta_destino/$directorio"
  cp "$archivo" "$carpeta_destino/$archivo"
  echo "Archivo $archivo copiado a la carpeta $carpeta_destino/$archivo."
done

# Renombrar archivo del informe
cp "informe.pdf" "$carpeta_destino/$nombre_informe"

# Crear un archivo zip con el contenido de la carpeta de destino
zip -r "$archivo_zip" "$carpeta_destino"

# Mostrar mensaje de confirmación
echo "Archivos copiados y comprimidos en $archivo_zip."

# Eliminar la carpeta de destino
rm -r "$carpeta_destino"

echo "Carpeta $carpeta_destino eliminada."
