RegisterNetEvent('mcd_savename:saveplayer')
AddEventHandler('mcd_savename:saveplayer', function()
    local playername = MCD.GetPlayerName(source)
    local identifier = ESX.GetPlayerFromId(source).getIdentifier()
    MySQL.Async.execute('UPDATE '..Config.Tablename..' SET '..Config.Collum..' = @PlayerName WHERE identifier = @identifier', {
        ['@PlayerName'] = playername,
        ['@identifier'] = identifier
    })
    
    local text = '~s~[~y~'..GetCurrentResourceName()..'~s~][~b~INFO~s~]\t'
    text = text .. 'Saved Name from ~g~' .. identifier .. ' ~s~(~p~'..MCD.GetPlayerName(source)..'~s~)'
    MCD.PrintConsole(text)
end)

TriggerEvent('mcd_lib:fuzdvgsgzhufdghuiz', GetCurrentResourceName() , 'mcd_savename')