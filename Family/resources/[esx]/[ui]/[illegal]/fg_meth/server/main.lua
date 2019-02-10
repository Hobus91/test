ESX                			 = nil
local arrayWeight            = {}
local PlayersVente           = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-------- Traitement

RegisterServerEvent('fg_meth:traitement')
AddEventHandler('fg_meth:traitement', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local amount = Config.Zones.Recolte.ItemAdd
	local item = Config.Zones.Recolte.ItemDb_name
	local message = 'Vous avez reçu '
	TriggerEvent('esx:showNotification', _source, item, amount, message)
	xPlayer.addInventoryItem(item, amount)		

end)

-------- Vente

local function Vente(source)
	local _source = source
	local onDutyPolice = GetInServiceCount('police')

	if onDutyPolice < Config.PoliceNeeded then
		TriggerClientEvent('esx:showNotification', _source, 'Action ~r~impossible~s~ : Action impossible : ' .. onDutyPolice .. '/' .. Config.PoliceNeeded.. ' ~b~Flics~s~ en service')
		return
	end

	SetTimeout(Config.Zones.Vente.ItemTime, function()
		if PlayersVente[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local Quantity = xPlayer.getInventoryItem(Config.Zones.Vente.ItemRequires).count

			if Quantity < Config.Zones.Vente.ItemRemove then
				TriggerClientEvent('nobrain:showErrorNotif', _source, 'Vous n\'avez plus de '..Config.Zones.Vente.ItemRequires_name..' a vendre.')
				PlayersVente[_source] = false
				TriggerClientEvent('fg_meth:Paye', _source)
			else
				local amount = Config.Zones.Vente.ItemRemove
				local item = Config.Zones.Vente.ItemRequires
				local message = 'Vous avez vendu '
				TriggerEvent('esx:showNotification', _source, item, amount, message)
				xPlayer.removeInventoryItem(item, amount)
				
				TriggerClientEvent('fg_meth:prePaye', _source)
				
				Vente(_source)
			end
		end
	end)
end

RegisterServerEvent('fg_meth:startVente')
AddEventHandler('fg_meth:startVente', function()

	local _source = source

	if PlayersVente[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~Sortez et revenez dans la zone !')
		PlayersVente[_source] = false	
	else
		PlayersVente[_source] = true
		TriggerClientEvent('esx:showNotification', _source, '~g~Action ~w~en cours...')
		Vente(_source)
	end
end)

RegisterServerEvent('fg_meth:stopVente')
AddEventHandler('fg_meth:stopVente', function()

	local _source = source
	
	if PlayersVente[_source] == true then
		PlayersVente[_source] = false
	else		
		PlayersVente[_source] = true
	end
	TriggerClientEvent('fg_meth:Paye', _source)
end)

RegisterServerEvent('fg_meth:recupPayePlayer')
AddEventHandler('fg_meth:recupPayePlayer', function(PriceWin)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	local amount = PriceWin
	
	if Config.PayeType == 1 then
		xPlayer.addAccountMoney('money', amount)
		TriggerEvent('esx:showNotification', _source)
		
	elseif Config.PayeType == 2 then
		xPlayer.addAccountMoney('bank', amount)
		TriggerEvent('esx:showNotification', _source)
		
	elseif Config.PayeType == 3 then
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

--item tenue hazmat
ESX.RegisterUsableItem('GADGET_HAZMAT1', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    TriggerClientEvent('fg_meth:settenuehaz1', _source)
end)
