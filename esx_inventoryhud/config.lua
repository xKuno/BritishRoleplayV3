Config = {}
Config.Locale = 'en'
Config.IncludeCash = true -- Include cash in inventory?
Config.IncludeWeapons = true -- Include weapons in inventory?
Config.IncludeAccounts = true -- Include accounts (bank, black money, ...)?
Config.ExcludeAccountsList = {"bank"} -- List of accounts names to exclude from inventory
Config.OpenControl = 289 -- Key for opening inventory. Edit html/js/config.js to change key for closing it.

Config.CloseUiItems = {
    "radio",
    "fishingrod",
    "binoculars", 
    "bulletproof",
    "shell_oil", 
    "fixkit",
    "carokit",
    "carokitems",
    "clip",
    "hunting_bait",
    "hunting_tool",
    "lighter",
    "mayfair",
    "sterling",
    "mayfair_pack",
    "sterling_pack",
    "cubancigar",
    "davidoffcigar",
    "raw_paper",
    "banana_kush_joint",
    "purple_haze_joint",
    "blue_dream_joint",
    "og_kush_joint",
    "weaponlootbox",
    "tuning_laptop",
    "lootbox3",
    "Pistol_Lootbox",
    "mechanic_tools",
    "AR_Lootbox"
}

Config.ShopBlipID = 52
Config.LiquorBlipID = 93
Config.YouToolBlipID = 402
Config.PrisonShopBlipID = 52
Config.WeedStoreBlipID = 140
Config.WeaponShopBlipID = 110

Config.ShopLength = 14
Config.LiquorLength = 10
Config.YouToolLength = 2
Config.PrisonShopLength = 2

Config.Color = 2
Config.WeaponColor = 1

Config.WeaponLiscence = {x = 12.47, y = -1105.5, z = 1.8}
Config.LicensePrice = 5000

Config.Shops = {
    RegularShop = {
        Locations = {
			{x = 373.875,   y = 325.896,  z = 102.566},
			{x = 2557.458,  y = 382.282,  z = 107.622},
			{x = -3038.939, y = 585.954,  z = 6.908},
			{x = -3241.927, y = 1001.462, z = 11.830},
			{x = 547.431,   y = 2671.710, z = 41.156},
			{x = 1961.464,  y = 3740.672, z = 31.343},
			{x = 2678.916,  y = 3280.671, z = 54.241},
            {x = 1729.216,  y = 6414.131, z = 34.037},
            {x = -48.519,   y = -1757.514, z = 28.421},
			{x = 1163.373,  y = -323.801,  z = 68.205},
			{x = -707.501,  y = -914.260,  z = 18.215},
			{x = -1820.523, y = 792.518,   z = 137.118},
            {x = 1698.388,  y = 4924.404,  z = 41.063},
            {x = 25.723,   y = -1346.966, z = 28.497}, 
            {x = 4466.1,   y = -4465.52, z = 3.25},--cayo perico
        },
        Items = {
            {name = 'fishingrod'},
            {name = 'fishbait'},
            {name = 'turtlebait'},
            {name = 'fixkit'},
            {name = 'bandage'},
            {name = 'phone'},
            {name = 'oxygen_mask'},
            {name = 'lighter'},
            {name = 'mayfair'},
            {name = 'sterling'},
            {name = 'mayfair_pack'},
            {name = 'sterling_pack'},
            {name = 'cubancigar'},
            {name = 'davidoffcigar'},
            {name = 'raw_paper'},
            {name = 'water'},
            {name = 'bread'},
            {name = 'marsbar'},
            {name = 'snickers'},
            {name = 'walkers'},
            {name = 'doritos'},
            {name = 'monstermunch'},
            {name = 'cocacola'},
            {name = 'sprite'},
            {name = 'fanta'},
            {name = 'monster'},
            {name = 'milk'},
        }
    },

    RobsLiquor = {
		Locations = {
			{x = 1135.808,  y = -982.281,  z = 45.415},
			{x = -1222.915, y = -906.983,  z = 11.326},
			{x = -1487.553, y = -379.107,  z = 39.163},
			{x = -2968.243, y = 390.910,   z = 14.043},
			{x = 1166.024,  y = 2708.930,  z = 37.157},
			{x = 1392.562,  y = 3604.684,  z = 33.980},
			{x = -1393.409, y = -606.624,  z = 29.319},
			{x = 1685.14, y = 4864.85,  z = 41.5},
            {x = 4468.45,   y = -4464.48, z = 3.25},--cayo perico
            {x = 55.05, y = -798.57,  z = 30.59}
        },
        Items = {
            {name = 'fishingrod'},
            {name = 'fishbait'},
            {name = 'turtlebait'},
            {name = 'fixkit'},
            {name = 'bandage'},
            {name = 'oxygen_mask'},
            {name = 'lighter'},
            {name = 'mayfair'},
            {name = 'sterling'},
            {name = 'mayfair_pack'},
            {name = 'sterling_pack'},
            {name = 'cubancigar'},
            {name = 'davidoffcigar'},
            {name = 'raw_paper'},
            {name = 'vodka'},
            {name = 'jager'},
            {name = 'rum'},
            {name = 'whisky'},
            {name = 'fosters'},
            {name = 'darkfruits'},
           }

    },


    YouTool = {
        Locations = {
            {x = 2745.35, y = 3482.41, z = 54.7},
        },
        Items = {
            {name = 'fishingrod'},
            {name = 'fishbait'},
            {name = 'turtlebait'},
            {name = 'fixkit'},
            {name = 'phone'},
            {name = 'oxygen_mask'},
            {name = 'lighter'},
            {name = 'hunting_bait'},
            {name = 'hunting_tool'},
            {name = 'shell_oil'},
            {name = 'water'},
            {name = 'bread'},
        }
    },


    PrisonShop = {
        Locations = {
            {x = 1780.06, y = 2587.13, z = 44.92},
        },
        Items = {
            {name = 'water'},
            {name = 'bread'},
        }
    },

    WeaponShop = {
        Locations = {
           --{ x = -662.180, y = -934.961, z = 20.829 },
        },
        Weapons = {
            {name = "WEAPON_BAT", ammo = 1}
        },
        Ammo = {
            --{name = "9mm_rounds", weaponhash = "WEAPON_PISTOL", ammo = 24},
        },
        Items = {

        }
    },
}