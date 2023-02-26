FROM ubuntu:latest

RUN mkdir -p /nakama/data

ADD ./data/config.yml /nakama/data/
ADD ./nakama /nakama
ADD ./data/modules/update_wallet.lua nakama/data/modules/update_wallet.lua
ADD ./data/modules/register&update.lua nakama/data/modules/register&update.lua
ADD ./data/modules/send_notification.lua nakama/data/modules/send_notification.lua
ADD ./data/modules/version_write.lua nakama/data/modules/version_write.lua
ADD ./data/modules/world_rpc_id.lua nakama/data/modules/world_rpc_id.lua
ADD ./data/modules/world_control.lua nakama/data/modules/world_control.lua

RUN chmod +x /nakama/nakama
CMD /nakama/nakama --config /nakama/data/config.yml
