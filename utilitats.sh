#Parar i eliminar tots els contenidors docker
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
# Veure els logs d'un contenidor
docker logs e44a56f57591 2>&1
# Veure la IP del host del contenidor
ip -4 addr show docker0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'