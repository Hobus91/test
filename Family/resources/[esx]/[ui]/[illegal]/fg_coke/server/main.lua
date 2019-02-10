ESX                			  = nil
local PlayersRecolte1Coke         = {}
local PlayersRecolte2Coke         = {}
local PlayersTraitement1Coke      = {}
local PlayersVente1Coke           = {}
local arrayWeight             = {}
local itemWeight              = 0

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
--------------------------------------------- Recolte1Coke -----------------------------------------------------------------

local function Recolte1Coke(source)
	local _source = source
	local onDutyPolice = GetInServiceCount('police')
	
	if ConfigCoke.Hours then
		local heure = os.date("%H")
		if not (heure >= ""..ConfigCoke.openHours.."" and heure < ""..ConfigCoke.closeHours.."") then
			if onDutyPolice < ConfigCoke.PoliceNeeded then
				TriggerClientEvent('esx:showNotification', _source, 'Action ~r~impossible~s~ : ' .. onDutyPolice .. '/' .. ConfigCoke.PoliceNeeded.. ' ~b~Flics~s~ en service')
				return
			end
		end
	else
		if onDutyPolice < ConfigCoke.PoliceNeeded then
			TriggerClientEvent('esx:showNotification', _source, 'Action ~r~impossible~s~ : ' .. onDutyPolice .. '/' .. ConfigCoke.PoliceNeeded.. ' ~b~Flics~s~ en service')
			return
		end
	end
	
	SetTimeout(ConfigCoke.Zones.Recolte1Coke.ItemTime, function()
		if PlayersRecolte1Coke[source] == true then

			local xPlayer = ESX.GetPlayerFromId(_source)
			local amount = ConfigCoke.Zones.Recolte1Coke.ItemAdd
			local item = ConfigCoke.Zones.Recolte1Coke.ItemDb_name
			local message = 'Vous avez reçu '
			TriggerEvent('esx:showNotification', _source, item, amount, message)
			xPlayer.addInventoryItem(item, amount)
			
			Recolte1Coke(_source)
		end
	end)
end

