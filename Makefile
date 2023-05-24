DOCKER_NAME=Dockerfile
DOCKER_COMP_NAME=docker-compose.yml
DOCKER_COMP_PATH=srcs
DOCKER_PATH=${DOCKER_COMP_PATH}/requirements
DATA_PATH=/home/${USER}/data
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
	mkdir -p ${DATA_PATH}/wordpress
	mkdir -p ${DATA_PATH}/mariadb
	${DOCK_COMP} up -d
down:
	${DOCK_COMP} down
all: build up
status:
	@docker ps

delete: down
	docker system prune -f --volumes
	sudo rm -rf ${DATA_PATH}/wordpress ${DATA_PATH}/mariadb
re: delete all
logs:
	${DOCK_COMP} logs

.PHONY: all build create start stop up down delete re logs
.SILENT: