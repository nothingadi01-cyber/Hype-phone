RegisterNetEvent('lb-phone:sendDispatch', function(data)
    local src = source
    local job = data.job
    local message = data.message
    local coords = data.coords

    for _, id in ipairs(GetPlayers()) do
        local Player = (Config.Framework == 'esx')
            and Framework.GetPlayerFromId(id)
            or Framework.Functions.GetPlayer(id)

        if Player then
            local playerJob = (Config.Framework == 'esx')
                and Player.job.name
                or Player.PlayerData.job.name

            if playerJob == job then
                TriggerClientEvent('lb-phone:dispatchAlert', id, {
                    message = message,
                    coords = coords
                })
            end
        end
    end
end)
