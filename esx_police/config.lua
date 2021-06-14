Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = {x = 1.5, y = 1.5, z = 0.5}
Config.MarkerColor                = {r = 50, g = 50, b = 204}

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableLicenses             = false -- enable if you're using esx_license

Config.EnableHandcuffTimer        = true -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = true -- enable blips for cops on duty, requires esx_society
Config.EnableCustomPeds           = true -- enable custom peds in cloak room? See Config.CustomPeds below to customize peds

Config.EnableESXService           = false -- enable esx service?
Config.MaxInService               = -1

Config.Locale = 'en'

Config.militarStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(425.1, -979.5, 30.7),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(462.26, -996.5, 30.69)
		},

		Armories = {
			vector3(479.3, -996.7, 30.69)
		},

		Vehicles = {
			{
				Spawner = vector3(454.6, -1017.4, 28.4),
				InsideShop = vector3(444.42, -1018.55, 28.61),
				SpawnPoints = {
					{coords = vector3(438.4, -1018.3, 27.7), heading = 90.0, radius = 6.0},
					{coords = vector3(441.0, -1024.2, 28.3), heading = 90.0, radius = 6.0},
					{coords = vector3(453.5, -1022.2, 28.0), heading = 90.0, radius = 6.0},
					{coords = vector3(450.9, -1016.5, 28.1), heading = 90.0, radius = 6.0}
				}
			},

			{
				Spawner = vector3(473.3, -1018.8, 28.0),
				InsideShop = vector3(444.42, -1018.55, 28.61),
				SpawnPoints = {
					{coords = vector3(475.9, -1021.6, 28.0), heading = 276.1, radius = 6.0},
					{coords = vector3(484.1, -1023.1, 27.5), heading = 302.5, radius = 6.0}
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(461.1, -981.5, 43.6),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{coords = vector3(449.5, -981.2, 43.6), heading = 92.6, radius = 10.0}
				}
			}
		},

		BossActions = {
			vector3(460.05, -985.31, 30.73)
		}

	}

}

