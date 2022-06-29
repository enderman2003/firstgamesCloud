FROM docker:latest

RUN mkdir -p /nakama/data

ADD ./docker-compose.yml ./
ADD ./data/config.yml /nakama/

CMD docker run -p 8080:8080 -p 7348:7348 -p 7349:7349 -p 7350:7350
