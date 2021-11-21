ESX = nil



Citizen.CreateThread(function()

	while ESX == nil do

		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

		Citizen.Wait(100)

	end

end)





local openedMenu = false

local mainMenu = RageUI.CreateMenu("Chasse pêche et tradition", "Menu")

local subMenu = RageUI.CreateSubMenu(mainMenu, "Pistolet", "Menu")

local subMenu2 = RageUI.CreateSubMenu(mainMenu, "Armes Blanches", "Menu")

local subMenu3 = RageUI.CreateSubMenu(mainMenu, "Outils", "Menu")

local subMenu4 = RageUI.CreateSubMenu(mainMenu, "Chasse", "Menu")

local subMenu5 = RageUI.CreateSubMenu(mainMenu, "Quincaillerie", "Menu")

mainMenu.Closed = function() openedMenu = false FreezeEntityPosition(PlayerPedId(), false) end





function OpenMenu()

    if openedMenu then 

        openedMenu = false 

        return 

    else

        openedMenu = true 

        FreezeEntityPosition(PlayerPedId(), true)

        RageUI.Visible(mainMenu, true)

        Citizen.CreateThread(function()

            while openedMenu do 

                RageUI.IsVisible(mainMenu, function()

                    RageUI.Button("~b~Pistolet", nil, {RightLabel = "→→"}, true, {}, subMenu)

                    RageUI.Button("~w~Armes Blanches", nil, {RightLabel = "→→"}, true, {}, subMenu2)

                    RageUI.Button("~r~Outils", nil, {RightLabel = "→→"}, true, {}, subMenu3)

                    RageUI.Button("~g~Chasse", nil, {RightLabel = "→→"}, true, {}, subMenu4)

					RageUI.Button("~o~Pêche et Accessoires de chasse", nil, {RightLabel = "→→"}, true, {}, subMenu5)

                end)

                RageUI.IsVisible(subMenu, function()                 

                    if #Config.Categories.Pistol ~= 0 then 

                        RageUI.Separator("↓ Liste des Pistolets ↓")

                        for k, v in pairs(Config.Categories.Pistol) do 

                            RageUI.Button(v.label, nil, {RightLabel = "~r~"..ESX.Math.GroupDigits(v.price).."$"}, true, {

                                onSelected = function()

                                    ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)

                                        if hasWeaponLicense then
    
                                        TriggerServerEvent("Memel:BuyWeapon", v.name, v.label, v.price)
    
                                        else
                                    ESX.ShowNotification("Il faut aller voir le LSPD pour le permis port d'arme !")   
                            
                                        end 
                                end, GetPlayerServerId(PlayerId()), 'weapon')
                            end})
                        end 

                    else

                        RageUI.Separator("")

                        RageUI.Separator("~r~Il n'y as pas de Pistolet")

                        RageUI.Separator("")

                    end       

                end)

                RageUI.IsVisible(subMenu2, function()

                    if #Config.Categories.Armes ~= 0 then 

                        RageUI.Separator("↓ Liste des Armes Blanches ↓")

                        for k, v in pairs(Config.Categories.Armes) do 

                            RageUI.Button(v.label, nil, {RightLabel = "~r~"..ESX.Math.GroupDigits(v.price).."$"}, true, {

                                onSelected = function()

                                    TriggerServerEvent("Memel:BuyWeapon", v.name, v.label, v.price)

                                end, 
                            })    
                        end           

                    else

                        RageUI.Separator("")

                        RageUI.Separator("~r~Il n'y as pas d'arme blanche")

                        RageUI.Separator("")

                    end                     

                end)  

                RageUI.IsVisible(subMenu3, function()

                    if #Config.Categories.Outils ~= 0 then 

                        RageUI.Separator("↓ Liste des outils ↓")

                        for k, v in pairs(Config.Categories.Outils) do 

                            RageUI.Button(v.label, nil, {RightLabel = "~r~"..ESX.Math.GroupDigits(v.price).."$"}, true, {

                                onSelected = function()

                                    TriggerServerEvent("Memel:BuyItem", v.name, v.label, v.price)

                                end, 



                            })

                        end                     

                    else

                        RageUI.Separator("")

                        RageUI.Separator("~r~Il n'y as pas d'outil'")

                        RageUI.Separator("")

                    end                     

                end)

                RageUI.IsVisible(subMenu4, function()

                    if #Config.Categories.Chasse ~= 0 then 

                        RageUI.Separator("↓ Arme de chasse ↓")

                        for k, v in pairs(Config.Categories.Chasse) do 

                            RageUI.Button(v.label, nil, {RightLabel = "~r~"..ESX.Math.GroupDigits(v.price).."$"}, true, {

                                onSelected = function()
                                    ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)

                                        if hasWeaponLicense then
    
                                        TriggerServerEvent("Memel:BuyWeapon", v.name, v.label, v.price)
    
                                        else
                                    ESX.ShowNotification("Il faut aller voir le LSPD pour le permis port d'arme !")   
                            
                                        end 
                                end, GetPlayerServerId(PlayerId()), 'weapon')
                            end})
                        end    
                    
                    

                    else

                        RageUI.Separator("")

                        RageUI.Separator("~r~Il n'y as pas d'arme de chasse'")

                        RageUI.Separator("")

                    end                     

                end)

				RageUI.IsVisible(subMenu5, function()

                    if #Config.Categories.Peche ~= 0 then 

                        RageUI.Separator("↓ Pêche et accessoires de chasse ↓")

                        for k, v in pairs(Config.Categories.Peche) do 

                            RageUI.Button(v.label, nil, {RightLabel = "~r~"..ESX.Math.GroupDigits(v.price).."$"}, true, {

                                onSelected = function()

                                    TriggerServerEvent("Memel:BuyItem", v.name, v.label, v.price)

                                end, 



                            })

                        end                     

                    else

                        RageUI.Separator("")

                        RageUI.Separator("~r~Il n'y as pas d'objet en vente")

                        RageUI.Separator("")

                    end                     

                end)

                Wait(1.0)

            end

        end)

    end

