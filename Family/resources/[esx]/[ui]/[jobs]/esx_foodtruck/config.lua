Config                            = {}
Config.DrawDistance               = 100.0

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.EnableVaultManagement      = true
Config.EnableHelicopters          = false
Config.EnableMoneyWash            = true
Config.MaxInService               = 4
Config.Locale                     = 'fr'

Config.MissCraft                  = 10 -- %


Config.AuthorizedVehicles = {
    { name = 'taco',  label = 'Camion' },
}

Config.Blips = {
    
    Blip = {
      Pos     = { x = -2189.4892, y = -400.1130, z = 12.2620 },
      Sprite  = 88,
      Display = 4,
      Scale   = 0.8,
      Colour  = 64,
    },

}

Config.Zones = {

    Cloakrooms = {
        Pos   = { x = -2189.4892, y = -400.1130, z = 12.2620 },
        Size  = { x = 1.5, y = 1.5, z = 1.0 },
        Color = { r = 255, g = 187, b = 255 },
        Type  = 27,
    },

    Vente = {
        Pos   = { x = -2193.5297, y = -388.9872, z = 12.4704 },
        Size  = { x = 1.5, y = 1.5, z = 1.0 },
        Color = { r = 0, g = 94, b = 255 },
        Type  = 27,
    },

    Vaults = {
        Pos   = { x = -2214.125, y = -370.7426, z = 12.3203 },
        Size  = { x = 1.3, y = 1.3, z = 1.0 },
        Color = { r = 30, g = 144, b = 255 },
        Type  = 23,
    },

    Fridge = {
        Pos   = { x = -2222.3884, y = -365.9383, z = 12.3212 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 248, g = 248, b = 255 },
        Type  = 23,
    },

    Vehicles = {
        Pos          = { x = -2187.5541, y = -409.0729, z = 12.1357 },
        SpawnPoint   = { x = -2189.4628, y = -415.7510, z = 12.1282 },
        Size         = { x = 1.8, y = 1.8, z = 1.0 },
        Color        = { r = 255, g = 255, b = 0 },
        Type         = 23,
        Heading      = 314.0453,
    },

    VehicleDeleters = {
        Pos   = { x = -2194.0583, y = -418.8664, z = 12.0978 },
        Size  = { x = 3.0, y = 3.0, z = 0.2 },
        Color = { r = 255, g = 255, b = 0 },
        Type  = 1,
    },

--[[
    Helicopters = {
        Pos          = { x = 137.177, y = -1278.757, z = 28.371 },
        SpawnPoint   = { x = 138.436, y = -1263.095, z = 28.626 },
        Size         = { x = 1.8, y = 1.8, z = 1.0 },
        Color        = { r = 255, g = 255, b = 0 },
        Type         = 23,
        Heading      = 207.43,
    },

    HelicopterDeleters = {
        Pos   = { x = 133.203, y = -1265.573, z = 28.396 },
        Size  = { x = 3.0, y = 3.0, z = 0.2 },
        Color = { r = 255, g = 255, b = 0 },
        Type  = 1,
    },
]]--

    BossActions = {
        Pos   = { x = -2184.9577, y = -401.5499, z = 12.2112 },
        Size  = { x = 1.5, y = 1.5, z = 0.4 },
        Color = { r = 0, g = 100, b = 0 },
        Type  = 1,
    },

-----------------------
-------- SHOPS --------

    Flacons = {
        Pos   = { x = -719.9672, y = 76.0092, z = 54.8554 },
        Size  = { x = 1.4, y = 1.4, z = 1.0 },
        Color = { r = 238, g = 0, b = 0 },
        Type  = 23,
        Items = {
            { name = 'champagne',      label = _U('champagne'),   price = 1 }
            -- { name = 'vodka',      label = _U('vodka'),   price = 4 },
            -- { name = 'rhum',       label = _U('rhum'),    price = 2 },
            -- { name = 'whisky',     label = _U('whisky'),  price = 7 },
            -- { name = 'tequila',    label = _U('tequila'), price = 2 },
            -- { name = 'martini',    label = _U('martini'), price = 5 }
        },
    },

    NoAlcool = {
        Pos   = { x = 45.6557, y = -1749.0104, z = 28.6083 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 238, g = 110, b = 0 },
        Type  = 23,
        Items = {
            { name = 'meat',        label = _U('meat'),     price = 1 }
            -- { name = 'jusfruit',    label = _U('jusfruit'), price = 3 },
            -- { name = 'icetea',      label = _U('icetea'),   price = 4 },
            -- { name = 'energy',      label = _U('energy'),   price = 7 },
            -- { name = 'drpepper',    label = _U('drpepper'), price = 2 },
            -- { name = 'limonade',    label = _U('limonade'), price = 1 }
        },
    },

    Apero = {
        Pos   = { x = -2955.242, y = 385.897, z = 14.041 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 142, g = 125, b = 76 },
        Type  = 23,
        Items = {
            { name = 'limonade',   label = _U('limonade'),    price = 1 }
            -- { name = 'bolnoixcajou',    label = _U('bolnoixcajou'),     price = 10 },
            -- { name = 'bolpistache',     label = _U('bolpistache'),      price = 15 },
            -- { name = 'bolchips',        label = _U('bolchips'),         price = 5 },
            -- { name = 'saucisson',       label = _U('saucisson'),        price = 25 },
            -- { name = 'grapperaisin',    label = _U('grapperaisin'),     price = 15 }
        },
    },

    -- Ice = {
    --     Pos   = { x = 26.979, y = -1343.457, z = 28.517 },
    --     Size  = { x = 1.6, y = 1.6, z = 1.0 },
    --     Color = { r = 255, g = 255, b = 255 },
    --     Type  = 23,
    --     Items = {
    --         { name = 'ice',     label = _U('ice'),      price = 1 },
    --         { name = 'menthe',  label = _U('menthe'),   price = 2 }
    --     },
    -- },

}


