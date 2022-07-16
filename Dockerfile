FROM ubuntu:latest

RUN mkdir -p /nakama/data
RUN openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -sha256 -days 365 -nodes

ADD ./data/config.yml /nakama/data/
ADD ./nakama /nakama
ADD ./data/modules/verify_email.lua nakama/data/modules/verify_email.lua

RUN chmod +x /nakama/nakama
CMD /nakama/nakama --config /nakama/data/config.yml
