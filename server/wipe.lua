RegisterNetEvent('lb-phone:wipe', function(reason)
  local src = source
  local id = getId(src)

  MySQL.query.await('DELETE FROM phone_messages WHERE sender=? OR receiver=?', {id,id})
  MySQL.query.await('DELETE FROM phone_contacts WHERE owner=?', {id})
  MySQL.query.await('DELETE FROM phone_photos WHERE owner=?', {id})

  MySQL.insert(
    'INSERT INTO phone_wipe_logs (identifier, reason, by_who) VALUES (?, ?, ?)',
    { id, reason, id }
  )
end)
