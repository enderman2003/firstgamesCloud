FROM ubuntu:latest

RUN ["sudo", "usermod", "-aG", "docker", "$USER"]

FROM docker:latest

RUN mkdir -p /nakama/data
RUN touch /nakama/data/logfile.log

ADD ./data/config.yml /nakama/
ADD ./docker-compose.yml ./

RUN ["docker", "compose", "up"]
