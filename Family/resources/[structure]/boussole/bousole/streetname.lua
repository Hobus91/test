ESX              = nil
local PlayerData = {}
local viewMode = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer

	for i=1, #PlayerData.inventory, 1 do
		if PlayerData.inventory[i].name == 'gps' then
			if PlayerData.inventory[i].count > 0 then
				viewMode = false
			else
				viewMode = true
			end
		end
	end

end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

RegisterNetEvent('nb_base:setDisplayBousole')
AddEventHandler('nb_base:setDisplayBousole', function(val)
	viewMode = val
end)

local streetName = {}

-- Configuration. Please be careful when editing. It does not check for errors.
streetName.show = true
streetName.position = {x = 0.5, y = 0.01, centered = true}
streetName.textSize = 0.28
streetName.textColour = {r = 255, g = 255, b = 255, a = 255}
-- End of configuration


Citizen.CreateThread( function()
	local lastStreetA = 0
	local lastStreetB = 0
	local lastStreetName = {}

	while streetName.show do
		Citizen.Wait( 0 )
		
		if not viewMode then
			local playerPos = GetEntityCoords( GetPlayerPed( -1 ), true )
			local streetA, streetB = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, playerPos.x, playerPos.y, playerPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
			local street = {}

			if not ((streetA == lastStreetA or streetA == lastStreetB) and (streetB == lastStreetA or streetB == lastStreetB)) then
				-- Ignores the switcharoo while doing circles on intersections
				lastStreetA = streetA
				lastStreetB = streetB
			end

			if lastStreetA ~= 0 then
				table.insert( street, GetStreetNameFromHashKey( lastStreetA ) )
			end

			if lastStreetB ~= 0 then
				table.insert( street, GetStreetNameFromHashKey( lastStreetB ) )
			end

			drawText( table.concat( street, " & " ), streetName.position.x, streetName.position.y, {
				size = streetName.textSize,
				colour = streetName.textColour,
				outline = true,
				centered = streetName.position.centered
			})
		end
	end
end)
