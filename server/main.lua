RegisterNetEvent('lb-phone:server:hasPhone', function(cb)
    local src = source
    local hasItem = false

    if Config.Framework == 'esx' then
        local xPlayer = Framework.GetPlayerFromId(src)
        hasItem = xPlayer.getInventoryItem(Config.PhoneItem).count > 0
    else
        local Player = Framework.Functions.GetPlayer(src)
        hasItem = Player.Functions.GetItemByName(Config.PhoneItem) ~= nil
    end

    cb(hasItem)
end)
