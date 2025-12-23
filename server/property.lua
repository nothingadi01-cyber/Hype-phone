RegisterNetEvent('lb-phone:prop:lock', function(pid, state)
    local src = source
    local id = getId(src)

    local owns = MySQL.scalar.await(
        'SELECT 1 FROM phone_properties WHERE id=? AND owner=?',
        { pid, id }
    )
    if not owns then return end

    MySQL.update(
        'UPDATE phone_properties SET locked=? WHERE id=?',
        { state and 1 or 0, pid }
    )
end)

RegisterNetEvent('lb-phone:prop:share', function(pid, target)
    MySQL.insert(
        'REPLACE INTO phone_property_keys (property_id, holder) VALUES (?, ?)',
        { pid, target }
    )
end)
