function openContactsMenu(scaleform, contacts, selectID, title)
    AddPlayerContacts()
    SetMobilePhoneRotation(-90.0,0.0,0.0) -- 75<X<75
    SetPhoneLean(false)
    Scaleform.CallFunction(scaleform, false, "SET_HEADER", title)
    Scaleform.CallFunction(scaleform, false, "SET_DATA_SLOT_EMPTY", 2)
    Scaleform.CallFunction(scaleform, false, "SET_SOFT_KEYS", 1, false, 4)
    Scaleform.CallFunction(scaleform, false, "SET_SOFT_KEYS", 2, true, 5)
    Scaleform.CallFunction(scaleform, false, "SET_SOFT_KEYS", 3, true, 4)
    Scaleform.CallFunction(scaleform, false, "SET_DATA_SLOT", 2, i, 0, "TEST", "", "")
    for i,k in pairs(contacts) do
        Scaleform.CallFunction(scaleform, false, "SET_DATA_SLOT", 2, i, 0, k.name, "", k.pic)
    end

    Scaleform.CallFunction(scaleform, false, "DISPLAY_VIEW", 2, selectID)
end

AddEventHandler('scalePhone.HandleInput.contacts', function(input)
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
        if apps[appOpen].buttons[appSelectID] ~= nil then
            if (apps[appOpen].buttons[appSelectID][1] == 99999) then
                AddContactForm()
            elseif (apps[appOpen].buttons[appSelectID][1] == 99998) then
                RemoveContactForm()
            elseif (apps[appOpen].buttons[appSelectID][1] == 99997) then
                EditContactForm(Config.id)
            elseif (apps[appOpen].buttons[appSelectID][1] == 99996) then
                CallAdmin()
            else
                print(apps[appOpen].buttons[appSelectID][1])
            end
        end
    elseif input == 'back' then
        CellCamMoveFinger(5)
        RemovePlayerContacts()
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

