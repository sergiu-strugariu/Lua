function openMessagesMenu(scaleform, messages, selectID, title)
    RemovePlayerMessages()
    AddPlayerMessages()
    SetMobilePhoneRotation(-90.0,0.0,0.0) -- 75<X<75
    SetPhoneLean(false)
    Scaleform.CallFunction(scaleform, false, "SET_HEADER", title)
    Scaleform.CallFunction(scaleform, false, "SET_DATA_SLOT_EMPTY", 6)
    Scaleform.CallFunction(scaleform, false, "SET_SOFT_KEYS", 1, false, 4)
    Scaleform.CallFunction(scaleform, false, "SET_SOFT_KEYS", 2, true, 10)
    Scaleform.CallFunction(scaleform, false, "SET_SOFT_KEYS", 3, true, 4)
    for i,k in pairs(messages) do
        local var = ""
        if k.isentthat == true then
            var = "To: "
        end
        
        Scaleform.CallFunction(scaleform, false, "SET_DATA_SLOT", 6, i, messages[i].buttons.h, messages[i].buttons.m, messages[i].buttons.contact, messages[i].buttons.message)
    end
    Scaleform.CallFunction(scaleform, false, "DISPLAY_VIEW", 6, selectID)
end

AddEventHandler('scalePhone.HandleInput.messagesList', function(input)
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
        CellCamMoveFinger(5)
        if apps[appOpen].buttons[appSelectID].data ~= nil and apps[appOpen].buttons[appSelectID].data.canOpenMenu == true and apps[appOpen].buttons[appSelectID].data.selectEvent ~= nil then
            apps[4].data = apps[appOpen].buttons[appSelectID].data
            TriggerEvent('scalePhone.OpenApp', apps[appOpen].buttons[selectID].appID, false)
        end
    elseif input == 'back' then
        CellCamMoveFinger(5)
        RemovePlayerMessages()
        TriggerEvent(apps[appOpen].backEvent, apps[appOpen].data, false)
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