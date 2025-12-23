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
