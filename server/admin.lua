RegisterNetEvent('lb-phone:admin:getState', function(cb)
    local src = source
    if src ~= 0 then return end -- console/admin only

    local states = {}
    for _, id in ipairs(GetPlayers()) do
        states[#states+1] = {
            id = id,
            name = GetPlayerName(id)
        }
    end
    cb(states)
end)
