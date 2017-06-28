.DEFAULT_GOAL := help

PROJECT_NAME := RESTAPI

.PHONY: help
help:
	@echo "------------------------------------------------------------------------"
	@echo "${PROJECT_NAME}"
	@echo "------------------------------------------------------------------------"
	@grep -E '^[a-zA-Z0-9_/%\-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: swagger/editor
swagger/editor: ## start swagger editor container
	@docker-compose up -d editor

.PHONY: swagger/build
swagger/build: ## build a new stub server image
	@docker-compose build stub

.PHONY: swagger/start
swagger/start: swagger/build ## build and start the stub API server
	@docker-compose up -d stub

.PHONY: nginx/build
nginx/build: ## build nginx image with custom configuration
	@docker-compose build nginx

.PHONY: nginx/start
nginx/start: ## start nginx container as reverse proxying for editor and stub api
	@docker-compose up -d --build nginx

.PHONY: api/test
api/test: ## run api unit tests
	@docker-compose up --build test