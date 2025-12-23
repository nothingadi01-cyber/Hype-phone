RegisterNUICallback('getCrypto', function(data, cb)
    TriggerServerEvent('lb-phone:getCrypto', cb)
end)

RegisterNUICallback('buyCrypto', function()
    TriggerServerEvent('lb-phone:addCrypto', 10)
end)
