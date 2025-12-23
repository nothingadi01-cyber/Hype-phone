RegisterNUICallback('shareLocation', function()
    local coords = GetEntityCoords(PlayerPedId())
    TriggerServerEvent('lb-phone:shareLocation', coords)
end)

RegisterNetEvent('lb-phone:setWaypoint', function(coords)
    SetNewWaypoint(coords.x, coords.y)
end)
