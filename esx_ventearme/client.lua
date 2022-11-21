
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

Citizen.CreateThread(function()
    while true do 
       Citizen.Wait(500)
       if VarColor == "~r~" then VarColor = "~s~" else VarColor = "~r~" end   -- Si vous voulez changer la couleur toucher uniquement aux "g"
   end 
end)


Citizen.CreateThread(function()
    while true do 
       Citizen.Wait(500)
       if VIPColor == "~b~" then VIPColor = "~p~" else VIPColor = "~b~" end   -- Si vous voulez changer la couleur toucher uniquement aux "g"
   end 
end)

local openedMenu = false
local mainMenu = RageUI.CreateMenu("", "Vendeur Illégal")
local subMenu = RageUI.CreateSubMenu(mainMenu, "", "Pistolet")
local subMenu2 = RageUI.CreateSubMenu(mainMenu, "", "Mitraillettes")
local subMenu3 = RageUI.CreateSubMenu(mainMenu, "", "Fusil à Pompe")
local subMenu4 = RageUI.CreateSubMenu(mainMenu, "", "Fusil d'Assaut")
local subMenu5 = RageUI.CreateSubMenu(mainMenu, "", "VIP")
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
                    RageUI.Separator(VarColor.."↓ Catalogue d'Arme ↓")
                    RageUI.Button("~s~Pistolet", nil, {RightLabel = VarColor.."→→"}, true, {}, subMenu)
                    RageUI.Button("~s~Mitraillettes", nil, {RightLabel = VarColor.."→→"}, true, {}, subMenu2)
                    RageUI.Button("~s~Fusil à Pompe", nil, {RightLabel = VarColor.."→→"}, true, {}, subMenu3)
                    RageUI.Button("~s~Fusil d'Assaut", nil, {RightLabel = VarColor.."→→"}, true, {}, subMenu4)
                    RageUI.Separator(VarColor.."↓ Catalogue d'Arme VIP ↓")
                    if vipauto == 1 then 
                        RageUI.Button("~s~ VIP", nil, {RightBadge = RageUI.BadgeStyle.Star}, true, {}, subMenu5)
                    else 
                        RageUI.Button("~s~ VIP", nil, {RightBadge = RageUI.BadgeStyle.Lock}, false, {})
                    end
                end)
                RageUI.IsVisible(subMenu, function()                 
                    if #Config.Categories.Pistol ~= 0 then 
                        RageUI.Separator(VarColor.."↓ Liste des Pistolets ↓")
                        for k, v in pairs(Config.Categories.Pistol) do 
                            RageUI.Button(v.label, nil, {RightLabel = "~r~"..ESX.Math.GroupDigits(v.price).."$"}, true, {
                                onSelected = function()
                                    TriggerServerEvent("VendeurIllegal:KaiSoR", v.name, v.label, v.price)
                                end, 
                            })
                        end 
                    else
                        RageUI.Separator("")
                        RageUI.Separator("~r~Il n'y as pas de Pistolet")
                        RageUI.Separator("")
                    end       
                end)
                RageUI.IsVisible(subMenu2, function()
                    if #Config.Categories.Mitraillettes ~= 0 then 
                        RageUI.Separator(VarColor.."↓ Liste des Mitraillettes ↓")
                        for k, v in pairs(Config.Categories.Mitraillettes) do 
                            RageUI.Button(v.label, nil, {RightLabel = "~r~"..ESX.Math.GroupDigits(v.price).."$"}, true, {
                                onSelected = function()
                                    TriggerServerEvent("VendeurIllegal:KaiSoR", v.name, v.label, v.price)
                                end, 
                            })
                        end                     
                    else
                        RageUI.Separator("")
                        RageUI.Separator("~r~Il n'y as pas de Mitraillettes")
                        RageUI.Separator("")
                    end                     
                end)  
                RageUI.IsVisible(subMenu3, function()
                    if #Config.Categories.Pompes ~= 0 then 
                        RageUI.Separator(VarColor.."↓ Liste des Fusils à Pompe ↓")
                        for k, v in pairs(Config.Categories.Pompes) do 
                            RageUI.Button(v.label, nil, {RightLabel = "~r~"..ESX.Math.GroupDigits(v.price).."$"}, true, {
                                onSelected = function()
                                    TriggerServerEvent("VendeurIllegal:KaiSoR", v.name, v.label, v.price)
                                end, 
                            })
                        end                     
                    else
                        RageUI.Separator("")
                        RageUI.Separator("~r~Il n'y as pas de Fusil à Pompes")
                        RageUI.Separator("")
                    end                     
                end)
                RageUI.IsVisible(subMenu4, function()
                    if #Config.Categories.Fusils ~= 0 then 
                        RageUI.Separator(VarColor.."↓ Liste des Fusils d'Assaut ↓")
                        for k, v in pairs(Config.Categories.Fusils) do 
                            RageUI.Button(v.label, nil, {RightLabel = "~r~"..ESX.Math.GroupDigits(v.price).."$"}, true, {
                                onSelected = function()
                                    TriggerServerEvent("VendeurIllegal:KaiSoR", v.name, v.label, v.price)
                                end, 
                            })
                        end                     
                    else
                        RageUI.Separator("")
                        RageUI.Separator("~r~Il n'y as pas de Fusil d'Assaut")
                        RageUI.Separator("")
                    end                     
                end)
                RageUI.IsVisible(subMenu3, function()
                    if #Config.Categories.Pompes ~= 0 then 
                        RageUI.Separator(VarColor.."↓ Liste des Fusils à Pompe ↓")
                        for k, v in pairs(Config.Categories.Pompes) do 
                            RageUI.Button(v.label, nil, {RightLabel = "~r~"..ESX.Math.GroupDigits(v.price).."$"}, true, {
                                onSelected = function()
                                    TriggerServerEvent("VendeurIllegal:KaiSoR", v.name, v.label, v.price)
                                end, 
                            })
                        end                     
                    else
                        RageUI.Separator("")
                        RageUI.Separator("~r~Il n'y as pas de Fusil à Pompes")
                        RageUI.Separator("")
                    end                     
                end)
                RageUI.IsVisible(subMenu5, function()
                    if #Config.Categories.VIP ~= 0 then 
                        RageUI.Separator(VIPColor.."↓ Liste des Armes VIP ↓")
                        for k, v in pairs(Config.Categories.VIP) do 
                            RageUI.Button(v.label, nil, {RightLabel = "~r~"..ESX.Math.GroupDigits(v.price).."$"}, true, {
                                onSelected = function()
                                    TriggerServerEvent("VendeurIllegal:KaiSoR", v.name, v.label, v.price)
                                end, 
                            })
                        end                     
                    else
                        RageUI.Separator("")
                        RageUI.Separator("~r~Il n'y as pas d'Arme VIP")
                        RageUI.Separator("")
                    end                     
                end)

                Wait(1.0)
            end
        end)
    end
end

------------ [Création du Ped] ------------

Citizen.CreateThread(function()
    for k, v in pairs(Config.InfosPed) do 
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
        local wait = 750
        for k, v in pairs(Config.InfosPed) do 
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, v.pedPos.x, v.pedPos.y, v.pedPos.z)
            if dist <= 3.0 then 
                wait = 0
                Draw3DText(v.pedPos.x, v.pedPos.y, v.pedPos.z-0.600, v.TalkPed, 4, 0.1, 0.05)
                if IsControlJustPressed(1,51) then
                    vipautorisation() 
                    OpenMenu()
                end
            end
        end
    Citizen.Wait(wait)
    end
end)

------------ [Fonction du VIP] ------------

function vipautorisation()
    ESX.TriggerServerCallback("permission:vip", function(data) 
        vipauto = data;        
    end)
end

------------ [Fonction DrawText] ------------

function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
    local scale = (1/dist)*20
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov   
    SetTextScale(scaleX*scale, scaleY*scale)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextColour(250, 250, 250, 255)      
    SetTextDropshadow(1, 1, 1, 1, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x,y,z+2, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end