FROM ubuntu:latest

RUN mkdir -p /nakama/data

ADD ./data/config.yml /nakama/
ADD ./nakama /nakama

RUN chmod +x /nakama/nakama
CMD /nakama/nakama migrate up --database.address 'firstgamesAdmin:eK9nIS6Nhqt9c2kgDQ31uQ@free-tier12.aws-ap-south-1.cockroachlabs.cloud:26257/defaultdb?options=--cluster%3Dfirstgames-902' && --config /nakama/config.yml
