FROM ubuntu:latest

RUN mkdir -p /nakama/data

ADD ./data/config.yml /nakama/
ADD ./nakama /nakama

RUN chmod +x /nakama/nakama
CMD /nakama/nakama --config /nakama/config.yml
