#!/bin/sh

CONTAINER_NAME="mailpit"

case "$1" in
  start)
    echo "Iniciant el contenidor $CONTAINER_NAME..."
    docker run -d \
      --restart unless-stopped \
      --name=$CONTAINER_NAME \
      -p 8025:8025 \
      -p 1025:1025 \
      axllent/mailpit
    ;;
  stop)
    echo "Aturant el contenidor $CONTAINER_NAME..."
    docker stop $CONTAINER_NAME
    ;;
  down)
    echo "Aturant i esborrant el contenidor $CONTAINER_NAME..."
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
    ;;
  *)
    echo "Ús: $0 {start|stop|down}"
    ;;
esac
