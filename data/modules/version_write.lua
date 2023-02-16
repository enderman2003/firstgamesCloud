local function version_write(context, payload)
    local userId = context.user_id
    local data = nk.json_decode(payload)
    local new_objects = {
        {
            collection = "AppInfo", 
            key = "version", 
            user_id = userId, 
            value = {
                data={
                    version = 0.0.1
                }
            },
            permission_read = 2, 
            permission_write = 1
        }
    }
    nk.storage_write(new_objects)
    return payload
end

nk.register_rpc(version_write, "version_write")
