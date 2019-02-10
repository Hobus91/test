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
local run                       = 0

-- Meth
local myPed                     = GetPlayerPed(-1)
local myPos                     = GetEntityCoords(myPed)
local currentVehicle            = 0
local isGoodVehicle             = false
local currentCharge             = 0
local goodVehicle               = GetHashKey('journey')
local lastVehicle               = 0
local lastDommageVehicle        = 0
local TraitementOn	            = false
local TenueUse					= false

DecorRegister('illegal_chargeMeth', 3)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function recolte(currentVehicle, isGoodVehicle)
	if (PlayerData.job.name == Config.nameJob or PlayerData.job.name == Config.PoliceJob) then
		ESX.ShowNotification(Config.Zones.Recolte.messagePolice)
	else
		if currentVehicle == 0 then
			ESX.ShowNotification(Config.Text.NeedVehicle)
			return
		end
		if isGoodVehicle == false then
			ESX.ShowNotification(Config.Text.BadVehicle)
		else
			if currentCharge >= 10000 then
				currentCharge = 10000
				ESX.ShowNotification(Config.Text.ChargementFullVehicle)
				Citizen.Wait(200)
				ESX.ShowNotification(Config.Text.HelpFullVehicle1)
				Citizen.Wait(50)
				ESX.ShowNotification(Config.Text.HelpFullVehicle2)
				Citizen.Wait(50)
				ESX.ShowNotification(Config.Text.HelpFullVehicle3)
			else
				currentCharge = math.min(10000, currentCharge + 5)
				DecorSetInt(currentVehicle,'illegal_chargeMeth', currentCharge)
				ESX.ShowNotification(Config.Text.ChargementVehicle)
				Citizen.Wait(75)
			end
		end
	end
end

function traitement(vehicle)
	if (PlayerData.job.name == Config.nameJob or PlayerData.job.name == Config.PoliceJob) then
		ESX.ShowNotification(Config.Zones.Recolte.messagePolice)
	else
		if currentCharge > 0 then
			currentCharge = DecorGetInt(vehicle,'illegal_chargeMeth')
			currentCharge = math.max(0, currentCharge - 100)
        	ESX.ShowNotification(Config.Text.TransformToMeth)
			DecorSetInt(vehicle,'illegal_chargeMeth', currentCharge)
			RequestNamedPtfxAsset("core")
			SetPtfxAssetNextCall("core")
			local myPed = GetPlayerPed(-1)
      		local effet = StartParticleFxLoopedOnEntity("exp_grd_grenade_smoke", myPed,
           	   	0.0,-2.0,5.0,
         	   	0.0,0.0,0.0,
               	3.0,
            	1,1,1)
       	   	Citizen.Wait(5000)
           	StopParticleFxLooped(effet, 0)
           	TriggerServerEvent('fg_meth:traitement')
           	return
    	elseif currentCharge == 0 then
    		ESX.ShowNotification(Config.Text.VehicleVide)
	    end
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		myPed = GetPlayerPed(-1)
		myPos = GetEntityCoords(myPed)
		currentVehicle = GetVehiclePedIsIn(myPed, false)
		if currentVehicle ~= 0 then
			isGoodVehicle = IsVehicleModel(currentVehicle, goodVehicle)
		else
			isGoodVehicle = false
		end
		checkPoint(currentVehicle, isGoodVehicle)
		if isGoodVehicle then
			if lastVehicle == 0 then
				currentCharge = DecorGetInt(currentVehicle, 'illegal_chargeMeth')
				lastVehicle = currentVehicle
				lastDommageVehicle = GetEntityHealth(currentVehicle)
			end
			if currentCharge ~= 0 then
				CheckDommageVehicle(currentVehicle)
			end
		elseif lastVehicle ~= 0 then
			DecorSetInt(lastVehcile, 'illegal_chargeMeth', currentCharge)
			currentCharge = 0 
			lastVehicle = 0
			lastDommageVehicle = 0
		end
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
AddEventHandler('fg_meth:hasEnteredMarker', function(zone)
	if zone == 'Vente' then
		CurrentAction     = 'startVente'
		CurrentActionMsg  = Config.Zones.Vente.hint
		CurrentActionData = {}
	end
end)

-- Quand le joueur entre dans la zone recolte
function checkPoint(currentVehicle, isGoodVehicle)
	local dist = GetDistanceBetweenCoords(myPos.x, myPos.y, myPos.z, Config.Zones.Recolte.Pos.x, Config.Zones.Recolte.Pos.y, Config.Zones.Recolte.Pos.z, false)
	if dist < Config.Zones.Recolte.Size.x then
		recolte(currentVehicle, isGoodVehicle)
		return
	end
	if isGoodVehicle then
		if (IsControlJustReleased(1, Keys["Y"])) then
			TraitementOn = true
		end
		local myPed = GetPlayerPed(-1)
		local vehicle = GetVehiclePedIsIn(myPed, false)
		local speed = GetEntitySpeed(vehicle)
		if speed == 0 then
			if TraitementOn == true then
				if currentCharge > 0 then
					traitement(currentVehicle)
					return
				end
			end
		else
			TraitementOn = false
		end
	end
end

-- Quand le joueur sort de la zone
AddEventHandler('fg_meth:hasExitedMarker', function(zone)
	if zone == 'Vente' then
		TriggerServerEvent('fg_meth:stopVente')
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
			for k,v in pairs(Config.Zones) do
				if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
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
			
			for k,v in pairs(Config.Zones) do
				if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) <= v.Size.x) then
					isInMarker  = true
					currentZone = k
				end
			end
			if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
				HasAlreadyEnteredMarker = true
				LastZone                = currentZone
				TriggerEvent('fg_meth:hasEnteredMarker', currentZone)
			end
			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('fg_meth:hasExitedMarker', LastZone)
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
            	if CurrentAction == 'startVente' then
            		TriggerServerEvent('fg_meth:startVente')
            	end
				CurrentAction = nil
			end
		end
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if currentCharge ~= 0 then
            showChargement()
        end
    end
end)

function showChargement()
    DrawRect(0.065, 0.04, 0.1, 0.033, 0,0,0,225)
    SetTextFont(6)
    SetTextScale(0.0,0.5)
    SetTextCentre(false)
    SetTextDropShadow(0, 0, 0, 0, 0)
    SetTextEdge(0, 0, 0, 0, 0)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    AddTextComponentString('~r~Methylamine: ~b~' .. (currentCharge/100) .. ' %')
    DrawText(0.020, 0.04 - 0.017)
end

function CheckDommageVehicle(vehicle)
    local cDmg = GetEntityHealth(vehicle)
    local deltaDmg =  lastDommageVehicle - cDmg
    if deltaDmg ~= 0 then
        currentCharge = math.max(currentCharge - deltaDmg * 100, 0)
        DecorSetInt(vehicle, 'illegal_chargeMeth', currentCharge)
        if currentCharge == 0 then
            ESX.ShowNotification('~r~Vous avez perdu tout votre chargement')
        end
    end
    lastDommageVehicle = cDmg
end

RegisterNetEvent('fg_meth:prePaye')
AddEventHandler('fg_meth:prePaye', function()
	run = run + 1
end)

RegisterNetEvent('fg_meth:Paye')
AddEventHandler('fg_meth:Paye', function()
	local PriceWin = Config.Zones.Vente.ItemPrice * run
	run = 0
	
	if PriceWin > 0 then
		Wait(2000)
		TriggerServerEvent('fg_meth:recupPayePlayer', PriceWin)
	end
	
end)