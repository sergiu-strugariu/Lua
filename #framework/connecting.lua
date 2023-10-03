

local function OnPlayerActivated()
    if not Config.list[source] then
        Config.playerCount = Config.playerCount + 1
        Config.list[source] = true
    end
end

local function OnPlayerDropped()
    if Config.list[source] then
        Config.playerCount = Config.playerCount - 1
        Config.list[source] = nil
    end
end

local function OnPlayerConnecting(name, setKickReason, deferrals)
    local identifiers = GetPlayerIdentifiers(source)
    deferrals.defer()

    Wait(0)

    for _, v in pairs(identifiers) do
        if string.find(v, 'license') then
            Config.steamIdentifier = v
            break
        end
    end

    Wait(0)

    if not Config.steamIdentifier then
        deferrals.done("Nu ești conectat/ă la contul de Steam.")
    else
        exports.framework:single('SELECT steam_id FROM players WHERE steam_id = ?', {Config.steamIdentifier}, function(result)
            if result then -- Aleardy player
                exports.framework:single('SELECT banned, bantime, banreason, banadmin FROM players WHERE steam_id = ?', {Config.steamIdentifier}, function(row) -- Check player ban
                    if row.banned then -- if user is banned 
                        if row.bantime == "0" then -- if row.bantime == 0 it means permanent ban
                            deferrals.done('Ai primit ban permanent pe server din motivul "' .. row.banreason .. '" de la adminul "' .. row.banadmin.. '"')
                        end
                        deferrals.done('Ai ban pe server timp de "' .. row.bantime .. '" minute pe motivul "' .. row.banreason .. '" de la adminul "' .. row.banadmin .. '"')
                    end

                    if not row.banned then
                        deferrals.done()
                    end
                end)
            end

            if not result then -- New Player
                exports.framework:insert('INSERT IGNORE INTO players (name, steam_id) VALUES (?, ?)', {name, Config.steamIdentifier}) 
                
                Wait(500)

                exports.framework:single('SELECT * FROM players WHERE steam_id = ?', {Config.steamIdentifier}, function(row) 
                    if row then
                        exports.framework:insert('INSERT INTO economy (player_id, identifier, cash, bank) VALUES (?, ?, ?, ?)', {row.id, row.steam_id, 10000, 10000})
                        exports.framework:insert('INSERT INTO ranks (player_id, identifier, rank, rankPoints) VALUES (?, ?, ?, ?)', {row.id, row.steam_id, 1, 0})
                    end
                end)

                deferrals.done()
            end
        end)
    end
end

AddEventHandler("playerConnecting", OnPlayerConnecting)
