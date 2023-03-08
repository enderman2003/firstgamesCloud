local nakama = require("nakama")

local function send_to_battle()
    local matches = nakama.match_list()
    local current_match = matches[1]

    if current_match == nil then
        return nakama.match_create("world_control", {})
    else
        return current_match.match_id
    end
end

nakama.register_rpc(send_to_battle, "send_to_battle")
