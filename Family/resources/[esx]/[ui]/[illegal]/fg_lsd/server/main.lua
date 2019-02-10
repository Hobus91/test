ESX                			      = nil
local PlayersRecolte1LSD       	  = {}
local PlayersRecolte2LSD       	  = {}
local PlayersTraitement1LSD       = {}
local PlayersTraitement2LSD       = {}
local PlayersVente1LSDLSD         = {}


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--------------------------------------------- Recolte1LSD -----------------------------------------------------------------

local function Recolte1LSD(source)
	local _source = source
	local onDutyPolice = GetInServiceCount('police')

	if ConfigLSD.Hours then
		local heure = os.date("%H")
		if not (heure >= ""..ConfigLSD.openHours.."" and heure < ""..ConfigLSD.closeHours.."") then
			if onDutyPolice < ConfigLSD.PoliceNeeded then
				TriggerClientEvent('esx:showNotification', _source, 'Action ~r~impossible~s~ : ' .. onDutyPolice .. '/' .. ConfigLSD.PoliceNeeded.. ' ~b~Flics~s~ en service')
				return
			end
		end
	else
		if onDutyPolice < ConfigLSD.PoliceNeeded then
			TriggerClientEvent('esx:showNotification', _source, 'Action ~r~impossible~s~ : ' .. onDutyPolice .. '/' .. ConfigLSD.PoliceNeeded.. ' ~b~Flics~s~ en service')
			return
		end
	end
	
	SetTimeout(ConfigLSD.Zones.Recolte1LSD.ItemTime, function()
		if PlayersRecolte1LSD[source] == true then

			local xPlayer = ESX.GetPlayerFromId(_source)
			local amount = ConfigLSD.Zones.Recolte1LSD.ItemAdd
			local item = ConfigLSD.Zones.Recolte1LSD.ItemDb_name
			local message = 'Vous avez reçu '
			TriggerEvent('esx:showNotification', _source, item, amount, message)
			xPlayer.addInventoryItem(item, amount)
			
			Recolte1LSD(_source)
		end
	end)
end

