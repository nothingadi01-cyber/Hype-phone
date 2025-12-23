RegisterNUICallback('panic', function()
    local coords = GetEntityCoords(PlayerPedId())
    TriggerServerEvent('lb-phone:sendDispatch', {
        job = 'police',
        message = '🚨 PANIC BUTTON ACTIVATED',
        coords = coords
    })
end)
