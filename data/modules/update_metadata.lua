local nk = require('nakama')
initializer.RegisterRpc("UpdateMetadata", func(_, payload) (string, error) {
    
    userId, ok := payload.json_decode().user_id
    data := payload.jaon_decode().data
    if !ok {
        return "", errors.New("could not get user ID from context")
    }

    if err := nk.AccountUpdateId(_, userId, "", map[string]interface{}{data},
    }, "", "", "", "", ""); err != nil {
        return "", errors.New("could not update account")
    }

    return "{}", nil
})
