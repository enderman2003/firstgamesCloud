FROM ubuntu:latest

RUN ["newgrp", "docker"]

FROM docker:latest

RUN mkdir -p /nakama/data
RUN touch /nakama/data/logfile.log

ADD ./data/config.yml /nakama/
ADD ./docker-compose.yml ./

RUN ["docker", "compose", "up"]
