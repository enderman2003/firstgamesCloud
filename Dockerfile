FROM docker:latest

RUN mkdir -p /nakama/data
RUN touch /nakama/data/logfile.log

ADD ./nakama /nakama/
ADD ./data/config.yml /nakama/
ADD ./docker-compose.yml /nakama/

CMD ["docker-compose", "-f", "/nakama/docker-compose.yml", "up"]
