local rate = {}

RegisterNetEvent('lb-phone:saveVoice', function(data)
    local src = source
    local now = os.time()
    rate[src] = rate[src] or 0
    if now - rate[src] < 3 then return end -- anti-spam
    rate[src] = now

    MySQL.insert(
        'INSERT INTO phone_voice_notes (sender, receiver, group_id, audio, duration) VALUES (?, ?, ?, ?, ?)',
        { data.sender, data.receiver, data.group, data.audio, data.duration }
    )

    -- notify target(s)
    TriggerClientEvent('lb-phone:voiceIncoming', -1, data)
end)
