local nk = require('nakama')
nk.register_rpc("UpdateMetadata", func(_, payload) (string, error) {
    
    userId = payload.json_decode().user_id
    data = payload.json_decode().data
    if (userId == null) {
        return "", errors.New("could not get user ID from context")
    }

    if err := nk.AccountUpdateId(_, userId, "", map[string]interface{}{data},
    }, "", "", "", "", ""); err != nil {
        return "", errors.New("could not update account")
    }

    return "{}", nil
})
