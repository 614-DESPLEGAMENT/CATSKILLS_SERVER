#!/bin/bash

# Configuració
NUM_COMPETIDORS=8
BASE_HOME="/home"
# PHP_VERSION="8.3"  

# Instal·lació bàsica
apt update && apt install -y openssh-server 
#php${PHP_VERSION}-fpm php${PHP_VERSION}-cli

# Activar SSH si cal
systemctl enable ssh
systemctl start ssh

# Crear usuaris i estructures
for i in $(seq 1 $NUM_COMPETIDORS); do
  USER="competidor$i"
  PASSWORD="C@ts$(printf '%03d' $i)$(echo -n $i | sha256sum | cut -c1-3 | tr 'a-f' 'A-F')"
  echo "Creant usuari $USER amb contrasenya $PASSWORD..."

  echo "Creant usuari $USER..."
  useradd -m -s /bin/bash "$USER"
  echo "$USER:$PASSWORD" | chpasswd

  # Crear carpetes per projectes
  mkdir -p $BASE_HOME/$USER/modul2
  mkdir -p $BASE_HOME/$USER/modul3
  chown root:root $BASE_HOME/$USER
  chmod 755 $BASE_HOME/$USER

  chown -R $USER:$USER $BASE_HOME/$USER/modul2
  chown -R $USER:$USER $BASE_HOME/$USER/modul3

  # Opcional: configurar accés SFTP només a les seves carpetes
  echo "Match User $USER
    ChrootDirectory $BASE_HOME/$USER
    ForceCommand internal-sftp
    X11Forwarding no
    AllowTcpForwarding no" >> /etc/ssh/sshd_config

done

# Reiniciar SSH per aplicar canvis
systemctl restart ssh

echo "✅ Usuaris i entorns FPM creats. Cada competidor té accés per SSH/SFTP i dues carpetes."
