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
AddEventHandler('fg_sac:hasEnteredMarker', function(zone)

    if zone == 'Recolte1Weed' then
        CurrentAction		   = 'Recolte1Weed'
        CurrentActionMsg	   = ConfigWeed.Zones.Recolte1Weed.hint
        CurrentActionData	   = {}
    end

    if zone == 'Blanchiment1Sac' then
        CurrentAction		   = 'Blanchiment1Sac'
        CurrentActionMsg	   = ConfigWeed.Zones.Blanchiment1Sac.hint
        CurrentActionData	   = {}
    end

    if zone == 'Vente1Sac' then
        CurrentAction		   = 'Vente1Sac'
        CurrentActionMsg	   = ConfigWeed.Zones.Vente1Sac.hint
        CurrentActionData	   = {}
    end

    if zone == 'EnterRecolte1Weed' then
        CurrentAction		   = 'EnterRecolte1Weed'
        CurrentActionMsg	   = ConfigWeed.PublicZones.EnterRecolte1Weed.hint
        CurrentActionData	   = {}
    end

    if zone == 'ExitRecolte1Weed' then
        CurrentAction		   = 'ExitRecolte1Weed'
        CurrentActionMsg	   = ConfigWeed.PublicZones.ExitRecolte1Weed.hint
        CurrentActionData	   = {}
    end

    
end)

-- Quand le joueur sort de la zone
AddEventHandler('fg_sac:hasExitedMarker', function(zone)

    if zone == 'Recolte1Weed' then
        TriggerServerEvent('fg_sac:stopRecolte1Weed')
    end

    if zone == 'Blanchiment1Sac' then
        TriggerServerEvent('fg_sac:stopBlanchiment1Sac')
    end

    if zone == 'Vente1Sac' then
        TriggerServerEvent('fg_sac:stopVente1Sac')
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

			for k,v in pairs(ConfigWeed.Zones) do
				if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < ConfigWeed.DrawDistance) then
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
				end
			end
			
			for k,v in pairs(ConfigWeed.PublicZones) do
				if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < ConfigWeed.DrawDistance) then
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
			
			for k,v in pairs(ConfigWeed.Zones) do
				if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) <= v.Size.x) then
					isInMarker  = true
					currentZone = k
				end
			end
			
			for k,v in pairs(ConfigWeed.PublicZones) do
				if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) <= v.Size.x) then
					isInMarker  = true
					currentZone = k
				end
			end
			
			if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
				HasAlreadyEnteredMarker = true
				LastZone                = currentZone
				TriggerEvent('fg_sac:hasEnteredMarker', currentZone)
			end
			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('fg_sac:hasExitedMarker', LastZone)
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
				if CurrentAction == 'Recolte1Weed' then
					if IsPedInAnyVehicle(playerPed, 0) then
						ESX.ShowNotification('~r~Sortez de votre véhicule !')
					else
						if PlayerData.job.name == 'police' then
							ESX.ShowNotification(ConfigWeed.Zones.Recolte1Weed.messagePolice)
						else
							TriggerServerEvent('fg_sac:startRecolte1Weed')
						end
					end
				end
				if CurrentAction == 'Blanchiment1Sac' then
					if IsPedInAnyVehicle(playerPed, 0) then
						ESX.ShowNotification('~r~Sortez de votre véhicule !')
					else
						if PlayerData.job.name == 'police' then
							ESX.ShowNotification(ConfigWeed.Zones.Blanchiment1Sac.messagePolice)
						else
							TriggerServerEvent('fg_sac:startBlanchiment1Sac')
						end
					end
				end
				if CurrentAction == 'Vente1Sac' then
					if IsPedInAnyVehicle(playerPed, 0) then
						ESX.ShowNotification('~r~Sortez de votre véhicule !')
					else
						if PlayerData.job.name == 'police' then
							ESX.ShowNotification(ConfigWeed.Zones.Vente1Sac.messagePolice)
						else
							TriggerServerEvent('fg_sac:startVente1Sac')
						end
					end
				end
				if CurrentAction == 'EnterRecolte1Weed' then
					if IsPedInAnyVehicle(playerPed, 0) then
						ESX.ShowNotification('~r~Sortez de votre véhicule !')
					else
						TriggerEvent('fg_sac:publicTeleports', ConfigWeed.PublicZones.EnterRecolte1Weed.Teleport)
					end
				end
				if CurrentAction == 'ExitRecolte1Weed' then
					if IsPedInAnyVehicle(playerPed, 0) then
						ESX.ShowNotification('~r~Sortez de votre véhicule !')
					else
						TriggerEvent('fg_sac:publicTeleports', ConfigWeed.PublicZones.ExitRecolte1Weed.Teleport)
					end
				end
				
				CurrentAction = nil
			end
		end
	end
end)

RegisterNetEvent('fg_sac:prePaye')
AddEventHandler('fg_sac:prePaye', function()
	run = run + 1
end)

RegisterNetEvent('fg_sac:Paye')
AddEventHandler('fg_sac:Paye', function()
	local PriceWin = ConfigWeed.Zones.Vente1Sac.ItemPrice * run
	run = 0
	
	if PriceWin > 0 then
		Wait(2000)
		TriggerServerEvent('fg_sac:recupPayePlayer', PriceWin)
	end
	
end)

AddEventHandler('fg_sac:publicTeleports', function(position)
	SetEntityCoords(GetPlayerPed(-1), position.x, position.y, position.z)
end)