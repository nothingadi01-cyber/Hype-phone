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
