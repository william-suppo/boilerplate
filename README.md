![header](https://repository-images.githubusercontent.com/369639032/7a00e980-ba8c-11eb-9038-d0dda0c3cf7c)

## A propos

Un starter de projet Laravel.

+ Environnement de dev basé sur Docker
+ Tailwindcss
+ Vue.js

## Lancer l'application

```bash
cp .env.example .env
docker-compose up --build -d
docker-compose exec app composer up
docker-compose exec app yarn install 
```
