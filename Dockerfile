FROM docker:latest

RUN mkdir -p /nakama/data
RUN touch /nakama/data/logfile.log

ADD ./data/config.yml /nakama/
ADD ./docker-compose.yml ./

RUN ["usermod", "-aG", "docker", "$USER"]
RUN ["docker", "compose", "up"]
