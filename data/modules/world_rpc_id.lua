local nakama = require("nakama")

local function _get_first_world()
    local matches = nakama.match_list()
    local current_match = matches[1]

    if current_match == nil then
        return nakama.match_create("world_rpc", {})
    else
        return current_match.match_id
    end
end

local function get_world_id(_, _)
    return _get_first_world()
end

nakama.register_rpc(get_world_id, "get_world_id")
