local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX                           = nil
local PlayerData              = {}
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local onDuty 				  = false
local vehOut				  = false
local vehOut_mission          = nil

local affichenews 			  = false	
local texteafiche			  = nil
local messagenotfinish        = true

local Blips                   = {}

local isInMarker              = false
local isInPublicMarker        = false
local hintIsShowed            = false
local hintToDisplay           = "no hint to display"

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
  onDuty = false
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
  onDuty = false
end)

function OpenCloakroomMenu()

	local elements = {}

	if onDuty then
		table.insert(elements,{label = 'Terminer votre service', value = 'citizen_wear'})
	else
		table.insert(elements,{label = 'Prendre votre service', value = 'job_wear'})
	end

	ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'cloakroom',
      {
        title    = 'Vestiaire',
        align    = 'top-left',
        elements = elements,
        },
        function(data, menu)

            if data.current.value == 'citizen_wear' then
				onDuty = false
				menu.close()
                ESX.ShowNotification('Fin de ~r~Service')
				-- gcPhone
				TriggerServerEvent("player:serviceOff", "cnn")
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				  local model = nil

				  if skin.sex == 0 then
					model = GetHashKey("mp_m_freemode_01")
				  else
					model = GetHashKey("mp_f_freemode_01")
				  end

				  RequestModel(model)
				  while not HasModelLoaded(model) do
					RequestModel(model)
					Citizen.Wait(1)
				  end

				  SetPlayerModel(PlayerId(), model)
				  SetModelAsNoLongerNeeded(model)

				  TriggerEvent('skinchanger:loadSkin', skin)
				  TriggerEvent('esx:restoreLoadout')
				  
				  local playerPed = GetPlayerPed(-1)
				  -- SetPedArmour(playerPed, 0)
				  ClearPedBloodDamage(playerPed)
				  ResetPedVisibleDamage(playerPed)
				  ClearPedLastWeaponDamage(playerPed)
				end)
            end

            if data.current.value == 'job_wear' then
				onDuty = true
                menu.close()
				ESX.ShowNotification('Prise de ~g~Service')
				-- gcPhone
				TriggerServerEvent("player:serviceOn", "cnn")
				local playerPed = GetPlayerPed(-1)

				-- SetPedArmour(playerPed, 0)
				ClearPedBloodDamage(playerPed)
				ResetPedVisibleDamage(playerPed)
				ClearPedLastWeaponDamage(playerPed)
            end

			CurrentAction     = 'cloakroom_menu'
			CurrentActionMsg  = ConfigReporter.Zones.Cloakroom.hint
			CurrentActionData = {}
        end,
        function(data, menu)
        	menu.close()
			CurrentAction     = 'cloakroom_menu'
			CurrentActionMsg  = ConfigReporter.Zones.Cloakroom.hint
			CurrentActionData = {}    
		end    	
    )
end

Citizen.CreateThread(function()
	while true do
		Wait(10000)
		if vehOut_mission ~= nil then
			if not DoesEntityExist(vehOut_mission) then
				vehOut = false
			end
		end
	end
end)

function OpenBossMenu()
   if ConfigReporter.EnablePlayerManagement and PlayerData.job ~= nil and (PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name == 'viceboss')  then

		local elements = {
  			{label = 'Gerer entreprise',        value = 'boss_actions'},
			{label = 'deposer dans le coffre ',        value = 'put_stock'},
			{label = 'Retirer du coffre',        value = 'get_stock'}
		}

		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'cnn_boss',
			{
				title    = 'CNN',
				elements = elements
			},
			function(data, menu)



				if data.current.value == 'boss_actions' then
					TriggerEvent('esx_society:openBossMenu', 'cnn', function(data, menu)
						menu.close()
					end)
				end
				if data.current.value == 'put_stock' then
					OpenPutStocksMenu()
				end

				if data.current.value == 'get_stock' then
					OpenGetStocksMenu()
				end



			end,
			function(data, menu)
				menu.close()
    			CurrentAction     = 'boss_menu'
    			CurrentActionMsg  = ConfigReporter.Zones.BossAction.hint
    			CurrentActionData = {}
			end
		)
	else
		ESX.ShowNotification('~r~Vous devez être patron !')
	end
