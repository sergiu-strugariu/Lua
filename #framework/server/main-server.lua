
-- Get general informations from table players

function GetPlayerIdentifierById(id)
    local row = exports.framework:single_async('SELECT steam_id FROM players WHERE id = ?', {id}) 
    if row then
        print('Success GetPlayerIdentifierById')
        return row.steam_id
    end
end

function GetPlayerIdByIdentifier(identifier)
    local row = exports.framework:single_async('SELECT id FROM players WHERE steam_id = ?', {identifier})
    if row then
        print('Success GetPlayerIdByIdentifier')
        return row.id
    end
end

function GetPlayerNameById(id)
    local row = exports.framework:single_async('SELECT name FROM players WHERE id = ?', {id})
    if row then
        print('Success GetPlayerNameById')
        return row.name
    end
end

function GetPlayerWhitelistById(id)
    local row = exports.framework:single_async('SELECT * FROM players WHERE id = ?', {id})
    if row.whitelisted then
        return string.format("Jucatorul %s cu ID-ul %s se afla in whitelist.", row.name, row.id)
    end

    return string.format("Jucatorul %s cu ID-ul %s nu este se afla in whitelist.", row.name, row.id)
end

function GetPlayerBannedById(id)
    local row = exports.framework:single_async('SELECT * FROM players WHERE id = ?', {id})
    if row.banned then
        return string.format("Jucatorul %s cu ID-ul %s este banat pe server. Detalii: Timp: %s | Motiv: %s | Admin: %s", row.name, row.id, row.bantime, row.banreason, row.banadmin)
    end
    
    return string.format("Jucatorul %s cu ID-ul %s nu este banat pe server.", row.name, row.id)
end

-- Get general informations from economy table

function GetPlayerIdById(id)
    local row = exports.framework:single_async('SELECT player_id FROM economy WHERE id = ?', {id})
    if row then
        print('Success GetPlayerIdById')
        return row.player_id
    end
end

function GetIdByPlayerId(player_id)
    local row = exports.framework:single_async('SELECT id FROM economy WHERE player_id = ?', {player_id})
    if row then
        print('Success GetIdByPlayerId')
        return row.id
    end
end

function GetPlayerCashById(id)
    local row = exports.framework:single_async('SELECT cash FROM economy WHERE id = ?', {id})
    if row then
        print('Success GetPlayerCashById')
        return row.cash
    end
end

function GetPlayerCashByPlayerId(player_id)
    local row = exports.framework:single_async('SELECT cash FROM economy WHERE player_id = ?', {player_id})
    if row then
        print('Success GetPlayerCashByPlayerId')
        return row.cash
    end
end

function GetPlayerBankById(id)
    local row = exports.framework:single_async('SELECT bank FROM economy WHERE id = ?', {id})
    if row then
        print('Success GetPlayerBankById')
        return row.bank
    end
end

function GetPlayerBankByPlayerId(player_id)
    local row = exports.framework:single_async('SELECT bank FROM economy WHERE player_id = ?', {player_id})
    if row then
        print('Success GetPlayerBankByPlayerId')
        return row.bank
    end
end

function AddPlayerCashById(id, cash)
    exports.framework:single('SELECT * FROM economy WHERE id = ?', {id}, function(row)
        if row then
            row.cash = row.cash + cash
            exports.framework:update('UPDATE economy SET cash = ? WHERE id = ?', {row.cash, id}, function()
                print('Success AddPlayerCashById')
            end)
        end
    end)
end

function AddPlayerBankById(id, bank)
    exports.framework:single('SELECT * FROM economy WHERE id = ?', {id}, function(row)
        if row then
            row.bank = row.bank + bank
            exports.framework:update('UPDATE economy SET bank = ? WHERE id = ?', {row.bank, id}, function()
                print('Success AddPlayerBankById')
            end)
        end
    end)
end

