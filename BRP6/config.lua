Config = {}

Config["image_source"] = "nui://esx_inventoryhud/html/img/items/" -- From where it should take images?

Config.CloseInventoryHudTrigger = "esx_inventoryhud:closeInventory" -- Change with your event, or put weapon in esx_inventoryhud config.

Config["chance"] = {
	[1] = { name = "Rare", rate = 50 },
	--[1] = { name = "Common", rate = 50 }, -- Chance
	[2] = { name = "Rare", rate = 40 },
	[3] = { name = "Epic", rate = 15 },
	[4] = { name = "Unique", rate = 5.7} ,
	[5] = { name = "Legendary", rate = 1.5 },
}

Config["broadcast"] = true  -- Enable/disable announcements

Config["broadcast_tier"] = {
	[1] = true,	-- Upon receiving the award in Type "1" will be announced.
	[2] = true, 	-- Upon receiving the award in Type "2" will be announced.
	[3] = true,		-- Upon receiving the award in Type "3" will be announced.
	[4] = true,  	-- Upon receiving the award in Type "4" will be announced.
	[5] = true,  	-- Upon receiving the award in Type "5" will be announced.
}

Config["lootbox"] = {
	-- ["Pistol_Lootbox"]
	-- name = "PistolLootbox",
	-- list = {
	-- 	{ weapon = "weapon_m1911BRP", tier = 1 },
	-- 	{ weapon = "weapon_HK45BRP", tier = 1 },
	-- 	{ weapon = "weapon_fnp", tier = 1 },
	-- 	{ weapon = "weapon_pt92", tier = 1 },
	-- 	{ weapon = "weapon_TEC9BRP", tier = 2 },
	-- 	}
	-- },
		["AR_Lootbox"] = {
		name = "ARLootbox",
		list = {
			{ weapon = "weapon_sigBRP", tier = 1 },
			{ weapon = "weapon_sigmpx", tier = 1 },
			{ weapon = "weapon_augBRP", tier = 1 },
			{ weapon = "weapon_akmbrp", tier = 1 },
			{ weapon = "weapon_ak74BRP", tier = 1 },
		}
	},
		["Pistol_Lootbox"] = {
		name = "PistolLootbox",
		list = {
			{ weapon = "weapon_m1911BRP", ammount = 30, tier = 1 },
			--{ weapon = "weapon_HK45BRP", ammount = 30, tier = 1 },
			{ weapon = "weapon_fnp", ammount = 30, tier = 1 },
			{ weapon = "weapon_pt92", ammount = 30, tier = 1 },
			{ weapon = "weapon_TEC9BRP", ammount = 30, tier = 2 },
		}
	},
}