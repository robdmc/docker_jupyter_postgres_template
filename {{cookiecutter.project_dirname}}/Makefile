#! /usr/bin/make 


.PHONY: help
help:  ## Print the help documentation
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


.PHONY: build
build: ## Build docker images locally and don't send to dockerhub
	docker builder prune -f
	docker-compose down
	docker rmi -f {{cookiecutter.docker_username}}/{{cookiecutter.project_name}}
	docker build -t  {{cookiecutter.docker_username}}/{{cookiecutter.project_name}} .


.PHONY: shell
shell: ## Open a shell in the container
	docker-compose run --rm shell

.PHONY: notebook
notebook: ## Start a jupyter notebook
	docker-compose run --rm --service-ports notebook

.PHONY: pgcli
pgcli: ## Run a pgcli session
	docker compose run --rm pgcli


.PHONY: build_env
build_env: ## Build the python environment
	docker-compose run --rm build_env

.PHONY: create_db
create_db: ## Creates the working dataqbase
	docker-compose run --rm create_db

.PHONY: down
down: ## stop all docker-compose services
	docker-compose down

.PHONY: reset
reset: ## Blow away all docker resourses associated with this project
	docker-compose down
	-docker volume rm {{cookiecutter.project_name}}_db-data
	-docker volume rm {{cookiecutter.project_name}}_env
	-docker images | grep '{{cookiecutter.project_name}}' | awk '{print $3}'  | xargs docker rmi
	-docker builder prune -f

.PHONY: bootstrap
bootstrap: ## Nuke all resources and rebuild them
	# stop serverses and blow away all docker resources
	docker-compose down
	-docker volume rm {{cookiecutter.project_name}}_db-data
	-docker volume rm {{cookiecutter.project_name}}_env
	-docker images | grep '{{cookiecutter.project_name}}' | awk '{print $3}'  | xargs docker rmi
	-docker builder prune -f
	#
	# Build the docker container
	docker rmi -f {{cookiecutter.docker_username}}/{{cookiecutter.project_name}}
	docker build -t  {{cookiecutter.docker_username}}/{{cookiecutter.project_name}} .
	#
	# Build python env
	docker-compose run --rm build_env
	#
	# Create the working database
	docker-compose run --rm make_db

.PHONY: nuke
nuke: ## Nuke all resources
	# stop serverses and blow away all docker resources
	docker-compose down
	-docker volume rm {{cookiecutter.project_name}}_db-data
	-docker volume rm {{cookiecutter.project_name}}_env
	-docker images | grep '{{cookiecutter.project_name}}' | awk '{print $3}'  | xargs docker rmi
	-docker builder prune -f
