local nk = require('nakama')
local function send_notification(context, payload)
  local data = nk.json_decode(payload)
  if (context.user_id == nil) then
    error("Data could not be updated")
  end
  local new_notifications = {
    {
      sender_id = context.user_id,
      content = data.content,
      user_id = data.p2_id,
      code = data.code,
      persistent = true
    },
    {
      sender_id = context.user_id,
      content = data.content,
      user_id = data.data.p3_id,
      code = data.code,
      persistent = true
    },
    {
      sender_id = context.user_id,
      content = data.content,
      user_id = data.p4_id,
      code = data.code,
      persistent = true
    }
  }

  nk.notification_send(new_notifications)
end

local function send_notification_fr(context, payload)
  local data = nk.json_decode(payload)
  if (context.user_id == nil) then
    error("Data could not be updated")
  end
  local sender_id = context.user_id
  local content = {
    message: "Friend request from" . . context.username
  }
  local user_id = data.id
  local code = data.code
  local persistent = true

  nk.notification_send(user_id, nil, content, code, sender_id, persistent)
end

nk.register_rpc(send_notification, "send_notification")
nk.register_rpc(send_notification_fr, "send_notification_fr")
