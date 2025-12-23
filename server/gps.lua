RegisterNetEvent('lb-phone:shareLocation', function(coords)
    for _, id in ipairs(GetPlayers()) do
        TriggerClientEvent('lb-phone:setWaypoint', id, coords)
    end
end)
