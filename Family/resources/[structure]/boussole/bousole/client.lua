ESX              = nil
local PlayerData = {}
local viewMode = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end
function drawTxt2(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(6)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end
local zones = { ['AIRP'] = "Los Santos International Airport", ['ALAMO'] = "Alamo Sea", ['ALTA'] = "Alta", ['ARMYB'] = "Fort Zancudo", ['BANHAMC'] = "Banham Canyon Dr", ['BANNING'] = "Banning", ['BEACH'] = "Vespucci Beach", ['BHAMCA'] = "Banham Canyon", ['BRADP'] = "Braddock Pass", ['BRADT'] = "Braddock Tunnel", ['BURTON'] = "Burton", ['CALAFB'] = "Calafia Bridge", ['CANNY'] = "Raton Canyon", ['CCREAK'] = "Cassidy Creek", ['CHAMH'] = "Chamberlain Hills", ['CHIL'] = "Vinewood Hills", ['CHU'] = "Chumash", ['CMSW'] = "Chiliad Mountain State Wilderness", ['CYPRE'] = "Cypress Flats", ['DAVIS'] = "Davis", ['DELBE'] = "Del Perro Beach", ['DELPE'] = "Del Perro", ['DELSOL'] = "La Puerta", ['DESRT'] = "Grand Senora Desert", ['DOWNT'] = "Downtown", ['DTVINE'] = "Downtown Vinewood", ['EAST_V'] = "East Vinewood", ['EBURO'] = "El Burro Heights", ['ELGORL'] = "El Gordo Lighthouse", ['ELYSIAN'] = "Elysian Island", ['GALFISH'] = "Galilee", ['GOLF'] = "GWC and Golfing Society", ['GRAPES'] = "Grapeseed", ['GREATC'] = "Great Chaparral", ['HARMO'] = "Harmony", ['HAWICK'] = "Hawick", ['HORS'] = "Vinewood Racetrack", ['HUMLAB'] = "Humane Labs and Research", ['JAIL'] = "Bolingbroke Penitentiary", ['KOREAT'] = "Little Seoul", ['LACT'] = "Land Act Reservoir", ['LAGO'] = "Lago Zancudo", ['LDAM'] = "Land Act Dam", ['LEGSQU'] = "Legion Square", ['LMESA'] = "La Mesa", ['LOSPUER'] = "La Puerta", ['MIRR'] = "Mirror Park", ['MORN'] = "Morningwood", ['MOVIE'] = "Richards Majestic", ['MTCHIL'] = "Mount Chiliad", ['MTGORDO'] = "Mount Gordo", ['MTJOSE'] = "Mount Josiah", ['MURRI'] = "Murrieta Heights", ['NCHU'] = "North Chumash", ['NOOSE'] = "N.O.O.S.E", ['OCEANA'] = "Pacific Ocean", ['PALCOV'] = "Paleto Cove", ['PALETO'] = "Paleto Bay", ['PALFOR'] = "Paleto Forest", ['PALHIGH'] = "Palomino Highlands", ['PALMPOW'] = "Palmer-Taylor Power Station", ['PBLUFF'] = "Pacific Bluffs", ['PBOX'] = "Pillbox Hill", ['PROCOB'] = "Procopio Beach", ['RANCHO'] = "Rancho", ['RGLEN'] = "Richman Glen", ['RICHM'] = "Richman", ['ROCKF'] = "Rockford Hills", ['RTRAK'] = "Redwood Lights Track", ['SANAND'] = "San Andreas", ['SANCHIA'] = "San Chianski Mountain Range", ['SANDY'] = "Sandy Shores", ['SKID'] = "Mission Row", ['SLAB'] = "Stab City", ['STAD'] = "Maze Bank Arena", ['STRAW'] = "Strawberry", ['TATAMO'] = "Tataviam Mountains", ['TERMINA'] = "Terminal", ['TEXTI'] = "Textile City", ['TONGVAH'] = "Tongva Hills", ['TONGVAV'] = "Tongva Valley", ['VCANA'] = "Vespucci Canals", ['VESP'] = "Vespucci", ['VINE'] = "Vinewood", ['WINDF'] = "Ron Alternates Wind Farm", ['WVINE'] = "West Vinewood", ['ZANCUDO'] = "Zancudo River", ['ZP_ORT'] = "Port of South Los Santos", ['ZQ_UAR'] = "Davis Quartz" }
local directions = { [0] = 'N', [45] = 'NW', [90] = 'W', [135] = 'SW', [180] = 'S', [225] = 'SE', [270] = 'E', [315] = 'NE', [360] = 'N', } 

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

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local pos = GetEntityCoords(GetPlayerPed(-1))
		local var1, var2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
		local current_zone = zones[GetNameOfZone(pos.x, pos.y, pos.z)]

		for k,v in pairs(directions)do
			direction = GetEntityHeading(GetPlayerPed(-1))
			if(math.abs(direction - k) < 22.5)then
				direction = v
				break;
			end
		end
		
		if not viewMode then
			if(GetStreetNameFromHashKey(var1) and GetNameOfZone(pos.x, pos.y, pos.z)) then
				if(zones[GetNameOfZone(pos.x, pos.y, pos.z)] and tostring(GetStreetNameFromHashKey(var1)))then
					if direction == 'N' then
							drawTxt(x-0.320, y+0.43, 1.0,1.0,0.5, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.300, y+0.43, 1.0,1.0,0.5, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.310, y+0.43, 1.0,1.0,0.5, direction, dir_r, dir_g, dir_b, dir_a)
						if tostring(GetStreetNameFromHashKey(var2)) == "" then
							drawTxt2(x-0.290, y+0.455, 1.0,1.0,0.30, current_zone, town_r, town_g, town_b, town_a)
						else 
							drawTxt2(x-0.290, y+0.455, 1.0,1.0,0.30, tostring(GetStreetNameFromHashKey(var2)) .. ", " .. zones[GetNameOfZone(pos.x, pos.y, pos.z)], str_around_r, str_around_g, str_around_b, str_around_a)
						end
							drawTxt2(x-0.290, y+0.43, 1.0,1.0,0.5, tostring(GetStreetNameFromHashKey(var1)), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
					elseif direction == 'NE' then 
							drawTxt(x-0.320, y+0.43, 1.0,1.0,0.5, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.300, y+0.43, 1.0,1.0,0.5, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.310, y+0.43, 1.0,1.0,0.5, direction, dir_r, dir_g, dir_b, dir_a)
						if tostring(GetStreetNameFromHashKey(var2)) == "" then
							drawTxt2(x-0.290, y+0.455, 1.0,1.0,0.30, current_zone, town_r, town_g, town_b, town_a)
						else 
							drawTxt2(x-0.290, y+0.455, 1.0,1.0,0.30, tostring(GetStreetNameFromHashKey(var2)) .. ", " .. zones[GetNameOfZone(pos.x, pos.y, pos.z)], str_around_r, str_around_g, str_around_b, str_around_a)
						end
						drawTxt2(x-0.290, y+0.43, 1.0,1.0,0.5, tostring(GetStreetNameFromHashKey(var1)),curr_street_r, curr_street_g, curr_street_b, curr_street_a)
					elseif direction == 'E' then 
							drawTxt(x-0.320, y+0.43, 1.0,1.0,0.5, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.300, y+0.43, 1.0,1.0,0.5, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.310, y+0.43, 1.0,1.0,0.5, direction, dir_r, dir_g, dir_b, dir_a)
						if tostring(GetStreetNameFromHashKey(var2)) == "" then
							drawTxt2(x-0.290, y+0.455, 1.0,1.0,0.30, current_zone, town_r, town_g, town_b, town_a)
						else 
							drawTxt2(x-0.290, y+0.455, 1.0,1.0,0.30, tostring(GetStreetNameFromHashKey(var2)) .. ", " .. zones[GetNameOfZone(pos.x, pos.y, pos.z)], str_around_r, str_around_g, str_around_b, str_around_a)
						end
						drawTxt2(x-0.290, y+0.43, 1.0,1.0,0.5, tostring(GetStreetNameFromHashKey(var1)), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
					elseif direction == 'SE' then 
							drawTxt(x-0.320, y+0.43, 1.0,1.0,0.5, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.300, y+0.43, 1.0,1.0,0.5, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.310, y+0.43, 1.0,1.0,0.5, direction, dir_r, dir_g, dir_b, dir_a)
						if tostring(GetStreetNameFromHashKey(var2)) == "" then
							drawTxt2(x-0.290, y+0.455, 1.0,1.0,0.30, current_zone, town_r, town_g, town_b, town_a)
						else 
							drawTxt2(x-0.290, y+0.455, 1.0,1.0,0.30, tostring(GetStreetNameFromHashKey(var2)) .. ", " .. zones[GetNameOfZone(pos.x, pos.y, pos.z)], str_around_r, str_around_g, str_around_b, str_around_a)
						end
							drawTxt2(x-0.290, y+0.43, 1.0,1.0,0.5, tostring(GetStreetNameFromHashKey(var1)), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
					elseif direction == 'S' then
							drawTxt(x-0.320, y+0.43, 1.0,1.0,0.5, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.300, y+0.43, 1.0,1.0,0.5, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.310, y+0.43, 1.0,1.0,0.5, direction, dir_r, dir_g, dir_b, dir_a)
						if tostring(GetStreetNameFromHashKey(var2)) == "" then
							drawTxt2(x-0.290, y+0.455, 1.0,1.0,0.30, current_zone, town_r, town_g, town_b, town_a)
						else 
							drawTxt2(x-0.290, y+0.455, 1.0,1.0,0.30, tostring(GetStreetNameFromHashKey(var2)) .. ", " .. zones[GetNameOfZone(pos.x, pos.y, pos.z)], str_around_r, str_around_g, str_around_b, str_around_a)
						end
							drawTxt2(x-0.290, y+0.43, 1.0,1.0,0.5, tostring(GetStreetNameFromHashKey(var1)), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
					elseif direction == 'SW' then
							drawTxt(x-0.320, y+0.43, 1.0,1.0,0.5, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.300, y+0.43, 1.0,1.0,0.5, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.310, y+0.43, 1.0,1.0,0.5, direction, dir_r, dir_g, dir_b, dir_a)
						if tostring(GetStreetNameFromHashKey(var2)) == "" then
							drawTxt2(x-0.290, y+0.455, 1.0,1.0,0.30, current_zone, town_r, town_g, town_b, town_a)
						else 
							drawTxt2(x-0.290, y+0.455, 1.0,1.0,0.30, tostring(GetStreetNameFromHashKey(var2)) .. ", " .. zones[GetNameOfZone(pos.x, pos.y, pos.z)], str_around_r, str_around_g, str_around_b, str_around_a)
						end
							drawTxt2(x-0.290, y+0.43, 1.0,1.0,0.5, tostring(GetStreetNameFromHashKey(var1)), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
					elseif direction == 'W' then 
							drawTxt(x-0.320, y+0.43, 1.0,1.0,0.5, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.300, y+0.43, 1.0,1.0,0.5, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.310, y+0.43, 1.0,1.0,0.5, direction, dir_r, dir_g, dir_b, dir_a)
						if tostring(GetStreetNameFromHashKey(var2)) == "" then 
							drawTxt2(x-0.290, y+0.455, 1.0,1.0,0.30, current_zone, town_r, town_g, town_b, town_a)
						else
							drawTxt2(x-0.290, y+0.455, 1.0,1.0,0.30, tostring(GetStreetNameFromHashKey(var2)) .. ", " .. zones[GetNameOfZone(pos.x, pos.y, pos.z)], str_around_r, str_around_g, str_around_b, str_around_a)
						end
							drawTxt2(x-0.290, y+0.43, 1.0,1.0,0.5, tostring(GetStreetNameFromHashKey(var1)), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
					elseif direction == 'NW' then
							drawTxt(x-0.320, y+0.43, 1.0,1.0,0.5, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.300, y+0.43, 1.0,1.0,0.5, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.310, y+0.43, 1.0,1.0,0.5, direction, dir_r, dir_g, dir_b, dir_a)
						if tostring(GetStreetNameFromHashKey(var2)) == "" then
							drawTxt2(x-0.290, y+0.455, 1.0,1.0,0.30, current_zone, town_r, town_g, town_b, town_a)
						else 
							drawTxt2(x-0.290, y+0.455, 1.0,1.0,0.30, tostring(GetStreetNameFromHashKey(var2)) .. ", " .. zones[GetNameOfZone(pos.x, pos.y, pos.z)], str_around_r, str_around_g, str_around_b, str_around_a)
						end 
							drawTxt2(x-0.290, y+0.43, 1.0,1.0,0.5, tostring(GetStreetNameFromHashKey(var1)), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
					end
				end
			end
		end
	end
end)
