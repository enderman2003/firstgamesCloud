local nk = require("nakama")

local function create_user(context, payload)
    local userId = context.user_id
    local data = nk.json_decode(payload)

    local new_objects = {
            collection = "user_data", 
            key = userId, 
            user_id = userId, 
            value = {
                data={
                    kills=data['data']['kills'],
                    deaths=data['data']['deaths'],
                    ability=data['data']['ability'],
                    cool_down=data['data']['cool_down'],
                    cp=data['data']['cp'],
                    curr_weapon=data['data']['curr_weapon'],
                    location={
                        lon=data['data']['lon'],
                        lat=data['data']['lat'],
                        ip_addr=data['data']['location']['ip_addr'],
                        country=data['data']['location']['country'],
                        region=data['data']['location']['region'],
                        city=data['data']['location']['city']
                    },
                    ban_time={
                        day=data['data']['ban_time']['day'],
                        month=data['data']['ban_time']['month'],
                        year=data['data']['ban_time']['year'],
                        hours=data['data']['ban_time']['hours'],
                        minutes=data['data']['ban_time']['minutes']
                    },
                    weapon_inv={
                        Hands={
                            level=data['data']['weapon_inv']['Hands']['level'],
                            cp=data['data']['weapon_inv']['Hands']['cp']
                        }
                    },
                    upgrade_inv={
                        banadges=data['data']['upgrade_inv']['bandages'],
                        punching_bag=data['data']['upgrade_inv']['punching_bag']
                    }
                }
            },
            permission_read = 2, 
            permission_write = 1
    }

    nk.storage_write(new_objects)
    return payload
end

nk.register_rpc(create_user, "create_user")
