ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_phone:registerNumber', 'banker', _('bank_customer'), false, false)
TriggerEvent('esx_society:registerSociety', 'banker', 'Banquier', 'society_banker', 'society_banker', 'society_banker', {type = 'public'})

RegisterServerEvent('esx_bankerjob:customerDeposit')
AddEventHandler('esx_bankerjob:customerDeposit', function (target, amount)
  local xPlayer = ESX.GetPlayerFromId(target)

  TriggerEvent('esx_addonaccount:getSharedAccount', 'society_banker', function (account)
    if amount > 0 and account.money >= amount then
      account.removeMoney(amount)

      TriggerEvent('esx_addonaccount:getAccount', 'bank_savings', xPlayer.identifier, function (account)
        account.addMoney(amount)
      end)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_amount'))
    end
  end)
end)

RegisterServerEvent('esx_bankerjob:customerWithdraw')
AddEventHandler('esx_bankerjob:customerWithdraw', function (target, amount)
  local xPlayer = ESX.GetPlayerFromId(target)

  TriggerEvent('esx_addonaccount:getAccount', 'bank_savings', xPlayer.identifier, function (account)
    if amount > 0 and account.money >= amount then
      account.removeMoney(amount)

      TriggerEvent('esx_addonaccount:getSharedAccount', 'society_banker', function (account)
        account.addMoney(amount)
      end)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_amount'))
    end
  end)
end)

ESX.RegisterServerCallback('esx_bankerjob:getCustomers', function (source, cb)
  local xPlayers  = ESX.GetPlayers()
  local customers = {}

  for i=1, #xPlayers, 1 do

    local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

    TriggerEvent('esx_addonaccount:getAccount', 'bank_savings', xPlayer.identifier, function (account)
      table.insert(customers, {
        source      = xPlayer.source,
        name        = GetPlayerName(xPlayer.source),
        bankSavings = account.money
      })
    end)

  end

  cb(customers)
end)

function CalculateBankSavings (d, h, m)
  local asyncTasks = {}

  MySQL.Async.fetchAll(
    'SELECT * FROM addon_account_data WHERE account_name = @account_name',
    { ['@account_name'] = 'bank_savings' },
    function (result)
      local bankInterests = 0
      local xPlayers      = ESX.GetPlayers()

      for i=1, #result, 1 do
        local foundPlayer = false
        local xPlayer     = nil

        for i=1, #xPlayers, 1 do
          local xPlayer2 = ESX.GetPlayerFromId(xPlayers[i])
          if xPlayer2.identifier == result[i].owner then
            foundPlayer = true
            xPlayer     = xPlayer2
          end
        end

        if foundPlayer then
          TriggerEvent('esx_addonaccount:getAccount', 'bank_savings', xPlayer.identifier, function (account)
            local interests = math.floor(account.money / 100 * Config.BankSavingPercentage)
            bankInterests   = bankInterests + interests

            table.insert(asyncTasks, function(cb)
              account.addMoney(interests)
            end)
          end)
        else
          local interests = math.floor(result[i].money / 100 * Config.BankSavingPercentage)
          local newMoney  = result[i].money + interests;
          bankInterests   = bankInterests + interests

          local scope = function (newMoney, owner)
            table.insert(asyncTasks, function (cb)

              MySQL.Async.execute(
                'UPDATE addon_account_data SET money = @money WHERE owner = @owner AND account_name = @account_name',
                {
                  ['@money']        = newMoney,
                  ['@owner']        = owner,
                  ['@account_name'] = 'bank_savings',
                },
                function (rowsChanged)
                  cb()
                end
              )
            end)
          end

          scope(newMoney, result[i].owner)
        end
      end

      TriggerEvent('esx_addonaccount:getSharedAccount', 'society_banker', function (account)
        account.addMoney(bankInterests)
      end)

      Async.parallelLimit(asyncTasks, 5, function (results)
        print('[BANK] Calculated interests')
      end)

    end
  )
end

TriggerEvent('cron:runAt', 22, 0, CalculateBankSavings)

RegisterServerEvent('esx_bankerjob:putStockItems')
AddEventHandler('esx_bankerjob:putStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_banker', function(inventory)

    local item = inventory.getItem(itemName)
    local playerItemCount = xPlayer.getInventoryItem(itemName).count

    if item.count >= 0 and count <= playerItemCount then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_added') .. count .. ' ' .. item.label)

  end)

end)

RegisterServerEvent('esx_bankerjob:getStockItem')
AddEventHandler('esx_bankerjob:getStockItem', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_banker', function(inventory)
		local item = inventory.getItem(itemName)
		local sourceItem = xPlayer.getInventoryItem(itemName)
		
		-- is there enough in the society?
		if count > 0 and item.count >= count then
		
			-- can the player carry the said amount of x item?
			if sourceItem.limit ~= -1 and (sourceItem.count + count) > sourceItem.limit then
				TriggerClientEvent('esx:showNotification', xPlayer.source, _U('player_cannot_hold'))
			else
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_withdrawn', count, item.label))
			end
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
		end
	end)
end)

ESX.RegisterServerCallback('esx_bankerjob:getStockItems', function(source, cb)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_banker', function(inventory)
    cb(inventory.items)
  end)

end)


ESX.RegisterServerCallback('esx_bankerjob:getPlayerInventory', function(source, cb)

  local xPlayer    = ESX.GetPlayerFromId(source)
  local items      = xPlayer.inventory

  cb({
    items      = items
  })

end)