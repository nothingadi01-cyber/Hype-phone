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
