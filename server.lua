ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



RegisterServerEvent("Warlif:BuyWeapon")

AddEventHandler("Warlif:BuyWeapon", function(name, label, price)

    if source then 

        local xPlayer = ESX.GetPlayerFromId(source)

        if xPlayer.getAccount("bank").money <= price then return TriggerClientEvent("esx:showNotification", source, "~r~Vous n'avez pas assez d'argent") end 

        if xPlayer.getWeapon(name) then 

            return TriggerClientEvent("esx:showNotification", source, "~r~Vous avez déjà cette arme")

        else

            TriggerClientEvent("esx:showNotification", source, "Vous venez d'acheter ~b~1x "..label.."~s~ pour ~g~"..ESX.Math.GroupDigits(price).."$~s~ !")

            xPlayer.removeAccountMoney("bank", price)

            xPlayer.addWeapon(name, 250)

        end    
    end
end)




RegisterServerEvent("Warlif:BuyItem")

AddEventHandler("Warlif:BuyItem", function(name, label, price)

    if source then 

        local xPlayer = ESX.GetPlayerFromId(source)

        if xPlayer.getAccount("bank").money <= price then return TriggerClientEvent("esx:showNotification", source, "~r~Vous n'avez pas assez d'argent")

	else 

		TriggerClientEvent("esx:showNotification", source, "Vous venez d'acheter ~b~1x "..label.."~s~ pour ~g~"..ESX.Math.GroupDigits(price).."$~s~ !")

        xPlayer.removeAccountMoney("bank", price)

        xPlayer.addInventoryItem(name, 1)

        end       

    end

end)
