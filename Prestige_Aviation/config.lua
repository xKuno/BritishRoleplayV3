Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.EnablePlayerManagement     = true
--Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity --
--Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds --
Config.EnableSocietyOwnedVehicles = false
--Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale                     = 'en'
Config.Items = {
  {name = 'ties', label = 'Ties', price = 25},
}

Config.prestige_aviationStations = {

  prestige_aviation = {

	  AuthorizedVehicles = {
		  { name = 'luxor2',  label = 'luxor2' },
		  { name = 'swift',  label = 'swift' },
      { name = 'KRichA420', label = 'KRichA420'},
	  },

--[[     Armories = {
      { x = 172.84, y = -1320.08, z = 28.0 },
    },]]

    Vehicles = {
      {
        Spawner    = { x = -1282.42, y = -3342.06, z = 12.95 },
        SpawnPoint = { x = -1263.75, y = -3351.38, z = 13.94 },
        Heading    = 330.0,
      }
    },

    VehicleDeleters = {
      { x = 4454.29, y = -4501.5, z = 4.19 },
    },

    BossActions = {
      { x = 4428.24, y = -4452.83, z = 7.24 }
    },

  },

}
