RegisterNUICallback('takePhoto', function()
    exports['screenshot-basic']:requestScreenshotUpload(
        'http://localhost/upload', 'files[]',
        function(data)
            local image = json.decode(data).files[1].url
            TriggerServerEvent('lb-phone:savePhoto', image)
            SendNUIMessage({ action = 'photoSaved', image = image })
        end
    )
end)

RegisterNUICallback('loadGallery', function(data, cb)
    TriggerServerEvent('lb-phone:getPhotos', cb)
end)
PhoneCameraAnim()
