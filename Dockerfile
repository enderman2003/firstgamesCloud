FROM ubuntu

RUN mkdir -p /nakama/data
RUN touch /nakama/data/logfile.log

ADD ./nakama /nakama/
ADD ./data/config.yml /nakama/