RegisterServerEvent('fg_lsd:startRecolte1LSD')
AddEventHandler('fg_lsd:startRecolte1LSD', function()

	local _source = source
	
	if PlayersRecolte1LSD[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~Sortez et revenez dans la zone !')
		PlayersRecolte1LSD[_source] = false	
	else
		PlayersRecolte1LSD[_source] = true
		TriggerClientEvent('esx:showNotification', _source, '~g~Action ~w~en cours...')
		Recolte1LSD(_source)
	end
end)

RegisterServerEvent('fg_lsd:stopRecolte1LSD')
AddEventHandler('fg_lsd:stopRecolte1LSD', function()
	local _source = source
	if PlayersRecolte1LSD[_source] == true then
		PlayersRecolte1LSD[_source] = false
	else	
		PlayersRecolte1LSD[_source] = true
	end
end)

--------------------------------------------- Recolte2LSD -----------------------------------------------------------------

local function Recolte2LSD(source)
	local _source = source
	local onDutyPolice = GetInServiceCount('police')

	if ConfigLSD.Hours then
		local heure = os.date("%H")
		if not (heure >= ""..ConfigLSD.openHours.."" and heure < ""..ConfigLSD.closeHours.."") then
			if onDutyPolice < ConfigLSD.PoliceNeeded then
				TriggerClientEvent('esx:showNotification', _source, 'Action ~r~impossible~s~ : ' .. onDutyPolice .. '/' .. ConfigLSD.PoliceNeeded.. ' ~b~Flics~s~ en service')
				return
			end
		end
	else
		if onDutyPolice < ConfigLSD.PoliceNeeded then
			TriggerClientEvent('esx:showNotification', _source, 'Action ~r~impossible~s~ : ' .. onDutyPolice .. '/' .. ConfigLSD.PoliceNeeded.. ' ~b~Flics~s~ en service')
			return
		end
	end
	
	SetTimeout(ConfigLSD.Zones.Recolte2LSD.ItemTime, function()
		if PlayersRecolte2LSD[source] == true then

			local xPlayer = ESX.GetPlayerFromId(_source)
			local amount = ConfigLSD.Zones.Recolte2LSD.ItemAdd
			local item = ConfigLSD.Zones.Recolte2LSD.ItemDb_name
			local message = 'Vous avez reçu '
			TriggerEvent('esx:showNotification', _source, item, amount, message)
			xPlayer.addInventoryItem(item, amount)
			
			Recolte2LSD(_source)
		end
	end)
end

RegisterServerEvent('fg_lsd:startRecolte2LSD')
AddEventHandler('fg_lsd:startRecolte2LSD', function()

	local _source = source
	
	if PlayersRecolte2LSD[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~Sortez et revenez dans la zone !')
		PlayersRecolte2LSD[_source] = false	
	else
		PlayersRecolte2LSD[_source] = true
		TriggerClientEvent('esx:showNotification', _source, '~g~Action ~w~en cours...')
		Recolte2LSD(_source)
	end
end)

RegisterServerEvent('fg_lsd:stopRecolte2LSD')
AddEventHandler('fg_lsd:stopRecolte2LSD', function()
	local _source = source
	if PlayersRecolte2LSD[_source] == true then
		PlayersRecolte2LSD[_source] = false
	else	
		PlayersRecolte2LSD[_source] = true
	end
end)

--------------------------------------------- Traitement1LSD -----------------------------------------------------------------

local function  Traitement1LSD(source)
	local _source = source
	local onDutyPolice = GetInServiceCount('police')
	
	if ConfigLSD.Hours then
		local heure = os.date("%H")
		if not (heure >= ""..ConfigLSD.openHours.."" and heure < ""..ConfigLSD.closeHours.."") then
			if onDutyPolice < ConfigLSD.PoliceNeeded then
				TriggerClientEvent('esx:showNotification', _source, 'Action ~r~impossible~s~ : ' .. onDutyPolice .. '/' .. ConfigLSD.PoliceNeeded.. ' ~b~Flics~s~ en service')
				return
			end
		end
	else
		if onDutyPolice < ConfigLSD.PoliceNeeded then
			TriggerClientEvent('esx:showNotification', _source, 'Action ~r~impossible~s~ : ' .. onDutyPolice .. '/' .. ConfigLSD.PoliceNeeded.. ' ~b~Flics~s~ en service')
			return
		end
	end

	SetTimeout(ConfigLSD.Zones.Traitement1LSD.ItemTime, function()
		if PlayersTraitement1LSD[source] == true then

			local xPlayer = ESX.GetPlayerFromId(_source)

			local QuantityRequire = xPlayer.getInventoryItem(ConfigLSD.Zones.Traitement1LSD.ItemRequires).count

			if QuantityRequire < ConfigLSD.Zones.Traitement1LSD.ItemRemove then
				TriggerClientEvent('esx:showNotification', _source, 'Vous n\'avez pas assez de '..ConfigLSD.Zones.Traitement1LSD.ItemRequires_name)
				PlayersTraitement1LSD[_source] = false
			else
				local amount = ConfigLSD.Zones.Traitement1LSD.ItemRemove
				local item = ConfigLSD.Zones.Traitement1LSD.ItemRequires
				local message = 'Vous avez utilisé '
				TriggerEvent('esx:showNotification', _source, item, amount, message)
				xPlayer.removeInventoryItem(item, amount)
				
				local amount = ConfigLSD.Zones.Traitement1LSD.ItemAdd
				local item = ConfigLSD.Zones.Traitement1LSD.ItemDb_name
				local message = 'Vous avez reçu '
				TriggerEvent('esx:showNotification', _source, item, amount, message)
				xPlayer.addInventoryItem(item, amount)
				
				Traitement1LSD(_source)
			end
		end
	end)
end

RegisterServerEvent('fg_lsd:startTraitement1LSD')
AddEventHandler('fg_lsd:startTraitement1LSD', function()

	local _source = source
	if PlayersTraitement1LSD[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~Sortez et revenez dans la zone !')
		PlayersTraitement1LSD[_source] = false
	else
		PlayersTraitement1LSD[_source] = true
		TriggerClientEvent('esx:showNotification', _source, '~g~Action ~w~en cours...')
		Traitement1LSD(_source)
	end
end)

RegisterServerEvent('fg_lsd:stopTraitement1LSD')
AddEventHandler('fg_lsd:stopTraitement1LSD', function()

	local _source = source
	if PlayersTraitement1LSD[_source] == true then
		PlayersTraitement1LSD[_source] = false
	else	
		PlayersTraitement1LSD[_source] = true
	end
end)

--------------------------------------------- Traitement2LSD -----------------------------------------------------------------

local function  Traitement2LSD(source)
	local _source = source
	local onDutyPolice = GetInServiceCount('police')
	
	if ConfigLSD.Hours then
		local heure = os.date("%H")
		if not (heure >= ""..ConfigLSD.openHours.."" and heure < ""..ConfigLSD.closeHours.."") then
			if onDutyPolice < ConfigLSD.PoliceNeeded then
				TriggerClientEvent('esx:showNotification', _source, 'Action ~r~impossible~s~ : ' .. onDutyPolice .. '/' .. ConfigLSD.PoliceNeeded.. ' ~b~Flics~s~ en service')
				return
			end
		end
	else
		if onDutyPolice < ConfigLSD.PoliceNeeded then
			TriggerClientEvent('esx:showNotification', _source, 'Action ~r~impossible~s~ : ' .. onDutyPolice .. '/' .. ConfigLSD.PoliceNeeded.. ' ~b~Flics~s~ en service')
			return
		end
	end

	SetTimeout(ConfigLSD.Zones.Traitement2LSD.ItemTime, function()
		if PlayersTraitement2LSD[source] == true then

			local xPlayer = ESX.GetPlayerFromId(_source)

			local QuantityRequire1 = xPlayer.getInventoryItem(ConfigLSD.Zones.Traitement2LSD.ItemRequires1).count
			local QuantityRequire2 = xPlayer.getInventoryItem(ConfigLSD.Zones.Traitement2LSD.ItemRequires2).count

			if QuantityRequire1 < ConfigLSD.Zones.Traitement2LSD.ItemRemove1 then
				TriggerClientEvent('esx:showNotification', _source, 'Vous n\'avez pas assez de '..ConfigLSD.Zones.Traitement2LSD.ItemRequires_name1)
				PlayersTraitement2LSD[_source] = false
			elseif QuantityRequire2 < ConfigLSD.Zones.Traitement2LSD.ItemRemove2 then
				TriggerClientEvent('esx:showNotification', _source, 'Vous n\'avez pas assez de '..ConfigLSD.Zones.Traitement2LSD.ItemRequires_name2)
				PlayersTraitement2LSD[_source] = false
			else
				local amount = ConfigLSD.Zones.Traitement2LSD.ItemRemove1
				local item = ConfigLSD.Zones.Traitement2LSD.ItemRequires1
				local message = 'Vous avez utilisé '
				TriggerEvent('esx:showNotification', _source, item, amount, message)
				xPlayer.removeInventoryItem(item, amount)

				local amount = ConfigLSD.Zones.Traitement2LSD.ItemRemove2
				local item = ConfigLSD.Zones.Traitement2LSD.ItemRequires2
				local message = 'Vous avez utilisé '
				TriggerEvent('esx:showNotification', _source, item, amount, message)
				xPlayer.removeInventoryItem(item, amount)
				
				local amount = ConfigLSD.Zones.Traitement2LSD.ItemAdd
				local item = ConfigLSD.Zones.Traitement2LSD.ItemDb_name
				local message = 'Vous avez reçu '
				TriggerEvent('esx:showNotification', _source, item, amount, message)
				xPlayer.addInventoryItem(item, amount)
				
				Traitement2LSD(_source)
			end
		end
	end)
end

RegisterServerEvent('fg_lsd:startTraitement2LSD')
AddEventHandler('fg_lsd:startTraitement2LSD', function()

	local _source = source
	if PlayersTraitement2LSD[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~Sortez et revenez dans la zone !')
		PlayersTraitement2LSD[_source] = false
	else
		PlayersTraitement2LSD[_source] = true
		TriggerClientEvent('esx:showNotification', _source, '~g~Action ~w~en cours...')
		Traitement2LSD(_source)
	end
end)

RegisterServerEvent('fg_lsd:stopTraitement2LSD')
AddEventHandler('fg_lsd:stopTraitement2LSD', function()

	local _source = source
	if PlayersTraitement2LSD[_source] == true then
		PlayersTraitement2LSD[_source] = false
	else	
		PlayersTraitement2LSD[_source] = true
	end
end)

--------------------------------------------- Vente1LSD -----------------------------------------------------------------
local function Vente1LSD(source)
	local _source = source
	local onDutyPolice = GetInServiceCount('police')
	
	if ConfigLSD.Hours then
		local heure = os.date("%H")
		if not (heure >= ""..ConfigLSD.openHours.."" and heure < ""..ConfigLSD.closeHours.."") then
			if onDutyPolice < ConfigLSD.PoliceNeeded then
				TriggerClientEvent('esx:showNotification', _source, 'Action ~r~impossible~s~ : ' .. onDutyPolice .. '/' .. ConfigLSD.PoliceNeeded.. ' ~b~Flics~s~ en service')
				return
			end
		end
	else
		if onDutyPolice < ConfigLSD.PoliceNeeded then
			TriggerClientEvent('esx:showNotification', _source, 'Action ~r~impossible~s~ : ' .. onDutyPolice .. '/' .. ConfigLSD.PoliceNeeded.. ' ~b~Flics~s~ en service')
			return
		end
	end

	SetTimeout(ConfigLSD.Zones.Vente1LSD.ItemTime, function()
		if PlayersVente1LSDLSD[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local Quantity = xPlayer.getInventoryItem(ConfigLSD.Zones.Vente1LSD.ItemRequires).count

			if Quantity < ConfigLSD.Zones.Vente1LSD.ItemRemove then
				TriggerClientEvent('esx:showNotification', _source, 'Vous n\'avez plus de '..ConfigLSD.Zones.Vente1LSD.ItemRequires_name..' a vendre.')
				PlayersVente1LSDLSD[_source] = false
				TriggerClientEvent('fg_lsd:Paye', _source)
			else
				local amount = ConfigLSD.Zones.Vente1LSD.ItemRemove
				local item = ConfigLSD.Zones.Vente1LSD.ItemRequires
				local message = 'Vous avez vendu '
				TriggerEvent('esx:showNotification', _source, item, amount, message)
				xPlayer.removeInventoryItem(item, amount)
				
				TriggerClientEvent('fg_lsd:prePaye', _source)
				
				Vente1LSD(_source)
			end
		end
	end)
end

RegisterServerEvent('fg_lsd:startVente1LSD')
AddEventHandler('fg_lsd:startVente1LSD', function()

	local _source = source

	if PlayersVente1LSDLSD[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~Sortez et revenez dans la zone !')
		PlayersVente1LSDLSD[_source] = false	
	else
		PlayersVente1LSDLSD[_source] = true
		TriggerClientEvent('esx:showNotification', _source, '~g~Action ~w~en cours...')
		Vente1LSD(_source)
	end
end)

RegisterServerEvent('fg_lsd:stopVente1LSD')
AddEventHandler('fg_lsd:stopVente1LSD', function()

	local _source = source
	
	if PlayersVente1LSDLSD[_source] == true then
		PlayersVente1LSDLSD[_source] = false
	else		
		PlayersVente1LSDLSD[_source] = true
	end
	TriggerClientEvent('fg_lsd:Paye', _source)
end)

RegisterServerEvent('fg_lsd:recupPayePlayer')
AddEventHandler('fg_lsd:recupPayePlayer', function(PriceWin)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	local amount = PriceWin
	
	if ConfigLSD.PayeType == 1 then
		xPlayer.addAccountMoney('money', amount)
		TriggerEvent('esx:showNotification', _source)
		
	elseif ConfigLSD.PayeType == 2 then
		xPlayer.addAccountMoney('banque', amount)
		TriggerEvent('esx:showNotification', _source)
		
	elseif ConfigLSD.PayeType == 3 then
		xPlayer.addAccountMoney('black_money', amount)
		TriggerEvent('esx:showNotification', _source)
		
	end
	
end)

----------------------------------------------------------
-- System de service
----------------------------------------------------------
local InService = {}

AddEventHandler("onResourceStart", function(name)
    if name == GetCurrentResourceName() then
		TriggerEvent('esx_duty:activateAllDuty', 'police')
		TriggerEvent('esx_duty:activateAllDuty', 'ambulance')
		TriggerEvent('esx_duty:activateAllDuty', 'taxi')
		TriggerEvent('esx_duty:activateAllDuty', 'mecano')
    end
end)

RegisterServerEvent('esx_duty:activateAllDuty')
AddEventHandler('esx_duty:activateAllDuty', function(name)
	InService[name]    = {}
end)

RegisterServerEvent('esx_duty:activateOnDuty')
AddEventHandler('esx_duty:activateOnDuty', function(name)
	local _source = source
	InService[name][_source] = true
end)

RegisterServerEvent('esx_duty:disableOnDuty')
AddEventHandler('esx_duty:disableOnDuty', function(name)
	local _source = source
	InService[name][_source] = nil
end)

function GetInServiceCount(name)

	local count = 0

	for k,v in pairs(InService[name]) do
		if v == true then
			count = count + 1
		end
	end

	return count

end

AddEventHandler('playerDropped', function()

	local _source = source
		
	for k,v in pairs(InService) do
		if v[_source] == true then
			v[_source] = nil
		end
	end

end)
