
ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    end
end)

RegisterNetEvent('lovescripting:bulletproof')
AddEventHandler('lovescripting:bulletproof', function()
    local playerPed = PlayerPedId()

    local lib, anim = 'anim@heists@narcotics@funding@gang_idle', 'gang_chatting_idle01'

    TriggerEvent('skinchanger:getSkin', function(skin)
        if skin.sex == 0 then
            ESX.Streaming.RequestAnimDict(lib, function()
                TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, 6000, 0, 0, false, false, false)

                if Config.Settings.ProgressbarActiv == true then
                    exports['progressBars']:startUI(6000, Config.Language.progressbar_message)
                end
                Wait(6000)

                SetPedComponentVariation(GetPlayerPed(-1), 9, 7, Config.Vest.male, 0)
                AddArmourToPed(playerPed,100)
                SetPedArmour(playerPed, 100)

                ESX.ShowNotification(Config.Language.bulletproof_used)
            end)
        else 
            ESX.Streaming.RequestAnimDict(lib, function()
                TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, 6000, 0, 0, false, false, false)

                if Config.Settings.ProgressbarActiv == true then
                    exports['progressBars']:startUI(6000, Config.Language.progressbar_message)
                end
                Wait(6000)

                SetPedComponentVariation(GetPlayerPed(-1), 9, 6, Config.Vest.female, 0)
                AddArmourToPed(playerPed,100)
                SetPedArmour(playerPed, 100)

                ESX.ShowNotification(Config.Language.bulletproof_used)
            end)
        end
    end)
end)


RegisterCommand(Config.Settings.CommandName, function()
    if Config.Settings.CommandActiv == true then
        TriggerEvent('lovescripting:bulletproof')
    else
        ESX.ShowNotification(Config.Language.command_disabled)
    end
end, false)