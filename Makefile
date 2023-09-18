setup:
	@make build
	@make up
	@make composer-update
build:
	docker-compose build --no-cache --force-rm
up:
	docker-compose up -d
down:
	docker-compose down
composer-update:
	docker exec laravel-docker-app bash -c "composer update"
data:
	docker exec laravel-docker-app bash -c "php artisan migrate"
	docker exec laravel-docker-app bash -c "php artisan db:seed"