local nk = require("nakama")

local function create_user(context, payload)
    local userId = context.user_id
    local data = nk.json_decode(payload).data

    local new_objects = {
       { collection = userId, key = "kills", user_id = userId, value = {value=data['kills']}, version="*", permission_read = 1, permission_write = 1 },
       { collection = userId, key = "deaths", user_id = userId, value = {value=data['deaths']}, version="*", permission_read = 1, permission_write = 1 },
       { collection = userId, key = "ability", user_id = userId, value = {value=data['ability']}, version="*", permission_read = 1, permission_write = 1 },
       { collection = userId, key = "lon", user_id = userId, value = {value=data['lon']}, version="*", permission_read = 1, permission_write = 1 },
       { collection = userId, key = "lat", user_id = userId, value = {value=data['lat']}, version="*", permission_read = 1, permission_write = 1 },
       { collection = userId, key = "ban_time", user_id = userId, value = {value= data['ban_time']}, version="*", permission_read = 1, permission_write = 1 },
       { collection = userId, key = "curr_weapon", user_id = userId, value = {value=data['curr_weapon']}, version="*", permission_read = 1, permission_write = 1 },
       { collection = userId, key = "cooldown", user_id = userId, value = {value=data['cool_down']}, version="*", permission_read = 1, permission_write = 1 },
       { collection = userId, key = "cp", user_id = userId, value = {value=data['cp']}, version="*", permission_read = 1, permission_write = 1 },
       { collection = userId, key = "upgrade_inv", user_id = userId, value = {value=data['upgrade_inv']}, version="*", permission_read = 1, permission_write = 1 },
       { collection = userId, key = "weapon_inv", user_id = userId, value = {value=data['weapon_inv']}, version="*", permission_read = 1, permission_write = 1 }
    }

    nk.storage_write(new_objects)
    return payload
end
nk.register_rpc(create_user, "create_user")
