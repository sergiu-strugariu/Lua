function p(table)
    return print(json.encode(table, {indent=true}))
end

function GetPlayerId()
    local id = TriggerServerCallback {
        eventName = 'framework:GetPlayerId',
        args = {}
    }

    return id
end

function GetPlayerIdentifierById(id)
    local identifier = TriggerServerCallback {
        eventName = 'framework:GetPlayerIdentifierById', 
        args = {id}
    }

    return identifier
end

function GetPlayerNameById(id)
    local playerName = TriggerServerCallback {
        eventName = 'framework:GetPlayerNameById',
        args = {id}
    }

    return playerName
end

function GetPlayerWhitelistById(id)
    local playerWhitelisted = TriggerServerCallback {
        eventName = 'framework:GetPlayerWhitelistById',
        args = {id}
    }

    return playerWhitelisted
end

function GetPlayerBannedById(id)
    local playerBanned = TriggerServerCallback {
        eventName = 'framework:GetPlayerBannedById',
        args = {id}
    }

    return playerBanned
end

function GetPlayerIdById(id)
    local playerId = TriggerServerCallback {
        eventName = 'framework:GetPlayerIdById',
        args = {id}
    }

    return playerId
end

function GetIdByPlayerId(id)
    local id = TriggerServerCallback {
        eventName = 'framework:GetIdByPlayerId',
        args = {id}
    }

    return id
end

function GetPlayerCashById(id)
    local cash = TriggerServerCallback {
        eventName = 'framework:GetPlayerCashById',
        args = {id}
    }

    return cash
end

function GetPlayerCashByPlayerId(id)
    local cash = TriggerServerCallback {
        eventName = 'framework:GetPlayerCashByPlayerId',
        args = {id}
    }

    return cash
end

function GetPlayerBankById(id)
    local cash = TriggerServerCallback {
        eventName = 'framework:GetPlayerBankById',
        args = {id}
    }

    return cash
end

function GetPlayerBankByPlayerId(id)
    local cash = TriggerServerCallback {
        eventName = 'framework:GetPlayerBankByPlayerId',
        args = {id}
    }

    return cash
end

function SetPlayerMoneyById(id, cash, bank)
    local money = TriggerServerCallback {
        eventName = 'framework:SetPlayerMoneyById',
        args = {id, cash, bank}
    }
    updateHudMoney()
    return money
end

function SetPlayerMoneyByIdentifier(identifier, cash, bank)
    local money = TriggerServerCallback {
        eventName = 'framework:SetPlayerMoneyByIdentifier',
        args = {identifier, cash, bank}
    }
    updateHudMoney()
    return money
end

function SetPlayerMoneyByPlayerId(id, cash, bank)
    local money = TriggerServerCallback {
        eventName = 'framework:SetPlayerMoneyByPlayerId',
        args = {id, cash, bank}
    } 
    updateHudMoney()
    return money
end

function AddPlayerCashById(id, cash)
    local addMoney = TriggerServerCallback {
        eventName = 'framework:AddPlayerCashById',
        args = {id, cash}
    }
    updateHudMoney()
    return addMoney
end

function AddPlayerBankById(id, bank)
    local addMoney = TriggerServerCallback {
        eventName = 'framework:AddPlayerBankById',
        args = {id, bank}
    }
    updateHudMoney()
    return addMoney
end

function AddPlayerMoneyById(id, cash, bank)
    local addMoney = TriggerServerCallback {
        eventName = 'framework:AddPlayerMoneyById',
        args = {id, cash, bank}
    }
    updateHudMoney()
    return addMoney
end

function AddPlayerMoneyByIdentifier(identifier, cash, bank)
    local addMoney = TriggerServerCallback {
        eventName = 'framework:AddPlayerMoneyByIdentifier',
        args = {identifier, cash, bank}
    }
    updateHudMoney()
    return addMoney
end

function RemovePlayerMoneyById(id, cash, bank)
    local removeMoney = TriggerServerCallback {
        eventName = 'framework:RemovePlayerMoneyById',
        args = {id, cash, bank}
    }
    
    updateHudMoney()
    return removeMoney
end

