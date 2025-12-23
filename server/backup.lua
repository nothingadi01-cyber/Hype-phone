RegisterNetEvent('lb-phone:backup', function(data)
  local src = source
  local id = getId(src)

  MySQL.insert(
    'REPLACE INTO phone_backups (identifier, data, last_backup) VALUES (?, ?, ?)',
    { id, json.encode(data), os.time() }
  )
end)

RegisterNetEvent('lb-phone:restore', function(cb)
  local id = getId(source)
  local row = MySQL.single.await(
    'SELECT data FROM phone_backups WHERE identifier=?',
    {id}
  )
  cb(row and json.decode(row.data) or nil)
end)
