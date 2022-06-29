FROM docker:latest

RUN mkdir -p /nakama/data

ADD ./docker-compose.yml ./
ADD ./data/config.yml /nakama/

CMD docker-compose -f ./docker-compose.yml up
