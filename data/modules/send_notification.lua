local nk = require('nakama')
local function send_notification(context, payload)
  local data = nk.json_decode(payload)
  if (context.user_id == nil) then
    error("Data could not be updated")
  end
  local subject = "Locked in battle"

  local content = {
    matched = true
  }

  local receiver_id = data.data.rem_id
  local sender_id = context.user_id
  local code = 101
  local persistent = false

  nk.notification_send(receiver_id, subject, content, code, sender_id, persistent)
end 

nk.register_rpc(send_notification, "send_notification")
