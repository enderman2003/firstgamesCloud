local nk = require("nakama")

local function create_user(context, payload)
    local userId = context.user_id
    local data = nk.json_decode(payload)

    local new_objects = {
       { 
            collection = userId, 
            key = "user_data", 
            user_id = userId, 
            value = {value=data['data']}, 
            permission_read = 2, 
            permission_write = 1 
        },
    }

    nk.storage_write(new_objects)
    return payload
end
local nk = require("nakama")

local function send_location(context, payload)
    local userId = context.user_id
    local data = nk.json_decode(payload)

    local new_objects = {
       { 
            collection = userId, 
            key = "user_data", 
            user_id = userId, 
            value = {value=data['data']}, 
            permission_read = 1, 
            permission_write = 1 },
    }

    nk.storage_write(new_objects)
    return payload
end

nk.register_rpc(send_location, "send_location")
nk.register_rpc(create_user, "create_user")
