FROM docker:latest

RUN mkdir -p /nakama/data
RUN touch /nakama/data/logfile.log

ADD ./data/config.yml /nakama/
ADD ./docker-compose.yml ./

RUN ["docker", "run", "-it", "-v", "/var/run/docker.sock:/var/run/docker.sock", "ubuntu:latest"]
RUN ["docker", "compose", "up"]
