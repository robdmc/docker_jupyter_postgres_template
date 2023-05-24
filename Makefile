#! /usr/bin/make 


.PHONY: help
help:  ## Print the help documentation
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


.PHONY: build
build: ## Build images locally and don't send to dockerhub
	docker builder prune -f
	docker-compose down
	docker rmi -f robdmc/dockerjupyterpostgres
	docker build -t  robdmc/dockerjupyterpostgres .

.PHONY: test
test: ## Run test suite
	docker-compose run --rm test


.PHONY: shell
shell: ## Open a shell in the container
	docker-compose run --rm shell

.PHONY: notebook
notebook: ## Start a jupyter notebook
	docker-compose run --rm --service-ports notebook

.PHONY: build_env
build_env: ## Creates a fresh test db on the postgres server
	docker-compose run --rm build_env

.PHONY: create_db
create_db: ## Creates a fresh test db on the postgres server
	docker-compose run --rm make_test_db

.PHONY: load_db
load_db: ## Load table into the database
	docker-compose run --rm load_db

.PHONY: down
down: ## stop all docker-compose services
	docker-compose down

.PHONY: reset
reset: ## Only reset docker stuff for this project
	docker-compose down
	-docker volume rm docker_jupyter_postgres_db-data
	-docker volume rm docker_jupyter_postgres_penv
	-docker images | grep 'dockerjupyterpostgres' | awk '{print $3}'  | xargs docker rmi
	-docker builder prune -f



