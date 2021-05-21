## A propos

Un starter de projet Laravel.

+ Environnement de dev basé sur Docker

## Lancer l'application

```bash
cp .env.example .env
docker-compose up --build -d
docker-compose exec app composer up
docker-compose exec app yarn install 
```
