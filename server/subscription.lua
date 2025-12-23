local function getId(src)
  if Config.Framework=='esx' then
    return Framework.GetPlayerFromId(src).identifier
  else
    return Framework.Functions.GetPlayer(src).PlayerData.citizenid
  end
end

RegisterNetEvent('lb-phone:checkSub', function(cb)
  local id = getId(source)
  local row = MySQL.single.await(
    'SELECT * FROM phone_subscriptions WHERE identifier=?',
    {id}
  )

  if not row then cb('none'); return end
  if row.plan == 'lifetime' then cb('lifetime'); return end
  if row.expires > os.time() then cb('monthly') else cb('none') end
end)

RegisterNetEvent('lb-phone:addSub', function(plan, days)
  local id = getId(source)
  local expires = plan=='monthly' and (os.time()+days*86400) or 0

  MySQL.insert(
    'REPLACE INTO phone_subscriptions (identifier, plan, expires) VALUES (?, ?, ?)',
    { id, plan, expires }
  )
end)
