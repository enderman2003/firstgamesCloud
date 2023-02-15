FROM ubuntu:latest

RUN mkdir -p /nakama/data

ADD ./data/config.yml /nakama/data/
ADD ./nakama /nakama
ADD ./data/modules/update_metadata.lua nakama/data/modules/update_metadata.lua
ADD ./data/modules/world_control.lua nakama/data/modules/world_control.lua
ADD ./data/modules/world_rpc.lua nakama/data/modules/world_rpc.lua
ADD ./data/modules/send_notification.lua nakama/data/modules/send_notification.lua

RUN chmod +x /nakama/nakama
CMD /nakama/nakama migrate up --database.address 'postgresql://sahilraut21102003:UyhnKzYBLVUwgn3fNyX8gg@eclipsecloud-3888.6xw.cockroachlabs.cloud:26257/defaultdb?options=cluster%3Declipsecloud&sslmode=verify'
