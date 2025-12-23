RegisterNUICallback('getBalance', function(data, cb)
    TriggerServerEvent('lb-phone:getBalance', cb, data.phone)
end)

RegisterNUICallback('transferMoney', function(data)
    TriggerServerEvent('lb-phone:transferMoney', data)
end)
