Config                            = {}
Config.DrawDistance               = 100.0
Config.MaxInService               = 4
Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.Locale                     = 'fr'

Config.Zones = {

	BleFarm = {
		Pos   = {x = 2660.486, y = 4550.2958, z = 38.3246},
		Size  = {x = 1.8, y = 1.8, z = 0.2},
		Color = {r = 17, g = 206, b = 80},
		Name  = "5- Récolte Blé",
		Type  = 1
	},

	TraitementFarine = {
		Pos   = {x = 2886.7380, y = 4385.0747, z = 49.5624},
		Size  = {x = 2.0, y = 2.0, z = 0.2},
		Color = {r = 17, g = 206, b = 80},
		Name  = "6- Fabrication Farine",
		Type  = 1
	},

	TraitementBread = {
		Pos   = {x = -42.43397, y = 1882.0645, z = 194.8035},
		Size  = {x = 2.0, y = 2.0, z = 0.2},
		Color = {r = 17, g = 206, b = 80},
		Name  = "7- Fabrication Pain",
		Type  = 1
	},
	
	SellFarm = {
		Pos   = {x = -59.9417, y = -209.5444, z = 44.8065},
		Size  = {x = 1.5, y = 1.5, z = 0.2},
		Color = {r = 17, g = 206, b = 80},
		Name  = "8- Vente Pain",
		Type  = 1
	},

	FermierActions = {
		Pos   = {x = 2564.0651, y = 4680.6923, z = 33.0767},
		Size  = {x = 1.2, y = 1.2, z = 0.6},
		Color = {r = 17, g = 206, b = 80},
		Name  = "1- Point d'action",
		Type  = 0
	 },
	  
	VehicleSpawner = {
		Pos   = {x = 2556.6682, y = 4671.0664, z = 32.9935},
		Size = {x = 1.2, y = 1.2, z = 0.6},
		Color = {r = 17, g = 206, b = 80},
		Name  = "2- Garage véhicule de travail",
		Type  = 0
	},

	VehicleSpawnPoint = {
		Pos   = {x = 2552.6447, y = 4671.7641, z = 32.9537},
		Size  = {x = 1.2, y = 1.2, z = 0.6},
		Color = {r = 17, g = 206, b = 80},
		Heading = 15.7724,
		Name  = "3- Spawn point",
		Type  = -1
	},

	VehicleDeleter = {
		Pos   = {x = 2552.9729, y = 4670.6108, z = 32.9551},
		Size  = {x = 4.0, y = 4.0, z = 0.3},
		Color = {r = 255, g = 0, b = 0},
		Name  = "4- Ranger son véhicule",
		Type  = 1
	}

}