RegisterServerEvent('fg_coke:startRecolte1Coke')
AddEventHandler('fg_coke:startRecolte1Coke', function()

	local _source = source
	
	if PlayersRecolte1Coke[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~Sortez et revenez dans la zone !')
		PlayersRecolte1Coke[_source] = false	
	else
		PlayersRecolte1Coke[_source] = true
		TriggerClientEvent('esx:showNotification', _source, '~g~Action ~w~en cours...')
		Recolte1Coke(_source)
	end
end)

RegisterServerEvent('fg_coke:stopRecolte1Coke')
AddEventHandler('fg_coke:stopRecolte1Coke', function()
	local _source = source
	if PlayersRecolte1Coke[_source] == true then
		PlayersRecolte1Coke[_source] = false
	else	
		PlayersRecolte1Coke[_source] = true
	end
end)
--------------------------------------------- Recolte2Coke -----------------------------------------------------------------

local function Recolte2Coke(source)
	local _source = source
	 local onDutyPolice = GetInServiceCount('police')
	
	 if ConfigCoke.Hours then
		 local heure = os.date("%H")
		 if not (heure >= ""..ConfigCoke.openHours.."" and heure < ""..ConfigCoke.closeHours.."") then
			 if onDutyPolice < ConfigCoke.PoliceNeeded then
				 TriggerClientEvent('esx:showNotification', _source, 'Action ~r~impossible~s~ : ' .. onDutyPolice .. '/' .. ConfigCoke.PoliceNeeded.. ' ~b~Flics~s~ en service')
				 return
			 end
		 end
	 else
		 if onDutyPolice < ConfigCoke.PoliceNeeded then
			 TriggerClientEvent('esx:showNotification', _source, 'Action ~r~impossible~s~ : ' .. onDutyPolice .. '/' .. ConfigCoke.PoliceNeeded.. ' ~b~Flics~s~ en service')
			 return
		 end
	 end
	
	SetTimeout(ConfigCoke.Zones.Recolte2Coke.ItemTime, function()
		if PlayersRecolte2Coke[source] == true then

			local xPlayer = ESX.GetPlayerFromId(_source)
			local amount = ConfigCoke.Zones.Recolte2Coke.ItemAdd
			local item = ConfigCoke.Zones.Recolte2Coke.ItemDb_name
			local message = 'Vous avez reçu '
			TriggerEvent('esx:showNotification', _source, item, amount, message)
			xPlayer.addInventoryItem(item, amount)
			
			Recolte2Coke(_source)
		end
	end)
end

RegisterServerEvent('fg_coke:startRecolte2Coke')
AddEventHandler('fg_coke:startRecolte2Coke', function()

	local _source = source
	
	if PlayersRecolte2Coke[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~Sortez et revenez dans la zone !')
		PlayersRecolte2Coke[_source] = false	
	else
		PlayersRecolte2Coke[_source] = true
		TriggerClientEvent('esx:showNotification', _source, '~g~Action ~w~en cours...')
		Recolte2Coke(_source)
	end
end)

RegisterServerEvent('fg_coke:stopRecolte2Coke')
AddEventHandler('fg_coke:stopRecolte2Coke', function()
	local _source = source
	if PlayersRecolte2Coke[_source] == true then
		PlayersRecolte2Coke[_source] = false
	else	
		PlayersRecolte2Coke[_source] = true
	end
end)
--------------------------------------------- Recolte3 -----------------------------------------------------------------

local function Recolte3(source)
	local _source = source
	local onDutyPolice = GetInServiceCount('police')
	
	if ConfigCoke.Hours then
		local heure = os.date("%H")
		if not (heure >= ""..ConfigCoke.openHours.."" and heure < ""..ConfigCoke.closeHours.."") then
			if onDutyPolice < ConfigCoke.PoliceNeeded then
				TriggerClientEvent('esx:showNotification', _source, 'Action ~r~impossible~s~ : ' .. onDutyPolice .. '/' .. ConfigCoke.PoliceNeeded.. ' ~b~Flics~s~ en service')
				return
			end
		end
	else
		if onDutyPolice < ConfigCoke.PoliceNeeded then
			TriggerClientEvent('esx:showNotification', _source, 'Action ~r~impossible~s~ : ' .. onDutyPolice .. '/' .. ConfigCoke.PoliceNeeded.. ' ~b~Flics~s~ en service')
			return
		end
	end
	
	SetTimeout(ConfigCoke.Zones.Recolte3.ItemTime, function()
		if PlayersRecolte3[source] == true then

			local xPlayer = ESX.GetPlayerFromId(_source)
			local amount = ConfigCoke.Zones.Recolte3.ItemAdd
			local item = ConfigCoke.Zones.Recolte3.ItemDb_name
			local message = 'Vous avez reçu '
			TriggerEvent('esx:showNotification', _source, item, amount, message)
			xPlayer.addInventoryItem(item, amount)
			
			Recolte3(_source)
		end
	end)
end

RegisterServerEvent('fg_coke:startRecolte3')
AddEventHandler('fg_coke:startRecolte3', function()

	local _source = source
	
	if PlayersRecolte3[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~Sortez et revenez dans la zone !')
		PlayersRecolte3[_source] = false	
	else
		PlayersRecolte3[_source] = true
		TriggerClientEvent('esx:showNotification', _source, '~g~Action ~w~en cours...')
		Recolte3(_source)
	end
end)

RegisterServerEvent('fg_coke:stopRecolte3')
AddEventHandler('fg_coke:stopRecolte3', function()
	local _source = source
	if PlayersRecolte3[_source] == true then
		PlayersRecolte3[_source] = false
	else	
		PlayersRecolte3[_source] = true
	end
end)

--------------------------------------------- Traitement1Coke -----------------------------------------------------------------

local function  Traitement1Coke(source)
	local _source = source
	local onDutyPolice = GetInServiceCount('police')
	
	if ConfigCoke.Hours then
		local heure = os.date("%H")
		if not (heure >= ""..ConfigCoke.openHours.."" and heure < ""..ConfigCoke.closeHours.."") then
			if onDutyPolice < ConfigCoke.PoliceNeeded then
				TriggerClientEvent('esx:showNotification', _source, 'Action ~r~impossible~s~ : ' .. onDutyPolice .. '/' .. ConfigCoke.PoliceNeeded.. ' ~b~Flics~s~ en service')
				return
			end
		end
	else
		if onDutyPolice < ConfigCoke.PoliceNeeded then
			TriggerClientEvent('esx:showNotification', _source, 'Action ~r~impossible~s~ : ' .. onDutyPolice .. '/' .. ConfigCoke.PoliceNeeded.. ' ~b~Flics~s~ en service')
			return
		end
	end

	SetTimeout(ConfigCoke.Zones.Traitement1Coke.ItemTime, function()
		if PlayersTraitement1Coke[source] == true then

			local xPlayer = ESX.GetPlayerFromId(_source)

			local QuantityRequire1 = xPlayer.getInventoryItem(ConfigCoke.Zones.Traitement1Coke.ItemRequires1).count
			local QuantityRequire2 = xPlayer.getInventoryItem(ConfigCoke.Zones.Traitement1Coke.ItemRequires2).count
			local QuantityRequire3 = xPlayer.getInventoryItem(ConfigCoke.Zones.Traitement1Coke.ItemRequires3).count

			if QuantityRequire1 < ConfigCoke.Zones.Traitement1Coke.ItemRemove1 then
				TriggerClientEvent('esx:showNotification', _source, 'Vous n\'avez pas assez de '..ConfigCoke.Zones.Traitement1Coke.ItemRequires_name1)
				PlayersTraitement1Coke[_source] = false
			elseif QuantityRequire2 < ConfigCoke.Zones.Traitement1Coke.ItemRemove2 then
				TriggerClientEvent('esx:showNotification', _source, 'Vous n\'avez pas assez de '..ConfigCoke.Zones.Traitement1Coke.ItemRequires_name2)
				PlayersTraitement1Coke[_source] = false
			elseif QuantityRequire3 < ConfigCoke.Zones.Traitement1Coke.ItemRemove3 then
				TriggerClientEvent('esx:showNotification', _source, 'Vous n\'avez pas assez de '..ConfigCoke.Zones.Traitement1Coke.ItemRequires_name3)
				PlayersTraitement1Coke[_source] = false
			else
				local amount = ConfigCoke.Zones.Traitement1Coke.ItemRemove1
				local item = ConfigCoke.Zones.Traitement1Coke.ItemRequires1
				local message = 'Vous avez utilisé '
				TriggerEvent('esx:showNotification', _source, item, amount, message)
				xPlayer.removeInventoryItem(item, amount)
				
				local amount = ConfigCoke.Zones.Traitement1Coke.ItemRemove2
				local item = ConfigCoke.Zones.Traitement1Coke.ItemRequires2
				local message = 'Vous avez utilisé '
				TriggerEvent('esx:showNotification', _source, item, amount, message)
				xPlayer.removeInventoryItem(item, amount)
				
				local amount = ConfigCoke.Zones.Traitement1Coke.ItemRemove3
				local item = ConfigCoke.Zones.Traitement1Coke.ItemRequires3
				local message = 'Vous avez utilisé '
				TriggerEvent('esx:showNotification', _source, item, amount, message)
				xPlayer.removeInventoryItem(item, amount)
				
				local amount = ConfigCoke.Zones.Traitement1Coke.ItemAdd
				local item = ConfigCoke.Zones.Traitement1Coke.ItemDb_name
				local message = 'Vous avez reçu '
				TriggerEvent('esx:showNotification', _source, item, amount, message)
				xPlayer.addInventoryItem(item, amount)
				
				Traitement1Coke(_source)
			end
		end
	end)
end

RegisterServerEvent('fg_coke:startTraitement1Coke')
AddEventHandler('fg_coke:startTraitement1Coke', function()

	local _source = source
	if PlayersTraitement1Coke[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~Sortez et revenez dans la zone !')
		PlayersTraitement1Coke[_source] = false
	else
		PlayersTraitement1Coke[_source] = true
		TriggerClientEvent('esx:showNotification', _source, '~g~Action ~w~en cours...')
		Traitement1Coke(_source)
	end
end)

RegisterServerEvent('fg_coke:stopTraitement1Coke')
AddEventHandler('fg_coke:stopTraitement1Coke', function()

	local _source = source
	if PlayersTraitement1Coke[_source] == true then
		PlayersTraitement1Coke[_source] = false
	else	
		PlayersTraitement1Coke[_source] = true
	end
end)

--------------------------------------------- Vente1Coke -----------------------------------------------------------------
local function Vente1Coke(source)
	local _source = source
	local onDutyPolice = GetInServiceCount('police')
	
	if ConfigCoke.Hours then
		local heure = os.date("%H")
		if not (heure >= ""..ConfigCoke.openHours.."" and heure < ""..ConfigCoke.closeHours.."") then
			if onDutyPolice < ConfigCoke.PoliceNeeded then
				TriggerClientEvent('esx:showNotification', _source, 'Action ~r~impossible~s~ : ' .. onDutyPolice .. '/' .. ConfigCoke.PoliceNeeded.. ' ~b~Flics~s~ en service')
				return
			end
		end
	else
		if onDutyPolice < ConfigCoke.PoliceNeeded then
			TriggerClientEvent('esx:showNotification', _source, 'Action ~r~impossible~s~ : ' .. onDutyPolice .. '/' .. ConfigCoke.PoliceNeeded.. ' ~b~Flics~s~ en service')
			return
		end
	end

	SetTimeout(ConfigCoke.Zones.Vente1Coke.ItemTime, function()
		if PlayersVente1Coke[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local Quantity = xPlayer.getInventoryItem(ConfigCoke.Zones.Vente1Coke.ItemRequires).count

			if Quantity < ConfigCoke.Zones.Vente1Coke.ItemRemove then
				TriggerClientEvent('esx:showNotification', _source, 'Vous n\'avez plus de '..ConfigCoke.Zones.Vente1Coke.ItemRequires_name..' a vendre.')
				PlayersVente1Coke[_source] = false
				TriggerClientEvent('fg_coke:Paye', _source)
			else
				local amount = ConfigCoke.Zones.Vente1Coke.ItemRemove
				local item = ConfigCoke.Zones.Vente1Coke.ItemRequires
				local message = 'Vous avez vendu '
				TriggerEvent('esx:showNotification', _source, item, amount, message)
				xPlayer.removeInventoryItem(item, amount)
				
				TriggerClientEvent('fg_coke:prePaye', _source)
				
				Vente1Coke(_source)
			end
		end
	end)
end

RegisterServerEvent('fg_coke:startVente1Coke')
AddEventHandler('fg_coke:startVente1Coke', function()

	local _source = source

	if PlayersVente1Coke[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~Sortez et revenez dans la zone !')
		PlayersVente1Coke[_source] = false	
	else
		PlayersVente1Coke[_source] = true
		TriggerClientEvent('esx:showNotification', _source, '~g~Action ~w~en cours...')
		Vente1Coke(_source)
	end
end)

RegisterServerEvent('fg_coke:stopVente1Coke')
AddEventHandler('fg_coke:stopVente1Coke', function()

	local _source = source
	
	if PlayersVente1Coke[_source] == true then
		PlayersVente1Coke[_source] = false
	else		
		PlayersVente1Coke[_source] = true
	end
	TriggerClientEvent('fg_coke:Paye', _source)
end)

RegisterServerEvent('fg_coke:recupPayePlayer')
AddEventHandler('fg_coke:recupPayePlayer', function(PriceWin)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	local amount = PriceWin
	
	if ConfigCoke.PayeType == 1 then
		xPlayer.addAccountMoney('money', amount)
		TriggerEvent('esx:showNotification', _source)
		
	elseif ConfigCoke.PayeType == 2 then
		xPlayer.addAccountMoney('banque', amount)
		TriggerEvent('esx:showNotification', _source)
		
	elseif ConfigCoke.PayeType == 3 then
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
