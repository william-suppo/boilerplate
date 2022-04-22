.PHONY: up
up:
	docker-compose up -d
	docker-compose exec app composer install
	docker-compose exec app npm ci
	docker-compose exec app npm run dev

.PHONY: test
test:
	docker-compose exec app php artisan test
