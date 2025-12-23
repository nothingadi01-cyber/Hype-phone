RegisterNetEvent('lb-phone:savePhoto', function(image)
    local src = source
    local identifier

    if Config.Framework == 'esx' then
        local xPlayer = Framework.GetPlayerFromId(src)
        identifier = xPlayer.identifier
    else
        local Player = Framework.Functions.GetPlayer(src)
        identifier = Player.PlayerData.citizenid
    end

    MySQL.insert(
        'INSERT INTO phone_photos (owner, image) VALUES (?, ?)',
        { identifier, image }
    )
end)

RegisterNetEvent('lb-phone:getPhotos', function(cb)
    local src = source
    local identifier

    if Config.Framework == 'esx' then
        identifier = Framework.GetPlayerFromId(src).identifier
    else
        identifier = Framework.Functions.GetPlayer(src).PlayerData.citizenid
    end

    local photos = MySQL.query.await(
        'SELECT * FROM phone_photos WHERE owner = ? ORDER BY time DESC',
        { identifier }
    )
    cb(photos)
end)
