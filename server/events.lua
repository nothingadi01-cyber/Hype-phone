RegisterNetEvent('lb-phone:createEvent', function(data)
  local src = source
  local id = (Config.Framework=='esx')
    and Framework.GetPlayerFromId(src).identifier
    or Framework.Functions.GetPlayer(src).PlayerData.citizenid

  MySQL.insert(
    'INSERT INTO phone_events (creator, title, description, x, y, z, time) VALUES (?, ?, ?, ?, ?, ?, ?)',
    { id, data.title, data.desc, data.coords.x, data.coords.y, data.coords.z, data.time }
  )
end)

RegisterNetEvent('lb-phone:rsvp', function(eventId)
  local src = source
  local id = (Config.Framework=='esx')
    and Framework.GetPlayerFromId(src).identifier
    or Framework.Functions.GetPlayer(src).PlayerData.citizenid

  MySQL.insert(
    'REPLACE INTO phone_event_rsvp (event_id, attendee) VALUES (?, ?)',
    { eventId, id }
  )
end)
