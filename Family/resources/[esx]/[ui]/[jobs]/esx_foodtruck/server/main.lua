ESX                = nil
local PlayersReselling 				 = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
  TriggerEvent('esx_service:activateService', 'foodtruck', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'foodtruck', _U('foodtruck_customer'), true, true)
TriggerEvent('esx_society:registerSociety', 'foodtruck', 'Foodtruck', 'society_foodtruck', 'society_foodtruck', 'society_foodtruck', {type = 'private'})



RegisterServerEvent('esx_foodtruck:getStockItem')
AddEventHandler('esx_foodtruck:getStockItem', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_foodtruck', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count then
      inventory.removeItem(itemName, count)
      xPlayer.addInventoryItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_removed') .. count .. ' ' .. item.label)

  end)

end)

ESX.RegisterServerCallback('esx_foodtruck:getStockItems', function(source, cb)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_foodtruck', function(inventory)
    cb(inventory.items)
  end)

end)

RegisterServerEvent('esx_foodtruck:putStockItems')
AddEventHandler('esx_foodtruck:putStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_foodtruck', function(inventory)

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


RegisterServerEvent('esx_foodtruck:getFridgeStockItem')
AddEventHandler('esx_foodtruck:getFridgeStockItem', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_foodtruck_fridge', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count then
      inventory.removeItem(itemName, count)
      xPlayer.addInventoryItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_removed') .. count .. ' ' .. item.label)

  end)

end)

ESX.RegisterServerCallback('esx_foodtruck:getFridgeStockItems', function(source, cb)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_foodtruck_fridge', function(inventory)
    cb(inventory.items)
  end)

end)

RegisterServerEvent('esx_foodtruck:putFridgeStockItems')
AddEventHandler('esx_foodtruck:putFridgeStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_foodtruck_fridge', function(inventory)

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


RegisterServerEvent('esx_foodtruck:buyItem')
AddEventHandler('esx_foodtruck:buyItem', function(itemName, price, itemLabel)

    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local limit = xPlayer.getInventoryItem(itemName).limit
    local qtty = xPlayer.getInventoryItem(itemName).count
    local societyAccount = nil

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_foodtruck', function(account)
        societyAccount = account
      end)
    
    if societyAccount ~= nil and societyAccount.money >= price then
        if qtty > limit then
            societyAccount.removeMoney(price)
            xPlayer.addInventoryItem(itemName, 1)
            TriggerClientEvent('esx:showNotification', _source, _U('bought') .. itemLabel)
        else
            TriggerClientEvent('esx:showNotification', _source, _U('max_item'))
        end
    else
        TriggerClientEvent('esx:showNotification', _source, _U('not_enough'))
    end

end)


