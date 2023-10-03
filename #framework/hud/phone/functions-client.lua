AddEventHandler("scalePhone.ChangePhoneTheme", function(_data)
    if _data.themeID ~= nil then
        themeID = _data.themeID
        if isPhoneActive then
            phoneScaleform = generateMainPhone(apps[0].buttons, selectID, themeID)
            appOpen = 0
        end
    end
end)

AddEventHandler("scalePhone.TogglePhoneSleepMode", function()
    sleepMode = not sleepMode
    Scaleform.CallFunction(phoneScaleform, false, "SET_SLEEP_MODE", sleepMode)
    TriggerEvent('scalePhone.Event.SleepModeChanged', sleepMode)
end)

blacklistID = {
    
}

typeDetails = {
    ['homepage'] = {id = 1, isLeftToRight = true},
    ['contacts'] = {id = 2, isLeftToRight = false},
    ['callscreen'] = {id = 4, isLeftToRight = false},
    ['messagesList'] = {id = 6, isLeftToRight = false},
    ['messageView'] = {id = 7, isLeftToRight = false},
    ['emailList'] = {id = 8, isLeftToRight = false},
    ['emailView'] = {id = 9, isLeftToRight = false},
    ['menu'] = {id = 18, isLeftToRight = false},
    ['snapmatic'] = {id = 16, isLeftToRight = true},
    ['todoList'] = {id = 14, isLeftToRight = false},
    ['todoView'] = {id = 15, isLeftToRight = false},
    ['missionStatsView'] = {id = 19, isLeftToRight = false},
    ['numpad'] = {id = 11, isLeftToRight = true},
    ['gps'] = {id = 24, isLeftToRight = false},
    ['trackifyView'] = {id = 23, isLeftToRight = false},
    ['securoHack'] = {id = 27, isLeftToRight = false},
    ['settings'] = {id = 22, isLeftToRight = false},
    ['tv'] = {id = -1, isLeftToRight = false},
}

function RemoveNotifications(appID)
    for i,k in pairs(apps[0].buttons) do
        if appID == k.appID then
            k.notif = 0
        end
    end
end

function getAppOpen(isLast)
    local retval = appOpen
    if isLast ~= nil and isLast == true then
        retval = lastAppOpen
    end
    return retval
end

function sleepModeStatus()
    return sleepMode
end

function findButtonIdUsingData(appID, dataSample) --this approach might get....ummm....laggy.
    if apps[appID] ~= nil then
        if apps[appID].buttons ~= nil then
            local id = nil
            for i,k in pairs(apps[appID].buttons) do
                if k.eventParams ~= nil then
                    if type(k.eventParams) == 'table' and type(dataSample) ~= 'table' then
                        for j,v in pairs(k.eventParams) do
                            if v == dataSample then
                                id = i
                                break
                            end
                        end
                    elseif type(k.eventParams) ~= 'table' and type(dataSample) ~= 'table' then
                        if k.eventParams == dataSample then
                            id = i
                            break
                        end
                    elseif type(k.eventParams) == 'table' and type(dataSample) == 'table' then
                        if k.eventParams == dataSample then
                            id = i
                            break
                        end
                    end
                end
            end
            if id ~= nil then
                return id
            else
                print('[[  ::  ERROR  ::  WE COULD NOT FIND YOUR BUTTON ID. MAKE SURE THE SAMPLE DATA MATCHES ANY VALUE IN "eventParams" OR IS EQUAL TO "eventParams"  ::  ]]')
            end
        end
    else
        print('[[  ::  ERROR  ::  INVALID APP ID WHEN SEARCHING FOR A BUTTON ID  ::  ]]')
    end
end

