RegisterNUICallback('createGroup', function(data)
    TriggerServerEvent('lb-phone:createGroup', data.name)
end)

RegisterNUICallback('inviteGroup', function(data)
    TriggerServerEvent('lb-phone:inviteGroup', data)
end)

RegisterNUICallback('kickGroup', function(data)
    TriggerServerEvent('lb-phone:kickGroup', data)
end)