RegisterServerEvent('esx_foodtruck:craftingCoktails')
AddEventHandler('esx_foodtruck:craftingCoktails', function(itemValue)

    local _source = source
    local _itemValue = itemValue
    TriggerClientEvent('esx:showNotification', _source, _U('assembling_cocktail'))

    if _itemValue == 'hamburger' then
        SetTimeout(10000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('meat').count
            local bethQuantity      = xPlayer.getInventoryItem('bread').count

            if alephQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('meat') .. '~w~')
            elseif bethQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('bread') .. '~w~')
            else
                local chanceToMiss = math.random(100)
                if chanceToMiss <= Config.MissCraft then
                    TriggerClientEvent('esx:showNotification', _source, _U('craft_miss'))
                    xPlayer.removeInventoryItem('meat', 1)
                    xPlayer.removeInventoryItem('bread', 1)
                else
                    TriggerClientEvent('esx:showNotification', _source, _U('craft') .. _U('hamburger') .. ' ~w~!')
                    xPlayer.removeInventoryItem('meat', 1)
                    xPlayer.removeInventoryItem('bread', 1)
                    xPlayer.addInventoryItem('hamburger', 1)
                end
            end

        end)
    end

    -- if _itemValue == 'golem' then
    --     Setchampagne(10000, function()        

    --         local xPlayer           = ESX.GetPlayerFromId(_source)

    --         local alephQuantity     = xPlayer.getInventoryItem('limonade').count
    --         local bethQuantity      = xPlayer.getInventoryItem('vodka').count
    --         local gimelQuantity     = xPlayer.getInventoryItem('ice').count

    --         if alephQuantity < 2 then
    --             TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('limonade') .. '~w~')
    --         elseif bethQuantity < 2 then
    --             TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('vodka') .. '~w~')
    --         elseif gimelQuantity < 1 then
    --             TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('ice') .. '~w~')
    --         else
    --             local chanceToMiss = math.random(100)
    --             if chanceToMiss <= Config.MissCraft then
    --                 TriggerClientEvent('esx:showNotification', _source, _U('craft_miss'))
    --                 xPlayer.removeInventoryItem('limonade', 2)
    --                 xPlayer.removeInventoryItem('vodka', 2)
    --                 xPlayer.removeInventoryItem('ice', 1)
    --             else
    --                 TriggerClientEvent('esx:showNotification', _source, _U('craft') .. _U('golem') .. ' ~w~!')
    --                 xPlayer.removeInventoryItem('limonade', 2)
    --                 xPlayer.removeInventoryItem('vodka', 2)
    --                 xPlayer.removeInventoryItem('ice', 1)
    --                 xPlayer.addInventoryItem('golem', 1)
    --             end
    --         end

    --     end)
    -- end
    
    -- if _itemValue == 'whiskycoca' then
    --     Setchampagne(10000, function()        

    --         local xPlayer           = ESX.GetPlayerFromId(_source)

    --         local alephQuantity     = xPlayer.getInventoryItem('soda').count
    --         local bethQuantity      = xPlayer.getInventoryItem('whisky').count

    --         if alephQuantity < 2 then
    --             TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('soda') .. '~w~')
    --         elseif bethQuantity < 2 then
    --             TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('whisky') .. '~w~')
    --         else
    --             local chanceToMiss = math.random(100)
    --             if chanceToMiss <= Config.MissCraft then
    --                 TriggerClientEvent('esx:showNotification', _source, _U('craft_miss'))
    --                 xPlayer.removeInventoryItem('soda', 2)
    --                 xPlayer.removeInventoryItem('whisky', 2)
    --             else
    --                 TriggerClientEvent('esx:showNotification', _source, _U('craft') .. _U('whiskycoca') .. ' ~w~!')
    --                 xPlayer.removeInventoryItem('soda', 2)
    --                 xPlayer.removeInventoryItem('whisky', 2)
    --                 xPlayer.addInventoryItem('whiskycoca', 1)
    --             end
    --         end

    --     end)
    -- end

    -- if _itemValue == 'rhumcoca' then
    --     Setchampagne(10000, function()        

    --         local xPlayer           = ESX.GetPlayerFromId(_source)

    --         local alephQuantity     = xPlayer.getInventoryItem('soda').count
    --         local bethQuantity      = xPlayer.getInventoryItem('rhum').count

    --         if alephQuantity < 2 then
    --             TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('soda') .. '~w~')
    --         elseif bethQuantity < 2 then
    --             TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('rhum') .. '~w~')
    --         else
    --             local chanceToMiss = math.random(100)
    --             if chanceToMiss <= Config.MissCraft then
    --                 TriggerClientEvent('esx:showNotification', _source, _U('craft_miss'))
    --                 xPlayer.removeInventoryItem('soda', 2)
    --                 xPlayer.removeInventoryItem('rhum', 2)
    --             else
    --                 TriggerClientEvent('esx:showNotification', _source, _U('craft') .. _U('rhumcoca') .. ' ~w~!')
    --                 xPlayer.removeInventoryItem('soda', 2)
    --                 xPlayer.removeInventoryItem('rhum', 2)
    --                 xPlayer.addInventoryItem('rhumcoca', 1)
    --             end
    --         end

    --     end)
    -- end

    -- if _itemValue == 'vodkaenergy' then
    --     Setchampagne(10000, function()        

    --         local xPlayer           = ESX.GetPlayerFromId(_source)

    --         local alephQuantity     = xPlayer.getInventoryItem('energy').count
    --         local bethQuantity      = xPlayer.getInventoryItem('vodka').count
    --         local gimelQuantity     = xPlayer.getInventoryItem('ice').count

    --         if alephQuantity < 2 then
    --             TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('energy') .. '~w~')
    --         elseif bethQuantity < 2 then
    --             TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('vodka') .. '~w~')
    --         elseif gimelQuantity < 1 then
    --             TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('ice') .. '~w~')
    --         else
    --             local chanceToMiss = math.random(100)
    --             if chanceToMiss <= Config.MissCraft then
    --                 TriggerClientEvent('esx:showNotification', _source, _U('craft_miss'))
    --                 xPlayer.removeInventoryItem('energy', 2)
    --                 xPlayer.removeInventoryItem('vodka', 2)
    --                 xPlayer.removeInventoryItem('ice', 1)
    --             else
    --                 TriggerClientEvent('esx:showNotification', _source, _U('craft') .. _U('vodkaenergy') .. ' ~w~!')
    --                 xPlayer.removeInventoryItem('energy', 2)
    --                 xPlayer.removeInventoryItem('vodka', 2)
    --                 xPlayer.removeInventoryItem('ice', 1)
    --                 xPlayer.addInventoryItem('vodkaenergy', 1)
    --             end
    --         end

    --     end)
    -- end

    -- if _itemValue == 'vodkafruit' then
    --     Setchampagne(10000, function()        

    --         local xPlayer           = ESX.GetPlayerFromId(_source)

    --         local alephQuantity     = xPlayer.getInventoryItem('jusfruit').count
    --         local bethQuantity      = xPlayer.getInventoryItem('vodka').count
    --         local gimelQuantity     = xPlayer.getInventoryItem('ice').count

    --         if alephQuantity < 2 then
    --             TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('jusfruit') .. '~w~')
    --         elseif bethQuantity < 2 then
    --             TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('vodka') .. '~w~')
    --         elseif gimelQuantity < 1 then
    --             TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('ice') .. '~w~')
    --         else
    --             local chanceToMiss = math.random(100)
    --             if chanceToMiss <= Config.MissCraft then
    --                 TriggerClientEvent('esx:showNotification', _source, _U('craft_miss'))
    --                 xPlayer.removeInventoryItem('jusfruit', 2)
    --                 xPlayer.removeInventoryItem('vodka', 2)
    --                 xPlayer.removeInventoryItem('ice', 1)
    --             else
    --                 TriggerClientEvent('esx:showNotification', _source, _U('craft') .. _U('vodkafruit') .. ' ~w~!')
    --                 xPlayer.removeInventoryItem('jusfruit', 2)
    --                 xPlayer.removeInventoryItem('vodka', 2)
    --                 xPlayer.removeInventoryItem('ice', 1)
    --                 xPlayer.addInventoryItem('vodkafruit', 1) 
    --             end
    --         end

    --     end)
    -- end

    -- if _itemValue == 'rhumfruit' then
    --     Setchampagne(10000, function()        

    --         local xPlayer           = ESX.GetPlayerFromId(_source)

    --         local alephQuantity     = xPlayer.getInventoryItem('jusfruit').count
    --         local bethQuantity      = xPlayer.getInventoryItem('rhum').count
    --         local gimelQuantity     = xPlayer.getInventoryItem('ice').count

    --         if alephQuantity < 2 then
    --             TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('jusfruit') .. '~w~')
    --         elseif bethQuantity < 2 then
    --             TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('rhum') .. '~w~')
    --         elseif gimelQuantity < 1 then
    --             TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('ice') .. '~w~')
    --         else
    --             local chanceToMiss = math.random(100)
    --             if chanceToMiss <= Config.MissCraft then
    --                 TriggerClientEvent('esx:showNotification', _source, _U('craft_miss'))
    --                 xPlayer.removeInventoryItem('jusfruit', 2)
    --                 xPlayer.removeInventoryItem('rhum', 2)
    --                 xPlayer.removeInventoryItem('ice', 1)
    --             else
    --                 TriggerClientEvent('esx:showNotification', _source, _U('craft') .. _U('rhumfruit') .. ' ~w~!')
    --                 xPlayer.removeInventoryItem('jusfruit', 2)
    --                 xPlayer.removeInventoryItem('rhum', 2)
    --                 xPlayer.removeInventoryItem('ice', 1)
    --                 xPlayer.addInventoryItem('rhumfruit', 1)
    --             end
    --         end

    --     end)
    -- end

    -- if _itemValue == 'teqpaf' then
    --     Setchampagne(10000, function()        

    --         local xPlayer           = ESX.GetPlayerFromId(_source)

    --         local alephQuantity     = xPlayer.getInventoryItem('limonade').count
    --         local bethQuantity      = xPlayer.getInventoryItem('tequila').count

    --         if alephQuantity < 2 then
    --             TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('limonade') .. '~w~')
    --         elseif bethQuantity < 2 then
    --             TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('tequila') .. '~w~')
    --         else
    --             local chanceToMiss = math.random(100)
    --             if chanceToMiss <= Config.MissCraft then
    --                 TriggerClientEvent('esx:showNotification', _source, _U('craft_miss'))
    --                 xPlayer.removeInventoryItem('limonade', 2)
    --                 xPlayer.removeInventoryItem('tequila', 2)
    --             else
    --                 TriggerClientEvent('esx:showNotification', _source, _U('craft') .. _U('teqpaf') .. ' ~w~!')
    --                 xPlayer.removeInventoryItem('limonade', 2)
    --                 xPlayer.removeInventoryItem('tequila', 2)
    --                 xPlayer.addInventoryItem('teqpaf', 1)
    --             end
    --         end

    --     end)
    -- end

    -- if _itemValue == 'mojito' then
    --     Setchampagne(10000, function()        

    --         local xPlayer           = ESX.GetPlayerFromId(_source)

    --         local alephQuantity     = xPlayer.getInventoryItem('rhum').count
    --         local bethQuantity      = xPlayer.getInventoryItem('limonade').count
    --         local gimelQuantity     = xPlayer.getInventoryItem('menthe').count
    --         local daletQuantity      = xPlayer.getInventoryItem('ice').count

    --         if alephQuantity < 2 then
    --             TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('rhum') .. '~w~')
    --         elseif bethQuantity < 2 then
    --             TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('limonade') .. '~w~')
    --         elseif gimelQuantity < 2 then
    --             TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('menthe') .. '~w~')
    --         elseif daletQuantity < 1 then
    --             TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('ice') .. '~w~')
    --         else
    --             local chanceToMiss = math.random(100)
    --             if chanceToMiss <= Config.MissCraft then
    --                 TriggerClientEvent('esx:showNotification', _source, _U('craft_miss'))
    --                 xPlayer.removeInventoryItem('rhum', 2)
    --                 xPlayer.removeInventoryItem('limonade', 2)
    --                 xPlayer.removeInventoryItem('menthe', 2)
    --                 xPlayer.removeInventoryItem('ice', 1)
    --             else
    --                 TriggerClientEvent('esx:showNotification', _source, _U('craft') .. _U('mojito') .. ' ~w~!')
    --                 xPlayer.removeInventoryItem('rhum', 2)
    --                 xPlayer.removeInventoryItem('limonade', 2)
    --                 xPlayer.removeInventoryItem('menthe', 2)
    --                 xPlayer.removeInventoryItem('ice', 1)
    --                 xPlayer.addInventoryItem('mojito', 1)
    --             end
    --         end

    --     end)
    -- end

    -- if _itemValue == 'mixapero' then
    --     Setchampagne(10000, function()        

    --         local xPlayer           = ESX.GetPlayerFromId(_source)

    --         local alephQuantity     = xPlayer.getInventoryItem('bolcacahuetes').count
    --         local bethQuantity      = xPlayer.getInventoryItem('bolnoixcajou').count
    --         local gimelQuantity     = xPlayer.getInventoryItem('bolpistache').count
    --         local daletQuantity     = xPlayer.getInventoryItem('bolchips').count

    --         if alephQuantity < 2 then
    --             TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('bolcacahuetes') .. '~w~')
    --         elseif bethQuantity < 2 then
    --             TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('bolnoixcajou') .. '~w~')
    --         elseif gimelQuantity < 2 then
    --             TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('bolpistache') .. '~w~')
    --         elseif daletQuantity < 2 then
    --             TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('bolchips') .. '~w~')
    --         else
    --             local chanceToMiss = math.random(100)
    --             if chanceToMiss <= Config.MissCraft then
    --                 TriggerClientEvent('esx:showNotification', _source, _U('craft_miss'))
    --                 xPlayer.removeInventoryItem('bolcacahuetes', 2)
    --                 xPlayer.removeInventoryItem('bolnoixcajou', 2)
    --                 xPlayer.removeInventoryItem('bolpistache', 2)
    --                 xPlayer.removeInventoryItem('bolchips', 1)
    --             else
    --                 TriggerClientEvent('esx:showNotification', _source, _U('craft') .. _U('mixapero') .. ' ~w~!')
    --                 xPlayer.removeInventoryItem('bolcacahuetes', 2)
    --                 xPlayer.removeInventoryItem('bolnoixcajou', 2)
    --                 xPlayer.removeInventoryItem('bolpistache', 2)
    --                 xPlayer.removeInventoryItem('bolchips', 2)
    --                 xPlayer.addInventoryItem('mixapero', 1)
    --             end
    --         end

    --     end)
    -- end

    -- if _itemValue == 'metreshooter' then
    --     Setchampagne(10000, function()        

    --         local xPlayer           = ESX.GetPlayerFromId(_source)

    --         local alephQuantity     = xPlayer.getInventoryItem('jager').count
    --         local bethQuantity      = xPlayer.getInventoryItem('vodka').count
    --         local gimelQuantity     = xPlayer.getInventoryItem('whisky').count
    --         local daletQuantity     = xPlayer.getInventoryItem('tequila').count

    --         if alephQuantity < 2 then
    --             TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('jager') .. '~w~')
    --         elseif bethQuantity < 2 then
    --             TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('vodka') .. '~w~')
    --         elseif gimelQuantity < 2 then
    --             TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('whisky') .. '~w~')
    --         elseif daletQuantity < 2 then
    --             TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('tequila') .. '~w~')
    --         else
    --             local chanceToMiss = math.random(100)
    --             if chanceToMiss <= Config.MissCraft then
    --                 TriggerClientEvent('esx:showNotification', _source, _U('craft_miss'))
    --                 xPlayer.removeInventoryItem('jager', 2)
    --                 xPlayer.removeInventoryItem('vodka', 2)
    --                 xPlayer.removeInventoryItem('whisky', 2)
    --                 xPlayer.removeInventoryItem('tequila', 2)
    --             else
    --                 TriggerClientEvent('esx:showNotification', _source, _U('craft') .. _U('metreshooter') .. ' ~w~!')
    --                 xPlayer.removeInventoryItem('jager', 2)
    --                 xPlayer.removeInventoryItem('vodka', 2)
    --                 xPlayer.removeInventoryItem('whisky', 2)
    --                 xPlayer.removeInventoryItem('tequila', 2)
    --                 xPlayer.addInventoryItem('metreshooter', 1)
    --             end
    --         end

    --     end)
    -- end

    -- if _itemValue == 'jagercerbere' then
    --     Setchampagne(10000, function()        

    --         local xPlayer           = ESX.GetPlayerFromId(_source)

    --         local alephQuantity     = xPlayer.getInventoryItem('jagerbomb').count
    --         local bethQuantity      = xPlayer.getInventoryItem('vodka').count
    --         local gimelQuantity     = xPlayer.getInventoryItem('tequila').count

    --         if alephQuantity < 1 then
    --             TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('jagerbomb') .. '~w~')
    --         elseif bethQuantity < 2 then
    --             TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('vodka') .. '~w~')
    --         elseif gimelQuantity < 2 then
    --             TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('tequila') .. '~w~')
    --         else
    --             local chanceToMiss = math.random(100)
    --             if chanceToMiss <= Config.MissCraft then
    --                 TriggerClientEvent('esx:showNotification', _source, _U('craft_miss'))
    --                 xPlayer.removeInventoryItem('jagerbomb', 1)
    --                 xPlayer.removeInventoryItem('vodka', 2)
    --                 xPlayer.removeInventoryItem('tequila', 2)
    --             else
    --                 TriggerClientEvent('esx:showNotification', _source, _U('craft') .. _U('jagercerbere') .. ' ~w~!')
    --                 xPlayer.removeInventoryItem('jagerbomb', 1)
    --                 xPlayer.removeInventoryItem('vodka', 2)
    --                 xPlayer.removeInventoryItem('tequila', 2)
    --                 xPlayer.addInventoryItem('jagercerbere', 1)
    --             end
    --         end

    --     end)
    -- end

