local nk = require('nakama')
local function update_wallet(context, payload)
    local userId = context.user_id
    local data = nk.json_decode(payload)
    if (userId == nil) then
        error("Data could not be updated")
    end

    local update = nk.wallet_update(userId, data)
    return payload
end
nk.register_rpc(update_wallet, "update_wallet")

