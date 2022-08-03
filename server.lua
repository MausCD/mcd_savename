RegisterNetEvent('mcd_savename:saveplayer')
AddEventHandler('mcd_savename:saveplayer', function()
    local playername = MCD.GetPlayerName(source)
    local identifier = ESX.GetPlayerFromId(source).getIdentifier()

    MySQL.Async.fetchAll('SELECT name FROM '..Config.Tablename..' WHERE identifier = @identifier', {
        ['@identifier'] = identifier
    }, function(result)
        if result[1].name ~= playername then

            MySQL.Async.execute('UPDATE '..Config.Tablename..' SET name = @PlayerName WHERE identifier = @identifier', {
                ['@PlayerName'] = playername,
                ['@identifier'] = identifier
            }, function(result2)

                local text = '~s~[~y~'..GetCurrentResourceName()..'~s~][~b~INFO~s~]\t'.. Config.Label[Config.Locale]
                text = text:gsub('%%a' , identifier)
                text = text:gsub('%%b' , playername)
                MCD.PrintConsole(text)
            end)  

        end
    end)
end)

TriggerEvent('mcd_lib:fuzdvgsgzhufdghuiz', GetCurrentResourceName() , 'mcd_savename')