-----------------------
----- TELEPORTERS -----

Config.TeleportZones = {
  EnterBuilding = {
    Pos       = { x = 132.608, y = -1293.978, z = 0.0 },
    Size      = { x = 1.2, y = 1.2, z = 0.1 },
    Color     = { r = 128, g = 128, b = 128 },
    Marker    = 1,
    Hint      = _U('e_to_enter_1'),
    Teleport  = { x = 126.742, y = -1278.386, z = 0.0 }
  },

  ExitBuilding = {
    Pos       = { x = 132.517, y = -1290.901, z = 0.0 },
    Size      = { x = 1.2, y = 1.2, z = 0.1 },
    Color     = { r = 128, g = 128, b = 128 },
    Marker    = 1,
    Hint      = _U('e_to_exit_1'),
    Teleport  = { x = 131.175, y = -1295.598, z = 0.0 },
  },

--[[
  EnterHeliport = {
    Pos       = { x = 126.843, y = -729.012, z = 241.201 },
    Size      = { x = 2.0, y = 2.0, z = 0.2 },
    Color     = { r = 204, g = 204, b = 0 },
    Marker    = 1,
    Hint      = _U('e_to_enter_2),
    Teleport  = { x = -65.944, y = -818.589, z =  320.801 }
  },

  ExitHeliport = {
    Pos       = { x = -67.236, y = -821.702, z = 320.401 },
    Size      = { x = 2.0, y = 2.0, z = 0.2 },
    Color     = { r = 204, g = 204, b = 0 },
    Marker    = 1,
    Hint      = _U('e_to_exit_2'),
    Teleport  = { x = 124.164, y = -728.231, z = 241.801 },
  },
]]--
}


-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
  barman_outfit = {
    male = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 40,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 40,
        ['pants_1'] = 28,   ['pants_2'] = 2,
        ['shoes_1'] = 38,   ['shoes_2'] = 4,
        ['chain_1'] = 118,  ['chain_2'] = 0
    },
    female = {
        ['tshirt_1'] = 34,   ['tshirt_2'] = 0,
        ['torso_1'] = 14,    ['torso_2'] = 6,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 14,
        ['pants_1'] = 25,   ['pants_2'] = 8,
        ['shoes_1'] = 1,    ['shoes_2'] = 8,
        ['chain_1'] = 0,    ['chain_2'] = 2
    }
  }
}
