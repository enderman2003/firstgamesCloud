FROM heroiclabs/nakama:latest

RUN mkdir -p /nakama/data
RUN touch /nakama/data/logfile.log

ADD ./data/config.yml /nakama/

CMD ["nakama", "--config", "/nakama/config.yml"]
