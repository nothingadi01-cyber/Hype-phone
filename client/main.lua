RegisterCommand("phone", function()
    SetNuiFocus(true, true)
    SendNUIMessage({ action = "openPhone" })
end)

RegisterNUICallback("close", function()
    SetNuiFocus(false, false)
end)
