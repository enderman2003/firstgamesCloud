FROM docker:latest

RUN mkdir -p /nakama/data
RUN touch /nakama/data/logfile.log

ADD ./nakama /nakama/
ADD ./data/config.yml /nakama/

CMD ["/nakama/nakama", "--config", "/nakama/config.yml"]
