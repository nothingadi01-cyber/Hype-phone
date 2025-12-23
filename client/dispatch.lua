RegisterNetEvent('lb-phone:dispatchAlert', function(data)
    SendNUIMessage({
        action = 'dispatchAlert',
        data = data
    })

    SetNewWaypoint(data.coords.x, data.coords.y)
end)

RegisterNUICallback('sendDispatch', function(data)
    data.coords = GetEntityCoords(PlayerPedId())
    TriggerServerEvent('lb-phone:sendDispatch', data)
end)
