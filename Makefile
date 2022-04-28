.PHONY: up
up:
	docker-compose up --build -d
	docker-compose exec app composer install --quiet --no-ansi --no-interaction --no-scripts --no-suggest --no-progress --prefer-dist
	docker-compose exec app npm ci
	docker-compose exec app npm run dev

.PHONY: test
test:
	docker-compose exec app php artisan test
