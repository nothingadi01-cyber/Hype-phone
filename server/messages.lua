RegisterNetEvent('lb-phone:sendMessage', function(data)
    local src = source
    local senderNumber = data.from
    local targetNumber = data.to
    local message = data.message

    MySQL.insert(
        'INSERT INTO phone_messages (sender, receiver, message) VALUES (?, ?, ?)',
        { senderNumber, targetNumber, message }
    )

    for _, playerId in ipairs(GetPlayers()) do
        TriggerClientEvent('lb-phone:receiveMessage', playerId, {
            from = senderNumber,
            to = targetNumber,
            message = message
        })
    end
end)

RegisterNetEvent('lb-phone:loadMessages', function(cb, number)
    local src = source
    local result = MySQL.query.await(
        'SELECT * FROM phone_messages WHERE sender = ? OR receiver = ? ORDER BY time ASC',
        { number, number }
    )
    cb(result)
end)
