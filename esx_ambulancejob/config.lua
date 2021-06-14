Config                            = {}

Config.DrawDistance               = 100.0

Config.Marker                     = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }

Config.ReviveReward               = 1000  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.LoadIpl                    = true -- disable if you're using fivem-ipl or other IPL loaders

Config.Locale = 'en'

local second = 1000
local minute = 60 * second

Config.EarlyRespawnTimer          = 5 * minute  -- Time til respawn is available
Config.BleedoutTimer              = 15 * minute -- Time til the player bleeds out

Config.EnablePlayerManagement     = true

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = false

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = true
Config.EarlyRespawnFineAmount     = 500

Config.RespawnPoint = { coords = vector3(315.1, -580.8, 43.28), heading = 334.65 }

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(335.36, -585.93, 27.79),
			sprite = 61,
			scale  = 0.8,
			color  = 2
		},

		AmbulanceActions = {
			vector3(198.37, -1651.02, 28.8)
		},

		Pharmacies = {
			vector3(215.62, -1649.14, 28.8)
		},

		Vehicles = {
			{
				Spawner = vector3(201.56, -1666.07, 29.8),
				InsideShop = vector3(190.83, -1669.14, 29.8),
				Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(174.5, -1659.43, 29.33), heading = 232.0, radius = 2.0 },
					{ coords = vector3(176.5, -1657.16, 29.33), heading = 232.0, radius = 2.0 },
					{ coords = vector3(178.5, -1654.39, 29.33), heading = 232.0, radius = 2.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(319.49, -1454.62, 46.5),
				InsideShop = vector3(312.5, -1465.9, 46.5),
				Marker = { type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(313.16, -1465.14, 46.5), heading = 322.5, radius = 10.0 },
					{ coords = vector3(299.41, -1453.55, 46.5), heading = 322.5, radius = 10.0 }
				}
			}
		},

		FastTravels = {
			--To MX Track
			{
				From = vector3(-1081.05, -252.17, 44.02),
				To = { coords = vector3(1521.2, -3278.24, 28.17), heading = 92.0 },
				Marker = { type = 37, x = 1.5, y = 1.5, z = 0.5, r = 0, g = 0, b = 0, a = 100, rotate = true }
			},
			--TP Back From Mx Track
			{
				From = vector3(1538.94, -3266.5, 28.41),
				To = { coords = vector3(-1081.59, -252.61, 37.76), heading = 112.16 },
				Marker = { type = 24, x = 1.5, y = 1.5, z = 0.5, r = 0, g = 0, b = 0, a = 100, rotate = true }
			},
			--TO GO Karting
			{
				From = vector3(-1079.97, -254.09, 44.02),
				To = { coords = vector3(5533.85, 305.34, 20.04), heading = 112.16 },
				Marker = { type = 36, x = 1.5, y = 1.5, z = 0.5, r = 0, g = 0, b = 0, a = 100, rotate = true }
			},
			--TP back From GO Karting
			{
				From = vector3(5544.51, 304.32, 20.04),
				To = { coords = vector3(-1081.59, -252.61, 37.76), heading = 112.16 },
				Marker = { type = 24, x = 1.5, y = 1.5, z = 0.5, r = 0, g = 0, b = 0, a = 100, rotate = true }
			},
		},

		FastTravelsPrompt = {
			{
				From = vector3(-27.14, -1089.26, 20.44),
				To = { coords = vector3(-29.22, -1094.42, 25.44), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			}
		}

	}
}

Config.AuthorizedVehicles = {

	traineeparamedic = {
		{ model = 'Traineeparamedic', label = 'Traineeparamedic', price = 10000}
	},

	paramedic = {
		{ model = 'paramedic', label = 'paramedic', price = 10000}           
	},

	juniordoctor = {
		{ model = 'juniordoctor', label = 'juniordoctor', price = 10000}          
	},

	doctor = {
		{ model = 'doctor', label = 'doctor', price = 10000}            
	},

	seniordoctor = {
		{ model = 'seniordoctor', label = 'seniordoctor', price = 10000}           
	},

	ccparamedic = {
		{ model = 'ccparamedic', label = 'ccparamedic', price = 10000}          
	},

	specilist = {
		{ model = 'specilist', label = 'specilist', price = 10000}         
	},

	consultant = {
		{ model = 'consultant', label = 'consultant', price = 10000}          
	},

	assistchief = {
		{ model = 'assistchief', label = 'assistchief', price = 10000}
                
	},

	depchief = {
		{ model = 'depchief', label = 'depchief', price = 10000}           
	},

	chief = {
		{ model = 'chief', label = 'chief', price = 10000}            
	},

	boss = {
		{ model = 'FastResponders', label = 'Fast Responders', price = 10000}
	}

}

Config.AuthorizedHelicopters = {
	traineeparamedic = {},

	paramedic = {},

	juniordoctor = {},

	doctor = {},

	seniordoctor = {},

	ccparamedic = {},

	specilist = {},

	consultant = {},

	assistchief = {},

	depchief = {},

	chief = {
		{ model = 'airambulance', price =  1000000},
	}
}
