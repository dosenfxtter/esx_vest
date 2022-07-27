
ESX = nil


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem("bulletproof", function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem("bulletproof", 1)

    TriggerClientEvent('lovescripting:bulletproof', source)
end)