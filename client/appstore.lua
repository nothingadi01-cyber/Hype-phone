RegisterNUICallback('getApps', function(data, cb)
    TriggerServerEvent('lb-phone:getApps', cb)
end)

RegisterNUICallback('installApp', function(data)
    TriggerServerEvent('lb-phone:installApp', data.app)
end)

RegisterNUICallback('removeApp', function(data)
    TriggerServerEvent('lb-phone:removeApp', data.app)
end)
