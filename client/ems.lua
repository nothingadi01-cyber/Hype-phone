RegisterCommand('emscheck', function()
  local ped = PlayerPedId()
  local target, dist = GetClosestPlayer()
  if dist < 3.0 then
    local hp = GetEntityHealth(GetPlayerPed(target))
    TriggerEvent('chat:addMessage',{
      args={'EMS','Patient HP: '..hp}
    })
  end
end)
