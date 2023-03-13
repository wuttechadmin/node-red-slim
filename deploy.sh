#!/bin/bash
export STACK_NAME=wuttech

docker-compose build nodered-slim && docker-compose up

#export $(cat .env.prod) 
#> /dev/null 2>&1; \ 
#docker stack deploy --compose-file docker-compose.yml ${STACK_NAME}



