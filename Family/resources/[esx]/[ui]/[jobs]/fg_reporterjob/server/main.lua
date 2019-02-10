ESX               			 = nil
local arrayWeight            = {}
local PlayersRecolte         = {}
local os_time 				 = os.time
local os_date				 = os.date

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if ConfigReporter.MaxInService ~= -1 then
  TriggerEvent('esx_service:activateService', 'cnn', ConfigReporter.MaxInService)
end

TriggerEvent('esx_society:registerSociety', 'cnn', 'CNN', 'society_cnn', 'society_cnn', 'society_cnn', {type = 'private'})

RegisterServerEvent('fg_reporterjob:getStockItem')
AddEventHandler('fg_reporterjob:getStockItem', function(itemName, count)

	local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_cnn', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count then
      inventory.removeItem(itemName, count)
      xPlayer.addInventoryItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité invalide')
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez retiré ~g~x' .. count .. ' ' .. item.label)

  end)

end)

ESX.RegisterServerCallback('fg_reporterjob:getStockItems', function(source, cb)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_cnn', function(inventory)
    cb(inventory.items)
  end)

end)

RegisterServerEvent('fg_reporterjob:putStockItems')
AddEventHandler('fg_reporterjob:putStockItems', function(itemName, count)

	local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_cnn', function(inventory)

    local item = inventory.getItem(itemName)
    local playerItemCount = xPlayer.getInventoryItem(itemName).count

    if item.count >= 0 and count <= playerItemCount then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité invalide')
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez ajouté ~g~x' .. count .. ' ' .. item.label)

  end)

end)

ESX.RegisterServerCallback('fg_reporterjob:getPlayerInventory', function(source, cb)

	local _source = source
  local xPlayer    = ESX.GetPlayerFromId(_source)
  local items      = xPlayer.inventory

  cb({
    items      = items
  })

end)


-- Recolte 

-- Recolte
local function Recolte(source)
	local _source = source

	SetTimeout(ConfigReporter.Zones.Recolte.ItemTime, function()

		if PlayersRecolte[_source] == true then
			local xPlayer = ESX.GetPlayerFromId(_source)
			local amount = ConfigReporter.Zones.Recolte.ItemAdd
			local item = ConfigReporter.Zones.Recolte.ItemDb_name
			local message = 'Vous avez reçu '
			TriggerEvent('esx:showNotification', _source, item, amount, message)
			xPlayer.addInventoryItem(item, amount)
			
			Recolte(_source)
		end
	end)
end

RegisterServerEvent('fg_reporterjob:startRecolte')
AddEventHandler('fg_reporterjob:startRecolte', function()

	local _source = source
	
	if PlayersRecolte[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~Sortez et revenez dans la zone !')
		PlayersRecolte[_source] = false	
	else
		PlayersRecolte[_source] = true
		TriggerClientEvent('esx:showNotification', _source, '~g~Action ~w~en cours...')
		Recolte(_source)
	end
end)

RegisterServerEvent('fg_reporterjob:stopRecolte')
AddEventHandler('fg_reporterjob:stopRecolte', function()
	local _source = source
	if PlayersRecolte[_source] == true then
		PlayersRecolte[_source] = false
	else	
		PlayersRecolte[_source] = true
	end
end)





--- Annonce

-- Test annonce
RegisterServerEvent('fg_reporterjob:annonce')
AddEventHandler('fg_reporterjob:annonce', function(result)
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()
	local text     = result
	--print(text)
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		TriggerClientEvent('fg_reporterjob:annonce', xPlayers[i],text)
	end

	Wait(10000)

	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		TriggerClientEvent('fg_reporterjob:annoncestop', xPlayers[i])
	end

end)
TriggerEvent('cron:runAt', 6, 4, PaySubscriptions)