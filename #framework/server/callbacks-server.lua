
-- Players

RegisterServerCallback {
    eventName = 'framework:GetPlayerId',
    eventCallback = function(source)
        for k, identifier in pairs(GetPlayerIdentifiers(source))do
            if string.sub(identifier, 1, string.len("license:")) == "license:" then
                return exports.framework:GetPlayerIdByIdentifier(identifier)
            end
        end
    end
}
 
RegisterServerCallback {
    eventName = 'framework:GetPlayerIdentifierById', 
    eventCallback = function(source, id)
        return exports.framework:GetPlayerIdentifierById(id) 
    end
}

RegisterServerCallback {
    eventName = 'framework:GetPlayerNameById',
    eventCallback = function(source, id)
        return exports.framework:GetPlayerNameById(id)
    end
}

RegisterServerCallback {
    eventName = 'framework:GetPlayerWhitelistById',
    eventCallback = function(source, id)
        return exports.framework:GetPlayerWhitelistById(id)
    end
}

RegisterServerCallback {
    eventName = 'framework:GetPlayerBannedById',
    eventCallback = function(source, id)
        return exports.framework:GetPlayerBannedById(id)
    end
}

-- Economy

RegisterServerCallback {
    eventName = 'framework:GetPlayerIdById',
    eventCallback = function(source, id)
        return exports.framework:GetPlayerIdById(id)
    end
}

RegisterServerCallback {
    eventName = 'framework:GetIdByPlayerId',
    eventCallback = function(source, id)
        return exports.framework:GetIdByPlayerId(id)
    end
}

RegisterServerCallback {
    eventName = 'framework:GetPlayerCashById',
    eventCallback = function(source, id)
        return exports.framework:GetPlayerCashById(id)
    end
}

RegisterServerCallback {
    eventName = 'framework:GetPlayerCashByPlayerId',
    eventCallback = function(source, id)
        return exports.framework:GetPlayerCashByPlayerId(id)
    end
}

RegisterServerCallback {
    eventName = 'framework:GetPlayerBankById',
    eventCallback = function(source, id)
        return exports.framework:GetPlayerBankById(id)
    end
}

RegisterServerCallback {
    eventName = 'framework:GetPlayerBankByPlayerId',
    eventCallback = function(source, id)
        return exports.framework:GetPlayerBankByPlayerId(id) 
    end
}

RegisterServerCallback {
    eventName = 'framework:SetPlayerMoneyById',
    eventCallback = function(source, id, cash, bank)
        return exports.framework:SetPlayerMoneyById(id, cash, bank)
    end
}

RegisterServerCallback {
    eventName = 'framework:SetPlayerMoneyByIdentifier',
    eventCallback = function(source, identifier, cash, bank)
        return exports.framework:SetPlayerMoneyByIdentifier(identifier, cash, bank)
    end
}

RegisterServerCallback {
    eventName = 'framework:SetPlayerMoneyByPlayerId',
    eventCallback = function(source, id, cash, bank)
        return exports.framework:SetPlayerMoneyByPlayerId(id, cash, bank)
    end
}

RegisterServerCallback {
    eventName = 'framework:AddPlayerCashById',
    eventCallback = function(source, id, cash)
        return exports.framework:AddPlayerCashById(id, cash)
    end
}

RegisterServerCallback {
    eventName = 'framework:AddPlayerBankById',
    eventCallback = function(source, id, bank)
        return exports.framework:AddPlayerBankById(id, bank)
    end
}

RegisterServerCallback {
    eventName = 'framework:AddPlayerMoneyById',
    eventCallback = function(source, id, cash, bank)
        return exports.framework:AddPlayerMoneyById(id, cash, bank)
    end
}

RegisterServerCallback {
    eventName = 'framework:AddPlayerMoneyByIdentifier',
    eventCallback = function(source, identifier, cash, bank)
        return exports.framework:AddPlayerMoneyByIdentifier(identifier, cash, bank)
    end
}

