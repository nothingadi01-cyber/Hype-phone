local lastCoords = nil
local shakeCount = 0

CreateThread(function()
  while true do
    Wait(300)
    local coords = GetEntityCoords(PlayerPedId())
    if lastCoords then
      if #(coords - lastCoords) > 1.2 then
        shakeCount += 1
        if shakeCount >= 5 then
          TriggerEvent('lb-phone:sendSOS')
          shakeCount = 0
        end
      end
    end
    lastCoords = coords
  end
end)

RegisterNetEvent('lb-phone:sendSOS', function()
  local coords = GetEntityCoords(PlayerPedId())
  TriggerServerEvent('lb-phone:sos', coords)
end)
