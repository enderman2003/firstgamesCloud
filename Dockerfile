FROM ubuntu:latest

RUN mkdir -p /nakama/data

ADD ./data/config.yml /nakama/data/
ADD ./nakama /nakama
ADD ./data/modules/verify_email.lua nakama/data/modules/

RUN chmod +x /nakama/nakama
CMD /nakama/nakama --config /nakama/config.yml
