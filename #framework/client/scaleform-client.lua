--[[
    "~y~Test Banner~s~.", "You ~g~can ~r~use ~y~colors ~b~here ~s~too.", 5, true
]]

function ScaleformBanner(_title, _subtitle, _waitTime, _playSound)
    local showBanner = true
    local scale = 0
    if _playSound ~= nil and _playSound == true then
        PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
    end
    scale = ShowBanner(_title, _subtitle)
    Citizen.CreateThread(function()
        Citizen.Wait((tonumber(_waitTime) * 1000) - 400)
        Scaleform.CallFunction(scale, false, "SHARD_ANIM_OUT", 2, 0.4, 0)
        Citizen.Wait(400)
        showBanner = false
    end)
    Citizen.CreateThread(function()
        while showBanner do
            Citizen.Wait(1)
            DrawScaleformMovieFullscreen(scale, 255, 255, 255, 255)
        end
    end)
end

--[[
     "~y~Test Scaleform~s~.", "You ~g~can ~r~use ~y~colors ~b~here ~s~too.", 5, true
]]

function ScaleformMissionQuit(_title, _subtitle, _waitTime, _playSound)
    showMQ = true
    if _playSound ~= nil and _playSound == true then
        PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
    end
    showMissionQuit(_title, _subtitle, _waitTime)
    Citizen.CreateThread(function()
        Citizen.Wait(tonumber(_waitTime) * 1000)
        showMQ = false
    end)
end

--[[
    local slots = {
        {name = "test1", state = 0},
        {name = "test2", state = 1},
        {name = "test3", state = 2},
        {name = "test4", state = 3},
    }
]]

function ScaleformResultsPanel(_title, _subtitle, _slots, _waitTime, _playSound)
    local showRP = true
    local scale = 0
    if _playSound ~= nil and _playSound == true then
        PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
    end
    scale = ShowResultsPanel(_title, _subtitle, _slots)
    Citizen.CreateThread(function()
        Citizen.Wait(tonumber(_waitTime) * 1000)
        showRP = false
    end)
    Citizen.CreateThread(function()
        while showRP do
            DrawScaleformMovieFullscreen(scale, 255, 255, 255, 255)
            Citizen.Wait(1)
        end
    end)
end

--[[
    local data = {
        name = "Mission name",
        type = "Mission type",
        percentage = "15",
        rockstarVerified = true,
        playersRequired = "3",
        rp = 0,
        cash = 0,
        time = ""
    }
]]

function ScaleformMissionInfo(_data, _x, _y, _width, _waitTime, _playSound)
    showMI = true
    if _playSound ~= nil and _playSound == true then
        PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
    end
    ShowMissionInfoPanel(_data, _x, _y, _width)
    Citizen.CreateThread(function()
        Citizen.Wait(tonumber(_waitTime) * 1000)
        showMI = false
    end)
end

--[[
    "~y~Test Scaleform~s~.", 5, true
]]

function ScaleformSplashText(_title, _waitTime, _playSound)
    showST = true
    if _playSound ~= nil and _playSound == true then
        PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
    end
    ShowSplashText(_title, _waitTime * 1000)
    Citizen.CreateThread(function()
        Citizen.Wait(tonumber(_waitTime) * 1000)
        showST = false
    end)
end

--[[
    "~y~Test Scaleform~s~.", "You ~g~can ~r~use ~y~colors ~b~here ~s~too.", "ERROR 420: Scaleforms too hot.", 5, true
]]

function ScaleformPopupWarning(_title, _subtitle, _errorCode, _waitTime, _playSound)
    showPW = true
    if _playSound ~= nil and _playSound == true then
        PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
    end
    showPopupWarning(_title, _subtitle, _errorCode)
    Citizen.CreateThread(function()
        Citizen.Wait(tonumber(_waitTime) * 1000)
        showPW = false
    end)
end

--[[
    0, 150, 200, 10, true
]]

