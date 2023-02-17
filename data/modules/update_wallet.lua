local nk = require('nakama')
local function update_wallet(context, payload)
    local userId = context.user_id
    local data = nk.json_decode(payload)
    if (userId == nil) then
        error("Data could not be updated")
    end
    local changeset = {
        coins = -data.coins
    }
    local metadata = {
        game_result = "killed"
    }
    local update = nk.wallet_update(userId, changeset, metadata, true)
    return payload
end

local function add_coins(context, payload)
    local userId = context.user_id
    local data = nk.json_decode(payload)
    if (data['user_id'] ~= nil) then
        local changeset = {
            coins = data.coins
        }
        local metadata = {
            game_result = "killed"
        }
        local update = nk.wallet_update(data['user_id'], changeset, metadata, true)
        return payload
    end
    local changeset = {
        coins = data.coins
    }
    local metadata = {
        game_result = "killed"
    }
    local update = nk.wallet_update(userId, changeset, metadata, true)
    return payload
end

nk.register_rpc(add_coins, "add_coins")
nk.register_rpc(update_wallet, "update_wallet")

