#!/bin/bash

# Comprova si Docker està instal·lat
if ! command -v docker &> /dev/null
then
    echo "🔍 Docker no està instal·lat. Iniciant la instal·lació..."

    # Actualitza el sistema i instal·la paquets requerits
    sudo apt update
    sudo apt install -y \
        ca-certificates \
        curl \
        gnupg \
        lsb-release

    # Afegeix la clau oficial de Docker
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

    # Afegeix el repositori de Docker
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # Instal·la Docker
    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    # Activa i inicia el servei
    sudo systemctl enable docker
    sudo systemctl start docker

    echo "✅ Docker s'ha instal·lat correctament!"
else
    echo "✅ Docker ja està instal·lat al sistema."
fi
