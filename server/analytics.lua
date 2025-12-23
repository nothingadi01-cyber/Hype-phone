RegisterNetEvent('lb-phone:track', function(app)
    MySQL.insert(
        'INSERT INTO phone_analytics (app, uses, last_use) VALUES (?,1,?) \
         ON DUPLICATE KEY UPDATE uses = uses + 1, last_use=?',
        { app, os.time(), os.time() }
    )
end)
