ConfigWeed                = {}
ConfigWeed.DrawDistance   = 100.0
ConfigWeed.PoliceNeeded   = 0
ConfigWeed.Hours 			  = true
ConfigWeed.openHours		  = 16
ConfigWeed.closeHours		  = 24

ConfigWeed.PayeType = 3 -- [1 = Cash , 2 = Banque , 3 = Argent Sale]

ConfigWeed.Zones = {
    
	Recolte1Weed = {
		Pos   = {x = 1057.55925292969, y = -3197.4321289063, z = -40.131988525391},
		Size  = {x = 3.5, y = 3.5, z = 0.6},
		Color = {r = 204, g = 204, b = 0},
		Type  = -1,
		
		ItemTime = 4000,
		ItemDb_name = "fleurcannabis",
		ItemName = "Fleur de cannabis",
		ItemMax = 30,
		ItemAdd = 1,
		ItemRemove = 0,
		ItemRequires = "nothing",
		ItemRequires_name = "nothing",
		ItemDrop = 100,
		ItemPrice  = 0,
		hint = 'Appuyez sur ~INPUT_CONTEXT~ pour récolter de la Fleur de cannabis',
		messagePolice = 'Vous avez trouvé un point pour récolter de ~r~stupefiant~s~ !',
	},
	
	Traitement1Weed = {
		Pos   = {x = -1063.1751, y = -1663.2283, z = 3.5586},
		Size  = {x = 3.0, y = 3.0, z = 0.6},
		Color = {r = 204, g = 204, b = 0},
		Type  = -1,
		
		ItemTime = 4000,
		ItemDb_name = "sachetamnesia",
		ItemName = "Sachet d'Amnesia",
		ItemMax = 30,
		ItemAdd = 1,
		ItemRemove = 1,
		ItemRequires = "fleurcannabis",
		ItemRequires_name = "Fleur de cannabis",
		ItemDrop = 100,
		ItemPrice  = 0,
		hint = 'Appuyez sur ~INPUT_CONTEXT~ pour traiter la Fleur de cannabis',
		messagePolice = 'Vous avez trouvé un point de traitement pour ~r~stupefiant~s~ !',
	},

	Vente1Weed = {
		Pos   = {x = -65.0682, y = -1512.8895, z = 35.6249},
		Size  = {x = 2.0, y = 2.0, z = 0.6},
		Color = {r = 204, g = 204, b = 0},
		Type  = -1,
		
		ItemTime = 4000,
		ItemDb_name = "nothing",
		ItemName = "nothing",
		ItemMax = 100,
		ItemAdd = 1,
		ItemRemove = 1,
		ItemRequires = "sachetamnesia",
		ItemRequires_name = "Sachet d'Amnesia",
		ItemDrop = 100,
		ItemPrice  = 195,
		hint = 'Appuyez sur ~INPUT_CONTEXT~ pour vendre les Sachet d\'Amnesia',
		messagePolice = 'Vous avez trouvé un point de vente de ~r~stupefiant~s~ !',
	},
}

ConfigWeed.PublicZones = {
  EnterRecolte1Weed = {
    Pos       = { x = 64.413681030273, y = 6309.84375, z = 30.49693107605 },
    Size      = { x = 1.5, y = 1.5, z = 0.6 },
    Color     = { r = 250, g = 176, b = 49 },
    Type      = -1,
    hint      = "Appuyez sur ~INPUT_CONTEXT~ pour entrer.",
    Teleport  = { x = 1062.9486083984, y = -3182.3212890625, z = -39.163360595703 }
  },

  ExitRecolte1Weed = {
    Pos       = { x = 1066.2626953125, y = -3183.4692382813, z = -40.163547515869 },
    Size      = { x = 1.5, y = 1.5, z = 0.6 },
    Color     = { r = 250, g = 176, b = 49 },
    Type    = 0,
    hint      = "Appuyez sur ~INPUT_CONTEXT~ pour sortir.",
    Teleport  = { x = 66.95426940918, y = 6309.8076171875, z = 30.376113891602 },
  },
}
