SRC := ./src

generate-key:
	@cd $(SRC) && php artisan key:generate

clear-config: 
	@cd $(SRC) && php artisan config:clear

run:
	@cd $(SRC) && php artisan serve

reload:
	@cd $(SRC) && php artisan orchid:publish
	@cd $(SRC) && php artisan view:clear

update:
	@cd $(SRC) && composer update orchid/platform --with-dependencies

create-migration:
	@cd $(SRC) && php artisan make:migration create_tasks_table --create=tasks

migrate:
	@cd $(SRC) && php artisan migrate

create-model:
	@cd $(SRC) && php artisan make:model Model -m

create-resource:
	@cd $(SRC) && php artisan make:filament-resource

create-user:
	@cd $(SRC) && php artisan make:filament-user

publish-config:
	@cd $(SRC) && php artisan vendor:publish --tag=filament-config

upgrade:
	@cd $(SRC) && composer update && php artisan filament:upgrade

create-page:
	@cd $(SRC) && php artisan make:filament-page

clear-route:
	@cd $(SRC) && php artisan route:clear