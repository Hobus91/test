--================================================================================================
--==                                VARIABLES - DO NOT EDIT                                     ==
--================================================================================================
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('bank:deposit')
AddEventHandler('bank:deposit', function(amount, inbank)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if inbank then
		if amount == nil or amount <= 0 or amount > xPlayer.getMoney() then
			TriggerClientEvent('chatMessage', _source, "Montant invalide")
		else
			xPlayer.removeMoney(amount)
			xPlayer.addAccountMoney('bank', tonumber(amount))
		end
	else
		TriggerClientEvent('chatMessage', _source, "Vous devez aller à la banque pour faire un dépôt")
	end
	
end)


RegisterServerEvent('bank:withdraw')
AddEventHandler('bank:withdraw', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local base = 0
	amount = tonumber(amount)
	base = xPlayer.getAccount('bank').money
	if amount == nil or amount <= 0 or amount > base then
		TriggerClientEvent('chatMessage', _source, "Montant invalide")
	else
		xPlayer.removeAccountMoney('bank', amount)
		xPlayer.addMoney(amount)
	end
end)

RegisterServerEvent('bank:balance')
AddEventHandler('bank:balance', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	balance = xPlayer.getAccount('bank').money
	TriggerClientEvent('currentbalance1', _source, balance)
	
end)


RegisterServerEvent('bank:transfer')
AddEventHandler('bank:transfer', function(to, amountt, inbank)
	local _source = source

	if inbank then
		local xPlayer = ESX.GetPlayerFromId(_source)
		local zPlayer = ESX.GetPlayerFromId(to)
		local balance = 0
		balance = xPlayer.getAccount('bank').money
		zbalance = zPlayer.getAccount('bank').money
		
		if tonumber(_source) == tonumber(to) then
			TriggerClientEvent('chatMessage', _source, "Transfert impossible")
		else
			if balance <= 0 or balance < tonumber(amountt) or tonumber(amountt) <= 0 then
				TriggerClientEvent('chatMessage', _source, "Vous n'avez pas assez d'argent en banque")
			else
				xPlayer.removeAccountMoney('bank', amountt)
				zPlayer.addAccountMoney('bank', amountt)
			end
			
		end
	else
		TriggerClientEvent('chatMessage', _source, "Vous devez aller à la banque pour faire un transfert")
	end
end)





