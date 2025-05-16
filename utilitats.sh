#Parar i eliminar tots els contenidors docker
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
# Veure els logs d'un contenidor
docker logs e44a56f57591 2>&1
# Veure la IP del host del contenidor
ip -4 addr show docker0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'
# Fitxer host de linux
sudo nano /etc/hosts
# Comprovar si un contenidor té acces a una carpeta
docker compose exec nginx ls -l /etc/certs
# Edita per canviar el port que escolta el php-fpm
/etc/php/8.4/fpm/pool.d/www.conf
#Comprova si funciona el port
sudo netstat -tulpn | grep php
# Quan res funciona amb docker es recreen els contenidors
docker compose up -d --force-recreate
