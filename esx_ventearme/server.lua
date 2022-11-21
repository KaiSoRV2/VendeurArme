ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("VendeurIllegal:KaiSoR")
AddEventHandler("VendeurIllegal:KaiSoR", function(name, label, price)
    if source then 
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.getAccount("black_money").money <= price then return TriggerClientEvent("esx:showNotification", source, "~r~Vous n'avez pas assez d'argent sale") end 
        if xPlayer.getWeapon(name) then 
            return TriggerClientEvent("esx:showNotification", source, "~r~Vous avez déjà cette arme")
        else
            TriggerClientEvent("esx:showNotification", source, "Vous venez d'acheter ~b~1x "..label.."~s~ pour ~r~"..ESX.Math.GroupDigits(price).."$~s~ !")
            xPlayer.removeAccountMoney("black_money", price)
            xPlayer.addWeapon(name, 250)
        end       
    end
end)



ESX.RegisterServerCallback("permission:vip", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.fetchAll('SELECT viplevel FROM users WHERE identifier = @identifier', {
        ['@identifier'] = xPlayer.identifier
    }, function(data)
        local permvip = data[1].viplevel --> Remplacer .viplevel par votre valeur dans laquelle s'éxécute votre rôle VIP
        cb(permvip)
    end)
end)

      
        