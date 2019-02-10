ESX                			      = nil
local PlayersRecolte1Weed         = {}
local PlayersBlanchiment1Sac      = {}
local PlayersVente1SacWeed       = {}

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

RegisterServerEvent('fg_sac:startRecolte1Weed')
AddEventHandler('fg_sac:startRecolte1Weed', function()

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

RegisterServerEvent('fg_sac:stopRecolte1Weed')
AddEventHandler('fg_sac:stopRecolte1Weed', function()
	local _source = source
	if PlayersRecolte1Weed[_source] == true then
		PlayersRecolte1Weed[_source] = false
	else	
		PlayersRecolte1Weed[_source] = true
	end
end)

--------------------------------------------- Blanchiment1Sac -----------------------------------------------------------------

local function  Blanchiment1Sac(source)
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

	SetTimeout(ConfigWeed.Zones.Blanchiment1Sac.ItemTime, function()
		if PlayersBlanchiment1Sac[source] == true then

			local xPlayer = ESX.GetPlayerFromId(_source)

			local QuantityRequire = xPlayer.getInventoryItem(ConfigWeed.Zones.Blanchiment1Sac.ItemRequires).count

			if QuantityRequire < ConfigWeed.Zones.Blanchiment1Sac.ItemRemove then
				TriggerClientEvent('esx:showNotification', _source, 'Vous n\'avez pas assez de '..ConfigWeed.Zones.Blanchiment1Sac.ItemRequires_name)
				PlayersBlanchiment1Sac[_source] = false
			else
				local amount = ConfigWeed.Zones.Blanchiment1Sac.ItemRemove
				local item = ConfigWeed.Zones.Blanchiment1Sac.ItemRequires
				local message = 'Vous avez utilisé '
				TriggerEvent('esx:showNotification', _source, item, amount, message)
				xPlayer.removeInventoryItem(item, amount)
				
				local amount = ConfigWeed.Zones.Blanchiment1Sac.ItemAdd
				local item = ConfigWeed.Zones.Blanchiment1Sac.ItemDb_name
				local message = 'Vous avez reçu '
				TriggerEvent('esx:showNotification', _source, item, amount, message)
				xPlayer.addInventoryItem(item, amount)
				
				Blanchiment1Sac(_source)
			end
		end
	end)
end

RegisterServerEvent('fg_sac:startBlanchiment1Sac')
AddEventHandler('fg_sac:startBlanchiment1Sac', function()

	local _source = source
	if PlayersBlanchiment1Sac[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~Sortez et revenez dans la zone !')
		PlayersBlanchiment1Sac[_source] = false
	else
		PlayersBlanchiment1Sac[_source] = true
		TriggerClientEvent('esx:showNotification', _source, '~g~Action ~w~en cours...')
		Blanchiment1Sac(_source)
	end
end)

RegisterServerEvent('fg_sac:stopBlanchiment1Sac')
AddEventHandler('fg_sac:stopBlanchiment1Sac', function()

	local _source = source
	if PlayersBlanchiment1Sac[_source] == true then
		PlayersBlanchiment1Sac[_source] = false
	else	
		PlayersBlanchiment1Sac[_source] = true
	end
end)

--------------------------------------------- Vente1Sac -----------------------------------------------------------------
local function Vente1Sac(source)
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

	SetTimeout(ConfigWeed.Zones.Vente1Sac.ItemTime, function()
		if PlayersVente1SacWeed[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local Quantity = xPlayer.getInventoryItem(ConfigWeed.Zones.Vente1Sac.ItemRequires).count

			if Quantity < ConfigWeed.Zones.Vente1Sac.ItemRemove then
				TriggerClientEvent('esx:showNotification', _source, 'Vous n\'avez plus de '..ConfigWeed.Zones.Vente1Sac.ItemRequires_name..' a vendre.')
				PlayersVente1SacWeed[_source] = false
				TriggerClientEvent('fg_sac:Paye', _source)
			else
				local amount = ConfigWeed.Zones.Vente1Sac.ItemRemove
				local item = ConfigWeed.Zones.Vente1Sac.ItemRequires
				local message = 'Vous avez vendu '
				TriggerEvent('esx:showNotification', _source, item, amount, message)
				xPlayer.removeInventoryItem(item, amount)
				
				TriggerClientEvent('fg_sac:prePaye', _source)
				
				Vente1Sac(_source)
			end
		end
	end)
end

RegisterServerEvent('fg_sac:startVente1Sac')
AddEventHandler('fg_sac:startVente1Sac', function()

	local _source = source

	if PlayersVente1SacWeed[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~Sortez et revenez dans la zone !')
		PlayersVente1SacWeed[_source] = false	
	else
		PlayersVente1SacWeed[_source] = true
		TriggerClientEvent('esx:showNotification', _source, '~g~Action ~w~en cours...')
		Vente1Sac(_source)
	end
end)

RegisterServerEvent('fg_sac:stopVente1Sac')
AddEventHandler('fg_sac:stopVente1Sac', function()

	local _source = source
	
	if PlayersVente1SacWeed[_source] == true then
		PlayersVente1SacWeed[_source] = false
	else		
		PlayersVente1SacWeed[_source] = true
	end
	TriggerClientEvent('fg_sac:Paye', _source)
end)

RegisterServerEvent('fg_sac:recupPayePlayer')
AddEventHandler('fg_sac:recupPayePlayer', function(PriceWin)

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
