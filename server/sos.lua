RegisterNetEvent('lb-phone:sos', function(coords)
  local src = source
  TriggerEvent('lb-phone:sendDispatch', {
    job = 'ambulance',
    message = '🆘 EMERGENCY SOS RECEIVED',
    coords = coords
  })
  TriggerEvent('lb-phone:sendDispatch', {
    job = 'police',
    message = '🆘 EMERGENCY SOS RECEIVED',
    coords = coords
  })
end)
