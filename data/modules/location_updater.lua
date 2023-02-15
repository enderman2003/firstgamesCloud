local nk = require("nakama")

local function location_update(context, payload)
    local userId = context.user_id
    local data = nk.json_decode(payload)

    local new_objects = {
       { 
            collection = "user_data", 
            key = userId, 
            user_id = userId, 
            value = {data=data['data']}, 
            permission_read = 1, 
            permission_write = 1 
        },
    }

    nk.storage_write(new_objects)
    return payload
end

nk.register_rpc(location_update, "location_update")
