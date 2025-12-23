RegisterNetEvent('lb-phone:createGroup', function(name)
    local src = source
    local id = (Config.Framework=='esx')
        and Framework.GetPlayerFromId(src).identifier
        or Framework.Functions.GetPlayer(src).PlayerData.citizenid

    local gid = MySQL.insert.await(
        'INSERT INTO phone_groups (name, owner) VALUES (?, ?)',
        { name, id }
    )

    MySQL.insert(
        'INSERT INTO phone_group_members (group_id, member, role) VALUES (?, ?, ?)',
        { gid, id, 'owner' }
    )
end)

RegisterNetEvent('lb-phone:inviteGroup', function(data)
    MySQL.insert(
        'INSERT INTO phone_group_members (group_id, member) VALUES (?, ?)',
        { data.group, data.member }
    )
end)

RegisterNetEvent('lb-phone:kickGroup', function(data)
    MySQL.update(
        'DELETE FROM phone_group_members WHERE group_id = ? AND member = ?',
        { data.group, data.member }
    )
end)
