FROM ubuntu:latest

RUN mkdir -p /nakama/data
RUN touch /nakama/data/logfile.log

ADD ./data/config.yml /nakama/
ADD ./docker-compose.yml ./

RUN ["docker", "run", "-v", "/var/run/docker.sock:/var/run/docker.sock"]
RUN ["docker", "compose", "up"]