end

function OpenPutStocksMenu()

ESX.TriggerServerCallback('fg_reporterjob:getPlayerInventory', function(inventory)

		local elements = {}

		for i=1, #inventory.items, 1 do

			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {label = item.label .. ' x' .. item.count, type = 'item_standard', value = item.name})
			end

		end

	  ESX.UI.Menu.Open(
	    'default', GetCurrentResourceName(), 'stocks_menu',
	    {
	      title    = 'Inventaire',
	      elements = elements
	    },
	    function(data, menu)

	    	local itemName = data.current.value

				-- ESX.UI.Menu.Open(
					-- 'dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count',
					-- {
						-- title = 'Quantité'
					-- },
					-- function(data2, menu2)

						-- --local count = tonumber(data2.value)
						-- local rounded = round(tonumber(data2.value), 0)

						-- if rounded == nil then
							-- ESX.ShowNotification('Quantité invalide')
						-- else
							-- menu2.close()
				    	-- menu.close()
				    	-- OpenPutStocksMenu()

							-- TriggerServerEvent('fg_reporterjob:putStockItems', itemName, rounded)
						-- end

					-- end,
					-- function(data2, menu2)
						-- menu2.close()
					-- end
				-- )
		
				ESX.UI.Menu.CloseAll()
				local type = 'put'
				TriggerEvent("nb_menu_dialog:fg_reporterjob_StockItem", type, itemName)

	    end,
	    function(data, menu)
	    	menu.close()
	    end
	  )

	end)

end

RegisterNetEvent('fg_reporterjob:OpenPutStocksMenu')
AddEventHandler('fg_reporterjob:OpenPutStocksMenu', function()
	OpenPutStocksMenu()
end)

function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.abs(math.floor(num * mult + 0.5))
end

function OpenGetStocksMenu()

	ESX.TriggerServerCallback('fg_reporterjob:getStockItems', function(items)

		print(json.encode(items))

		local elements = {}

	    for i=1, #items, 1 do
   		if items[i].count > 0 then
      		table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
        end
        end

	  ESX.UI.Menu.Open(
	    'default', GetCurrentResourceName(), 'stocks_menu',
	    {
	      title    = 'CNN',
	      elements = elements
	    },
	    function(data, menu)

	    	local itemName = data.current.value

				-- ESX.UI.Menu.Open(
					-- 'dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count',
					-- {
						-- title = 'Quantité'
					-- },
					-- function(data2, menu2)

						-- --local count = tonumber(data2.value)
						-- local rounded = round(tonumber(data2.value), 0)

						-- if rounded == nil then
							-- ESX.ShowNotification('Quantité invalide')
						-- else
							-- menu2.close()
				    	-- menu.close()
				    	-- OpenGetStocksMenu()

							-- TriggerServerEvent('fg_reporterjob:getStockItem', itemName, rounded)
						-- end

					-- end,
					-- function(data2, menu2)
						-- menu2.close()
					-- end
				-- )
		
				ESX.UI.Menu.CloseAll()
				local type = 'get'
				TriggerEvent("nb_menu_dialog:fg_reporterjob_StockItem", type, itemName)

	    end,
	    function(data, menu)
	    	menu.close()
	    end
	  )

	end)

end

RegisterNetEvent('fg_reporterjob:OpenGetStocksMenu')
AddEventHandler('fg_reporterjob:OpenGetStocksMenu', function()
	OpenGetStocksMenu()
end)

