#!/bin/bash
# Переменные
NETWORK="zachet-network"
DB_CONTAINER="zachet-db"
WEB_CONTAINER="zachet-web"

# Остановка и удаление контейнеров
docker stop $WEB_CONTAINER $DB_CONTAINER
docker rm $WEB_CONTAINER $DB_CONTAINER

# Удаление сети
docker network rm $NETWORK

echo "Очистка завершена."
