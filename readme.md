# 🧪 Plataforma de Competidors amb Gitea, Laravel i MariaDB Prova5

Aquest projecte configura un entorn complet per gestionar exercicis pràctics amb 7 competidors. Està pensat per oferir un entorn de desenvolupament i desplegament simple però segur, utilitzant Docker i accés per SSH/SFTP.

## 📦 Estructura

- **Docker Compose** amb:
  - Gitea (gestor de repositoris Git)
  - MySQL per Gitea
  - MariaDB per aplicacions Laravel
  - phpMyAdmin (gestió base de dades)
  - Nginx per servir aplicacions
- **Script Bash** per crear:
  - 7 usuaris (competidor1 a competidor7)
  - Carpetes aïllades per cada usuari: `modul2` i `modul3`
  - Accés per SSH/SFTP
  - PHP-FPM per executar aplicacions Laravel localment

## 🐳 Requisits

- Docker
- Docker Compose
- Bash (per executar l’script)
- Sistema Linux (Ubuntu recomanat)

---

## 🔧 Instal·lació i execució

### 1. Clona aquest repositori

```bash
git clone <URL-del-repositori>
cd <nom-del-repositori>
sudo bash setup_competidors.sh
docker compose up -d
```