function OpenGearsMenu()
	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'reporter_gears',
		{
			title    = 'Matériel',
			elements = {
		  		{label = 'Fond Vert', 			value = 'prop_ld_greenscreen_01'},
		  		{label = 'Lumières', 			value = 'prop_worklight_03b'},
		  		{label = 'Micro pied', 			value = 'v_ilev_fos_mic'},
		  		{label = 'Pupitre', 			value = 'prop_parkingpay'},
		  		{label = 'Ranger matériel',     value = 'clean'}
			}
		},
		function(data, menu)
			if data.current.value ~= 'clean' then
				if IsInVehicle() then
					ESX.ShowNotification('Vous ne pouvez pas faire cela dans un véhicule !')
				else
					TriggerEvent('esx:spawnObject', data.current.value)
					-- menu.close()
				end
			else
				local obj, dist = ESX.Game.GetClosestObject({'prop_ld_greenscreen_01', 'prop_worklight_03b', 'v_ilev_fos_mic', 'prop_parkingpay'})
				if dist < 3.0 then
					DeleteEntity(obj)
				else
					ESX.ShowNotification('Vous êtes trop éloigné de votre matériel pour le ranger.')
				end
			end

		end,
		function(data, menu)
			ESX.UI.Menu.CloseAll()
			OpenActionMenu()
		end
	)
end

function OpenActionMenu()

	ESX.UI.Menu.CloseAll()

	ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
		local jobMoney = 0
		local elements = {}
		table.insert(elements, {label = 'Diffuser une news', value = 'broadcast_news'})
		table.insert(elements, {label = 'Matériel', value = 'gears'})
		table.insert(elements, {label = 'Facturation', value = 'billing'})

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'reporter_actions',
			{
				title    = 'CNN',
				align    = 'top-left',
				elements = elements,
			},
			function(data, menu)
			
				if data.current.value ~= nil then
					if data.current.value == 'menuperso_grade' then
						TriggerEvent('NB:openMenuCnn')
					end

					if data.current.value == 'gears' then
						OpenGearsMenu()
					end

					if data.current.value == 'broadcast_news' then
						messagenotfinish = true
						Message()
					end

					if data.current.value == 'billing' then

						-- ESX.UI.Menu.Open(
							-- 'dialog', GetCurrentResourceName(), 'billing',
							-- {
								-- title = 'Montant de la facture'
							-- },
							-- function(data, menu)

								-- local amount = tonumber(data.value)

								-- if amount == nil then
									-- ESX.ShowNotification('Montant invalide')
								-- else
									
									-- menu.close()
									
									-- local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

									-- if closestPlayer == -1 or closestDistance > 3.0 then
										-- ESX.ShowNotification('Aucun joueur à proximité')
									-- else
										-- TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_cnn', 'CNN', amount)
									-- end

								-- end

							-- end,
							-- function(data, menu)
								-- menu.close()
							-- end
						-- )
	
						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						
						if closestPlayer ~= -1 and closestDistance < 5.0 then
							ESX.UI.Menu.CloseAll()
							local society = 'society_cnn'
							local name = 'CNN'
							TriggerEvent("nb_menu_dialog:esx_billing_sendBill", closestPlayer, society, name)
						else
						  ESX.ShowNotification('Aucun joueur à proximité')
						end

					end
				end
			end,
			function(data, menu)
				menu.close()
			end
		)
	end, PlayerData.job.name)
end