function ScaleformCountdown(_r, _g, _b, _waitTime, _playSound)
    local showCD = true
    local time = _waitTime
    local scale = 0
    if _playSound ~= nil and _playSound == true then
        PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
    end
    scale = showCountdown(time, _r, _g, _b)
    Citizen.CreateThread(function()
        while showCD do
            Citizen.Wait(1000)
            if time > 1 then
                time = time - 1
                scale = showCountdown(time, _r, _g, _b)
                PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
            elseif time == 1 then
                time = time - 1
                PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
                scale = showCountdown("GO", _r, _g, _b)
            else
                showCD = false
            end
        end
    end)
    Citizen.CreateThread(function()
        while showCD do
            Citizen.Wait(1)
            DrawScaleformMovieFullscreen(scale, 255, 255, 255, 255)
        end
    end)
end

--[[
    "~y~Test Scaleform~s~.", "You ~g~can ~r~use ~y~colors ~b~here ~s~too.", 2, 9, true
]]

function ScaleformMidsizeBanner(_title, subtitle, _bannerColor, _waitTime, _playSound)
    local showMidBanner = true
    local scale = 0
    if _playSound ~= nil and _playSound == true then
        PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
    end
    scale = showMidsizeBanner(_title, subtitle, _bannerColor)
    Citizen.CreateThread(function()
        Citizen.Wait((_waitTime * 1000) - 1000)
        Scaleform.CallFunction(scale, false, "SHARD_ANIM_OUT", 2, 0.3, true)
        Citizen.Wait(1000)
        showMidBanner = false
    end)
    Citizen.CreateThread(function()
        while showMidBanner do
            Citizen.Wait(1)
            DrawScaleformMovieFullscreen(scale, 255, 255, 255, 255)
        end
    end)
end

--[[
    "Test Role", "Name1 \n   Name 2", 0.4, 0.5, 8, true

    or

    Citizen.CreateThread(function()
        ScaleformCredits("Test Role", "Name1 \n   Name 2", 0.4, 0.5, 8, true)
        Citizen.Wait((10*1000))
        ScaleformCredits("Test Role", "Name3 \n   Name 4", 0.4, 0.5, 8, true)
    end)
]]

function ScaleformCredits(_role, _nameString, _x, _y, _waitTime, _playSound)
    showCreditsBanner = true
    if _playSound ~= nil and _playSound == true then
        PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
    end
    showCredits(_role, _nameString, _x, _y)
    Citizen.CreateThread(function()
        Citizen.Wait(tonumber(_waitTime) * 1000)
        showCreditsBanner = false
    end)
end

--[[
    local _initialText = { --first slide. Consists of 3 text lines.
        missionTextLabel = "~y~BANK HEIST~s~", 
        passFailTextLabel = "PASSED.",
        messageLabel = "I don't even know why we have a third message.",
    }

    local _table = { --second slide. You can add as many "stats" as you want. They will appear from botton to top, so keep that in mind.
        {stat = "Total Payout", value = "~g~$~s~50000"},
        --{stat = "value3", value = "~g~$~s~50000"},
        --{stat = "value2", value = "~b~1999~s~"},
        --{stat = "value1", value = "TEST"},
    }

    local _money = { --third slide. Incremental money. It will start from startMoney and increment to finishMoney. top and bottom text appear above/below the money string.
        startMoney = 3000,
        finishMoney = 53000,
        topText = "",
        bottomText = "",
        rightHandStat = "woah",
        rightHandStatIcon = 0, --0 or 1 = checked, 2 = X, 3 = no icon
    }

    local _xp = { --fourth and final slide. XP Bar slide. Will start with currentRank and a xp bar filled with (xpBeforeGain - minLevelXP) and will add xpGained. If you rank up, it goes to "Level Up" slide.
        xpGained = 500,
        xpBeforeGain = 1400,
        minLevelXP = 600,
        maxLevelXP = 2360,
        currentRank = 68,
        nextRank = 69,
        rankTextSmall = "LEVEL UP.",
        rankTextBig = "~b~Nice.~s~",
    }

    _initialText, _table, _money, _xp, 10, true
]]

function ScaleformHeistFinale(_initialText, _table, _money, _xp, _waitTime, _playSound)
    showHeistBanner = true
    if _playSound ~= nil and _playSound == true then
        PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
    end
    showHeist(_initialText, _table, _money, _xp)
    Citizen.CreateThread(function()
        Citizen.Wait(tonumber(_waitTime) * 1000)
        showHeistBanner = false
    end)
