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
