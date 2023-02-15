local nk = require("nakama")

local function create_user(context, payload)
    local userId = context.user_id
    local data = nk.json_decode(payload).data

    local new_objects = {
            collection = "user_data", 
            key = userId, 
            user_id = userId, 
            value = {
                data={
                    kills=data.kills,
                    deaths=data.deaths,
                    ability=data.ability,
                    cool_down=data.cool_down,
                    cp=data.cp,
                    curr_weapon=data.curr_weapon,
                    location={
                        lon=data.lon,
                        lat=data.lat,
                        ip_addr=data['location'].ip_addr,
                        country=data['location'].country,
                        region=data['location'].region,
                        city=data['location'].city
                    },
                    ban_time={
                        day=data['ban_time'].day,
                        month=data['ban_time'].month,
                        year=data['ban_time'].year,
                        hours=data['ban_time'].hours,
                        minutes=data['ban_time'].minutes
                    },
                    weapon_inv={
                        Hands={
                            level=data['weapon_inv']['Hands'].level,
                            cp=data['weapon_inv']['Hands'].cp
                        }
                    },
                    upgrade_inv={
                        banadges=data['upgrade_inv'].bandages,
                        punching_bag=data['upgrade_inv'].punching_bag
                    }
            },
            permission_read = 2, 
            permission_write = 1 
        },
    }

    nk.storage_write(new_objects)
    return payload
end

nk.register_rpc(create_user, "create_user")
