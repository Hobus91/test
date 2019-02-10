ConfigLSD                = {}
ConfigLSD.DrawDistance   = 100.0
ConfigLSD.PoliceNeeded   = 0
ConfigLSD.Hours 		 = true
ConfigLSD.openHours		 = 16
ConfigLSD.closeHours	 = 24

ConfigLSD.PayeType = 3 -- [1 = Cash , 2 = Banque , 3 = Argent Sale]

ConfigLSD.Zones = {
    
	Recolte1LSD = {
		Pos   = {x = 2906.4245, y = 4347.1513, z = 49.2986},
		Size  = {x = 2.0, y = 2.0, z = 0.6},
		Color = {r = 204, g = 204, b = 0},
		Type  = -1,
		
		ItemTime = 4000,
		ItemDb_name = "ergotdeseigle",
		ItemName = "Ergot de seigle",
		ItemMax = 30,
		ItemAdd = 1,
		ItemRemove = 0,
		ItemRequires = "nothing",
		ItemRequires_name = "nothing",
		ItemDrop = 100,
		ItemPrice  = 0,
		hint = "Appuyez sur ~INPUT_CONTEXT~ pour récuperer de l'ergot de seigle",
		messagePolice = 'Vous avez trouvé un point pour récolter de ~r~stupefiant~s~ !',
	},
	
	Recolte2LSD = {
		Pos   = {x = 3592.0183, y = 3639.6010, z = 40.3403},
		Size  = {x = 2.0, y = 2.0, z = 0.6},
		Color = {r = 204, g = 204, b = 0},
		Type  = -1,
		
		ItemTime = 4000,
		ItemDb_name = "amidediéthylamine",
		ItemName = "Amide Diéthylamine",
		ItemMax = 30,
		ItemAdd = 1,
		ItemRemove = 0,
		ItemRequires = "nothing",
		ItemRequires_name = "nothing",
		ItemDrop = 100,
		ItemPrice  = 0,
		hint = "Appuyez sur ~INPUT_CONTEXT~ pour récuperer de l'amide diéthylamine",
		messagePolice = 'Vous avez trouvé un point pour récolter de ~r~stupefiant~s~ !',
	},

	Traitement1LSD = {
		Pos   = {x = 93.6391, y = 3756.0798, z = 39.7725},
		Size  = {x = 2.0, y = 2.0, z = 0.6},
		Color = {r = 204, g = 204, b = 0},
		Type  = -1,
		
		ItemTime = 4000,
		ItemDb_name = "acidelyserique",
		ItemName = "Acide Lysergique",
		ItemMax = 30,
		ItemAdd = 3,
		ItemRemove = 1,
		ItemRequires = "ergotdeseigle",
		ItemRequires_name = "Ergot de seigle",
		ItemDrop = 100,
		ItemPrice  = 0,
		hint = "Appuyez sur ~INPUT_CONTEXT~ pour traiter l'ergot de seigle",
		messagePolice = 'Vous avez trouvé un point de traitement pour ~r~stupefiant~s~ !',
	},

	Traitement2LSD = {
		Pos   = {x = 718.8928, y = -767.7078, z = 23.8841},
		Size  = {x = 2.0, y = 2.0, z = 0.6},
		Color = {r = 204, g = 204, b = 0},
		Type  = -1,
		
		ItemTime = 4000,
		ItemDb_name = "lsd",
		ItemName = "LSD",
		ItemAdd = 1,
		ItemRemove1 = 1,
		ItemRequires1 = "acidelyserique",
		ItemRequires_name1 = "Acide Lysergique",
		ItemRemove2 = 1,
		ItemRequires2 = "amidediéthylamine",
		ItemRequires_name2 = "Amide Diéthylamine",
		ItemDrop = 100,
		ItemPrice  = 0,
		hint = 'Appuyez sur ~INPUT_CONTEXT~ pour commencer à synthétiser',
		messagePolice = 'Vous avez trouvé un point de traitement pour ~r~stupefiant~s~ !',
	},

	Vente1LSD = {
		Pos   = {x = 149.7215, y = 322.1369, z = 111.1385},
		Size  = {x = 2.0, y = 2.0, z = 0.6},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		
		ItemTime = 4000,
		ItemDb_name = "nothing",
		ItemName = "nothing",
		ItemMax = 100,
		ItemAdd = -1,
		ItemRemove = 1,
		ItemRequires = "lsd",
		ItemRequires_name = "LSD",
		ItemDrop = 100,
		ItemPrice  = 450,
		hint = "Appuyez sur ~INPUT_CONTEXT~ pour vendre les Sachet de LSD",
		messagePolice = 'Vous avez trouvé un point de vente de ~r~stupefiant~s~ !',
	},
}
