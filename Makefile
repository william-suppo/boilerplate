.PHONY: up
up:
	docker-compose up -d
#	docker-compose exec app composer install
#	docker-compose exec app npm ci
#	docker-compose exec app npm run dev

.PHONY: build
build:
	docker build --tag local/boilerplate:latest --target prod .
