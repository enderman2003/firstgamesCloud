local nk = require("nakama")

local function create_user(context, payload)
    local userId = context.user_id
    local data = nk.json_decode(payload)    
    local uname = context.username
    
    if (data['user_id'] ~= nil) then
        local new_objects = {
            {
                collection = "user_data", 
                key = data['user_id'], 
                user_id = data['user_id'], 
                value = {data={
                        username=uname,
                        cus_id=data['data']['data']['cus_id'],
                        username=data['data']['data']['username'],
                        kills=data['data']['data']['kills'],
                        deaths=data['data']['data']['deaths'],
                        ability=data['data']['data']['ability'],
                        cool_down=data['data']['data']['cool_down'],
                        cp=data['data']['data']['cp'],
                        rank=data['data']['data']['rank'],
                        curr_weapon=data['data']['data']['curr_weapon'],
                        location={
                            ip_addr=data['data']['data']['location']['ip_addr'],
                            country=data['data']['data']['location']['country'],
                            region=data['data']['data']['location']['region'],
                            city=data['data']['data']['location']['city']
                        },
                        ban_time={
                            day=data['data']['data']['ban_time']['day'],
                            month=data['data']['data']['ban_time']['month'],
                            year=data['data']['data']['ban_time']['year'],
                            hours=data['data']['data']['ban_time']['hours'],
                            minutes=data['data']['data']['ban_time']['minutes']
                        },
                        weapon_inv=data['data']['data']['weapon_inv'],
                        upgrade_inv={
                            bandages=data['data']['data']['upgrade_inv']['bandages'],
                            punching_bag=data['data']['data']['upgrade_inv']['punching_bag']
                        }
                    }
                },
                permission_read = 2, 
                permission_write = 1
            }
        }

        nk.storage_write(new_objects)
        return payload
    end
    
    local new_objects = {
        {
            collection = "user_data", 
            key = userId, 
            user_id = userId, 
            value = {data={
                    username=uname,
                    cus_id=data['data']['cus_id'],
                    kills=data['data']['kills'],
                    deaths=data['data']['deaths'],
                    ability=data['data']['ability'],
                    cool_down=data['data']['cool_down'],
                    cp=data['data']['cp'],
                    rank=data['data']['rank'],
                    curr_weapon=data['data']['curr_weapon'],
                    location={
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
                    weapon_inv=data['data']['weapon_inv'],
                    upgrade_inv={
                        bandages=data['data']['upgrade_inv']['bandages'],
                        punching_bag=data['data']['upgrade_inv']['punching_bag']
                    }
                }
            },
            permission_read = 2, 
            permission_write = 1
        }
    }

    nk.storage_write(new_objects)
    return payload
end

local function location_update(context, payload)
    local userId = context.user_id
    local data = nk.json_decode(payload)
    local new_objects = {
        {
            collection = "realtime_location", 
            key = userId, 
            user_id = userId, 
            value = {
                data={
                    realtime_location={
                        lon=data['data']['realtime_location']['lon'],
                        lat=data['data']['realtime_location']['lat']
                    }
                }
            },
            permission_read = 2, 
            permission_write = 1
        }
    }
    nk.storage_write(new_objects)
    return payload
end

local function update_pay(context, payload)
    local userId = context.user_id
    local data = nk.json_decode(payload)
    local new_objects = {
        {
            collection = "payments", 
            key = userId, 
            user_id = userId, 
            value = {
                data={
                    pay_ids=data['data']
                }
            },
            permission_read = 2, 
            permission_write = 1
        }
    }
    nk.storage_write(new_objects)
    return payload
end

nk.register_rpc(update_pay, "update_pay")
nk.register_rpc(location_update, "location_update")
nk.register_rpc(create_user, "create_user")
