RegisterNetEvent('lb-phone:addStory', function(data)
  local src = source
  local id = (Config.Framework=='esx')
    and Framework.GetPlayerFromId(src).identifier
    or Framework.Functions.GetPlayer(src).PlayerData.citizenid

  MySQL.insert(
    'INSERT INTO phone_stories (author, image, caption, expires) VALUES (?, ?, ?, ?)',
    { id, data.image, data.caption, os.time()+86400 }
  )
end)

RegisterNetEvent('lb-phone:getStories', function(cb)
  local rows = MySQL.query.await(
    'SELECT * FROM phone_stories WHERE expires > ? ORDER BY id DESC',
    { os.time() }
  )
  cb(rows)
end)
