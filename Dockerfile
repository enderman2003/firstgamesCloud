FROM docker:latest

RUN mkdir -p /nakama/data

ADD ./docker-compose.yml ./
ADD ./data/config.yml /nakama/
ADD ./nakama /nakama

CMD /nakama/nakama --config /nakama/config.yml
