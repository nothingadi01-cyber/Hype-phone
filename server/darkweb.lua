RegisterNetEvent('lb-phone:darkMessage', function(data)
    local src = source
    local sender = getIdentifier(src)

    MySQL.insert(
        'INSERT INTO phone_dark_messages (sender, receiver, message) VALUES (?, ?, ?)',
        { sender, data.to, data.message }
    )
end)

RegisterNetEvent('lb-phone:darkBuy', function(item)
    local src = source
    local id = getIdentifier(src)
    local price = 50 -- configurable

    MySQL.insert(
        'INSERT INTO phone_dark_orders (buyer, item, price, status) VALUES (?, ?, ?, ?)',
        { id, item, price, 'pending' }
    )

    -- TRACE RISK
    if math.random(1,100) < 15 then
        TriggerEvent('lb-phone:sendDispatch', {
            job = 'police',
            message = '⚠ Suspicious Dark Web Activity Detected',
            coords = GetEntityCoords(GetPlayerPed(src))
        })
    end
end)
