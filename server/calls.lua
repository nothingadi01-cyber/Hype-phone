local ActiveCalls = {}

RegisterNetEvent('lb-phone:startCall', function(data)
    local src = source
    local from = data.from
    local to = data.to

    ActiveCalls[to] = src

    TriggerClientEvent('lb-phone:incomingCall', -1, {
        from = from,
        to = to
    })
end)

RegisterNetEvent('lb-phone:acceptCall', function(data)
    local src = source
    local from = data.from
    local to = data.to

    MySQL.insert(
        'INSERT INTO phone_calls (caller, receiver, status) VALUES (?, ?, ?)',
        { from, to, 'answered' }
    )

    TriggerClientEvent('lb-phone:callAccepted', ActiveCalls[to], src)
end)

RegisterNetEvent('lb-phone:rejectCall', function(data)
    MySQL.insert(
        'INSERT INTO phone_calls (caller, receiver, status) VALUES (?, ?, ?)',
        { data.from, data.to, 'rejected' }
    )
end)
