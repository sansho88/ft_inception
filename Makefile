DOCKER_NAME=Dockerfile
DOCKER_COMP_NAME=docker-compose.yml
DOCKER_PATH=srcs/requirements
DOCKER_COMP_PATH=srcs
DOCK_COMP=docker compose --file ${DOCKER_COMP_PATH}/${DOCKER_COMP_NAME}

build:
	${DOCK_COMP} build 
create:
	${DOCK_COMP} create
start:
	${DOCK_COMP} start
stop:
	${DOCK_COMP} stop
up:
	${DOCK_COMP} up -d
down:
	${DOCK_COMP} down
all: build up
status:
	@docker ps

delete: down
	docker system prune -f --volumes
re: delete all
logs:
	${DOCK_COMP} logs

.PHONY: all build create start stop up down delete re logs