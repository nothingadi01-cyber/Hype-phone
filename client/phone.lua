local phoneOpen = false

RegisterKeyMapping('openphone', 'Open Phone', 'keyboard', Config.OpenKey)

RegisterCommand('openphone', function()
    if phoneOpen then return end

    if Config.MLOOnly and not IsPlayerInMLO() then
        TriggerEvent('chat:addMessage', {
            args = {'Phone', 'You can only use phone inside phone shop'}
        })
        return
    end

    PlayPhoneAnim()
    phoneOpen = true
    SetNuiFocus(true, true)
    SendNUIMessage({ action = 'open' })
end)

RegisterNUICallback('close', function()
    phoneOpen = false
    StopPhoneAnim()
    SetNuiFocus(false, false)
end)

function IsPlayerInMLO()
    local coords = GetEntityCoords(PlayerPedId())
    for _, zone in pairs(Config.MLOZones) do
        if #(coords - zone.coords) < zone.radius then
            return true
        end
    end
    return false
end
PhoneOpenAnim()
-- instead of PlayPhoneAnim()

PhoneCloseAnim()
-- instead of StopPhoneAnim()
