RegisterNetEvent('lb-phone:saveSettings', function(settings)
    local src = source
    local id = (Config.Framework == 'esx')
        and Framework.GetPlayerFromId(src).identifier
        or Framework.Functions.GetPlayer(src).PlayerData.citizenid

    MySQL.insert(
        'REPLACE INTO phone_settings (identifier, theme, wallpaper, ringtone, volume) VALUES (?, ?, ?, ?, ?)',
        { id, settings.theme, settings.wallpaper, settings.ringtone, settings.volume }
    )
end)

RegisterNetEvent('lb-phone:loadSettings', function(cb)
    local src = source
    local id = (Config.Framework == 'esx')
        and Framework.GetPlayerFromId(src).identifier
        or Framework.Functions.GetPlayer(src).PlayerData.citizenid

    local data = MySQL.query.await(
        'SELECT * FROM phone_settings WHERE identifier = ?',
        { id }
    )

    cb(data[1])
end)
