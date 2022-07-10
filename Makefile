DOCKER_IMAGE ?= dockette/repman:1.4.0
COMPOSE_ARGS ?= -f tests/docker-compose.yml

.PHONY: build enter 

build:
	docker build -t ${DOCKER_IMAGE} .

enter:
	docker run -it --rm$ {DOCKER_IMAGE} /bin/bash


.PHONY: stack-env stack-up stack-clean stack-logs stack-create-user

stack-env:
	@touch tests/.env.local

stack-up: stack-env
	docker-compose ${COMPOSE_ARGS} up -d

stack-clean: stack-env
	docker-compose ${COMPOSE_ARGS} down 
	docker-compose ${COMPOSE_ARGS} rm -s -f

stack-logs: stack-env
	docker-compose ${COMPOSE_ARGS} logs -f

stack-create-user: stack-env
	docker-compose ${COMPOSE_ARGS} exec app bin/console repman:create:admin test@test test -v -n
