local cooldown = {}

local function getId(src)
    if Config.Framework=='esx' then
        return Framework.GetPlayerFromId(src).identifier
    else
        return Framework.Functions.GetPlayer(src).PlayerData.citizenid
    end
end

RegisterNetEvent('lb-phone:veh:lock', function(plate, state)
    local src = source
    local id = getId(src)
    if cooldown[src] and os.time()-cooldown[src] < 2 then return end
    cooldown[src] = os.time()

    local hasKey = MySQL.scalar.await(
        'SELECT 1 FROM phone_vehicle_keys WHERE plate=? AND owner=?',
        { plate, id }
    )
    if not hasKey then return end

    TriggerClientEvent('lb-phone:veh:setLock', -1, plate, state)
end)

RegisterNetEvent('lb-phone:veh:engine', function(plate, state)
    local src = source
    local id = getId(src)

    local hasKey = MySQL.scalar.await(
        'SELECT 1 FROM phone_vehicle_keys WHERE plate=? AND owner=?',
        { plate, id }
    )
    if not hasKey then return end

    TriggerClientEvent('lb-phone:veh:setEngine', -1, plate, state)
end)