end

--[[
    'Test', 1, 7, true
]]

function ScaleformSaving(_subtitle, _type, _waitTime, _playSound)
    if _playSound ~= nil and _playSound == true then
        PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
    end
    if _type == 1 then
        toggleSave = true
        showSaving(_subtitle)
    else
        showBusySpinnerNoScaleform(_subtitle)
    end
    Citizen.CreateThread(function()
        Citizen.Wait(tonumber(_waitTime) * 1000)
        if _type == 1 then
            toggleSave = false
        else
            BusyspinnerOff()
        end
    end)
end

--[[
    7, true
]]

function ScaleformShutter(_waitTime, _playSound)
    local showBanner = true
    local scale = 0
    if _playSound ~= nil and _playSound == true then
        PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
    end
    scale = showShutter()
    Citizen.CreateThread(function()
        Citizen.Wait((tonumber(_waitTime) * 1000) - 1000)
        Scaleform.CallFunction(scale, false, "CLOSE_THEN_OPEN_SHUTTER")
        Wait(1000)
        showBanner = false
    end)
    Citizen.CreateThread(function()
        while showBanner do
            Citizen.Wait(1)
            DrawScaleformMovieFullscreen(scale, 255, 255, 255, 255)
        end
    end)
end

function ScaleformWarehouse(_waitTime, _playSound)
    local showBanner = true
    local scale = 0
    if _playSound ~= nil and _playSound == true then
        PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
    end
    scale = showWarehouse()
    Citizen.CreateThread(function()
        Citizen.Wait(2000)
        --Scaleform.CallFunction(scale, false, "SET_INPUT_EVENT", 2)
        
        Citizen.Wait(2000)
        local ret = Scaleform.CallFunction(scale, true, "GET_CURRENT_SELECTION") --we get the scaleform return
        while true do
            if IsScaleformMovieMethodReturnValueReady(ret) then --scaleform takes it's sweet time, so we need to wait for the value to be registered, or calculated or something, idk
                selectID = GetScaleformMovieMethodReturnValueInt(ret) --output value. Can be Int, String or Bool. In my case is Int, and it's the "slotID" value that you set with Scaleform.CallFunction(scaleform, false, "DISPLAY_VIEW", viewID, slotID)
                print(selectID)
                break
            end
            Citizen.Wait(0)
        end
        Citizen.Wait((tonumber(_waitTime) * 1000) - 4000)
        showBanner = false
    end)
    Citizen.CreateThread(function()
        while showBanner do
            Citizen.Wait(1)
            DrawScaleformMovieFullscreen(scale, 255, 255, 255, 255)
        end
    end)
end

--[[
    tonumber(args[1]), 20
]]

function ScaleformMusicStudioMonitor(_state, _waitTime)
    local showMonitor = true
    local scale = 0

    scale = showMusicStudioMonitor(_state)

    Citizen.CreateThread(function()
        Citizen.Wait(_waitTime * 1000)
        showMonitor = false
    end)

    Citizen.CreateThread(function()
        while showMonitor do
            Citizen.Wait(1)
            DrawScaleformMovieFullscreen(scale, 255, 255, 255, 255)
        end
    end)
end

--[[
    "_title", "_subtitle", "_textblock", "v_73_fib01_txd", "xj_v_fibscreen", false, 7, true
]]

function ScaleformGameFeed(_title, _subtitle, _textblock, _textureDict, _textureName, _rightAlign, _waitTime, _playSound)
    local showBanner = true
    local scale = 0
    if _playSound ~= nil and _playSound == true then
        PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
    end
    scale = showGameFeed(_title, _subtitle, _textblock, _textureDict, _textureName, _rightAlign)
    Citizen.CreateThread(function()
        Citizen.Wait(_waitTime * 1000)
        showBanner = false
    end)
    Citizen.CreateThread(function()
        while showBanner do
            Citizen.Wait(1)
            DrawScaleformMovieFullscreen(scale, 255, 255, 255, 255)
        end
    end)
end