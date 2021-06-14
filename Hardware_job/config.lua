Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity --
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds --
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
--Config.MaxInService               = -1
Config.Locale                     = 'en'
Config.Items = {
  {name = 'ties', label = 'Ties', price = 25},
  {name = 'bulletproof', label = 'Bulletproof', price = 400},
  {name = 'phone', label = 'Phone', price = 100},
  {name = 'oxygen_mask', lable = 'Oxygen_mask', price = 40},
  {name = 'binoculars', lable = 'binoculars', price = 50},
  {name = 'skateboard', lable = 'skateboard', price = 50},
  {name = 'carokit', lable = 'Hammer', price = 600},
  {name = 'fixkit', lable = 'Repair Kit', price = 600},
  {name = 'carokitems', lable = 'hammer nhs and police only', price = 1},
  {name = 'bulletproofpd', lable = 'PD Only Bullet-proof Vest', price = 1},
}

Config.HardwareStations = {

  Hardware = {

	  AuthorizedVehicles = {},

    Armories = {
      { x = 172.84, y = -1320.08, z = 28.0 },
    },

    Vehicles = {},

    VehicleDeleters = {},

    BossActions = {
      { x = 168.33, y = -1312.28, z = 28.0 },
    },

  },

}
