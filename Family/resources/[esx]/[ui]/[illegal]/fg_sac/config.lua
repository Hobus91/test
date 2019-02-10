ConfigWeed                = {}
ConfigWeed.DrawDistance   = 100.0
ConfigWeed.PoliceNeeded   = 0
ConfigWeed.Hours 			  = true
ConfigWeed.openHours		  = 16
ConfigWeed.closeHours		  = 24

ConfigWeed.PayeType = 3 -- [1 = Cash , 2 = Banque , 3 = Argent Sale]

ConfigWeed.Zones = {
    
	Recolte1Weed = {
		Pos   = {x = -496.203125, y = 1048.5916748047, z = 114.7188873291},
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
	
	Blanchiment1Sac = {
		Pos   = {x = 1268.6556396484, y = -1710.0043945313, z = 54.771492004395},
		Size  = {x = 3.0, y = 3.0, z = 0.6},
		Color = {r = 204, g = 204, b = 0},
		Type  = -1,
		
		ItemTime = 4000,
		ItemDb_name = "sacblanchiment",
		ItemName = "Blanchiment du sac",
		ItemMax = 30,
		ItemAdd = 1,
		ItemRemove = 1,
		ItemRequires = "sacnumerotter",
		ItemRequires_name = "Sac Numerotté",
		ItemDrop = 100,
		ItemPrice  = 0,
		hint = 'Appuyez sur ~INPUT_CONTEXT~ pour blanchir les Sac Numerotté',
		messagePolice = 'Vous avez trouvé un point de blanchiment pour ~r~illégal~s~ !',
	},

	Vente1Sac = {
		Pos   = {x = -37.239513397217, y = 6578.9028320313, z = 32.269176483154},
		Size  = {x = 2.0, y = 2.0, z = 0.6},
		Color = {r = 204, g = 204, b = 0},
		Type  = -1,
		
		ItemTime = 4000,
		ItemDb_name = "nothing",
		ItemName = "nothing",
		ItemMax = 100,
		ItemAdd = 1,
		ItemRemove = 1,
		ItemRequires = "sacblanchiment",
		ItemRequires_name = "Blanchiment du sac",
		ItemDrop = 100,
		ItemPrice  = 875,
		hint = 'Appuyez sur ~INPUT_CONTEXT~ pour vendre les Sac Numerotté',
		messagePolice = 'Vous avez trouvé un point de vente de ~r~Sac Numerotté~s~ !',
	},
}

ConfigWeed.PublicZones = {
  EnterRecolte1Weed = {
    Pos       = { x = -494.203125, y = 1048.5916748047, z = 114.7188873291 },
    Size      = { x = 1.5, y = 1.5, z = 0.6 },
    Color     = { r = 250, g = 176, b = 49 },
    Type      = -1,
    hint      = "Appuyez sur ~INPUT_CONTEXT~ pour entrer.",
    Teleport  = { x = -492.203125, y = 1048.5916748047, z = 114.7188873291 }
  },

  ExitRecolte1Weed = {
    Pos       = { x = -490.203125, y = 1048.5916748047, z = 114.7188873291 },
    Size      = { x = 1.5, y = 1.5, z = 0.6 },
    Color     = { r = 250, g = 176, b = 49 },
    Type    = 0,
    hint      = "Appuyez sur ~INPUT_CONTEXT~ pour sortir.",
    Teleport  = { x = -499.203125, y = 1048.5916748047, z = 114.7188873291 },
  },
}
