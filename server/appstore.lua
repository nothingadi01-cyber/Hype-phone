local function getId(src)
    if Config.Framework == 'esx' then
        return Framework.GetPlayerFromId(src).identifier
    else
        return Framework.Functions.GetPlayer(src).PlayerData.citizenid
    end
end

RegisterNetEvent('lb-phone:getApps', function(cb)
    local id = getId(source)
    local apps = MySQL.query.await(
        'SELECT app FROM phone_apps WHERE identifier = ? AND installed = 1',
        { id }
    )
    cb(apps)
end)

RegisterNetEvent('lb-phone:installApp', function(app)
    local id = getId(source)
    MySQL.insert(
        'REPLACE INTO phone_apps (identifier, app, installed) VALUES (?, ?, 1)',
        { id, app }
    )
end)

RegisterNetEvent('lb-phone:removeApp', function(app)
    local id = getId(source)
    MySQL.update(
        'DELETE FROM phone_apps WHERE identifier = ? AND app = ?',
        { id, app }
    )
end)