Config.AuthorizedWeapons = {
	pcso = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
        { weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	constable = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
	    { weapon = 'WEAPON_STUNGUN', price = 0 },
	    { weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	sergeant = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
	    { weapon = 'WEAPON_STUNGUN', price = 0 },
	    { weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	inspector = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
	    { weapon = 'WEAPON_STUNGUN', price = 0 },
	    { weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	chiefinspector = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
	    { weapon = 'WEAPON_STUNGUN', price = 0 },
	    { weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_GLOCKBRP', components = { 0, nil }, price = 10000 },
		{ weapon = 'WEAPON_M4A1BRP', components = { 0, 0, nil }, price = 10000 },
		{ weapon = 'WEAPON_G36BRP', components = { 0, 0, nil }, price = 10000 }
	},

	superintendent = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
	    { weapon = 'WEAPON_STUNGUN', price = 0 },
	    { weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_GLOCKBRP', components = { 0, nil }, price = 10000 },
		{ weapon = 'WEAPON_M4A1BRP', components = { 0, 0, nil }, price = 10000 },
		{ weapon = 'WEAPON_G36BRP', components = { 0, 0, nil }, price = 10000 }
	},

	chiefsuperintendent = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
	    { weapon = 'WEAPON_STUNGUN', price = 0 },
	    { weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_GLOCKBRP', components = { 0, nil }, price = 10000 },
		{ weapon = 'WEAPON_M4A1BRP', components = { 0, 0, nil }, price = 10000 },
		{ weapon = 'WEAPON_G36BRP', components = { 0, 0, nil }, price = 10000 }
	},

	commander = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
	    { weapon = 'WEAPON_STUNGUN', price = 0 },
	    { weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_GLOCKBRP', components = { 0, nil }, price = 10000 },
		{ weapon = 'WEAPON_M4A1BRP', components = { 0, 0, nil }, price = 10000 },
		{ weapon = 'WEAPON_G36BRP', components = { 0, 0, nil }, price = 10000 }
	},

	divsion = {},

	assistcommissioner = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_GLOCKBRP', components = { 0, nil }, price = 10000 },
		{ weapon = 'WEAPON_M4A1BRP', components = { 0, 0, nil }, price = 10000 },
		{ weapon = 'WEAPON_G36BRP', components = { 0, 0, nil }, price = 10000 },
		{ weapon = 'WEAPON_RE6BRP', price = 100000 }
	},

	depcommissioner = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_GLOCKBRP', components = { 0, nil }, price = 10000 },
		{ weapon = 'WEAPON_M4A1BRP', components = { 0, 0, nil }, price = 10000 },
		{ weapon = 'WEAPON_G36BRP', components = { 0, 0, nil }, price = 10000 },
		{ weapon = 'WEAPON_RE6BRP', price = 100000 }
	},

	commissioner = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_GLOCKBRP', components = { 0, nil }, price = 10000 },
		{ weapon = 'WEAPON_M4A1BRP', components = { 0, 0, nil }, price = 10000 },
		{ weapon = 'WEAPON_G36BRP', components = { 0, 0, nil }, price = 10000 },
		{ weapon = 'WEAPON_RE6BRP', price = 100000 }
	},
}

Config.AuthorizedVehicles = {
	car = {
		pcso = {
			{ model = 'PCSO1', price = 10000}
		}, 

		constable = {
			{ model = 'Constable1', price = 10000},
			{ model = 'Constable2', price = 10000}
		},

		sergeant = {
			{ model = 'Sergeant1', price = 10000},
			{ model = 'Sergeant2', price = 10000}
		},

		inspector = {
			{ model = 'Inspector1', price = 10000}
		},

		chiefinspector = {
			{ model = 'Chiefinspector1', price = 10000}
		},

		superintendent = {
			{ model = 'Superintendent1', price = 10000}
		},

		chiefsuperintendent = {
			{ model = 'Chiefsuperintendent1', price = 10000}
		},

		commander = {
			{ model = 'Commander1', price = 10000},
			{ model = 'Commander2', price = 10000}
		},

		divsion = {
			{ model = 'ARV1', price = 10000},
			{ model = 'ARV2', price = 10000},
			{ model = 'ARV3', price = 10000},
			{ model = 'Interceptors1', price = 10000},
			{ model = 'Interceptors2', price = 10000},
			{ model = 'Interceptors3', price = 10000}
		},

		assistcommissioner = {},

		depcommissioner = {},

		commissioner = {},
    },

	helicopter = {
		pcso = {},

		constable = {},

		sergeant = {},

		inspector = {},

		chiefinspector = {},

		superintendent = {},

		chiefsuperintendent = {},

		commander = {},

		divsion = {
			{ model = 'npas', price =  1},
		},

		assistcommissioner = {},

		depcommissioner = {},

		commissioner = {}
	}
}

Config.CustomPeds = {
	shared = {
		{label = 'Police Ped', maleModel = '', femaleModel = 's_f_y_cop_01'}
	},

	pcso = {},

	constable = {},

	sergeant = {},

	inspector = {},

	chiefinspector = {},

	superintendent = {},

	chiefsuperintendent = {},

	commander = {},

	divsion = {},

	assistcommissioner = {},

	depcommissioner = {},

	commissioner = {
		{label = 'Robbies keep off dante', maleModel = 'skin_dante', femaleModel = 'skin_dante'},
		{label = 'Robbies keep off groom', maleModel = 'ig_groom', femaleModel = 'ig_groom'},
		{label = 'Robbies keep off Midas', maleModel = 'Midas', femaleModel = 'Midas'},
		{label = 'Robbies keep off JimmyBully', maleModel = 'JimmyBully', femaleModel = 'JimmyBully'},
		{label = 'Robbies keep off WillSmith', maleModel = 'WillSmith', femaleModel = 'WillSmith'},
		{label = 'Robbies keep off Ayane Naked', maleModel = 'Ayane_Naked', femaleModel = 'Ayane_Naked'},
		{label = 'Robbies keep off Ronald', maleModel = 'Ronald', femaleModel = 'Ronald'},
		{label = 'Robbies keep off Billy SAW', maleModel = 'Billy_SAW', femaleModel = 'Billy_SAW'}
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements
Config.Uniforms = {
	pcso = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 288,   torso_2 = 0,
			arms = 0,
			pants_1 = 102,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			mask_1 = 121,    mask_2 = 0,
			chain_1 = 120,    chain_2 = 0,
			bproof_1 = 1, bproof_2 = 0
		},
		female = {}
	},

	constable = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 271,   torso_2 = 0,
			arms = 1,
			pants_1 = 102,   pants_2 = 4,
			shoes_1 = 25,   shoes_2 = 0,
			mask_1 = 121,    mask_2 = 0,
			bproof_1 = 20, bproof_2 = 0
		},
		female = {}
	},

	sergeant = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 271,   torso_2 = 1,
			arms = 1,
			pants_1 = 102,   pants_2 = 4,
			shoes_1 = 25,   shoes_2 = 0,
			mask_1 = 121,    mask_2 = 0,
			bproof_1 = 20, bproof_2 = 1
		},
		female = {}
	},

	inspector = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 271,   torso_2 = 2,
			arms = 1,
			pants_1 = 102,   pants_2 = 4,
			shoes_1 = 25,   shoes_2 = 0,
			mask_1 = 121,    mask_2 = 0,
			bproof_1 = 20, bproof_2 = 2
		},
		female = {}
	},

	chiefinspector = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 271,   torso_2 = 3,
			arms = 1,
			pants_1 = 102,   pants_2 = 4,
			shoes_1 = 25,   shoes_2 = 0,
			mask_1 = 121,    mask_2 = 0,
			bproof_1 = 20, bproof_2 = 3
		},
		female = {}
	},

	superintendent = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 271,   torso_2 = 4,
			arms = 1,
			pants_1 = 102,   pants_2 = 4,
			shoes_1 = 25,   shoes_2 = 0,
			mask_1 = 121,    mask_2 = 0,
			bproof_1 = 20, bproof_2 = 4
		},
		female = {}
	},

	chiefsuperintendent = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 271,   torso_2 = 5,
			arms = 1,
			pants_1 = 102,   pants_2 = 4,
			shoes_1 = 25,   shoes_2 = 0,
			mask_1 = 121,    mask_2 = 0,
			bproof_1 = 20, bproof_2 = 5
		},
		female = {}
	},

	commander = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 271,   torso_2 = 6,
			arms = 1,
			pants_1 = 102,   pants_2 = 4,
			shoes_1 = 25,   shoes_2 = 0,
			mask_1 = 121,    mask_2 = 0,
			bproof_1 = 20, bproof_2 = 6
		},
		female = {}
	},

	divsion = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 271,   torso_2 = 7,
			arms = 1,
			pants_1 = 102,   pants_2 = 4,
			shoes_1 = 25,   shoes_2 = 0,
			mask_1 = 121,    mask_2 = 0,
			bproof_1 = 20, bproof_2 = 7
		},
		female = {}
	},

	assistcommissioner = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 271,   torso_2 = 8,
			arms = 1,
			pants_1 = 102,   pants_2 = 4,
			shoes_1 = 25,   shoes_2 = 0,
			mask_1 = 121,    mask_2 = 0,
			bproof_1 = 20, bproof_2 = 8
		},
		female = {}
	},

	depcommissioner = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 271,   torso_2 = 9,
			arms = 1,
			pants_1 = 102,   pants_2 = 4,
			shoes_1 = 25,   shoes_2 = 0,
			mask_1 = 121,    mask_2 = 0,
			bproof_1 = 20, bproof_2 = 9
		},
		female = {}
	},

	commissioner = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 271,   torso_2 = 10,
			arms = 1,
			pants_1 = 102,   pants_2 = 4,
			shoes_1 = 25,   shoes_2 = 0,
			mask_1 = 121,    mask_2 = 0,
			bproof_1 = 0, bproof_2 = 0
		},
		female = {}
	},

	bullet_wear = {
		male = {},
		female = {}
	},
}