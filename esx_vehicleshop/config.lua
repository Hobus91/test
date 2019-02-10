Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerColor                = { r = 198, g = 0, b = 0 }
Config.EnablePlayerManagement     = false -- If set to true, you need esx_addonaccount, esx_billing and esx_society
Config.EnableOwnedVehicles        = true --IMPORTANT POUR LE GIVE DES CLES
Config.EnableSocietyOwnedVehicles = false -- Ne pas avoir EnablePlayerManagement activé en même temps
Config.EnableJobLogs              = true -- only turn this on if you are using esx_joblogs
Config.ResellPercentage           = 50
Config.Locale = 'fr'

Config.Zones = {

  ShopEntering = {
    Pos   = { x = -42.46, y = -1092.71, z = 25.42 },
    Size  = { x = 1.5, y = 1.5, z = 1.0 },
    Type  = 27,
  },

  ShopInside = {
    Pos     = { x = -47.570, y = -1097.221, z = 25.422 },
    Size    = { x = 1.5, y = 1.5, z = 1.0 },
    Heading = -20.0,
    Type    = -1,
  },

  ShopOutside = {
    Pos     = { x = -14.8458, y = -1094.3101, z = 26.6761 }, --SORTIE VEHICULE ACHETEE
    Size    = { x = 1.5, y = 1.5, z = 1.0 },
    Heading = 90.0,
    Type    = -1,
  },

  BossActions = {
    Pos   = { x = -32.065, y = -1114.277, z = 25.422 },
    Size  = { x = 1.5, y = 1.5, z = 1.0 },
    Type  = -1,
  },

  GiveBackVehicle = {
    Pos   = { x = -18.227, y = -1078.558, z = 25.675 },
    Size  = { x = 3.0, y = 3.0, z = 1.0 },
    Type  = (Config.EnablePlayerManagement and 1 or -1),
  },

  ResellVehicle = {
    Pos   = { x = 813.870727, y = -822.550964, z = 26.1810779 },
    Size  = { x = 3.0, y = 3.0, z = 1.0 },
    Type  = -1,
  },

}
