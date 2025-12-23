Framework = nil

if Config.Framework == 'esx' then
    TriggerEvent('esx:getSharedObject', function(obj)
        Framework = obj
    end)
else
    Framework = exports['qb-core']:GetCoreObject()
end
