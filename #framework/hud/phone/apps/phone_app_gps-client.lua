function openGPSView(scaleform, title)
    SetMobilePhoneRotation(-90.0,0.0,0.0) -- 75<X<75
    SetPhoneLean(false)
    Scaleform.CallFunction(scaleform, false, "SET_HEADER", title)

    local zone = "Loading..."
    local ped = PlayerPedId()
    local coords = {x = "...", y = "...", z = "..."}
    Scaleform.CallFunction(scaleform, false, "SET_DATA_SLOT", 24, 0, 1, zone, '', coords.x, '', coords.y, '', coords.z)

    Scaleform.CallFunction(scaleform, false, "SET_SOFT_KEYS", 1, false, 4)
    Scaleform.CallFunction(scaleform, false, "SET_SOFT_KEYS", 2, false, 9)
    Scaleform.CallFunction(scaleform, false, "SET_SOFT_KEYS", 3, true, 4)

    Scaleform.CallFunction(scaleform, false, "DISPLAY_VIEW", 24, 0)
    local app = appOpen
    while app == appOpen do
        coords = GetEntityCoords(ped)
        zone = GetLabelText(GetNameOfZone(coords.x,coords.y,coords.z))
        if zone ~= "NULL" then
            Scaleform.CallFunction(scaleform, false, "SET_DATA_SLOT", 24, 0, 1, zone, 0, string.format("%.2f", coords.x), 0, string.format("%.2f", coords.y), 0, string.format("%.2f", coords.z))
        else
            zone = "Location Unknown"
            Scaleform.CallFunction(scaleform, false, "SET_DATA_SLOT", 24, 0, 1, zone, 6, string.format("%.2f", coords.x), 6, string.format("%.2f", coords.y), 6, string.format("%.2f", coords.z))
        end
        Scaleform.CallFunction(scaleform, false, "DISPLAY_VIEW", 24, 0)
        Citizen.Wait(500)
    end
end

AddEventHandler('scalePhone.HandleInput.gps', function(input)
    if input == "left" then
        CellCamMoveFinger(4)
        Scaleform.CallFunction(phoneScaleform, false, "SET_INPUT_EVENT", 4)
    elseif input == 'right' then
        CellCamMoveFinger(3)
        Scaleform.CallFunction(phoneScaleform, false, "SET_INPUT_EVENT", 2)
    elseif input == 'up' then
        CellCamMoveFinger(1)
        Scaleform.CallFunction(phoneScaleform, false, "SET_INPUT_EVENT", 1)
    elseif input == 'down' then
        CellCamMoveFinger(2)
        Scaleform.CallFunction(phoneScaleform, false, "SET_INPUT_EVENT", 3)
    elseif input == 'select' then
    elseif input == 'back' then
        CellCamMoveFinger(5)
        TriggerEvent(apps[appOpen].backEvent, apps[appOpen].data)
    end

    local ret = Scaleform.CallFunction(phoneScaleform, true, "GET_CURRENT_SELECTION")
    while true do
        if IsScaleformMovieMethodReturnValueReady(ret) then
            appSelectID = GetScaleformMovieMethodReturnValueInt(ret) --output
            break
        end
        Citizen.Wait(0)
    end
end)
