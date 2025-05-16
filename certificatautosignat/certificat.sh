#!/bin/bash
domains=(catskills.cat gitea.catskills.cat www.catskills.cat competidor21.catskills.cat competidor31.catskills.cat competidor22.catskills.cat competidor32.catskills.cat competidor23.catskills.cat competidor33.catskills.cat competidor24.catskills.cat competidor34.catskills.cat competidor25.catskills.cat competidor35.catskills.cat competidor26.catskills.cat competidor36.catskills.cat competidor27.catskills.cat competidor37.catskills.cat competidor28.catskills.cat competidor38.catskills.cat)
path="../nginx/data/certs"
mkdir -p $path
for domain in "${domains[@]}"; do
  openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout "$path/$domain.key" -out "$path/$domain.crt" -subj "/CN=$domain"
done