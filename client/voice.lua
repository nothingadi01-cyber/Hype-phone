RegisterNUICallback('saveVoice', function(data)
    TriggerServerEvent('lb-phone:saveVoice', data)
end)

RegisterNetEvent('lb-phone:voiceIncoming', function(data)
    SendNUIMessage({ action = 'voiceIncoming', data = data })
end)
