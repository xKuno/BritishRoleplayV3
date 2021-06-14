
Config = {

	BlipSprite = 237,
	BlipColor = 26,
	BlipText = 'Workbench',
	
	UseLimitSystem = false, 
	
	CraftingStopWithDistance = false,
	
	ExperiancePerCraft = 5,
	
	HideWhenCantCraft = false, 
	
	Categories = {
	
	['misc'] = {
		Label = 'MISC',
		Image = 'fishingrod',
		Jobs = {}
	},
	['weapons'] = {
		Label = 'WEAPONS',
		Image = 'WEAPON_APPISTOL',
		Jobs = {}
	},
	['weapons_parts'] = {
		Label = 'Parts',
		Image = 'parts',
		Jobs = {}
	},
	['mechanic_parts'] = {
		Label = 'Mechanic Parts',
		Image = 'parts',
		Jobs = {'mechanic'}
	},
	['medical'] = {
		Label = 'MEDICAL',
		Image = 'bandage',
		Jobs = {}
	}
	
	
	},
	
	PermanentItems = { 
		['wrench'] = true
	},
	
	Recipes = { 
	
		['bandage'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'medical', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {'ambulance'}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 2, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 30, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['Animal_Bones'] = 2, -- item name and count, adding items that dont exist in database will crash the script
				['ties'] = 2
			}
		},
		['turbo_lvl_1'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'mechanic_parts', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 30, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['Screws'] = 2, -- item name and count, adding items that dont exist in database will crash the script
				['iron'] = 2
			}
		},
		['turbo_lvl_2'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'mechanic_parts', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 30, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['Screws'] = 3, -- item name and count, adding items that dont exist in database will crash the script
				['iron'] = 3
			}
		},
		['turbo_lvl_3'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'mechanic_parts', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 30, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['Screws'] = 4, -- item name and count, adding items that dont exist in database will crash the script
				['iron'] = 4
			}
		},
		['strong_transmition'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'mechanic_parts', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 30, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['Screws'] = 4, -- item name and count, adding items that dont exist in database will crash the script
				['iron'] = 2
			}
		},
		['race_transmition'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'mechanic_parts', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 30, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['Screws'] = 5, -- item name and count, adding items that dont exist in database will crash the script
				['iron'] = 3
			}
		},
		['lowrider_suspension'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'mechanic_parts', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 30, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['Springs'] = 2, -- item name and count, adding items that dont exist in database will crash the script
				['iron'] = 2
			}
		},
		['race_suspension'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'mechanic_parts', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 30, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['Springs'] = 5, -- item name and count, adding items that dont exist in database will crash the script
				['iron'] = 2
			}
		},
		['v8engine'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'mechanic_parts', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 30, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['Springs'] = 2, -- item name and count, adding items that dont exist in database will crash the script
				['Screws'] = 2,
				['iron'] = 2
			}
		},
		['2jzengine'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'mechanic_parts', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 30, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['Springs'] = 1, -- item name and count, adding items that dont exist in database will crash the script
				['Screws'] = 2,
				['iron'] = 2
			}
		},
		['v12engine'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'mechanic_parts', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 30, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['Springs'] = 5, -- item name and count, adding items that dont exist in database will crash the script
				['Screws'] = 3,
				['iron'] = 5
			}
		},
		['race_brakes'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'mechanic_parts', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 30, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['Springs'] = 1, -- item name and count, adding items that dont exist in database will crash the script
				['Screws'] = 3,
				['iron'] = 3
			}
		},
		['michelin_tires'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'mechanic_parts', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 30, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
 -- item name and count, adding items that dont exist in database will crash the script
				['rubber'] = 10,
				['iron'] = 3
			}
		},
		['bridgestone_tires'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'mechanic_parts', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 30, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
 -- item name and count, adding items that dont exist in database will crash the script
				['rubber'] = 10,
				['iron'] = 3
			}
		},
		['shell_oil'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'mechanic_parts', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 30, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['iron'] = 1, -- item name and count, adding items that dont exist in database will crash the script
				['Screws'] = 1
			}
		},
		
	['WEAPON_FNP'] = {
        Level = 1,
        Category = 'weapons',
        isGun = true,
        Jobs = {}, 
        JobGrades = {}, 
        Amount = 1, 
        SuccessRate = 100,
        requireBlueprint = false,
        Time = 120,
        Ingredients = {
            ['FNP_Body'] = 1,
            ['FNP_Barrel'] = 1,
            ['FNP_Magazine'] = 1,
            ['PT92Firing_Pin'] = 1,
            ['Pistol_Spring'] = 1,
            ['Screws'] = 2
        }
    }, 

    ['FNP_Body'] = {
        Level = 0,
        Category = 'weapons_parts',
        isGun = false,
        Jobs = {}, 
        JobGrades = {}, 
        Amount = 1, 
        SuccessRate = 100,
        requireBlueprint = false,
        Time = 120,
        Ingredients = {
            ['Iron_Bar'] = 2,
            ['Screws'] = 1
        }
    }, 

	['FNP_Barrel'] = {
        Level = 0,
        Category = 'weapons_parts',
        isGun = false,
        Jobs = {}, 
        JobGrades = {}, 
        Amount = 1, 
        SuccessRate = 100,
        requireBlueprint = false,
        Time = 120,
        Ingredients = {
            ['Iron_Bar'] = 1,
            ['Screws'] = 2
        }
    }, 

	['FNP_Magazine'] = {
        Level = 0,
        Category = 'weapons_parts',
        isGun = false,
        Jobs = {}, 
        JobGrades = {}, 
        Amount = 1, 
        SuccessRate = 100,
        requireBlueprint = false,
        Time = 20,
        Ingredients = {
            ['Iron_Bar'] = 2,
            ['Screws'] = 2
        }
    }, 

	['WEAPON_PT92'] = {
		Level = 2,
		Category = 'weapons',
		isGun = true,
		Jobs = {}, 
		JobGrades = {}, 
		Amount = 1, 
		SuccessRate = 100,
		requireBlueprint = false,
		Time = 20,
		Ingredients = {
			['PT92_Body'] = 1,
			['FNP_Barrel'] = 1,
			['FNP_Magazine'] = 1,
			['PT92Firing_Pin'] = 1,
			['Pistol_Spring'] = 1,
			['Screws'] = 2
		}
	},

	 ['PT92_Body'] = {
		Level = 0,
		Category = 'weapons_parts',
		isGun = false,
		Jobs = {}, 
		JobGrades = {}, 
		Amount = 1, 
		SuccessRate = 100,
		requireBlueprint = false,
		Time = 20,
		Ingredients = {
			['Steel_Bar'] = 2,
			['Screws'] = 1
		}
	 },

	 ['PT92Firing_Pin'] = {
        Level = 0,
        Category = 'weapons_parts',
        isGun = false,
        Jobs = {}, 
        JobGrades = {}, 
        Amount = 1, 
        SuccessRate = 100,
        requireBlueprint = false,
        Time = 20,
        Ingredients = {
            ['Aluminium_Bar'] = 1,
            ['Screws'] = 2
        }
    }, 

	['Pistol_Spring'] = {
        Level = 0,
        Category = 'weapons_parts',
        isGun = false,
        Jobs = {}, 
        JobGrades = {}, 
        Amount = 1, 
        SuccessRate = 100,
        requireBlueprint = false,
        Time = 20,
        Ingredients = {
            ['Springs'] = 1,
            ['Steel_Bar'] = 1,
        }
    }, 

	['WEAPON_WINCHESTER12BRP'] = {
		Level = 300,
		Category = 'weapons',
		isGun = true,
		Jobs = {}, 
		JobGrades = {}, 
		Amount = 1, 
		SuccessRate = 100,
		requireBlueprint = false,
		Time = 20,
		Ingredients = {
			['WIN12_Body'] = 1,
			['WIN12_Barrel'] = 1,
			['WIN12_Stock'] = 1,
			['ShotgunFiring_Pin'] = 1,
			['Shotgun_Spring'] = 1,
			['Screws'] = 2
		}
	}, 

	['WIN12_Body'] = {
		Level = 250,
		Category = 'weapons_parts',
		isGun = false,
		Jobs = {}, 
		JobGrades = {}, 
		Amount = 1, 
		SuccessRate = 100,
		requireBlueprint = false,
		Time = 20,
		Ingredients = {
			['Wood_Grade_4'] = 9,
			['Steel_Bar'] = 4,
			['Screws'] = 1
		}
	},

	['WIN12_Barrel'] = {
		Level = 250,
		Category = 'weapons_parts',
		isGun = false,
		Jobs = {}, 
		JobGrades = {}, 
		Amount = 1, 
		SuccessRate = 100,
		requireBlueprint = false,
		Time = 20,
		Ingredients = {
			['Aluminium_Bar'] = 2,
			['Steel_Bar'] = 4,
			['Screws'] = 8
		}
	},

	['WIN12_Stock'] = {
		Level = 250,
		Category = 'weapons_parts',
		isGun = false,
		Jobs = {}, 
		JobGrades = {}, 
		Amount = 1, 
		SuccessRate = 100,
		requireBlueprint = false,
		Time = 20,
		Ingredients = {
			['Aluminium_Bar'] = 2,
			['Wood_Grade_4'] = 6,
			['Screws'] = 6
		}
	}, 

	['ShotgunFiring_Pin'] = {
		Level = 250,
		Category = 'weapons_parts',
		isGun = false,
		Jobs = {}, 
		JobGrades = {}, 
		Amount = 1, 
		SuccessRate = 100,
		requireBlueprint = false,
		Time = 20,
		Ingredients = {
			['Aluminium_Bar'] = 1,
			['Screws'] = 2,
			['Springs'] = 1
		}
	}, 

	['Shotgun_Spring'] = {
		Level = 250,
		Category = 'weapons_parts',
		isGun = false,
		Jobs = {}, 
		JobGrades = {}, 
		Amount = 1, 
		SuccessRate = 100,
		requireBlueprint = false,
		Time = 20,
		Ingredients = {
			['Aluminium_Bar'] = 1,
			['Springs'] = 1
		}
	},

	['WEAPON_vectorBRP'] = {
		Level = 200,
		Category = 'weapons',
		isGun = true,
		Jobs = {}, 
		JobGrades = {}, 
		Amount = 1, 
		SuccessRate = 100,
		requireBlueprint = false,
		Time = 20,
		Ingredients = {
			['vectorBRP_Body'] = 1,
			['vectorBRP_Barrel'] = 1,
			['vectorBRP_Magazine'] = 2,
			['vectorBRP_Firing_Pin'] = 1,
			['vectorBRP_Spring'] = 2,
			['Screws'] = 5
		}
	},

	['vectorBRP_Body'] = {
        Level = 200,
        Category = 'weapons_parts',
        isGun = false,
        Jobs = {}, 
        JobGrades = {}, 
        Amount = 1, 
        SuccessRate = 100,
        requireBlueprint = false,
        Time = 20,
        Ingredients = {
            ['Aluminium_Bar'] = 8,
            ['Steel_Bar'] = 8,
			['Screws'] = 10
        }
    }, 

	['vectorBRP_Barrel'] = {
        Level = 200,
        Category = 'weapons_parts',
        isGun = false,
        Jobs = {}, 
        JobGrades = {}, 
        Amount = 1, 
        SuccessRate = 100,
        requireBlueprint = false,
        Time = 20,
        Ingredients = {
            ['Aluminium_Bar'] = 8,
            ['Steel_Bar'] = 8,
			['Screws'] = 8
        }
    }, 

	['vectorBRP_Magazine'] = {
        Level = 200,
        Category = 'weapons_parts',
        isGun = false,
        Jobs = {}, 
        JobGrades = {}, 
        Amount = 1, 
        SuccessRate = 100,
        requireBlueprint = false,
        Time = 20,
        Ingredients = {
            ['Aluminium_Bar'] = 8,
            ['Steel_Bar'] = 4,
			['Screws'] = 6
        }
    },

    ['vectorBRP_Firing_Pin'] = {
        Level = 100,
        Category = 'weapons_parts',
        isGun = false,
        Jobs = {}, 
        JobGrades = {}, 
        Amount = 1, 
        SuccessRate = 100,
        requireBlueprint = false,
        Time = 20,
        Ingredients = {
            ['Aluminium_Bar'] = 4,
            ['Screws'] = 2
        }
    },

    ['vectorBRP_Spring'] = {
        Level = 100,
        Category = 'weapons_parts',
        isGun = false,
        Jobs = {}, 
        JobGrades = {}, 
        Amount = 1, 
        SuccessRate = 100,
        requireBlueprint = false,
        Time = 20,
        Ingredients = {
            ['Springs'] = 1,
            ['Steel_Bar'] = 1,
        }
    },

	['WEAPON_akmBRP'] = {
		Level = 300,
		Category = 'weapons',
		isGun = true,
		Jobs = {}, 
		JobGrades = {}, 
		Amount = 1, 
		SuccessRate = 20,
		requireBlueprint = false,
		Time = 120,
		Ingredients = {
			['akmBRP_Body'] = 1,
			['akmBRP_Barrel'] = 1,
			['akmBRP_Magazine'] = 1,
			['AR_Firing_Pin'] = 1,
			['AR_Spring'] = 1,
			['Screws'] = 1
		}
	}, 

	['akmBRP_Body'] = {
		Level = 50,
		Category = 'weapons_parts',
		isGun = false,
		Jobs = {}, 
		JobGrades = {}, 
		Amount = 1, 
		SuccessRate = 20,
		requireBlueprint = false,
		Time = 120,
		Ingredients = {
			['Gold_Bar'] = 5,
			['Aluminium_Bar'] = 10,
			['Steel_Bar'] = 12,
			['Wood_Grade_4'] = 9,
			['Screws'] = 20
		}
	}, 

	['akmBRP_Barrel'] = {
		Level = 50,
		Category = 'weapons_parts',
		isGun = false,
		Jobs = {}, 
		JobGrades = {}, 
		Amount = 1, 
		SuccessRate = 20,
		requireBlueprint = false,
		Time = 120,
		Ingredients = {
			['Gold_Bar'] = 3,
			['Aluminium_Bar'] = 8,
			['Steel_Bar'] = 10,
			['Screws'] = 16
		}
	}, 

	['akmBRP_Magazine'] = {
		Level = 50,
		Category = 'weapons_parts',
		isGun = false,
		Jobs = {}, 
		JobGrades = {}, 
		Amount = 1, 
		SuccessRate = 20,
		requireBlueprint = false,
		Time = 120,
		Ingredients = {
			['Gold_Bar'] = 2,
			['Aluminium_Bar'] = 4,
			['Steel_Bar'] = 6,
			['Screws'] = 8
		}
	}, 

	['AR_Firing_Pin'] = {
		Level = 50,
		Category = 'weapons_parts',
		isGun = false,
		Jobs = {}, 
		JobGrades = {}, 
		Amount = 1, 
		SuccessRate = 20,
		requireBlueprint = false,
		Time = 120,
		Ingredients = {
			['Gold_Bar'] = 1,
			['Aluminium_Bar'] = 1,
			['Screws'] = 2
		}
	}, 

	['AR_Spring'] = {
		Level = 50,
		Category = 'weapons_parts',
		isGun = false,
		Jobs = {}, 
		JobGrades = {}, 
		Amount = 1, 
		SuccessRate = 20,
		requireBlueprint = false,
		Time = 120,
		Ingredients = {
			['Springs'] = 1,
			['Aluminium_Bar'] = 1
		}
	}, 

	['clip'] = {
		Level = 1,
		Category = 'misc',
		isGun = false,
		Jobs = {}, 
		JobGrades = {}, 
		Amount = 1, 
		SuccessRate = 50,
		requireBlueprint = false,
		Time = 40,
		Ingredients = {
			['Springs'] = 1,
			['Screws'] = 1,
			['Wood_Grade_1'] = 1
		}
	},

	['Bronze_Bar'] = {
		Level = 2,
		Category = 'misc',
		isGun = false,
		Jobs = {}, 
		JobGrades = {}, 
		Amount = 1, 
		SuccessRate = 50,
		requireBlueprint = false,
		Time = 120,
		Ingredients = {
			['Copper_Ore'] = 10,
			['Tin_ore'] = 10
		}
	}, 

	['Iron_Bar'] = {
		Level = 2,
		Category = 'misc',
		isGun = false,
		Jobs = {}, 
		JobGrades = {}, 
		Amount = 1, 
		SuccessRate = 50,
		requireBlueprint = false,
		Time = 120,
		Ingredients = {
			['Iron_Ore'] = 10,
			['Coal'] = 10
		}
	}, 

	['Steel_Bar'] = {
		Level = 2,
		Category = 'misc',
		isGun = false,
		Jobs = {}, 
		JobGrades = {}, 
		Amount = 1, 
		SuccessRate = 50,
		requireBlueprint = false,
		Time = 120,
		Ingredients = {
			['Iron_Ore'] = 10,
			['Coal'] = 10
		}
	}, 

	['Aluminium_Bar'] = {
		Level = 2,
		Category = 'misc',
		isGun = false,
		Jobs = {}, 
		JobGrades = {}, 
		Amount = 1, 
		SuccessRate = 50,
		requireBlueprint = false,
		Time = 120,
		Ingredients = {
			['Aluminium_Ore'] = 10,
			['Coal'] = 10
		}
	}, 
	
	['Gold_Bar'] = {
		Level = 2,
		Category = 'misc',
		isGun = false,
		Jobs = {}, 
		JobGrades = {}, 
		Amount = 1, 
		SuccessRate = 50,
		requireBlueprint = false,
		Time = 120, 
		Ingredients = { 
			['Gold_ore'] = 10, 
			['Aluminium_Ore'] = 10
		} 
	}
	
},
	
	Workbenches = { -- Every workbench location, leave {} for jobs if you want everybody to access
			{coords = vector3(5195.33,-5136.89,4.35), jobs = {}, blip = true, recipes = {}, radius = 3.0 },
			{coords = vector3(-200.74,-1317.55,31.09), jobs = {'mechanic'}, blip = true, recipes = {}, radius = 3.0 },
	
	},
	 
	Text = {
	
		['not_enough_ingredients'] = 'You dont have enough ingredients',
		['you_cant_hold_item'] = 'You cant hold the item',
		['item_crafted'] = 'Item crafted!',
		['wrong_job'] = 'You cant open this workbench',
		['workbench_hologram'] = '[~b~E~w~] Workbench',
		['wrong_usage'] = 'Wrong usage of command',
		['inv_limit_exceed'] = 'Inventory limit exceeded! Clean up before you lose more',
		['crafting_failed'] = 'You failed to craft the item!'
	
	}
	
	}
	
	function SendTextMessage(msg)
	
			SetNotificationTextEntry('STRING')
			AddTextComponentString(msg)
			DrawNotification(0,1)
			exports['mythic_notify']:SendAlert('inform', msg)
	
	end