end)


ESX.RegisterServerCallback('esx_foodtruck:getVaultWeapons', function(source, cb)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_foodtruck', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    cb(weapons)

  end)

end)

ESX.RegisterServerCallback('esx_foodtruck:addVaultWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.removeWeapon(weaponName)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_foodtruck', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = weapons[i].count + 1
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 1
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('esx_foodtruck:removeVaultWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.addWeapon(weaponName, 1000)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_foodtruck', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 0
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('esx_foodtruck:getPlayerInventory', function(source, cb)

  local xPlayer    = ESX.GetPlayerFromId(source)
  local items      = xPlayer.inventory

  cb({
    items      = items
  })

end)

----------------Revente---------------------------
local function Resell(source)

	local _source = source
	SetTimeout(5000, function()

		if PlayersReselling[_source] == true then

			local xPlayer  = ESX.GetPlayerFromId(_source)

			local champagneQuantity = xPlayer.getInventoryItem('champagne').count
			local meatQuantity = xPlayer.getInventoryItem('meat').count
			local limonadeQuantity = xPlayer.getInventoryItem('limonade').count

			if champagneQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', _source, 'Vous n\'avez plus de champagne à vendre')
				PlayersReselling[_source] = false
			elseif meatQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', _source, 'Vous n\'avez plus de Viande à vendre')
				PlayersReselling[_source] = false
			elseif limonadeQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', _source, 'Vous n\'avez plus de limonade à vendre')
				PlayersReselling[_source] = false
			else

				xPlayer.removeInventoryItem('champagne', 1)
				local amount = 1
				local item = 'Vous avez utilisé 1 Champagne'
				local message = 'Vous avez utilisé '
				TriggerClientEvent('esx:showNotification', xPlayer.source, item)
				
				xPlayer.removeInventoryItem('meat', 1)
				local amount = 1
				local item = 'Vous avez utilisé 1 Viande'
				local message = 'Vous avez utilisé '
				TriggerClientEvent('esx:showNotification', xPlayer.source, item)
				
				xPlayer.removeInventoryItem('limonade', 1)
				local amount = 1
				local item = 'Vous avez utilisé 1 Limonade'
				local message = 'Vous avez utilisé '
				TriggerClientEvent('esx:showNotification', xPlayer.source, item)
				
				local total 	   = 49
				local societyMoney = total

				TriggerEvent('esx_addonaccount:getSharedAccount', 'society_foodtruck', function(societyAccount)
					societyAccount.addMoney(societyMoney)
				end)

				message = 'Votre société a gagné '.. societyMoney ..' $'
				TriggerClientEvent('esx:showNotification', _source, message)

				Resell(_source)
			end

		end
	end)
