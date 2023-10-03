fx_version("adamant");
game("gta5");

dependencies {
	'/server:5104',
}

shared_scripts {
    "**/*-cfg.lua",
	"**/*-sh.lua"
}

client_scripts({ 
	'ui.lua',
    "**/*-client.lua",
    "**/*-cfg.lua"
});

server_scripts({ 
	'dist/build.js',
	'connecting.lua',
    "**/*-server.lua",
});

files {
	'ui/build/index.html',
	'ui/build/**/*'
}

exports {
	-- Players
	'GetPlayerId',
	'GetPlayerIdentifierById',
	'GetPlayerNameById',
	'GetPlayerWhitelistById',
	'GetPlayerBannedById',

	--Economy
	'GetPlayerIdById',
	'GetIdByPlayerId',
	'GetPlayerCashById',
	'GetPlayerCashByPlayerId',
	'GetPlayerBankById',
	'GetPlayerBankByPlayerId',
	'SetPlayerMoneyById',
	'SetPlayerMoneyByIdentifier',
	'SetPlayerMoneyByPlayerId',
	'AddPlayerCashById',
	'AddPlayerBankById',
	'AddPlayerMoneyById',
	'AddPlayerMoneyByIdentifier',
	'RemovePlayerMoneyById',
	'RemovePlayerMoneyByIdentifier',

	-- Ranks
	'GetPlayerRankById',
	'GetPlayerRankByIdentifier',
	'GetPlayerRankByPlayerId',
	'GetPlayerRankPointsById',
	'GetPlayerRankPointsByIdentifier',
	'GetPlayerRankPointsByPlayerId',
	'GetPlayerRankStatsById',
	'GetPlayerRankStatsByIdentifier',
	'GetPlayerRankStatsByPlayerId',
	'AddPlayerRankById',
	'AddPlayerRankPointsById',

	-- Phone
	'GetPlayerPhoneContacts',
	'AddPlayerPhoneContact',
	'RemovePlayerPhoneContact',
	'EditPlayerPhoneContact',
	'GetPlayerPhoneMessages',

	--Callbacks
	'RegisterClientCallback',
    'UnregisterClientCallback',
    'TriggerClientCallback',
    'TriggerServerCallback',
}

server_exports {
	-- Players
	'GetPlayerId',
	'GetPlayerIdByIdentifier',
	'GetPlayerIdentifierById',
	'GetPlayerNameById',
	'GetPlayerWhitelistById',
	'GetPlayerBannedById',
		
	-- Economy
	'GetPlayerIdById',
	'GetIdByPlayerId',
	'GetPlayerCashById',
	'GetPlayerCashByPlayerId',
	'GetPlayerBankById',
	'GetPlayerBankByPlayerId',
	'SetPlayerMoneyById',
	'SetPlayerMoneyByIdentifier',
	'SetPlayerMoneyByPlayerId',
	'AddPlayerCashById',
	'AddPlayerBankById',
	'AddPlayerMoneyById',
	'AddPlayerMoneyByIdentifier',
	'RemovePlayerMoneyById',
	'RemovePlayerMoneyByIdentifier',

	-- Ranks
	'GetPlayerRankById',
	'GetPlayerRankByIdentifier',
	'GetPlayerRankByPlayerId',
	'GetPlayerRankPointsById',
	'GetPlayerRankPointsByIdentifier',
	'GetPlayerRankPointsByPlayerId',
	'GetPlayerRankStatsById',
	'GetPlayerRankStatsByIdentifier',
	'GetPlayerRankStatsByPlayerId',
	'AddPlayerRankById',
	'AddPlayerRankPointsById',

	-- Phone
	'GetPlayerPhoneContacts',
	'AddPlayerPhoneContact',
	'RemovePlayerPhoneContact',
	'EditPlayerPhoneContact',
	'GetPlayerPhoneMessages',

	--Callbacks
	'RegisterServerCallback',
    'UnregisterServerCallback',
    'TriggerClientCallback',
    'TriggerServerCallback',
}

ui_page 'ui/build/index.html'

provide 'mysql-async'
provide 'ghmattimysql'

convar_category 'OxMySQL' {
	'Configuration',
	{
		{ 'Connection string', 'mysql_connection_string', 'CV_STRING', 'mysql://user:password@localhost/database' },
		{ 'Debug', 'mysql_debug', 'CV_BOOL', 'false' }
	}
}