function AddPlayerMoneyById(id, cash, bank)
    exports.framework:single('SELECT * FROM economy WHERE id = ?', {id}, function(row)
        if row then
            row.cash = row.cash + cash
            row.bank = row.bank + bank
            exports.framework:update('UPDATE economy SET cash = ?, bank = ? WHERE id = ?', {row.cash, row.bank, id}, function()
                print('Success AddPlayerMoneyById')
            end)
        end
    end)
end

function AddPlayerMoneyByIdentifier(identifier, cash, bank)
    exports.framework:single('SELECT * FROM economy WHERE identifier = ?', {identifier}, function(row)
        if row then
            row.cash = row.cash + cash
            row.bank = row.bank + bank
            exports.framework:update('UPDATE economy SET cash = ?, bank = ? WHERE identifier = ?', {row.cash, row.bank, identifier}, function()
                print('Success AddPlayerMoneyByIdentifier')
            end)
        end
    end)
end

function RemovePlayerMoneyById(id, cash, bank)
    exports.framework:single('SELECT * FROM economy WHERE id = ?', {id}, function(row)
        if row then
            row.cash = row.cash - cash
            row.bank = row.bank - bank
            exports.framework:update('UPDATE economy SET cash = ?, bank = ? WHERE id = ?', {row.cash, row.bank, id}, function()
                print('Success RemovePlayerMoneyById')
            end)
        end
    end)
end
 
function RemovePlayerMoneyByIdentifier(identifier, cash, bank)
    exports.framework:single('SELECT * FROM economy WHERE identifier = ?', {identifier}, function(row)
        if row then
            row.cash = row.cash - cash
            row.bank = row.bank - bank
            exports.framework:update('UPDATE economy SET cash = ?, bank = ? WHERE identifier = ?', {row.cash, row.bank, identifier}, function()
                print('Success RemovePlayerMoneyByIdentifier')
            end)
        end
    end)
end

function SetPlayerMoneyById(id, cash, bank)
    exports.framework:update('UPDATE economy SET cash = ?, bank = ? WHERE id = ?', {cash, bank, id}, function()
        print('Success SetPlayerMoneyById')
    end)
end

function SetPlayerMoneyByIdentifier(identifier, cash, bank)
    exports.framework:update('UPDATE economy SET cash = ?, bank = ? WHERE identifier = ?', {cash, bank, identifier}, function()
        print('Success SetPlayerMoneyByIdentifier')
    end)
end

function SetPlayerMoneyByPlayerId(player_id, cash, bank)
    exports.framework:update('UPDATE economy SET cash = ?, bank = ? WHERE player_id = ?', {cash, bank, player_id}, function()
        print('Success SetPlayerMoneyByPlayerId')
    end)
end

-- Ranks

function GetPlayerRankById(id)
    local row = exports.framework:single_async('SELECT rank FROM ranks WHERE id = ?', {id})
    if row then
        print("Succes GetPlayerRankById")
        return row.rank
    end
end

function GetPlayerRankByIdentifier(identifier)
    local row = exports.framework:single_async('SELECT rank FROM ranks WHERE identifier = ?', {identifier})
    if row then
        print("Succes GetPlayerRankByIdentifier")
        return row.rank
    end
end

function GetPlayerRankByPlayerId(player_id)
    local row = exports.framework:single_async('SELECT rank FROM ranks WHERE player_id = ?', {player_id})
    if row then
        print("Succes GetPlayerRankByPlayerId")
        return row.rank
    end
end

function GetPlayerRankPointsById(id)
    local row = exports.framework:single_async('SELECT rankPoints FROM ranks WHERE id = ?', {id})
    if row then
        print("Succes GetPlayerRankPointsById")
        return row.rankPoints
    end
end

function GetPlayerRankPointsByIdentifier(identifier)
    local row = exports.framework:single_async('SELECT rankPoints FROM ranks WHERE identifier = ?', {identifier})
    if row then
        print("Succes GetPlayerRankPointsByIdentifier")
        return row.rankPoints
    end
end

function GetPlayerRankPointsByPlayerId(player_id)
    local row = exports.framework:single_async('SELECT rankPoints FROM ranks WHERE player_id = ?', {player_id})
    if row then
        print("Succes GetPlayerRankPointsByPlayerId")
        return row.rankPoints
    end
