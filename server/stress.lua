RegisterNetEvent('lb-phone:addStress', function(amount)
  local src = source
  local id = (Config.Framework=='esx')
    and Framework.GetPlayerFromId(src).identifier
    or Framework.Functions.GetPlayer(src).PlayerData.citizenid

  MySQL.insert(
    'REPLACE INTO phone_health (identifier, stress, last_update) VALUES (?, ?, ?)',
    { id, amount, os.time() }
  )
end)
