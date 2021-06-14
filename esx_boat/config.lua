Config               = {}

Config.Locale = 'en'

Config.LicenseEnable = true -- enable boat license? Requires esx_license
Config.LicensePrice  = 50000

Config.MarkerType    = 1
Config.DrawDistance  = 100.0

Config.Marker = {
	r = 100, g = 204, b = 100, -- blue-ish color
	x = 1.5, y = 1.5, z = 1.0  -- standard size circle
}

Config.StoreMarker = {
	r = 255, g = 0, b = 0,     -- red color
	x = 5.0, y = 5.0, z = 1.0  -- big circle for storing boat
}

Config.Zones = {

	Garages = {
		{ -- Shank St, nearby campaign boat garage
			GaragePos  = vector3(-772.4, -1430.9, 0.5),
			SpawnPoint = vector4(-785.39, -1426.3, 0.0, 146.0),
			StorePos   = vector3(-798.4, -1456.0, 0.0),
			StoreTP    = vector4(-791.4, -1452.5, 1.5, 318.9)
		},

		{ -- Catfish View
			GaragePos  = vector3(3864.9, 4463.9, 1.6),
			SpawnPoint = vector4(3854.4, 4477.2, 0.0, 273.0),
			StorePos   = vector3(3857.0, 4446.9, 0.0),
			StoreTP    = vector4(3854.7, 4458.6, 1.8, 355.3)
		},

		{ -- Great Ocean Highway
			GaragePos  = vector3(-1614.0, 5260.1, 2.8),
			SpawnPoint = vector4(-1622.5, 5247.1, 0.0, 21.0),
			StorePos   = vector3(-1600.3, 5261.9, 0.0),
			StoreTP    = vector4(-1605.7, 5259.0, 2.0, 25.0)
		}
	},

	BoatShops = {
		{ -- Shank St, nearby campaign boat garage
			Outside = vector3(-773.7, -1495.2, 1.6),
			Inside = vector4(-798.5, -1503.1, -0.4, 120.0)
		}
	}

}

Config.Vehicles = {
	{model = 'seashark', label = 'Seashark (Random Color)', price = 7500},
	{model = 'seashark3', label = 'Seashark (Dark Blue)', price = 7500},
	{model = 'suntrap', label = 'Suntrap', price = 10000},
	{model = 'jetmax', label = 'Jetmax', price = 45000},
	{model = 'tropic2', label = 'Tropic', price = 65000},
	{model = 'dinghy2', label = 'Dinghy (Black)', price = 32500},
	{model = 'dinghy', label = 'Dinghy 2 (Random Color)', price = 40000},
	{model = 'speeder', label = 'Speeder', price = 85000},
	{model = 'squalo', label = 'Squalo (Random Color)', price = 61000},
	{model = 'toro', label = 'Toro', price = 200000}
}