end

function GetPlayerRankStatsById(id, status)
    local row = exports.framework:single_async('SELECT * FROM ranks WHERE player_id = ?', {id})
    if row then
        print("Succes GetPlayerRankStatsById")
        return row[status]
    end
end

function GetPlayerRankStatsByIdentifier(identifier, status)
    local row = exports.framework:single_async('SELECT * FROM ranks WHERE identifier = ?', {identifier})
    if row then
        print("Succes GetPlayerRankStatsByIdentifier")
        return row[status]
    end
end

function GetPlayerRankStatsByPlayerId(player_id, status)
    local row = exports.framework:single_async('SELECT * FROM ranks WHERE player_id = ?', {player_id})
    if row then
        print("Succes GetPlayerRankStatsByPlayerId")
        return row[status]
    end
end

function AddPlayerRankById(id, rank)
    exports.framework:single('SELECT * FROM ranks WHERE id = ?', {id}, function(row)
        if row then
            exports.framework:update('UPDATE ranks SET rank = ? WHERE id = ?', {rank, id}, function()
                print('Success AddPlayerRankById')
            end)
        end
    end)
end

function AddPlayerRankPointsById(id, rankPoints)
    exports.framework:single('SELECT * FROM ranks WHERE id = ?', {id}, function(row)
        if row then
            row.rankPoints = row.rankPoints + rankPoints
            exports.framework:update('UPDATE ranks SET rankPoints = ? WHERE id = ?', {rankPoints, id}, function()
                print('Success AddPlayerRankPointsById')
            end)
        end
    end)
end

-- Phone Contacts

function GetPlayerPhoneContacts(id) 
    local row = exports.framework:prepare_async('SELECT * FROM contacts WHERE player_id = ?', {id})
    if row then
        print('Succes GetPlayerPhoneContacts')
        return row
    end
end

function GetPlayerPhoneMessages(id) 
    local row = exports.framework:prepare_async('SELECT * FROM messages WHERE player_id = ?', {id})
    if row then
        print('Succes GetPlayerPhoneMessages')
        return row
    end
end

function AddPlayerPhoneContact(player_id, identifier, contact_name, contact_id, contact_identifier)
    exports.framework:single('SELECT * FROM contacts WHERE player_id = ?', {player_id}, function(row)
        if row then
            if row.contact_identifier == contact_identifier then
                print('ai deja acest contact')
            else
                exports.framework:insert('INSERT INTO contacts (player_id, identifier, contact_name, contact_id, contact_identifier) VALUES (?, ?, ?, ?, ?)', {player_id, identifier, contact_name, contact_id, contact_identifier}, function()
                    print('Success AddPlayerPhoneContact 1')
                end)
            end
        end
        if not row then
            exports.framework:insert('INSERT INTO contacts (player_id, identifier, contact_name, contact_id, contact_identifier) VALUES (?, ?, ?, ?, ?)', {player_id, identifier, contact_name, contact_id, contact_identifier}, function()
                print('Success AddPlayerPhoneContact 2')
            end)
        end
    end)
end

function RemovePlayerPhoneContact(player_id, contact_name)
    exports.framework:single('SELECT * FROM contacts WHERE player_id = ?', {player_id}, function(row)
        if row then
            if row.contact_name == contact_name then
                exports.framework:single('DELETE FROM contacts WHERE contact_name = ?', {contact_name}, function(result)
                    print('Succes RemovePlayerPhoneContact')
                end)
            end
        else
            print("Nu exista persoana in contacte")
        end
    end)
end

function EditPlayerPhoneContact(player_id, contact_name, contact_new_name)
    exports.framework:single('SELECT * FROM contacts WHERE player_id = ?', {player_id}, function(row)
        if row then
            if row.contact_name == contact_name then
                exports.framework:update('UPDATE contacts SET contact_name = ? WHERE contact_name = ?', {contact_new_name, contact_name}, function()
                    print('Success EditPlayerPhoneContact')
                end)
            else
                print('nu exista jucator')
            end
        end
    end)
end