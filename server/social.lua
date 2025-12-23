RegisterNetEvent('lb-phone:newPost', function(data)
    local src = source
    local id = (Config.Framework=='esx')
        and Framework.GetPlayerFromId(src).identifier
        or Framework.Functions.GetPlayer(src).PlayerData.citizenid

    MySQL.insert(
        'INSERT INTO phone_social_posts (author, message, image) VALUES (?, ?, ?)',
        { id, data.message, data.image }
    )
end)

RegisterNetEvent('lb-phone:getFeed', function(cb)
    local feed = MySQL.query.await(
        'SELECT * FROM phone_social_posts ORDER BY time DESC LIMIT 50'
    )
    cb(feed)
end)
