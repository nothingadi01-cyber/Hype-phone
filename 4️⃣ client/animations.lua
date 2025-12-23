function PlayPhoneAnim()
    RequestAnimDict(Config.PhoneAnim.dict)
    while not HasAnimDictLoaded(Config.PhoneAnim.dict) do
        Wait(10)
    end
    TaskPlayAnim(PlayerPedId(),
        Config.PhoneAnim.dict,
        Config.PhoneAnim.anim,
        8.0, -8.0, -1, 50, 0, false, false, false)
end

function StopPhoneAnim()
    ClearPedTasks(PlayerPedId())
end