function OpenVehicleMenu()

    local elements = {
        {label = ConfigReporter.Vehicles.Vehicle.Label, value = ConfigReporter.Vehicles.Vehicle},
    }

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'spawn_vehicle',
        {
            title    = 'Véhicule de service',
            elements = elements
        },
        function(data, menu)
            for i=1, #elements, 1 do
				menu.close()
				local playerPed = GetPlayerPed(-1)
				local coords    = ConfigReporter.Zones.VehicleSpawnPoint.Pos
				local Heading    = ConfigReporter.Zones.VehicleSpawnPoint.Heading
				local platenum = math.random(1000, 9999)
				local platePrefix = ConfigReporter.platePrefix
				ESX.Game.SpawnVehicle(data.current.value.Hash, coords, Heading, function(vehicle)
					TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
					SetVehicleNumberPlateText(vehicle, platePrefix .. platenum)
					plate = GetVehicleNumberPlateText(vehicle)
					plate = string.gsub(plate, " ", "")
					name = 'Véhicule de '..platePrefix
					TriggerServerEvent('esx_vehiclelock:registerkeyjob', name, plate, 'no')
					TriggerServerEvent('nb_caution:gestionCaution', "take", data.current.value.PriceCaution, platePrefix, 0)
					vehOut = true
					vehOut_mission = vehicle
				end)
				break
            end
            menu.close()
   		end,
		function(data, menu)
   		    menu.close()
  	        CurrentAction     = 'vehicle_menu'
    	    CurrentActionMsg  = ConfigReporter.Zones.VehicleSpawner.hint
   	        CurrentActionData = {}
		end
	)
end

function OpenHelicoMenu()

    local elements = {
        {label = ConfigReporter.Vehicles.Helico.Label, value = ConfigReporter.Vehicles.Helico},
    }

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'spawn_helico',
        {
            title    = 'Véhicule de service',
            elements = elements
        },
        function(data, menu)
            for i=1, #elements, 1 do
				menu.close()
				local playerPed = GetPlayerPed(-1)
				local coords    = ConfigReporter.Zones.HelicoSpawnPoint.Pos
				local Heading    = ConfigReporter.Zones.HelicoSpawnPoint.Heading
				local platenum = math.random(1000, 9999)
				local platePrefix = ConfigReporter.platePrefix
				ESX.Game.SpawnVehicle(data.current.value.Hash, coords, Heading, function(vehicle)
					TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
					SetVehicleNumberPlateText(vehicle, platePrefix .. platenum)
					plate = GetVehicleNumberPlateText(vehicle)
					plate = string.gsub(plate, " ", "")
					name = 'Véhicule de '..platePrefix
					TriggerServerEvent('esx_vehiclelock:registerkeyjob', name, plate, 'no')
					TriggerServerEvent('nb_caution:gestionCaution', "take", data.current.value.PriceCaution, platePrefix, 0)
					vehOut = true
					vehOut_mission = vehicle
				end)
				break
            end
            menu.close()
   		end,
		function(data, menu)
   		    menu.close()
  	        CurrentAction     = 'helico_menu'
    	    CurrentActionMsg  = ConfigReporter.Zones.HelicoSpawner.hint
   	        CurrentActionData = {}
		end
	)
end


AddEventHandler('fg_reporterjob:hasEnteredMarker', function(zone)

	if zone == 'Cloakroom' then
		CurrentAction     = 'cloakroom_menu'
		CurrentActionMsg  = ConfigReporter.Zones.Cloakroom.hint
		CurrentActionData = {}
	end

	if zone == 'VehicleSpawner' then
		CurrentAction     = 'vehicle_menu'
		CurrentActionMsg  = ConfigReporter.Zones.VehicleSpawner.hint
		CurrentActionData = {}
	end

	if zone == 'VehicleDeleter' then
		local playerPed = GetPlayerPed(-1)
		if IsPedInAnyVehicle(playerPed,  false) then
			local vehicle = GetVehiclePedIsIn(playerPed,  false)

			CurrentAction 	  = 'delete_vehicle'
			CurrentActionMsg  = ConfigReporter.Zones.VehicleDeleter.hint
			CurrentActionData = {vehicle = vehicle}
		end
	end

	if zone == 'HelicoSpawner' then
		CurrentAction     = 'helico_menu'
		CurrentActionMsg  = ConfigReporter.Zones.HelicoSpawner.hint
		CurrentActionData = {}
	end

	if zone == 'HelicoDeleter' then
		local playerPed = GetPlayerPed(-1)
		if IsPedInAnyVehicle(playerPed,  false) then
			local vehicle = GetVehiclePedIsIn(playerPed,  false)

			CurrentAction 	  = 'delete_helico'
			CurrentActionMsg  = ConfigReporter.Zones.HelicoDeleter.hint
			CurrentActionData = {vehicle = vehicle}
		end
	end

	if zone == 'BossAction' then
		CurrentAction     = 'boss_menu'
		CurrentActionMsg  = ConfigReporter.Zones.BossAction.hint
		CurrentActionData = {}
	end

	if zone == 'Caution' then
		CurrentAction     = 'caution'
		CurrentActionMsg  = ConfigReporter.Zones.Caution.hint
		CurrentActionData = {}
	end
end)

