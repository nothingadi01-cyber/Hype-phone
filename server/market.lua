RegisterNetEvent('lb-phone:listItem', function(data)
  local src = source
  local id = (Config.Framework=='esx')
    and Framework.GetPlayerFromId(src).identifier
    or Framework.Functions.GetPlayer(src).PlayerData.citizenid

  MySQL.insert(
    'INSERT INTO phone_market_items (seller, item, price) VALUES (?, ?, ?)',
    { id, data.item, data.price }
  )
end)

RegisterNetEvent('lb-phone:buyItem', function(itemId)
  -- money transfer handled here
  MySQL.update(
    'UPDATE phone_market_items SET status=? WHERE id=?',
    { 'sold', itemId }
  )
  TriggerClientEvent('lb-phone:notify', source, '📦 Item purchased! Delivery soon.')
end)
