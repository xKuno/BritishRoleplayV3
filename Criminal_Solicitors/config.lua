Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
--Config.MaxInService               = -1
Config.Locale                     = 'en'
Config.Items = {
  {name = 'skateboard', lable = 'skateboard', price = 500},
  {name = 'carokit', lable = 'Hammer', price = 700},
  {name = 'fixkit', lable = 'Repair Kit', price = 700},
}

Config.Criminal_SolicitorsStations = {

  Criminal_Solicitors = {

    Blip = {
      Pos     = { x = 1414.33, y = -758.43, z = 66.18 },
      Sprite  = 280,
      Display = 4,
      Scale   = 1.0,
      Colour  = 1,
    },

	  AuthorizedVehicles = {},

    Cloakrooms = {},

    Armories = {
      { x = 1414.33, y = -758.43, z = 66.18 },
    },

    Vehicles = {},
	
 Helicopters = {},

    VehicleDeleters = {},

    BossActions = {
      { x = 1415.04, y = -747.58, z = 69.53 },
    },

  },

}