function RemovePlayerMoneyByIdentifier(identifier, cash, bank)
    local removeMoney = TriggerServerCallback {
        eventName = 'framework:RemovePlayerMoneyByIdentifier',
        args = {identifier, cash, bank}
    }

    updateHudMoney()
    return removeMoney
end

function updateHudMoney()
    Wait(500)
    local cash = exports.framework:GetPlayerCashById(GetPlayerId())
    local bank = exports.framework:GetPlayerBankById(GetPlayerId())

    StatSetInt(Config.type.cash, cash, true)
    StatSetInt(Config.type.bank, bank, true)
    PlaySoundFrontend(-1, "FocusIn", "HintCamSounds", 1)
end

function GetPlayerRankById(id)
    local rank = TriggerServerCallback {
        eventName = 'framework:GetPlayerRankById',
        args = {id}
    }

    return rank
end

function GetPlayerRankByIdentifier(identifier)
    local rank = TriggerServerCallback {
        eventName = 'framework:GetPlayerRankByIdentifier',
        args = {identifier}
    }

    return rank
end

function GetPlayerRankByPlayerId(id)
    local rank = TriggerServerCallback {
        eventName = 'framework:GetPlayerRankByPlayerId',
        args = {id}
    }

    return rank
end

function GetPlayerRankPointsById(id)
    local rankPoints = TriggerServerCallback {
        eventName = 'framework:GetPlayerRankPointsById',
        args = {id}
    }

    return rankPoints
end

function GetPlayerRankPointsByIdentifier(identifier)
    local rankPoints = TriggerServerCallback {
        eventName = 'framework:GetPlayerRankPointsByIdentifier',
        args = {identifier}
    }

    return rankPoints
end

function GetPlayerRankPointsByPlayerId(id)
    local rankPoints = TriggerServerCallback {
        eventName = 'framework:GetPlayerRankPointsByPlayerId',
        args = {id}
    }

    return rankPoints
end

function GetPlayerRankStatsById(id, status)
    local rankStatus = TriggerServerCallback {
        eventName = 'framework:GetPlayerRankStatsById',
        args = {id, status}
    }
    
    return rankStatus
end

function GetPlayerRankStatsByIdentifier(identifier, status)
    local rankStatus = TriggerServerCallback {
        eventName = 'framework:GetPlayerRankStatsByIdentifier',
        args = {identifier, status}
    }
    
    return rankStatus
end

function GetPlayerRankStatsByPlayerId(id, status)
    local rankStatus = TriggerServerCallback {
        eventName = 'framework:GetPlayerRankStatsByPlayerId',
        args = {id, status}
    }
    
    return rankStatus
end

function AddPlayerRankById(id, rank)
    local rank = TriggerServerCallback {
        eventName = 'framework:AddPlayerRankById',
        args = {id, rank}
    }
    ScaleformSaving('Saving', 1, 7, true)
    return rank
end

function AddPlayerRankPointsById(id, rankPoints)
    local rankPoints = TriggerServerCallback {
        eventName = 'framework:AddPlayerRankPointsById',
        args = {id, rankPoints}
    }
    
    return rankPoints
end

-- Phone

function GetPlayerPhoneContacts(id)
    local contacts = TriggerServerCallback {
        eventName = 'framework:GetPlayerPhoneContacts',
        args = {id}
    }

    return contacts
end

function GetPlayerPhoneMessages(id)
    local contacts = TriggerServerCallback {
        eventName = 'framework:GetPlayerPhoneMessages',
        args = {id}
    }

    return contacts
end

function AddPlayerPhoneContact(player_id, identifier, contact_name, contact_id, contact_identifier)
    local addContact = TriggerServerCallback {
        eventName = 'framework:AddPlayerPhoneContact',
        args = {player_id, identifier, contact_name, contact_id, contact_identifier}
    }
    
    return addContact
end

function RemovePlayerPhoneContact(id, contact_name)
    local removeContact = TriggerServerCallback {
        eventName = 'framework:RemovePlayerPhoneContact',
        args = {id, contact_name}
    }

    return removeContact
end

function EditPlayerPhoneContact(id, contact_name, contact_new_name)
    local editContact = TriggerServerCallback {
        eventName = 'framework:EditPlayerPhoneContact',
        args = {id, contact_name, contact_new_name}
    }

    return editContact
end