function reorderAppButtons(appID)
    local row = 0
    local placeholder = {}
    local IsFirstItemANill = false
    if apps[appID].buttons[0] ~= nil then
        IsFirstItemANill = false
    else
        IsFirstItemANill = true
    end
    for i,k in pairs(apps[appID].buttons) do
        if apps[appID].buttons[i] ~= nil then
            placeholder[row] = apps[appID].buttons[i]
            row = row + 1
        else
            if i == 0 then
                IsFirstItemANill = true
            end
        end
    end
    if IsFirstItemANill == false then
        for i = #placeholder, 0, -1 do
            placeholder[i+1] = placeholder[i]
        end
        placeholder[0] = placeholder[#placeholder]
        placeholder[#placeholder] = nil
    end

    apps[appID].buttons = placeholder
end

function setPhoneDimensions(text, scale, x, y, z)
    local _scale = 250.0
    local _pos = {x = 47.0, y = -22.0, z = -60.0}
    if text == "default" then
    elseif text == "huge" then
        _scale = 400.0
        _pos.y = -14.0
        _pos.x = 46.0
    elseif text == "large" then
        _scale = 300.0
        _pos.y = -20.0
    elseif text == "small" then
        _scale = 200.0
        _pos.y = -24.0
    elseif text == "custom" then
        if tonumber(scale) ~= nil and tonumber(x) ~= nil and tonumber(y) ~= nil and tonumber(z) ~= nil then
            _scale = tonumber(scale) + 0.0
            _pos.x = tonumber(x) + 0.0
            _pos.y = tonumber(y) + 0.0
            _pos.z = tonumber(z) + 0.0
        else
            print('[  ::  ERROR IN setPhoneDimensions  ::  Missing scale, x, y and z NUMBER parameters. Setting phone dimensions to "default"  ::  ]')
            print('[  ::  WARNING IN setPhoneDimensions  ::  Correct syntax: setPhoneDimensions(text, scale, x, y, z) : text = "default", "custom", "small", "large", "huge" ::  ]')
            print('[  ::  WARNING IN setPhoneDimensions  ::  `scale`, `x`, `y`, `z` params are only used when `text` = "custom" ::  ]')
        end
    else
        print('[  ::  ERROR IN setPhoneDimensions  ::  unknown `text` parameter. Setting phone dimensions to "default"  ::  ]')
        print('[  ::  WARNING IN setPhoneDimensions  ::  Correct syntax: setPhoneDimensions(text, scale, x, y, z) : text = "default", "custom", "small", "large", "huge" ::  ]')
        print('[  ::  WARNING IN setPhoneDimensions  ::  `scale`, `x`, `y`, `z` params are only used when `text` = "custom" ::  ]')
    end
    phoneScale = _scale
    phonePos = _pos
    SetMobilePhonePosition(phonePos.x, phonePos.y, phonePos.z)
end

function getPhoneDimensions()
    return phoneScale, phonePos.x, phonePos.y, phonePos.z
end

function isPhoneOpened()
    return isPhoneActive
end

function shouldPhoneBeOpened(bool)
    if bool == true or bool == false then
        canPhoneBeOpened = bool
    else
        print('[  ::  ERROR IN shouldPhoneBeOpened  ::  Parameter should be a boolean. (either `true` or `false`)  ::  ]')
    end
end

function canPhoneBeOpened()
    return canPhoneBeOpened
end

function AddPlayerContacts() -- Show all contacts in phone
    local contacts = GetPlayerPhoneContacts(Config.player_id) 
            
    if contacts ~= nil and #contacts > 0 then
        for i,k in pairs(contacts) do
            data = {name = k.contact_name, k.id, pic = "CHAR_BLANK_ENTRY"}
            table.insert(apps[1]['buttons'], data)
        end
    elseif contacts ~= nil and #contacts == 0 then
        data = {name = contacts.contact_name, contacts.id, pic = "CHAR_BLANK_ENTRY"}
        table.insert(apps[1]['buttons'], data)
    end
end

function RemovePlayerContacts() -- Remove all contacts from phone after closing the phone app
    local contacts = GetPlayerPhoneContacts(Config.id)
    local keys = get_keys(apps[1]['buttons'])

    if contacts ~= nil and #contacts > 0 then
        for _,v in pairs(keys) do
            if v > 3 then
                table.remove(apps[1]['buttons'])
            end
        end
    else
        for _,v in pairs(keys) do
            if v > 3 then
                table.remove(apps[1]['buttons'])
            end
        end
    end
end

function RemovePlayerMessages()
    local messages = GetPlayerPhoneMessages(Config.player_id)
    local keys = get_keys(apps[2]['buttons'])

    if messages ~= nil and #messages > 0 then
        for _,v in pairs(keys) do
            if v > 1 then
                table.remove(apps[2]['buttons'])
            end
        end
    else
        for _,v in pairs(keys) do
            if v > 1 then
                table.remove(apps[2]['buttons'])
            end
        end
    end
end

function AddPlayerMessages() -- Show all messages in phone
    local messages = GetPlayerPhoneMessages(Config.player_id)

    if messages ~= nil and #messages > 0 then
        for i,k in pairs(messages) do
            button = {appID = 4, id = 4, isLeftToRight = false, type = "messageView", name = "Mesaj",icon = 0, notif = 0, openEvent = "", backEvent = "scalePhone.GoBackApp", 
                data = {
                    contact = k.sender_name, 
                    message = k.sender_message, 
                    canOpenMenu = true, 
                    selectEvent = 'scalePhone.BuildMessageView', 
                    isentthat = false
                },
                buttons = {
                    contact = k.sender_name,
                    message = k.sender_message,
                    h = GetClockHours(),
                    m = GetClockMinutes(),
                }
            }
            table.insert(apps[2]['buttons'], button)
        end
    elseif messages ~= nil and #messages == 0 then
        button = {appID = 4, id = 4, isLeftToRight = false, type = "messageView", name = "Mesaj",icon = 0, notif = 0, openEvent = "", backEvent = "scalePhone.GoBackApp", 
            data = {
                contact = messages.sender_name, 
                message = messages.sender_message, 
                canOpenMenu = true, 
                selectEvent = 'scalePhone.BuildMessageView', 
                isentthat = false
            },
            buttons = {
                contact = messages.sender_name,
                message = messages.sender_message,
                h = GetClockHours(),
                m = GetClockMinutes(),
            }
        }
        table.insert(apps[2]['buttons'], button)
    end
end

function AddContactForm() -- Create new contact for player
    DisplayOnscreenKeyboard(1,"FMMC_KEY_TIP8", "", "Prenume", "", "", "", 99)
    contact_name_form = true
    while contact_name_form do
        Wait(256)
        DisableAllControlActions(0)
        HideHudAndRadarThisFrame()
        if UpdateOnscreenKeyboard() == 1 then
            contact_name = GetOnscreenKeyboardResult()

            if string.len(contact_name) < 3 then
                print('nume prea mic')
                contact_name_form = false 
            end

            if string.len(contact_name) > 3 then
                contact_name_form = false 
                contact_id_form = true
                DisplayOnscreenKeyboard(0,"FMMC_KEY_TIP8", "", "0", "", "", "", 99)
                while contact_id_form do 
                    Wait(256)
                    DisableAllControlActions(0)
                    HideHudAndRadarThisFrame()

                    if UpdateOnscreenKeyboard() == 1 then
                        contact_id = GetOnscreenKeyboardResult()

                        if tonumber(contact_id) < 1 then
                            print('id prea mic')
                            contact_id_form = false
                        end

                        if GetPlayerIdentifierById(contact_id) ~= nil then
                            player_identifier = GetPlayerIdentifierById(Config.id)
                            player_id = Config.player_id
                            contact_identifier = GetPlayerIdentifierById(contact_id)
                            AddPlayerPhoneContact(player_id, player_identifier, contact_name, contact_id, contact_identifier)
                        else
                            print('jucatorul nu exista')
                            contact_id_form = false
                        end
                        contact_id_form = false
                    end
                end
            end
        end
    end
end

function RemoveContactForm() -- Remove contact from player
    DisplayOnscreenKeyboard(1,"FMMC_KEY_TIP8", "", "Prenume", "", "", "", 99)
    local id = Config.player_id
    contact_name_form = true
    while contact_name_form do
        Wait(256)
        DisableAllControlActions(0)
        HideHudAndRadarThisFrame()
        if UpdateOnscreenKeyboard() == 1 then
            contact_name = GetOnscreenKeyboardResult()
            if string.len(contact_name) < 3 then
                print('nume prea mic')
                contact_name_form = false 
            end

            if string.len(contact_name) > 3 then
                RemovePlayerPhoneContact(id, contact_name)
                contact_name_form = false 
            end
        end
    end
end

function EditContactForm()
    DisplayOnscreenKeyboard(1,"FMMC_KEY_TIP8", "", "Nume contact", "", "", "", 99)
    contact_name_form = true
    while contact_name_form do
        Wait(256)
        DisableAllControlActions(0)
        HideHudAndRadarThisFrame()
        if UpdateOnscreenKeyboard() == 1 then
            contact_name = GetOnscreenKeyboardResult()

            if string.len(contact_name) < 3 then
                print('nume prea mic')
                contact_name_form = false 
            end

            if string.len(contact_name) > 3 then
                contact_name_form = false 
                contact_id_form = true
                DisplayOnscreenKeyboard(0,"FMMC_KEY_TIP8", "", "Nume nou", "", "", "", 99)
                while contact_id_form do 
                    Wait(256)
                    DisableAllControlActions(0)
                    HideHudAndRadarThisFrame()

                    if UpdateOnscreenKeyboard() == 1 then
                        contact_new_name = GetOnscreenKeyboardResult()

                        if string.len(contact_name) < 3 then
                            print('nume prea mic')
                            contact_name_form = false 
                        end

                        if (contact_new_name ~= nil) then
                            EditPlayerPhoneContact(Config.player_id, contact_name, contact_new_name)
                        else
                            print('jucatorul nu exista')
                            contact_id_form = false
                        end
                        contact_id_form = false
                    end
                end
            end
        end
    end
end