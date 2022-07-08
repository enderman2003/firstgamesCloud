FROM ubuntu:latest

RUN mkdir -p /nakama/data

ADD ./data/config.yml /nakama/
ADD ./nakama /nakama

RUN chmod +x /nakama/nakama
RUN /nakama/nakama migrate up --database.address 'postgresql://enderman2003:v2_3sR9Z_uVhQm53n2hjDWz8sKTXCbF9@db.bit.io/enderman2003/firstgamesData'
CMD /nakama/nakama --config /nakama/config.yml