AddEventHandler('fg_reporterjob:hasExitedMarker', function(zone)
    CurrentAction = nil
	ESX.UI.Menu.CloseAll()
end)

-- Display markers
Citizen.CreateThread(function()
    while true do

        Wait(0)
        if PlayerData.job ~= nil and PlayerData.job.name == ConfigReporter.nameJob then

            local coords = GetEntityCoords(GetPlayerPed(-1))

            for k,v in pairs(ConfigReporter.Zones) do
                if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < ConfigReporter.DrawDistance) then
                    DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, false, 2, false, false, false, false)
                end
            end

        end

    end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
    while true do

        Wait(0)
        if PlayerData.job ~= nil and PlayerData.job.name == ConfigReporter.nameJob then

            local coords      = GetEntityCoords(GetPlayerPed(-1))
            local isInMarker  = false
            local currentZone = nil

            for k,v in pairs(ConfigReporter.Zones) do
                if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
                    isInMarker  = true
                    currentZone = k
                end
            end

            if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
                HasAlreadyEnteredMarker = true
                LastZone                = currentZone
                TriggerEvent('fg_reporterjob:hasEnteredMarker', currentZone)
            end

            if not isInMarker and HasAlreadyEnteredMarker then
                HasAlreadyEnteredMarker = false
                TriggerEvent('fg_reporterjob:hasExitedMarker', LastZone)
            end

        end

    end
end)

-- Create Blips
Citizen.CreateThread(function()		
	local blip = AddBlipForCoord(ConfigReporter.Zones.Cloakroom.Pos.x, ConfigReporter.Zones.Cloakroom.Pos.y, ConfigReporter.Zones.Cloakroom.Pos.z)
	SetBlipSprite (blip, ConfigReporter.Blip.Sprite)
	SetBlipDisplay(blip, ConfigReporter.Blip.Display)
	SetBlipScale  (blip, ConfigReporter.Blip.Scale)
	SetBlipColour (blip, ConfigReporter.Blip.Colour)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(ConfigReporter.Blip.BlipName)
	EndTextCommandSetBlipName(blip)
end)


