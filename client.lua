Citizen.CreateThread(function()
    while not ESX.IsPlayerLoaded() do Citizen.Wait(100) end
    TriggerServerEvent('mcd_savename:saveplayer')
end)