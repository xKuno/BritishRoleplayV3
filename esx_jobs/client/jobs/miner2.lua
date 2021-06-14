Config.Jobs.miner2 = {

	BlipInfos = {
		Sprite = 318,
		Color = 5
	},

	Vehicles = {

		Truck = {
			Spawner = 1,
			Hash = "rubble",
			Trailer = "none",
			HasCaution = true
		}

	},

	Zones = {

		CloakRoom = {
			Pos = {x = 892.35, y = -2172.77, z = 31.28},
			Size = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Marker = 1,
			Blip = true,
			Name = _U("m_miner2_locker"),
			Type = "cloakroom",
			Hint = _U("cloak_change"),
			GPS = {x = 884.86, y = -2176.51, z = 29.51}
		},

		Mine = {
			Pos = {x = 2962.40, y = 2746.20, z = 42.39},
			Size = {x = 5.0, y = 5.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Marker = 1,
			Blip = true,
			Name = _U("m_rock"),
			Type = "work",
			Item = {
				{
					name = _U("m_rock"),
					db_name = "stone",
					time = 3000,
					max = 50,
					add = 1,
					remove = 1,
					requires = "nothing",
					requires_name = "Nothing",
					drop = 100
				}
			},
			Hint = _U("m_pickrocks"),
			GPS = {x = 289.24, y = 2862.90, z = 42.64}
		},

		StoneWash = {
			Pos = {x = 289.24, y = 2862.90, z = 42.64},
			Size = {x = 5.0, y = 5.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Marker = 1,
			Blip = true,
			Name = _U("m_washrock"),
			Type = "work",
			Item = {
				{
					name = _U("m_washrock"),
					db_name = "washed_stone",
					time = 5000,
					max = 50,
					add = 1,
					remove = 1,
					requires = "stone",
					requires_name = _U("m_rock"),
					drop = 100
				}
			},
			Hint = _U("m_rock_button"),
			GPS = {x = 1109.14, y = -2007.87, z = 30.01}
		},

		Foundry = {
			Pos = {x = 1109.14, y = -2007.87, z = 30.01},
			Size = {x = 5.0, y = 5.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Marker = 1,
			Blip = true,
			Name = _U("m_rock_smelting"),
			Type = "work",
			Item = {
				{
					name = _U("m_Aluminium_Ore"),
					db_name = "Aluminium_Ore",
					time = 4000,
					max = 50,
					add = 1,
					remove = 1,
					requires = "washed_stone",
					requires_name = _U("m_washrock"),
					drop = 100
				},
				{
					name = _U("m_Steel_ore"),
					db_name = "Steel_ore",
					max = 50,
					add = 1,
					drop = 5
				}
			},
			Hint = _U("m_melt_button"),
			GPS = {x = -169.48, y = -2659.16, z = 5.00}
		},

		VehicleSpawner = {
			Pos = {x = 884.86, y = -2176.51, z = 29.51},
			Size = {x = 5.0, y = 5.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Marker = 1,
			Blip = false,
			Name = _U("spawn_veh"),
			Type = "vehspawner",
			Spawner = 1,
			Hint = _U("spawn_veh_button"),
			Caution = 2000,
			GPS = {x = 2962.40, y = 2746.20, z = 42.39}
		},

		VehicleSpawnPoint = {
			Pos = {x = 879.55, y = -2189.79, z = 29.51},
			Size = {x = 5.0, y = 5.0, z = 1.0},
			Marker = -1,
			Blip = false,
			Name = _U("service_vh"),
			Type = "vehspawnpt",
			Spawner = 1,
			Heading = 90.1,
			GPS = 0
		},

		VehicleDeletePoint = {
			Pos = {x = 881.93, y = -2198.01, z = 29.51},
			Size = {x = 5.0, y = 5.0, z = 1.0},
			Color = {r = 255, g = 0, b = 0},
			Marker = 1,
			Blip = false,
			Name = _U("return_vh"),
			Type = "vehdelete",
			Hint = _U("return_vh_button"),
			Spawner = 1,
			Caution = 2000,
			GPS = 0,
			Teleport = 0
		},

		Aluminium_OreDelivery = {
			Pos = {x = -169.481, y = -2659.16, z = 5.00103},
			Color = {r = 204, g = 204, b = 0},
			Size = {x = 5.0, y = 5.0, z = 3.0},
			Marker = 1,
			Blip = true,
			Name = _U("m_sell_Aluminium_Ore"),
			Type = "delivery",
			Spawner = 1,
			Item = {
				{
					name = _U("delivery"),
					time = 500,
					remove = 1,
					max = 50, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
					price = 50,
					requires = "Aluminium_Ore",
					requires_name = _U("m_Aluminium_Ore"),
					drop = 100
				}
			},
			Hint = _U("m_deliver_Aluminium_Ore"),
			GPS = {x = -148.78, y = -1040.38, z = 26.27}
		},

		Steel_oreDelivery = {
			Pos = {x = -621.04, y = -228.53, z = 37.05},
			Color = {r = 204, g = 204, b = 0},
			Size = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Marker = 1,
			Blip = true,
			Name = _U("m_sell_Steel_ore"),
			Type = "delivery",
			Spawner = 1,
			Item = {
				{
					name = _U("delivery"),
					time = 500,
					remove = 1,
					max = 50, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
					price = 70,
					requires = "Steel_ore",
					requires_name = _U("m_Steel_ore"),
					drop = 100
				}
			},
			Hint = _U("m_deliver_Steel_ore"),
			GPS = {x = 2962.40, y = 2746.20, z = 42.39}
		}

	}
}