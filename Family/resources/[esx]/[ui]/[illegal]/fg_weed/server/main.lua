ESX                			      = nil
local PlayersRecolte1Weed         = {}
local PlayersTraitement1Weed      = {}
local PlayersVente1WeedWeed       = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
--------------------------------------------- Recolte1Weed -----------------------------------------------------------------

local function Recolte1Weed(source)
	local _source = source
	local onDutyPolice = GetInServiceCount('police')

	if ConfigWeed.Hours then
		local heure = os.date("%H")
		if not (heure >= ""..ConfigWeed.openHours.."" and heure < ""..ConfigWeed.closeHours.."") then
			if onDutyPolice < ConfigWeed.PoliceNeeded then
				TriggerClientEvent('esx:showNotification', _source, 'Action ~r~impossible~s~ : ' .. onDutyPolice .. '/' .. ConfigWeed.PoliceNeeded.. ' ~b~Flics~s~ en service')
				return
			end
		end
	else
		if onDutyPolice < ConfigWeed.PoliceNeeded then
			TriggerClientEvent('esx:showNotification', _source, 'Action ~r~impossible~s~ : ' .. onDutyPolice .. '/' .. ConfigWeed.PoliceNeeded.. ' ~b~Flics~s~ en service')
			return
		end
	end
	
	SetTimeout(ConfigWeed.Zones.Recolte1Weed.ItemTime, function()
		if PlayersRecolte1Weed[source] == true then

			local xPlayer = ESX.GetPlayerFromId(_source)
			local amount = ConfigWeed.Zones.Recolte1Weed.ItemAdd
			local item = ConfigWeed.Zones.Recolte1Weed.ItemDb_name
			local message = 'Vous avez reçu '
			TriggerEvent('esx:showNotification', _source, item, amount, message)
			xPlayer.addInventoryItem(item, amount)
			
			Recolte1Weed(_source)
		end
	end)
end

