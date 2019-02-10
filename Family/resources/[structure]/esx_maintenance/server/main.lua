ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function getPlayerFromId(source)
    local identifiers = GetPlayerIdentifiers(source)
    local player = getIdentifier(identifiers)
    return player
end

function getIdentifier(id)
    for _, v in ipairs(id) do
        return v
    end
end

AddEventHandler('playerConnecting', function(peerName, setKickReason)
    local numIds = GetNumPlayerIdentifiers(source)
	for i,allowedID in ipairs(cfg.AllowedIDs) do
        for i = 0, numIds-3 do
            if cfg.isOnMaintenance == true and getPlayerFromId(source) ~= allowedID then
                print('-----------------FamilyG MAINTENANCE SYSTEM-----------')
                print('Tentative de connection du joueur : [' .. peerName ..']      ')
                print('-----------------FamilyG MAINTENANCE SYSTEM-----------')
                
				setKickReason('Le serveur est en maintenance, merci d\'attendre le feu vert sur notre Discord !')
				CancelEvent()
			end
		end
    end
end)
