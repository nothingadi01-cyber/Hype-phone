RegisterCommand("phone", function()
    SetNuiFocus(true, true)
    SendNUIMessage({ action = "openPhone" })
end)

RegisterNUICallback("close", function()
    SetNuiFocus(false, false)
end)

local allowedCoords = vector3(-656.12, -858.32, 24.5)

if #(GetEntityCoords(PlayerPedId()) - allowedCoords) < 5.0 then
   -- allow phone
end
Framework: ESX / QBCore
Phone usage: Anywhere / MLO only
GitHub: Public / Private
RegisterNUICallback('unlockPhone', function(data, cb)
    if data.pin == '1234' then cb(true) else cb(false) end
end)
RegisterNUICallback('vehLocate', function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= 0 then
        local c = GetEntityCoords(veh)
        SetNewWaypoint(c.x, c.y)
    end
end)
RegisterCommand('recoverphone', function(src)
  local chance = math.random(1,100)
  if chance <= 25 then
    MySQL.insert('INSERT INTO phone_evidence (identifier, recovered) VALUES (?,1)', {'unknown'})
    TriggerClientEvent('chat:addMessage', src, {args={'Evidence','Phone data partially recovered'}})
  else
    TriggerClientEvent('chat:addMessage', src, {args={'Evidence','Recovery failed'}})
  end
end)
TriggerClientEvent('lb-phone:incomingCall', -1, {
  from = 'SOS',
  to = 'EMS'
})
RegisterNUICallback('openPremiumApp', function(data, cb)
  TriggerServerEvent('lb-phone:checkSub', function(plan)
    if plan ~= 'none' then cb(true) else cb(false) end
  end)
end)
RegisterNetEvent('lb-phone:eventRoute', function(coords)
  SetNewWaypoint(coords.x, coords.y)
end)
CreateThread(function()
  Wait(60000)
  TriggerClientEvent('lb-phone:notify', -1, '📦 Delivery arriving soon')
end)
RegisterCommand('phoneadmin', function(src)
    if src == 0 then
        print('Use admin panel via NUI or console.')
    end
end)
SendNUIMessage({ action = 'openApp', app = 'bank' })
TriggerServerEvent('lb-phone:track', 'bank')

AddEventHandler('onResourceStop', function(res)
    if res == GetCurrentResourceName() then
        SetNuiFocus(false, false)
        ClearPedTasks(PlayerPedId())
    end
end)
