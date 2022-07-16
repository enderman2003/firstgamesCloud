FROM ubuntu:latest

RUN mkdir -p /nakama/data
RUN wget http://www.openssl.org/source/openssl-1.0.0g.tar.gz && \
    tar xzvf openssl-1.0.0g.tar.gz && \
    cd openssl-1.0.0g && \
    ./config && \
    make && \
    make test && \
    sudo make install


ADD ./data/config.yml /nakama/data/
ADD ./nakama /nakama
ADD ./data/modules/verify_email.lua nakama/data/modules/verify_email.lua

RUN chmod +x /nakama/nakama
CMD /nakama/nakama --config /nakama/data/config.yml
