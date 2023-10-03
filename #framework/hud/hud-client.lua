Citizen.CreateThread(function() -- add player money from database to hud
	while true do
		Wait(0)
		if NetworkIsSessionStarted() then
			Config.id = GetPlayerId()
            Config.cash = GetPlayerCashById(Config.id)
			Config.bank = GetPlayerBankById(Config.id)
			Config.player_id = GetPlayerIdById(Config.id)
			SetPlayerMoneyById(id, Config.cash, Config.bank)
            AddTextEntry('FE_THDR_GTAO', 'N.F.S - ROMANIA | discord.gg/nfsromania')
			return
		end
	end 
end)