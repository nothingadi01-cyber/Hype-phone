RegisterNUICallback('sendMessage', function(data)
    TriggerServerEvent('lb-phone:sendMessage', data)
end)

RegisterNetEvent('lb-phone:receiveMessage', function(data)
    SendNUIMessage({
        action = 'newMessage',
        data = data
    })
end)
