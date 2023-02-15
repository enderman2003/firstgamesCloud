FROM ubuntu:latest

RUN mkdir -p /nakama/data

ADD ./data/config.yml /nakama/data/
ADD ./nakama /nakama
ADD ./data/modules/update_metadata.lua nakama/data/modules/update_metadata.lua
ADD ./data/modules/register.lua nakama/data/modules/register.lua
ADD ./data/modules/send_notification.lua nakama/data/modules/send_notification.lua
ADD ./data/modules/location_updater.lua nakama/data/modules/location_updater.lua

RUN chmod +x /nakama/nakama
CMD /nakama/nakama --config /nakama/data/config.yml
