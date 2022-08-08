local nk = require('nakama')
local function send_notification(context, payload)
  local data = nk.json_decode(payload)
  if (context.user_id == nil) then
    error("Data could not be updated")
  end
  local receiverId = data.recipient_id
  local subject = data.subject
  local content = data.content
  local code = data.code
  local senderId = context.user_id
  local persistent = false
  nk.notification_send(receiverId, subject, content, code, senderId, persistent)
end
nk.register_rpc(send_notification, "send_notification")