RegisterServerCallback {
    eventName = 'framework:RemovePlayerMoneyById',
    eventCallback = function(source, id, cash, bank)
        return exports.framework:RemovePlayerMoneyById(id, cash, bank)
    end
}

RegisterServerCallback {
    eventName = 'framework:RemovePlayerMoneyByIdentifier',
    eventCallback = function(source, identifier, cash, bank)
        return exports.framework:RemovePlayerMoneyByIdentifier(identifier, cash, bank)
    end
}

RegisterServerCallback {
    eventName = 'framework:GetPlayerRankById',
    eventCallback = function(source, id)
        return exports.framework:GetPlayerRankById(id)
    end
}

RegisterServerCallback {
    eventName = 'framework:GetPlayerRankByIdentifier',
    eventCallback = function(source, identifier)
        return exports.framework:GetPlayerRankByIdentifier(identifier)
    end
}

RegisterServerCallback {
    eventName = 'framework:GetPlayerRankByPlayerId',
    eventCallback = function(source, id)
        return exports.framework:GetPlayerRankByPlayerId(id)
    end
}

RegisterServerCallback {
    eventName = 'framework:GetPlayerRankPointsById',
    eventCallback = function(source, id)
        return exports.framework:GetPlayerRankPointsById(id)
    end
}

RegisterServerCallback {
    eventName = 'framework:GetPlayerRankPointsByIdentifier',
    eventCallback = function(source, identifier)
        return exports.framework:GetPlayerRankPointsByIdentifier(identifier)
    end
}

RegisterServerCallback {
    eventName = 'framework:GetPlayerRankPointsByPlayerId',
    eventCallback = function(source, id)
        return exports.framework:GetPlayerRankPointsByPlayerId(id)
    end
}

RegisterServerCallback {
    eventName = 'framework:GetPlayerRankStatsById',
    eventCallback = function(source, id, status)
        return exports.framework:GetPlayerRankStatsById(id, status)
    end
}

RegisterServerCallback {
    eventName = 'framework:GetPlayerRankStatsByIdentifier',
    eventCallback = function(source, identifier, status)
        return exports.framework:GetPlayerRankStatsByIdentifier(identifier, status)
    end
}

RegisterServerCallback {
    eventName = 'framework:GetPlayerRankStatsByPlayerId',
    eventCallback = function(source, id, status)
        return exports.framework:GetPlayerRankStatsByPlayerId(id, status)
    end
}

RegisterServerCallback {
    eventName = 'framework:AddPlayerRankById',
    eventCallback = function(source, id, rank)
        return exports.framework:AddPlayerRankById(id, rank)
    end
}

RegisterServerCallback {
    eventName = 'framework:AddPlayerRankPointsById',
    eventCallback = function(source, id, rankPoints)
        return exports.framework:AddPlayerRankPointsById(id, rankPoints)
    end
}

-- Phone

RegisterServerCallback {
    eventName = 'framework:GetPlayerPhoneContacts',
    eventCallback = function(source, id)
        return exports.framework:GetPlayerPhoneContacts(id)
    end
}

RegisterServerCallback {
    eventName = 'framework:GetPlayerPhoneMessages',
    eventCallback = function(source, id)
        return exports.framework:GetPlayerPhoneMessages(id)
    end
}

RegisterServerCallback {
    eventName = 'framework:AddPlayerPhoneContact',
    eventCallback = function(source, player_id, identifier, contact_name, contact_id, contact_identifier)
        return exports.framework:AddPlayerPhoneContact(player_id, identifier, contact_name, contact_id, contact_identifier)
    end
}

RegisterServerCallback {
    eventName = 'framework:RemovePlayerPhoneContact',
    eventCallback = function(source, id, contact_name)
        return exports.framework:RemovePlayerPhoneContact(id, contact_name)
    end
}

RegisterServerCallback {
    eventName = 'framework:EditPlayerPhoneContact',
    eventCallback = function(source, id, contact_name, contact_new_name)
        return exports.framework:EditPlayerPhoneContact(id, contact_name, contact_new_name)
    end
}