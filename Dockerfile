FROM ubuntu:latest

RUN mkdir -p /nakama/data

ADD ./data/config.yml /nakama/
ADD ./nakama /nakama
ADD ./data/modules/verify_email.lua /nakama

RUN chmod +x /nakama/nakama
CMD /nakama/nakama --config /nakama/config.yml
