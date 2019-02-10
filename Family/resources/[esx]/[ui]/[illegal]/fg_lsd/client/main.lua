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

-- Quand le joueur entre dans la zone
AddEventHandler('fg_lsd:hasEnteredMarker', function(zone)

    if zone == 'Recolte1LSD' then
        CurrentAction		   = 'Recolte1LSD'
        CurrentActionMsg	   = ConfigLSD.Zones.Recolte1LSD.hint
        CurrentActionData	   = {}
	end

	if zone == 'Recolte2LSD' then
        CurrentAction		   = 'Recolte2LSD'
        CurrentActionMsg	   = ConfigLSD.Zones.Recolte2LSD.hint
        CurrentActionData	   = {}
    end

    if zone == 'Traitement1LSD' then
        CurrentAction		   = 'Traitement1LSD'
        CurrentActionMsg	   = ConfigLSD.Zones.Traitement1LSD.hint
        CurrentActionData	   = {}
	end
	
	if zone == 'Traitement2LSD' then
        CurrentAction		   = 'Traitement2LSD'
        CurrentActionMsg	   = ConfigLSD.Zones.Traitement2LSD.hint
        CurrentActionData	   = {}
    end

    if zone == 'Vente1LSD' then
        CurrentAction		   = 'Vente1LSD'
        CurrentActionMsg	   = ConfigLSD.Zones.Vente1LSD.hint
        CurrentActionData	   = {}
    end

    if zone == 'EnterRecolte1LSD' then
        CurrentAction		   = 'EnterRecolte1LSD'
        CurrentActionMsg	   = ConfigLSD.PublicZones.EnterRecolte1LSD.hint
        CurrentActionData	   = {}
    end

    if zone == 'ExitRecolte1LSD' then
        CurrentAction		   = 'ExitRecolte1LSD'
        CurrentActionMsg	   = ConfigLSD.PublicZones.ExitRecolte1LSD.hint
        CurrentActionData	   = {}
    end

    
end)

-- Quand le joueur sort de la zone
AddEventHandler('fg_lsd:hasExitedMarker', function(zone)

    if zone == 'Recolte1LSD' then
        TriggerServerEvent('fg_lsd:stopRecolte1LSD')
    end

	if zone == 'Recolte2LSD' then
        TriggerServerEvent('fg_lsd:stopRecolte2LSD')
	end
	
    if zone == 'Traitement1LSD' then
        TriggerServerEvent('fg_lsd:stopTraitement1LSD')
	end

	if zone == 'Traitement2LSD' then
        TriggerServerEvent('fg_lsd:stopTraitement2LSD')
    end

    if zone == 'Vente1LSD' then
        TriggerServerEvent('fg_lsd:stopVente1LSD')
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

			for k,v in pairs(ConfigLSD.Zones) do
				if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < ConfigLSD.DrawDistance) then
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
				end
			end
			
			for k,v in pairs(ConfigLSD.PublicZones) do
				if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < ConfigLSD.DrawDistance) then
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
			
			for k,v in pairs(ConfigLSD.Zones) do
				if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) <= v.Size.x) then
					isInMarker  = true
					currentZone = k
				end
			end
			
			for k,v in pairs(ConfigLSD.PublicZones) do
				if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) <= v.Size.x) then
					isInMarker  = true
					currentZone = k
				end
			end
			
			if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
				HasAlreadyEnteredMarker = true
				LastZone                = currentZone
				TriggerEvent('fg_lsd:hasEnteredMarker', currentZone)
			end
			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('fg_lsd:hasExitedMarker', LastZone)
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
				if CurrentAction == 'Recolte1LSD' then
					if IsPedInAnyVehicle(playerPed, 0) then
						ESX.ShowNotification('~r~Sortez de votre véhicule !')
					else
						if PlayerData.job.name == 'police' then
							ESX.ShowNotification(ConfigLSD.Zones.Recolte1LSD.messagePolice)
						else
							TriggerServerEvent('fg_lsd:startRecolte1LSD')
						end
					end
				end
				if CurrentAction == 'Recolte2LSD' then
					if IsPedInAnyVehicle(playerPed, 0) then
						ESX.ShowNotification('~r~Sortez de votre véhicule !')
					else
						if PlayerData.job.name == 'police' then
							ESX.ShowNotification(ConfigLSD.Zones.Recolte2LSD.messagePolice)
						else
							TriggerServerEvent('fg_lsd:startRecolte2LSD')
						end
					end
				end
				if CurrentAction == 'Traitement1LSD' then
					if IsPedInAnyVehicle(playerPed, 0) then
						ESX.ShowNotification('~r~Sortez de votre véhicule !')
					else
						if PlayerData.job.name == 'police' then
							ESX.ShowNotification(ConfigLSD.Zones.Traitement1LSD.messagePolice)
						else
							TriggerServerEvent('fg_lsd:startTraitement1LSD')
						end
					end
				end
				if CurrentAction == 'Traitement2LSD' then
					if IsPedInAnyVehicle(playerPed, 0) then
						ESX.ShowNotification('~r~Sortez de votre véhicule !')
					else
						if PlayerData.job.name == 'police' then
							ESX.ShowNotification(ConfigLSD.Zones.Traitement2LSD.messagePolice)
						else
							TriggerServerEvent('fg_lsd:startTraitement2LSD')
						end
					end
				end
				if CurrentAction == 'Vente1LSD' then
					if IsPedInAnyVehicle(playerPed, 0) then
						ESX.ShowNotification('~r~Sortez de votre véhicule !')
					else
						if PlayerData.job.name == 'police' then
							ESX.ShowNotification(ConfigLSD.Zones.Vente1LSD.messagePolice)
						else
							TriggerServerEvent('fg_lsd:startVente1LSD')
						end
					end
				end
				if CurrentAction == 'EnterRecolte1LSD' then
					if IsPedInAnyVehicle(playerPed, 0) then
						ESX.ShowNotification('~r~Sortez de votre véhicule !')
					else
						TriggerEvent('fg_lsd:publicTeleports', ConfigLSD.PublicZones.EnterRecolte1LSD.Teleport)
					end
				end
				if CurrentAction == 'ExitRecolte1LSD' then
					if IsPedInAnyVehicle(playerPed, 0) then
						ESX.ShowNotification('~r~Sortez de votre véhicule !')
					else
						TriggerEvent('fg_lsd:publicTeleports', ConfigLSD.PublicZones.ExitRecolte1LSD.Teleport)
					end
				end
				
				CurrentAction = nil
			end
		end
	end
end)

RegisterNetEvent('fg_lsd:prePaye')
AddEventHandler('fg_lsd:prePaye', function()
	run = run + 1
end)

RegisterNetEvent('fg_lsd:Paye')
AddEventHandler('fg_lsd:Paye', function()
	local PriceWin = ConfigLSD.Zones.Vente1LSD.ItemPrice * run
	run = 0
	
	if PriceWin > 0 then
		Wait(2000)
		TriggerServerEvent('fg_lsd:recupPayePlayer', PriceWin)
	end
	
end)

AddEventHandler('fg_lsd:publicTeleports', function(position)
	SetEntityCoords(GetPlayerPed(-1), position.x, position.y, position.z)
end)