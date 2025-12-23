Config = {}

-- Framework: 'esx' or 'qb'
Config.Framework = 'esx'

-- Phone item name
Config.PhoneItem = 'phone'

-- Phone usable only in MLO?
Config.MLOOnly = true

-- Allowed MLO zones
Config.MLOZones = {
    {
        coords = vector3(-656.12, -858.32, 24.5),
        radius = 6.0
    }
}

-- Keybind
Config.OpenKey = 'P'

-- Animations
Config.PhoneAnim = {
    dict = 'cellphone@',
    anim = 'cellphone_text_read_base'
}
Config.Sound = {
    DefaultVolume = 0.5,
    Ringtones = {
        'ringtone',
        'ringtone2',
        'ringtone3'
    }
}

Config.Animations = {
    open = { dict = 'cellphone@', anim = 'cellphone_text_in' },
    idle = { dict = 'cellphone@', anim = 'cellphone_text_read_base' },
    close = { dict = 'cellphone@', anim = 'cellphone_text_out' },
    call = { dict = 'cellphone@', anim = 'cellphone_call_listen_base' },
    camera = { dict = 'cellphone@self', anim = 'selfie' }
}
Config.JobApps = {
    police = {
        apps = {'dispatch', 'panic', 'gps'},
        canSee = {'police'}
    },
    ambulance = {
        apps = {'dispatch', 'panic', 'gps'},
        canSee = {'ambulance'}
    },
    gang = {
        apps = {'gangchat', 'darkweb'},
        canSee = {'gang'}
    }
}
Config.AppStore = {
    Apps = {
        { name = 'chat', label = 'Messages', free = true },
        { name = 'bank', label = 'Bank', free = true },
        { name = 'camera', label = 'Camera', free = true },
        { name = 'gallery', label = 'Gallery', free = true },
        { name = 'dispatch', label = 'Dispatch', job = 'police' },
        { name = 'darkweb', label = 'Dark Web', job = 'gang' },
        { name = 'crypto', label = 'Crypto', premium = true }
    }
}
