local nk = require('nakama')
local function update_metadata(context, payload)
    local userId = nk.json_decode(payload).user_id
    local data = nk.json_decode(payload).data
    if (userId == null)
        return userId
    end

    local update = nk.AccountUpdateId(_, userId, data)
end
nk.register_rpc(update_metadata, "update_metadata")

