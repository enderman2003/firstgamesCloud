local nk = require('nakama')
local function update_metadata(context, payload)
    local userId = nk.json_decode(payload).user_id
    local data = nk.json_decode(payload).data
    if userId == nil then
        error("Data could not be updated")
    end

    local update = nk.account_update_id(user_id, data, "", "", "", "", "", "")
    return payload
end
nk.register_rpc(update_metadata, "update_metadata")

