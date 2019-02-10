ESX			= nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('nb_base:setDisplayBousoleSV')
AddEventHandler('nb_base:setDisplayBousoleSV', function(val)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local viewMode = val
	local etatGps = xPlayer.getInventoryItem('gps').count

	if etatGps >= 1 then
		TriggerClientEvent('nb_base:setDisplayBousole',_source, viewMode)
	else
		local viewMode = true
		TriggerClientEvent('nb_base:setDisplayBousole',_source, viewMode)
	end
end)