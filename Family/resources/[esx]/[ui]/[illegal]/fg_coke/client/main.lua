local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX                             = nil
local PlayerData                = {}
local GUI                       = {}
GUI.Time                        = 0
local HasAlreadyEnteredMarker   = false
local LastZone                  = nil
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}
local TargetCoords              = nil
local run                       = 0

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

RegisterNetEvent('esx:setFaction')
AddEventHandler('esx:setFaction', function(faction)
	PlayerData.faction = faction
end)

-- Quand le joueur entre dans la zone
AddEventHandler('fg_coke:hasEnteredMarker', function(zone)

    if zone == 'Recolte1Coke' then
        CurrentAction		   = 'Recolte1Coke'
        CurrentActionMsg	   = ConfigCoke.Zones.Recolte1Coke.hint
        CurrentActionData	   = {}
    end

    if zone == 'Recolte2Coke' then
        CurrentAction		   = 'Recolte2Coke'
        CurrentActionMsg	   = ConfigCoke.Zones.Recolte2Coke.hint
        CurrentActionData	   = {}
    end

    if zone == 'Recolte3' then
        CurrentAction		   = 'recolte3'
        CurrentActionMsg	   = ConfigCoke.Zones.Recolte3.hint
        CurrentActionData	   = {}
    end

    if zone == 'Traitement1Coke' then
        CurrentAction		   = 'Traitement1Coke'
        CurrentActionMsg	   = ConfigCoke.Zones.Traitement1Coke.hint
        CurrentActionData	   = {}
    end

    if zone == 'Vente1Coke' then
        CurrentAction		   = 'Vente1Coke'
        CurrentActionMsg	   = ConfigCoke.Zones.Vente1Coke.hint
        CurrentActionData	   = {}
    end

    if zone == 'EnterTraitementCoke' then
        CurrentAction		   = 'EnterTraitementCoke'
        CurrentActionMsg	   = ConfigCoke.PublicZones.EnterTraitementCoke.hint
        CurrentActionData	   = {}
    end

    if zone == 'ExitTraitementCoke' then
        CurrentAction		   = 'ExitTraitementCoke'
        CurrentActionMsg	   = ConfigCoke.PublicZones.ExitTraitementCoke.hint
        CurrentActionData	   = {}
    end

    
end)

-- Quand le joueur sort de la zone
AddEventHandler('fg_coke:hasExitedMarker', function(zone)

    if zone == 'Recolte1Coke' then
        TriggerServerEvent('fg_coke:stopRecolte1Coke')
    end

    if zone == 'Recolte2Coke' then
        TriggerServerEvent('fg_coke:stopRecolte2Coke')
    end

    if zone == 'Recolte3' then
        TriggerServerEvent('fg_coke:stopRecolte3')
    end

    if zone == 'Traitement1Coke' then
        TriggerServerEvent('fg_coke:stopTraitement1Coke')
    end

    if zone == 'Vente1Coke' then
        TriggerServerEvent('fg_coke:stopVente1Coke')
    end

    CurrentAction = nil
	ESX.UI.Menu.CloseAll()
end)

-- Activation du marker au sol
Citizen.CreateThread(function()
	while true do
		Wait(0)
		if PlayerData.job ~= nil then
			local coords = GetEntityCoords(GetPlayerPed(-1))

			for k,v in pairs(ConfigCoke.Zones) do
				if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < ConfigCoke.DrawDistance) then
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
				end
			end
			
			for k,v in pairs(ConfigCoke.PublicZones) do
				if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < ConfigCoke.DrawDistance) then
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
				end
			end
			
		end
	end
end)

-- Detection de l'entrer/sortie de la zone du joueur
Citizen.CreateThread(function()
	while true do
		Wait(1)
		if PlayerData.job ~= nil then
			local coords      = GetEntityCoords(GetPlayerPed(-1))
			local isInMarker  = false
			local currentZone = nil
			
			for k,v in pairs(ConfigCoke.Zones) do
				if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) <= v.Size.x) then
					isInMarker  = true
					currentZone = k
				end
			end
			
			for k,v in pairs(ConfigCoke.PublicZones) do
				if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) <= v.Size.x) then
					isInMarker  = true
					currentZone = k
				end
			end
			
			if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
				HasAlreadyEnteredMarker = true
				LastZone                = currentZone
				TriggerEvent('fg_coke:hasEnteredMarker', currentZone)
			end
			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('fg_coke:hasExitedMarker', LastZone)
			end
		end
	end
