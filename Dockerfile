FROM ubuntu:latest

RUN mkdir -p /nakama/data

ADD ./docker-compose.yml ./
ADD ./data/config.yml /nakama/