end







Citizen.CreateThread(function()

    for k, v in pairs(Config.Position.Shops) do 

        while not HasModelLoaded(v.pedModel) do

            RequestModel(v.pedModel)

            Wait(1)

        end

        Ped = CreatePed(2, GetHashKey(v.pedModel), v.pedPos, v.heading, 0, 0)

        FreezeEntityPosition(Ped, 1)

        TaskStartScenarioInPlace(Ped, v.pedModel, 0, false)

        SetEntityInvincible(Ped, true)

        SetBlockingOfNonTemporaryEvents(Ped, 1)

    end

    while true do 

        local myCoords = GetEntityCoords(PlayerPedId())

        local nofps = false



        if not openedMenu then 

            for k, v in pairs(Config.Position.Shops) do 

                if #(myCoords - v.pos) < 1.0 then 

                    nofps = true

                    Visual.Subtitle("Appuyer sur ~b~[E]~s~ pour parler au ~b~vendeur", 1) 

                    if IsControlJustPressed(0, 38) then                  

                        OpenMenu()

                    end 

                end 

            end 

        end

        if nofps then 

            Wait(1)

        else 

            Wait(1500)

        end 

    end

end)

Citizen.CreateThread(function()
	for k,v in pairs(Config.Zones) do
		if v.Legal then
			for i = 1, #v.Locations, 1 do
				local blip = AddBlipForCoord(v.Locations[i])

				SetBlipSprite (blip, 110)
				SetBlipDisplay(blip, 4)
				SetBlipScale  (blip, 1.0)
				SetBlipColour (blip, 81)
				SetBlipAsShortRange(blip, true)

				BeginTextCommandSetBlipName("STRING")
				AddTextComponentSubstringPlayerName("Chasse pêche et tradition")
				EndTextCommandSetBlipName(blip)
			end
		end
	end
end)