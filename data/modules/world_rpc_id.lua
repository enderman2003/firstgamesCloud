local nk = require("nakama")

local function death(context, payload)
  local data = nk.json_decode(payload)
  if (context.user_id == nil) then
    error("Data could not be updated")
  end
  local subject = "Dead"

  local content = {
    opponent_dead = true
  }

  local receiver_id = data.data.rem_id
  local sender_id = context.user_id
  local code = 153
  local persistent = false

  nk.notification_send(receiver_id, subject, content, code, sender_id, persistent)
end

local function eliminated(context, payload)
  local data = nk.json_decode(payload)
  if (context.user_id == nil) then
    error("Data could not be updated")
  end
  local subject = "Eliminated"

  local content = {
    opponent_win = true
  }

  local receiver_id = data.data.rem_id
  local sender_id = context.user_id
  local code = 156
  local persistent = false

  nk.notification_send(receiver_id, subject, content, code, sender_id, persistent)
end

nk.register_rpc(death, "death")
nk.register_rpc(eliminated, "eliminated")
