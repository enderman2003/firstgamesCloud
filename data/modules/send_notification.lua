local nk = require('nakama')
local function send_notification(context, payload)
  local data = nk.json_decode(payload)
  if (context.user_id == nil) then
    error("Data could not be updated")
  end
  local new_notifications = {
    {
      subject = data.subject,
      content = data.content,
      sender_id = data.sender_id,
      user_id = data.p2_id,
      code = data.code,
      persistent = true
    }
    {
      subject = data.subject,
      content = data.content,
      sender_id = data.sender_id,
      user_id = data.data.p3_id,
      code = data.code,
      persistent = true
    }
    {
      subject = data.subject,
      content = data.content,
      sender_id = data.sender_id,
      user_id = data.p4_id,
      code = data.code,
      persistent = true
    }
  }

  nk.notification_send(new_notifications)
end
nk.register_rpc(send_notification, "send_notification")
