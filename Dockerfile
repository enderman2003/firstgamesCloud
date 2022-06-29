FROM ubuntu:latest

RUN mkdir -p /nakama/data
RUN touch /nakama/data/logfile.log

ADD ./data/config.yml /nakama/
ADD ./nakama /nakama/

RUN ["chmod", "+x", "/nakama/nakama"]
CMD ["nakama", "--config", "/nakama/config.yml"]
