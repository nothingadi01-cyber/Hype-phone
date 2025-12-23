local function getId(src)
  if Config.Framework=='esx' then
    return Framework.GetPlayerFromId(src).identifier
  else
    return Framework.Functions.GetPlayer(src).PlayerData.citizenid
  end
end

RegisterNetEvent('lb-phone:unlock', function(data, cb)
  local src = source
  local id = getId(src)
  local row = MySQL.single.await(
    'SELECT * FROM phone_security WHERE identifier=?', {id}
  )

  if not row then
    MySQL.insert('INSERT INTO phone_security (identifier) VALUES (?)', {id})
    cb(true); return
  end

  if row.locked == 1 then cb(false); return end

  if data.pin ~= row.pin then
    local now = os.time()
    local fails = row.fails + 1
    local locked = fails >= 5 and 1 or 0

    MySQL.update(
      'UPDATE phone_security SET fails=?, last_fail=?, locked=? WHERE identifier=?',
      {fails, now, locked, id}
    )
    cb(false); return
  end

  MySQL.update(
    'UPDATE phone_security SET fails=0, locked=0 WHERE identifier=?',
    {id}
  )
  cb(true)
end)
