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

local lastAction = {}

RegisterNetEvent('lb-phone:secureAction', function()
    local src = source
    if lastAction[src] and os.time() - lastAction[src] < 2 then
        DropPlayer(src, 'Phone exploit detected')
        return
    end
    lastAction[src] = os.time()
end)
RegisterCommand('phonelogs', function(src)
    if src == 0 then
        print('Phone logs available in SQL')
    end
end)
CreateThread(function()
  while true do
    Wait(300000) -- every 5 minutes
    local phoneData = CollectPhoneData() -- messages, apps, settings
    TriggerServerEvent('lb-phone:backup', phoneData)
  end
end)
local rate = {}

AddEventHandler('lb-phone:secure', function(src)
    rate[src] = rate[src] or 0
    if os.time() - rate[src] < 1 then
        DropPlayer(src, 'Phone exploit detected')
    end
    rate[src] = os.time()
end)
Wait(500) -- or higher