RegisterServerEvent('fg_weed:startRecolte1Weed')
AddEventHandler('fg_weed:startRecolte1Weed', function()

	local _source = source
	
	if PlayersRecolte1Weed[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~Sortez et revenez dans la zone !')
		PlayersRecolte1Weed[_source] = false	
	else
		PlayersRecolte1Weed[_source] = true
		TriggerClientEvent('esx:showNotification', _source, '~g~Action ~w~en cours...')
		Recolte1Weed(_source)
	end
end)

RegisterServerEvent('fg_weed:stopRecolte1Weed')
AddEventHandler('fg_weed:stopRecolte1Weed', function()
	local _source = source
	if PlayersRecolte1Weed[_source] == true then
		PlayersRecolte1Weed[_source] = false
	else	
		PlayersRecolte1Weed[_source] = true
	end
end)

--------------------------------------------- Traitement1Weed -----------------------------------------------------------------

local function  Traitement1Weed(source)
	local _source = source
	local onDutyPolice = GetInServiceCount('police')
	
	if ConfigWeed.Hours then
		local heure = os.date("%H")
		if not (heure >= ""..ConfigWeed.openHours.."" and heure < ""..ConfigWeed.closeHours.."") then
			if onDutyPolice < ConfigWeed.PoliceNeeded then
				TriggerClientEvent('esx:showNotification', _source, 'Action ~r~impossible~s~ : ' .. onDutyPolice .. '/' .. ConfigWeed.PoliceNeeded.. ' ~b~Flics~s~ en service')
				return
			end
		end
	else
		if onDutyPolice < ConfigWeed.PoliceNeeded then
			TriggerClientEvent('esx:showNotification', _source, 'Action ~r~impossible~s~ : ' .. onDutyPolice .. '/' .. ConfigWeed.PoliceNeeded.. ' ~b~Flics~s~ en service')
			return
		end
	end

	SetTimeout(ConfigWeed.Zones.Traitement1Weed.ItemTime, function()
		if PlayersTraitement1Weed[source] == true then

			local xPlayer = ESX.GetPlayerFromId(_source)

			local QuantityRequire = xPlayer.getInventoryItem(ConfigWeed.Zones.Traitement1Weed.ItemRequires).count

			if QuantityRequire < ConfigWeed.Zones.Traitement1Weed.ItemRemove then
				TriggerClientEvent('esx:showNotification', _source, 'Vous n\'avez pas assez de '..ConfigWeed.Zones.Traitement1Weed.ItemRequires_name)
				PlayersTraitement1Weed[_source] = false
			else
				local amount = ConfigWeed.Zones.Traitement1Weed.ItemRemove
				local item = ConfigWeed.Zones.Traitement1Weed.ItemRequires
				local message = 'Vous avez utilisé '
				TriggerEvent('esx:showNotification', _source, item, amount, message)
				xPlayer.removeInventoryItem(item, amount)
				
				local amount = ConfigWeed.Zones.Traitement1Weed.ItemAdd
				local item = ConfigWeed.Zones.Traitement1Weed.ItemDb_name
				local message = 'Vous avez reçu '
				TriggerEvent('esx:showNotification', _source, item, amount, message)
				xPlayer.addInventoryItem(item, amount)
				
				Traitement1Weed(_source)
			end
		end
	end)
end

RegisterServerEvent('fg_weed:startTraitement1Weed')
AddEventHandler('fg_weed:startTraitement1Weed', function()

	local _source = source
	if PlayersTraitement1Weed[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~Sortez et revenez dans la zone !')
		PlayersTraitement1Weed[_source] = false
	else
		PlayersTraitement1Weed[_source] = true
		TriggerClientEvent('esx:showNotification', _source, '~g~Action ~w~en cours...')
		Traitement1Weed(_source)
	end
end)

RegisterServerEvent('fg_weed:stopTraitement1Weed')
AddEventHandler('fg_weed:stopTraitement1Weed', function()

	local _source = source
	if PlayersTraitement1Weed[_source] == true then
		PlayersTraitement1Weed[_source] = false
	else	
		PlayersTraitement1Weed[_source] = true
	end
end)

--------------------------------------------- Vente1Weed -----------------------------------------------------------------
local function Vente1Weed(source)
	local _source = source
	local onDutyPolice = GetInServiceCount('police')
	
	if ConfigWeed.Hours then
		local heure = os.date("%H")
		if not (heure >= ""..ConfigWeed.openHours.."" and heure < ""..ConfigWeed.closeHours.."") then
			if onDutyPolice < ConfigWeed.PoliceNeeded then
				TriggerClientEvent('esx:showNotification', _source, 'Action ~r~impossible~s~ : ' .. onDutyPolice .. '/' .. ConfigWeed.PoliceNeeded.. ' ~b~Flics~s~ en service')
				return
			end
		end
	else
		if onDutyPolice < ConfigWeed.PoliceNeeded then
			TriggerClientEvent('esx:showNotification', _source, 'Action ~r~impossible~s~ : ' .. onDutyPolice .. '/' .. ConfigWeed.PoliceNeeded.. ' ~b~Flics~s~ en service')
			return
		end
	end

	SetTimeout(ConfigWeed.Zones.Vente1Weed.ItemTime, function()
		if PlayersVente1WeedWeed[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local Quantity = xPlayer.getInventoryItem(ConfigWeed.Zones.Vente1Weed.ItemRequires).count

			if Quantity < ConfigWeed.Zones.Vente1Weed.ItemRemove then
				TriggerClientEvent('esx:showNotification', _source, 'Vous n\'avez plus de '..ConfigWeed.Zones.Vente1Weed.ItemRequires_name..' a vendre.')
				PlayersVente1WeedWeed[_source] = false
				TriggerClientEvent('fg_weed:Paye', _source)
			else
				local amount = ConfigWeed.Zones.Vente1Weed.ItemRemove
				local item = ConfigWeed.Zones.Vente1Weed.ItemRequires
				local message = 'Vous avez vendu '
				TriggerEvent('esx:showNotification', _source, item, amount, message)
				xPlayer.removeInventoryItem(item, amount)
				
				TriggerClientEvent('fg_weed:prePaye', _source)
				
				Vente1Weed(_source)
			end
		end
	end)
end

RegisterServerEvent('fg_weed:startVente1Weed')
AddEventHandler('fg_weed:startVente1Weed', function()

	local _source = source

	if PlayersVente1WeedWeed[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~Sortez et revenez dans la zone !')
		PlayersVente1WeedWeed[_source] = false	
	else
		PlayersVente1WeedWeed[_source] = true
		TriggerClientEvent('esx:showNotification', _source, '~g~Action ~w~en cours...')
		Vente1Weed(_source)
	end
end)

RegisterServerEvent('fg_weed:stopVente1Weed')
AddEventHandler('fg_weed:stopVente1Weed', function()

	local _source = source
	
	if PlayersVente1WeedWeed[_source] == true then
		PlayersVente1WeedWeed[_source] = false
	else		
		PlayersVente1WeedWeed[_source] = true
	end
	TriggerClientEvent('fg_weed:Paye', _source)
end)

RegisterServerEvent('fg_weed:recupPayePlayer')
AddEventHandler('fg_weed:recupPayePlayer', function(PriceWin)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	local amount = PriceWin
	
	if ConfigWeed.PayeType == 1 then
		xPlayer.addAccountMoney('money', amount)
		TriggerEvent('esx:showNotification', _source)
		
	elseif ConfigWeed.PayeType == 2 then
		xPlayer.addAccountMoney('banque', amount)
		TriggerEvent('esx:showNotification', _source)
		
	elseif ConfigWeed.PayeType == 3 then
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
