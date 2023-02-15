local nk = require("nakama")

local function create_user(context, payload)
    local userId = context.user_id
    local data = nk.json_decode(payload).data

    local new_objects = {
            collection = "user_data", 
            key = userId, 
            user_id = userId, 
            value = {
                data=data
            },
            permission_read = 2, 
            permission_write = 1 
        },
    }

    nk.storage_write(new_objects)
    return payload
end

nk.register_rpc(create_user, "create_user")
