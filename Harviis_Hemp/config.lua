Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
--[[ onfig.EnableESXIdentity          = true -- only turn this on if you are using esx_identity --
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds --
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false ]]
Config.Locale                     = 'en'
Config.sellBlipText = "sell"
Config.sellBlipColor = 85
Config.sellBlipSprite = 102
Config.GiveBlack = true 
Config.sellLocation =  {x = 382.07, y = -816.35, z = 29.3}
Config.MenuAlign = "bottom-right"
Config.sellItems = {
	mangokush = 1500,
	haze = 1100,
	haze28g = 635,
  mangokush28g = 1700,
	jewels = 635,
}

Config.Items = {
  {name = 'purple_haze_joint', label = 'Purple Haze Joint', price = 40},
  {name = 'blue_dream_joint', label = 'Blue Dream Joint', price = 40},
  {name = 'banana_kush_joint', label = 'Banana Kush Joint', price = 40},
  {name = 'lighter', label = 'Lighter', price = 1},
}

Config.harviis_hempStations = {

  harviis_hemp = {

	  AuthorizedVehicles = {},

    Armories = {
      { x = 374.77, y = -827.49, z = 29.3 },
    },

    Vehicles = {},

    VehicleDeleters = {},

    BossActions = {
      { x = 375.94, y = -823.71, z = 29.3 },
    },

  },

}
