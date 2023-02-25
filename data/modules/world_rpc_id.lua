local nakama = require("nakama")

-- Gets the array of names currently in circulation out of non-user-owned storage.
-- @return A table in the format {names = {}}, with names being an array of strings.
local function _get_name_collection()
    local object_ids = {
        {
            collection = "global_data",
            key = "names"
        }
    }

    local objects = nakama.storage_read(object_ids)

    local names
    for _, object in pairs(objects) do
        names = object.value
        if names ~= nil then
            break
        end
    end

    if names ~= nil then
        return names
    else
        return {["names"] = {}}
    end
end

nakama.register_rpc(get_world_id, "get_world_id")
