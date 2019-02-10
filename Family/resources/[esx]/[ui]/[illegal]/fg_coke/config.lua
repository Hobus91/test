ConfigCoke						= {}
ConfigCoke.DrawDistance			= 100.0
ConfigCoke.PoliceNeeded			= 2
ConfigCoke.Hours				= true
ConfigCoke.openHours			= 18
ConfigCoke.closeHours			= 24

ConfigCoke.PayeType = 3 -- [1 = Cash , 2 = Banque , 3 = Argent Sale]

ConfigCoke.Zones = {

	Recolte1Coke = {
		Pos   = {x = 282.08, y = 6789.17, z = 14.7},
		Size  = {x = 1.5, y = 1.5, z = 0.6},
		Color = {r = 204, g = 204, b = 0},
		Type  = -1,
		
		ItemTime = 4000,
		ItemDb_name = "feuilledecoca",
		ItemName = "Feuille de coca",
		ItemAdd = 1,
		hint = 'Appuyez sur ~INPUT_CONTEXT~ pour récuperer de la Feuille de coca',
		messagePolice = 'Vous avez trouvé un point pour récolter de ~r~stupefiant~s~ !',
	},
	
	Recolte2Coke = {
		Pos   = {x = 264.64, y = 2872.18, z = 42.61},
		Size  = {x = 1.5, y = 1.5, z = 0.6},
		Color = {r = 204, g = 204, b = 0},
		Type  = -1,
		
		ItemTime = 4000,
		ItemDb_name = "ciment",
		ItemName = "Ciment",
		ItemAdd = 1,
		hint = 'Appuyez sur ~INPUT_CONTEXT~ pour récuperer du Ciment',
		messagePolice = 'Vous avez trouvé un point pour récolter de ~r~stupefiant~s~ !',
	},
	
	Traitement1Coke = {
		Pos   = {x = 1090.9284, y = -3196.6062, z = -39.9934},
		Size  = {x = 3.0, y = 3.0, z = 0.6},
		Color = {r = 204, g = 204, b = 0},
		Type  = -1,
		
		ItemTime = 4000,
		ItemDb_name = "cocaine",
		ItemName = "Cocaine",
		ItemAdd = 1,
		ItemRemove1 = 1,
		ItemRequires1 = "feuilledecoca",
		ItemRequires_name1 = "Feuille de coca",
		ItemRemove2 = 1,
		ItemRequires2 = "ciment",
		ItemRequires_name2 = "Ciment",
		ItemRemove3 = 1,
		ItemRequires3 = "essence",
		ItemRequires_name3 = "Essence",
		hint = 'Appuyez sur ~INPUT_CONTEXT~ pour commencer le traitement',
		messagePolice = 'Vous avez trouvé un point de ~r~Traitement illégale~s~ !',
		messagePolice = 'Vous avez trouvé un point de traitement pour ~r~stupefiant~s~ !',
	},

	Vente1Coke = {
		Pos   = {x = 566.9571, y = -3126.6437, z = 17.7686},
		Size  = {x = 2.0, y = 2.0, z = 0.6},
		Color = {r = 204, g = 204, b = 0},
		Type  = -1,
		
		ItemTime = 4000,
		ItemRemove = 1,
		ItemRequires = "cocaine",
		ItemRequires_name = "Cocaine",
		ItemPrice = 427,
		hint = 'Appuyez sur ~INPUT_CONTEXT~ pour vendre la Cocaine',
		messagePolice = 'Vous avez trouvé un point de vente de ~r~stupefiant~s~ !',
	},
}

ConfigCoke.PublicZones = {
	EnterTraitementCoke = {
		Pos       = { x = 173.4421, y = 2778.9023, z = 46.0773 },
		Size      = { x = 1.5, y = 1.5, z = 0.6 },
		Color     = { r = 250, g = 176, b = 49 },
		Type      = -1,
		hint      = "Appuyez sur ~INPUT_CONTEXT~ pour entrer.",
		Teleport  = { x = 1089.0579, y = -3189.2033, z = -39.9934 }
	},

	ExitTraitementCoke = {
		Pos       = { x = 1088.6436, y = -3187.5817, z = -39.9934 },
		Size      = { x = 1.5, y = 1.5, z = 0.6 },
		Color     = { r = 250, g = 176, b = 49 },
		Type    = 0,
		hint      = "Appuyez sur ~INPUT_CONTEXT~ pour sortir.",
		Teleport  = { x = 175.2947, y = 2778.8569, z = 45.0772 },
	},
}