-- Key Controls
Citizen.CreateThread(function()
  while true do

    Citizen.Wait(0)

    if CurrentAction ~= nil then

     	SetTextComponentFormat('STRING')
        AddTextComponentString(CurrentActionMsg)
        DisplayHelpTextFromStringLabel(0, 0, 1, -1)

        if (IsControlJustReleased(0,  Keys['E']) or IsControlJustReleased(0,  Keys['RIGHT'])) and PlayerData.job ~= nil and PlayerData.job.name == ConfigReporter.nameJob then
        	if CurrentAction == 'cloakroom_menu' then
        		OpenCloakroomMenu()
        	end
        	if CurrentAction == 'vehicle_menu' then
        		if vehOut then
        			ESX.ShowNotification('~r~Vous avez déjà sortie un véhicule !')
        		else
        			if IsPedInAnyVehicle(playerPed, 0) then
        				ESX.ShowNotification('~r~Sortez de votre véhicule !')
        			else
        				OpenVehicleMenu()
        			end
        		end
        	end
         	if CurrentAction == 'helico_menu' then
        		if vehOut then
        			ESX.ShowNotification('~r~Vous avez déjà sortie un véhicule !')
        		else
        			if IsPedInAnyVehicle(playerPed, 0) then
        				ESX.ShowNotification('~r~Sortez de votre véhicule !')
        			else
        				OpenHelicoMenu()
        			end
        		end
        	end       	
			if CurrentAction == 'delete_vehicle' then
				local playerPed = GetPlayerPed(-1)
				local vehicle   = GetVehiclePedIsIn(playerPed,  false)
			    local hash      = GetEntityModel(vehicle)
				local plate = GetVehicleNumberPlateText(vehicle)
				local plate = string.gsub(plate, " ", "")
				local platePrefix = ConfigReporter.platePrefix
					  
				if string.find (plate, platePrefix) then
					local truck = ConfigReporter.Vehicles.Vehicle
						
					if hash == GetHashKey(truck.Hash) then
						if GetVehicleEngineHealth(vehicle) <= 500 or GetVehicleBodyHealth(vehicle) <= 500 then
							ESX.ShowNotification('~r~Vas réparer le véhicule avant !')
						else
							TriggerServerEvent('esx_vehiclelock:vehjobSup', plate, 'no')
							DeleteVehicle(vehicle)
								
							if truck.HasCaution then
								TriggerServerEvent('nb_caution:gestionCaution', "give_back", truck.PriceCaution, platePrefix, 0)
							end							
							vehOut = false
						end
					end
				else
					ESX.ShowNotification('Vous ne pouvez ranger que des ~b~véhicules de service')
				end
			end
			if CurrentAction == 'delete_helico' then
				local playerPed = GetPlayerPed(-1)
				local vehicle   = GetVehiclePedIsIn(playerPed,  false)
			    local hash      = GetEntityModel(vehicle)
				local plate = GetVehicleNumberPlateText(vehicle)
				local plate = string.gsub(plate, " ", "")
				local platePrefix = ConfigReporter.platePrefix
					  
				if string.find (plate, platePrefix) then
					local truck = ConfigReporter.Vehicles.Helico
						
					if hash == GetHashKey(truck.Hash) then
						if GetVehicleEngineHealth(vehicle) <= 500 or GetVehicleBodyHealth(vehicle) <= 500 then
							ESX.ShowNotification('~r~Vas réparer l\'hélicoptère avant !')
						else
							TriggerServerEvent('esx_vehiclelock:vehjobSup', plate, 'no')
							DeleteVehicle(vehicle)
								
							if truck.HasCaution then
								TriggerServerEvent('nb_caution:gestionCaution', "give_back", truck.PriceCaution, platePrefix, 0)
							end							
							vehOut = false
						end
					end
				else
					ESX.ShowNotification('Vous ne pouvez ranger que des ~b~hélicoptère de service')
				end
			end
			if CurrentAction == 'boss_menu' then
				OpenBossMenu()
			end
			if CurrentAction == 'caution' then
				CautionMenu()
			end
        	CurrentAction = nil
        end
    end
    -- if IsControlJustReleased(0,  Keys['F6']) and PlayerData.job ~= nil and PlayerData.job.name == ConfigReporter.nameJob and onDuty then
        -- OpenActionMenu()
    -- end
   -- if IsControlJustReleased(0,  Keys['DELETE']) and PlayerData.job ~= nil and PlayerData.job.name == ConfigReporter.nameJob and onDuty then
   --     StartNPCJob()
   -- end
  end
end)

---------------------

---------------------------------------------------------------------------------------------------------
--NB : gestion des menu
---------------------------------------------------------------------------------------------------------
RegisterNetEvent('NB:openMenuCnn')
AddEventHandler('NB:openMenuCnn', function()
	if onDuty then
		OpenActionMenu()
	end
end)

-- test annonce

