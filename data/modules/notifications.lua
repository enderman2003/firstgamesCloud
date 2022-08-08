local nk = require('nakama')
local function send_notification(context, payload)
  local data = nk.json_decode(payload)
  if (context.user_id == nil) then
    error("Data could not be updated")
  end
  let receiverId = data.recipient_id
  let subject = data.subject
  let content = data.content
  let code = data.code
  let senderId = context.user_id
  let persistent = false
  nk.notificationSend(receiverId, subject, content, code, senderId, persistent)

nk.register_rpc(send_notification, "send_notification")
