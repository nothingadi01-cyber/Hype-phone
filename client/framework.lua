Framework = nil

CreateThread(function()
    if Config.Framework == 'esx' then
        while not Framework do
            TriggerEvent('esx:getSharedObject', function(obj)
                Framework = obj
            end)
            Wait(100)
        end
    else
        Framework = exports['qb-core']:GetCoreObject()
    end
end)