function Message()
	Citizen.CreateThread(function()
    while messagenotfinish do
    		Citizen.Wait(0)

			DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 99)
		    while (UpdateOnscreenKeyboard() == 0) do
		        DisableAllControlActions(0);
		       Citizen.Wait(0)
		    end
		    if (GetOnscreenKeyboardResult()) then
		        local result = GetOnscreenKeyboardResult()
		        messagenotfinish = false
		       TriggerServerEvent('fg_reporterjob:annonce',result)
		        
		    end


		end
	end)
	
end

function DrawAdvancedTextCNN (x,y ,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
    N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - 0.1+w, y - 0.02+h)
end

 Citizen.CreateThread(function()
		    while true do
		        Citizen.Wait(0)    
		                       
		            if (affichenews == true) then
				        DrawRect(0.494, 0.700, 5.185, 0.118, 0, 0, 0, 150)
				        DrawAdvancedTextCNN(0.588, 0.61, 0.005, 0.0028, 0.8, "~r~ CNN ~d~", 255, 255, 255, 255, 1, 0)
				        DrawAdvancedTextCNN(0.586, 0.700, 0.005, 0.0028, 0.6, texteafiche, 255, 255, 255, 255, 7, 0)
				        DrawAdvancedTextCNN(0.588, 0.246, 0.005, 0.0028, 0.4, "", 255, 255, 255, 255, 0, 0)
				    end
		        
		   			                  
		   end
		end)

RegisterNetEvent('fg_reporterjob:annonce')
AddEventHandler('fg_reporterjob:annonce', function(text)
 		texteafiche = text
 		affichenews = true
		
  end) 


RegisterNetEvent('fg_reporterjob:annoncestop')
AddEventHandler('fg_reporterjob:annoncestop', function()
 		affichenews = false
 		
  end) 

-----------------------
----- TELEPORTERS PUBLIC -----

-- Display teleport markers
Citizen.CreateThread(function()
  while true do
    Wait(0)

	local coords = GetEntityCoords(GetPlayerPed(-1))
	for k,v in pairs(ConfigReporter.TeleportZonesPublic) do
	  if(v.Marker ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < ConfigReporter.DrawDistance) then
		DrawMarker(v.Marker, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
	  end
	end

  end
end)

-- Activate teleport marker
Citizen.CreateThread(function()
  while true do
    Wait(0)
    local coords      = GetEntityCoords(GetPlayerPed(-1))
    local position    = nil
    local zone        = nil

	for k,v in pairs(ConfigReporter.TeleportZonesPublic) do
	  if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
		isInPublicMarker = true
		position = v.Teleport
		zone = v
		break
	  else
		isInPublicMarker  = false
	  end
	end
	
	if (IsControlJustReleased(1, Keys["E"]) or IsControlJustReleased(2, Keys["RIGHT"])) and isInPublicMarker then
	  TriggerEvent('fg_reporterjob:teleportMarkers', position)
	end

	-- hide or show top left zone hints
	if isInPublicMarker then
	  hintToDisplay = zone.Hint
	  hintIsShowed = true
	else
	  if not isInMarker then
		hintToDisplay = "no hint to display"
		hintIsShowed = false
	  end
	end

  end
end)

-- Verifie si le joueurs est dans un vehicule ou pas
function IsInVehicle()
	local ply = GetPlayerPed(-1)
	if IsPedSittingInAnyVehicle(ply) then
		return true
	else
		return false
	end
end

-----------------------
----- TELEPORTERS FUNCTION -----

AddEventHandler('fg_reporterjob:teleportMarkers', function(position)
  SetEntityCoords(GetPlayerPed(-1), position.x, position.y, position.z)
end)

-- Show top left hint
Citizen.CreateThread(function()
  while true do
    Wait(0)
    if hintIsShowed == true then
      SetTextComponentFormat("STRING")
      AddTextComponentString(hintToDisplay)
      DisplayHelpTextFromStringLabel(0, 0, 1, -1)
    end
  end
end)
