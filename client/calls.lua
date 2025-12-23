RegisterNUICallback('startCall', function(data)
    TriggerServerEvent('lb-phone:startCall', data)
end)

RegisterNUICallback('acceptCall', function(data)
    stopRingtone()
    TriggerServerEvent('lb-phone:acceptCall', data)
    PhoneCallAnim()
end)

RegisterNUICallback('rejectCall', function(data)
    stopRingtone()
    TriggerServerEvent('lb-phone:rejectCall', data)
end)

RegisterNetEvent('lb-phone:incomingCall', function(data)
    SendNUIMessage({ action = 'incomingCall', data = data })
    startRingtone()
end)

RegisterNetEvent('lb-phone:callAccepted', function()
    PhoneCallAnim()
end)
