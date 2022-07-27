fx_version 'cerulean'
game 'gta5'
author 'MausCD'
description 'This script saves the last PlayerName (from Fivem client or steam name)'
version '1.0'

shared_script '@es_extended/imports.lua'
shared_script '@mcd_lib/import.lua'

client_scripts {
	'client.lua',
}

server_scripts {
	"@mysql-async/lib/MySQL.lua",
	'config.lua',
	'server.lua'
}
dependencies {
	'mcd_lib',
}