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

create-migration:
	@cd $(SRC) && php artisan make:migration create_tasks_table --create=tasks

migrate:
	@cd $(SRC) && php artisan migrate

create-model:
	@cd $(SRC) && php artisan make:model Task

create-screen:
	@cd $(SRC) && php artisan orchid:screen TaskScreen