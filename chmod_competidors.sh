#!/bin/bash

BASE_HOME="/home" # Ajusta aquesta variable si la teva carpeta base és diferent

USUARIS=("competidor1" "competidor2" "competidor3" "competidor4" "competidor5" "competidor6" "competidor7" "competidor8" "prova")

for USER in "${USUARIS[@]}"; do
  echo "Restringint permisos de lectura a altres carpetes per a $USER..."

  # Assegurar que la carpeta base de l'usuari només tingui permisos per al propietari i root
  sudo chmod 700 "$BASE_HOME/$USER"
  echo "Permisos de $BASE_HOME/$USER establerts a 700 (drwx------)."

  # Opcionalment, si vols que puguin executar fitxers dins la seva carpeta, deixa-ho en 755
  # sudo chmod 755 "$BASE_HOME/$USER"
  # echo "Permisos de $BASE_HOME/$USER establerts a 755 (drwxr-xr-x)."

done