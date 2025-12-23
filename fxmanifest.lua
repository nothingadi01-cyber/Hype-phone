fx_version 'cerulean'
game 'gta5'

author 'YourName'
description 'LB Style MLO Phone'
version '1.0.0'

ui_page 'html/index.html'

files {
    'html/*'
}

client_scripts {
    'client/main.lua'
}

server_scripts {
    'server/main.lua'
}

fx_version 'cerulean'
game 'gta5'

author 'Adii Patel'
description 'LB Ultra Phone'
version '1.0.0'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/css/*.css',
    'html/js/*.js',
    'html/sounds/*.ogg'
}

shared_scripts {
    'config.lua'
}

client_scripts {
    'client/framework.lua',
    'client/phone.lua',
    'client/animations.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/framework.lua',
    'server/main.lua'
}
RegisterNUICallback('sendMessage', function(data)
    TriggerServerEvent('lb-phone:sendMessage', data)
end)

RegisterNetEvent('lb-phone:receiveMessage', function(data)
    SendNUIMessage({
        action = 'newMessage',
        data = data
    })
end)
RegisterNetEvent('lb-phone:getBalance', function(cb, phone)
    local src = source

    if Config.Framework == 'esx' then
        local xPlayer = Framework.GetPlayerFromId(src)
        cb(xPlayer.getAccount('bank').money)
    else
        local Player = Framework.Functions.GetPlayer(src)
        cb(Player.PlayerData.money.bank)
    end
end)

RegisterNetEvent('lb-phone:transferMoney', function(data)
    local src = source
    local amount = tonumber(data.amount)
    local from = data.from
    local to = data.to

    if amount <= 0 then return end

    local senderPlayer = nil

    if Config.Framework == 'esx' then
        senderPlayer = Framework.GetPlayerFromId(src)
        if senderPlayer.getAccount('bank').money < amount then return end
        senderPlayer.removeAccountMoney('bank', amount)
    else
        senderPlayer = Framework.Functions.GetPlayer(src)
        if senderPlayer.PlayerData.money.bank < amount then return end
        senderPlayer.Functions.RemoveMoney('bank', amount)
    end

    -- add money to target if online
    for _, id in ipairs(GetPlayers()) do
        local target = tonumber(id)
        local targetPlayer = (Config.Framework == 'esx')
            and Framework.GetPlayerFromId(target)
            or Framework.Functions.GetPlayer(target)

        if targetPlayer then
            local targetNumber = targetPlayer.PlayerData.charinfo.phone
            if targetNumber == to then
                if Config.Framework == 'esx' then
                    targetPlayer.addAccountMoney('bank', amount)
                else
                    targetPlayer.Functions.AddMoney('bank', amount)
                end
            end
        end
    end

    MySQL.insert(
        'INSERT INTO phone_bank_logs (sender, receiver, amount) VALUES (?, ?, ?)',
        { from, to, amount }
    )
end)
