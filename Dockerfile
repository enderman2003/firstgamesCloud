FROM ubuntu:latest

RUN mkdir -p /nakama/data

ADD ./data/config.yml /nakama/data/
ADD ./nakama /nakama
ADD ./data/modules/update_metadata.lua nakama/data/modules/update_metadata.lua
ADD ./data/modules/world_control.lua nakama/data/modules/world_control.lua
ADD ./data/modules/world_rpc.lua nakama/data/modules/world_rpc.lua
ADD ./data/modules/send_notification.lua nakama/data/modules/send_notification.lua

RUN chmod +x /nakama/nakama
CMD /nakama/nakama migrate up --database.address "postgres://enderman2003:JFlOGwzSTp63@ep-orange-leaf-915078.eu-central-1.aws.neon.tech/neondb" && /nakama/nakama --config /nakama/data/config.yml
