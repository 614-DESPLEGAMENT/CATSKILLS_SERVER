#!/bin/bash
domains=(catskills.cat gitea.catskills.cat www.catskills.cat competidor1.catskills.cat)
path="../nginx/data/certs"
mkdir -p $path
for domain in "${domains[@]}"; do
  openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout "$path/$domain.key" -out "$path/$domain.crt" -subj "/CN=$domain"
done