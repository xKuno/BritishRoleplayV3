Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerColor                = { r = 120, g = 120, b = 240 }
Config.EnablePlayerManagement     = true -- enables the actual car dealer job. You'll need esx_addonaccount, esx_billing and esx_society
Config.EnableOwnedVehicles        = true
Config.EnableSocietyOwnedVehicles = false -- use with EnablePlayerManagement disabled, or else it wont have any effects
Config.ResellPercentage           = 1

Config.Locale = 'en'

Config.LicenseEnable = false -- require people to own drivers license when buying vehicles? Only applies if EnablePlayerManagement is disabled. Requires esx_license

-- looks like this: 'LLL NNN'
-- The maximum plate length is 8 chars (including spaces & symbols), don't go past it!
Config.PlateLetters  = 3
Config.PlateNumbers  = 3
Config.PlateUseSpace = true

Config.Zones = {

    ShopEntering = {
        Pos   = vector3(-794.11, -218.34, 36.0),
        Size  = {x = 1.5, y = 1.5, z = 1.0},
        Type  = 1
    },

    ShopInside = {
        Pos     = vector3(-792.87, -229.75, 37.08),
        Size    = {x = 1.5, y = 1.5, z = 1.0},
        Heading = -20.0,
        Type    = -1
    },

	ShopOutside = {
		Pos     = vector3(-45.72, -1675.44, 10.38),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 57.47,
		Type    = -1
	},

	BossActions = {
		Pos   = vector3(-789.72, -214.63, 36.0),
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Type  = -1
	},

	GiveBackVehicle = {
		Pos   = vector3(-27.94, -1678.15, 10.48),
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Type  = (Config.EnablePlayerManagement and 1 or -1)
	},

	ResellVehicle = {
        Pos   = vector3(-771.63, -232.18, 36.0),
        Size  = {x = 3.0, y = 3.0, z = 1.0},
        Type  = 1
    }

}
