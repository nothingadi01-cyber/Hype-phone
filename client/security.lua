CreateThread(function()
  while true do
    Wait(500)
    local ped = PlayerPedId()
    if IsPedArmed(ped, 4) or IsPedCuffed(ped) or IsPedRagdoll(ped) then
      SendNUIMessage({ action='autoLock' })
    end
  end
end)

RegisterNUICallback('unlockPhone', function(data, cb)
  TriggerServerEvent('lb-phone:unlock', data, cb)
end)
