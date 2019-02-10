Config              = {}
Config.MarkerType   = 0
Config.DrawDistance = 100.0
Config.ZoneSize     = {x = 5.0, y = 5.0, z = 3.0}
--Config.MarkerColor  = {r = 100, g = 204, b = 100}

Config.RequiredCopsCoke  = 2
Config.RequiredCopsMeth  = 2
Config.RequiredCopsWeed  = 0
Config.RequiredCopsOpium = 2

Config.TimeToFarm    = 17 * 1000
Config.TimeToProcess = 46 * 1000
Config.TimeToSell    = 5  * 1000

Config.Locale = 'fr'

Config.Zones = {
	CokeField =			{x = 3292.73,  	y= 5184.32,		z= 18.07,	name = _U('coke_field'),		sprite = 501,	color = 40},
	CokeProcessing =	{x = 1099.54, 	y= -3194.14, 	z= -38.99,	name = _U('coke_processing'),	sprite = 478,	color = 40},
	CokeDealer =		{x = -1454.65,  y= -655.91,  	z= 29.74,	name = _U('coke_dealer'),		sprite = 500,	color = 75},
	MethField =			{x = 1443.28, 	y= 6332.08,  	z= 23.98,	name = _U('meth_field'),		sprite = 499,	color = 26},
	MethProcessing =	{x = 1011.30,   y= -3197.05, 	z= -38.9,	name = _U('meth_processing'),	sprite = 499,	color = 26},
	MethDealer =		{x = 307.53, 	y= -216.39,  	z= 58.50,	name = _U('meth_dealer'),		sprite = 500,	color = 75},
	WeedField =			{x = 2226.31, 	y= 5576.81,  	z= 53.86,	name = _U('weed_field'),		sprite = 496,	color = 52},
	WeedProcessing =	{x = 1032.93, 	y= -3205.549,	z= -38.18,	name = _U('weed_processing'),	sprite = 496,	color = 52},
	WeedDealer =		{x = 372.00,    y= -1790.955,   z= 30.00,	name = _U('weed_dealer'),		sprite = 500,	color = 75},
	OpiumField =		{x = -2002.81,	y= 2575.68,		z= 2.83,	name = _U('opium_field'),		sprite = 51,	color = 60},
	OpiumProcessing =	{x = 1685.47,	y= 3287.66,		z= 41.14,	name = _U('opium_processing'),	sprite = 51,	color = 60},
	OpiumDealer =		{x = 294.68,	y= -1007.19,	z= 29.33,	name = _U('opium_dealer'),		sprite = 500,	color = 75}
}
