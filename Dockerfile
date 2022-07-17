FROM ubuntu:latest

RUN mkdir -p /nakama/data

ADD ./data/config.yml /nakama/data/
ADD ./nakama /nakama
ADD ./data/modules/update_metadata.lua nakama/data/modules/update_metadata.lua

RUN chmod +x /nakama/nakama
CMD /nakama/nakama --config /nakama/data/config.yml
