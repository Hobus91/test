ConfigReporter                = {}
ConfigReporter.DrawDistance = 100.0
ConfigReporter.MaxInService = -1
ConfigReporter.EnablePlayerManagement = true

ConfigReporter.nameJob = "cnn"
ConfigReporter.nameJobLabel = "CNN"
ConfigReporter.platePrefix = "CNN"

ConfigReporter.PlayerSociety = true
ConfigReporter.PlayerSocietyPrice = 3
ConfigReporter.PlayerSocietyName = 'society_cnn'

ConfigReporter.PayeType = 1 -- [1 = Cash , 2 = Banque , 3 = Argent Sale]
	------------- CASH
ConfigReporter.PayeCashItem = "$ de Cash"
ConfigReporter.PayeCashMessage = "Vous avez reçu"
	------------- Banque
ConfigReporter.PayeBankItem = "$ en Banque"
ConfigReporter.PayeBankMessage = "Vous avez reçu"
	------------- Argent Sale
ConfigReporter.PayeDirtyItem = "$ d'Argent Sale"
ConfigReporter.PayeDirtyMessage = "Vous avez reçu"

ConfigReporter.Vehicles = {
	Vehicle = {
		Spawner = 1,
		Label = 'Camionnette', 
		Hash = "rumpo", 
		Livery = 0,
		Trailer = "none",
		HasCaution = true,
		PriceCaution = 300,
	},
    Helico = {
        Spawner = 1,
        Label = 'Helicoptère', 
        Hash = "frogger", 
        Livery = 0,
        Trailer = "none",
        HasCaution = true,
        PriceCaution = 1000,
    },
}

ConfigReporter.Blip = {
	Sprite = 184,
	Display = 4,
	Scale = 0.9,
	Colour = 1,
	BlipName = 'CNN'
}

ConfigReporter.Zones = {
	
	Cloakroom = {
		Pos = {x = -1063.3856, y = -249.3343, z = 43.02},
   	 	Size = {x = 1.2, y = 1.2, z = 0.2},
    	Color = {r = 246, g = 112, b = 45},
    	Type = 1,
    	BlipSprite = 0,
    	BlipColor = 0,
    	BlipName = ConfigReporter.nameJobLabel..' : Vestiaire',
    	hint = 'Appuyez sur ~INPUT_CONTEXT~ pour accéder au vestiaire',
	},	

	VehicleSpawner = {
		Pos = {x = -1095.1356, y = -261.0236, z = 36.6973},
   	 	Size = {x = 1.2, y = 1.2, z = 0.2},
    	Color = {r = 246, g = 112, b = 45},
    	Type = 1,	
    	BlipSprite = 0,
    	BlipColor = 0,
    	BlipName = ConfigReporter.nameJobLabel..' : Vehicule de service',
    	hint = 'Appuyez sur ~INPUT_CONTEXT~ pour accéder au garage',
	},

	VehicleSpawnPoint = {
		Pos = {x = -1098.3656, y = -256.4610, z = 36.6846},
   	 	Size = {x = 1.5, y = 1.5, z = 0.6},
    	Color = {r = 11, g = 203, b = 159},
    	Heading = 150.8222,
    	Type = -1,	
    	BlipSprite = 0,
    	BlipColor = 0,	
    	BlipName = '',
    	hint = '',
	},

	VehicleDeleter = {
		Pos = {x = -1098.3656, y = -256.4610, z = 36.6846},
   	 	Size = {x = 3.0, y = 3.0, z = 0.3},
    	Color = {r = 255, g = 0, b = 0},
    	Type = 1,
    	BlipSprite = 0,
    	BlipColor = 0,
    	BlipName = ConfigReporter.nameJobLabel..' : Retour véhicule',
    	hint = 'Appuyez sur ~INPUT_CONTEXT~ pour ranger le véhicule'
	},

    HelicoSpawner = {
        Pos = {x = -1063.2803, y = -240.6533, z = 53.0039},
        Size = {x = 1.5, y = 1.5, z = 0.6},
        Color = {r = 246, g = 112, b = 45},
        Type = 0,   
        BlipSprite = 0,
        BlipColor = 0,
        BlipName = ConfigReporter.nameJobLabel..' : Vehicule de service',
        hint = 'Appuyez sur ~INPUT_CONTEXT~ pour accéder au garage',
    },

    HelicoSpawnPoint = {
        Pos = {x = -1050.4809, y = -235.7541, z = 52.5118},
        Size = {x = 1.5, y = 1.5, z = 0.6},
        Color = {r = 11, g = 203, b = 159},
        Heading = 78.2235,
        Type = -1,  
        BlipSprite = 0,
        BlipColor = 0,  
        BlipName = '',
        hint = '',
    },

    HelicoDeleter = {
        Pos = {x = -1050.4809, y = -235.7541, z = 52.5118},
        Size = {x = 4.0, y = 4.0, z = 0.6},
        Color = {r = 255, g = 0, b = 0},
        Type = 0,
        BlipSprite = 0,
        BlipColor = 0,
        BlipName = ConfigReporter.nameJobLabel..' : Retour véhicule',
        hint = 'Appuyez sur ~INPUT_CONTEXT~ pour ranger l\'hélico'
    },

	BossAction = {
		Pos = {x = -1053.6954, y = -230.5303, z = 43.0208},
   	 	Size = {x = 1.5, y = 1.5, z = 0.6},
    	Color = {r = 246, g = 112, b = 45},
    	Type = 0,
    	BlipSprite = 0,
    	BlipColor = 0,
    	BlipName = ConfigReporter.nameJobLabel..' : Boss Action',
    	hint = 'Appuyez sur ~INPUT_CONTEXT~ pour allumer l\'ordinateur'
	},
}

ConfigReporter.TeleportZonesPublic = {
    Enter = {
    Pos       = { x = -1078.0576, y = -254.6773, z = 43.0211 },
    Size      = { x = 1.2, y = 1.2, z = 0.2 },
    Color     = { r = 246, g = 112, b = 45 },
    Marker    = 1,
    Hint      = 'Appuyez sur ~INPUT_CONTEXT~ pour monter sur le toit',
    Teleport  = { x = -1072.8593, y = -246.6864, z = 53.0060 }
    },

    Exit = {
    Pos       = { x = -1072.8593, y = -246.6864, z = 53.0060 },
    Size      = { x = 1.2, y = 1.2, z = 0.2 },
    Color     = { r = 246, g = 112, b = 45 },
    Marker    = 1,
    Hint      = 'Appuyez sur ~INPUT_CONTEXT~ pour descendre dans les locaux',
    Teleport  = { x = -1078.0576, y = -254.6773, z = 43.0211 }
    }
}