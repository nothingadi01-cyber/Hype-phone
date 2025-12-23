RegisterNetEvent('lb-phone:veh:setLock', function(plate, state)
    for _,veh in pairs(GetGamePool('CVehicle')) do
        if GetVehicleNumberPlateText(veh) == plate then
            SetVehicleDoorsLocked(veh, state and 2 or 1)
        end
    end
end)

RegisterNetEvent('lb-phone:veh:setEngine', function(plate, state)
    for _,veh in pairs(GetGamePool('CVehicle')) do
        if GetVehicleNumberPlateText(veh) == plate then
            SetVehicleEngineOn(veh, state, false, true)
        end
    end
end)