end)

-- Action après la demande d'accés 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if CurrentAction ~= nil then
            SetTextComponentFormat('STRING')
            AddTextComponentString(CurrentActionMsg)
            DisplayHelpTextFromStringLabel(0, 0, 1, -1)
            if (IsControlJustReleased(1, Keys["E"]) or IsControlJustReleased(2, Keys["RIGHT"])) and PlayerData.job ~= nil then
				local playerPed = GetPlayerPed(-1)
				if CurrentAction == 'Recolte1Coke' then
					if IsPedInAnyVehicle(playerPed, 0) then
						ESX.ShowNotification('~r~Sortez de votre véhicule !')
					else
						if PlayerData.job.name == 'police' then
							ESX.ShowNotification(ConfigCoke.Zones.Recolte1Coke.messagePolice)
						else
							TriggerServerEvent('fg_coke:startRecolte1Coke')
						end
					end
				end
				if CurrentAction == 'Recolte2Coke' then
					if IsPedInAnyVehicle(playerPed, 0) then
						ESX.ShowNotification('~r~Sortez de votre véhicule !')
					else
						-- if PlayerData.job.name == 'police' then
							-- ESX.ShowNotification(ConfigCoke.Zones.Recolte2Coke.messagePolice)
						-- else
							TriggerServerEvent('fg_coke:startRecolte2Coke')
						-- end
					end
				end
				if CurrentAction == 'recolte3' then
					if IsPedInAnyVehicle(playerPed, 0) then
						ESX.ShowNotification('~r~Sortez de votre véhicule !')
					else
						if PlayerData.job.name == 'police' then
							ESX.ShowNotification(ConfigCoke.Zones.Recolte3.messagePolice)
						else
							TriggerServerEvent('fg_coke:startRecolte3')
						end
					end
				end
				if CurrentAction == 'Traitement1Coke' then
					if IsPedInAnyVehicle(playerPed, 0) then
						ESX.ShowNotification('~r~Sortez de votre véhicule !')
					else
						if PlayerData.job.name == 'police' then
							ESX.ShowNotification(ConfigCoke.Zones.Traitement1Coke.messagePolice)
						else
							TriggerServerEvent('fg_coke:startTraitement1Coke')
						end
					end
				end
				if CurrentAction == 'Vente1Coke' then
					if IsPedInAnyVehicle(playerPed, 0) then
						ESX.ShowNotification('~r~Sortez de votre véhicule !')
					else
						if PlayerData.job.name == 'police' then
							ESX.ShowNotification(ConfigCoke.Zones.Vente1Coke.messagePolice)
						else
							TriggerServerEvent('fg_coke:startVente1Coke')
						end
					end
				end
				if CurrentAction == 'EnterTraitementCoke' then
					if IsPedInAnyVehicle(playerPed, 0) then
						ESX.ShowNotification('~r~Sortez de votre véhicule !')
					else
						TriggerEvent('fg_coke:publicTeleports', ConfigCoke.PublicZones.EnterTraitementCoke.Teleport)
					end
				end
				if CurrentAction == 'ExitTraitementCoke' then
					if IsPedInAnyVehicle(playerPed, 0) then
						ESX.ShowNotification('~r~Sortez de votre véhicule !')
					else
						TriggerEvent('fg_coke:publicTeleports', ConfigCoke.PublicZones.ExitTraitementCoke.Teleport)
					end
				end
				
				CurrentAction = nil
			end
		end
	end
end)

RegisterNetEvent('fg_coke:prePaye')
AddEventHandler('fg_coke:prePaye', function()
	run = run + 1
end)

RegisterNetEvent('fg_coke:Paye')
AddEventHandler('fg_coke:Paye', function()
	local PriceWin = ConfigCoke.Zones.Vente1Coke.ItemPrice * run
	run = 0
	
	if PriceWin > 0 then
		Wait(2000)
		TriggerServerEvent('fg_coke:recupPayePlayer', PriceWin)
	end
	
end)

AddEventHandler('fg_coke:publicTeleports', function(position)
	SetEntityCoords(GetPlayerPed(-1), position.x, position.y, position.z)
end)