end

RegisterServerEvent('esx_foodtruck:ZoneVenteStart')
AddEventHandler('esx_foodtruck:ZoneVenteStart', function()
    local _source = source
    
    if PlayersReselling[_source] == false then
        TriggerClientEvent('esx:showNotification', _source, '~r~Sortez et revenez dans la zone !')
		PlayersReselling[_source] = false
    else
        PlayersReselling[_source] = true
        TriggerClientEvent('esx:showNotification', _source, '~g~Action ~w~en cours...')
        Resell(_source, item)
    end
end)

RegisterServerEvent('esx_foodtruck:ZoneVenteStop')
AddEventHandler('esx_foodtruck:ZoneVenteStop', function()
    local _source = source
	
    if PlayersReselling[_source] == true then
        PlayersReselling[_source] = false
        -- TriggerClientEvent('esx:showNotification', _source, 'Vous ~r~sortez ~w~de la ~g~zone...')
        Resell(_source)
    else
        -- TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~recolter~w~ à présent!')        
        PlayersReselling[_source] = true
    end
end)

------------------------------ resgister usable item -----------------------------------

ESX.RegisterUsableItem('hamburger', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('hamburger', 1)
	TriggerClientEvent('esx_status:add', source, 'hunger', 750000)
	TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_cs_hamburger_01')
    TriggerClientEvent('esx:showNotification', source, _U('eat_hamburger'))
end)
