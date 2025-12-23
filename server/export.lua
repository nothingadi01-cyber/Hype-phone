RegisterCommand('export_phone_logs', function(src)
    if src ~= 0 then return end

    local rows = MySQL.query.await('SELECT * FROM phone_analytics')
    local csv = 'app,uses,last_use\n'

    for _, r in pairs(rows) do
        csv = csv .. string.format('%s,%s,%s\n', r.app, r.uses, r.last_use)
    end

    SaveResourceFile(GetCurrentResourceName(), 'exports/analytics.csv', csv, -1)
    print('📁 Phone analytics exported.')
end)
