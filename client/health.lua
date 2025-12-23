CreateThread(function()
  while true do
    Wait(5000)
    local ped = PlayerPedId()
    local health = GetEntityHealth(ped)
    local armor = GetPedArmour(ped)

    SendNUIMessage({
      action = 'updateHealth',
      health = health,
      armor = armor
    })
  end
end)
