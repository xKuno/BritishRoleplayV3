Config = {
    ESXLibrary = "esx:getSharedObject", --ESX LIBRARY
    FolderNameOfMythicProgbar = "mythic_progbar", --Folder name of Mythic Progress Bar...
    UseNewESX = true, --If you using lastest ES_EXTENDED leave it on true if not set it to false!!!
    CDTime = 1 , -- in minutes
    MaxFarmTime = 3, ---How much player can farm poppyies before CD comes
    EnableShop = true, --Enables Shop for other Items to be bought. . .
    EnableShopBlip = true, --Enables Blip for Shop on map
    ShopBlipName = "Minimarket 'Marry'", -- Name of blip
    TimeOnHeroin = 1, -- In minutes how much does effect stays on player. Not recommended over 3 min!
    GetBlackMoney = true, --Get Black Money for selling heroin?
    ShopPrice = { --SHOP PRICES ETC.
        Acetone = 35,
        Diacetylmorphine = 225,
        Paracetamol  = 110,
        Caffeine = 85,
        CitricAcid = 45
    },
    SellingItems = { --SELING ITEMS
        { DB_Name = 'h100', label = 'Clean Heroin [100%]', SellPrice = 1900 },
        { DB_Name = 'h50', label = 'Mixed Heroin [50%]', SellPrice = 1400 },
    },
    Coords = {
        Loc = {
            HeroinLoc = {
                vector3(3307.32, 5022.92, 23.5),
                vector3(3312.84, 5029.72, 23.66),
                vector3(3308.64, 5038.6, 22.1),
                vector3(3300.84, 5037.0, 22.46),
                vector3(3291.64, 5036.36, 22.66),
                vector3(3283.44, 5031.52, 22.42),
                vector3(3287.32, 5024.24, 22.66),
                vector3(3276.64, 5042.08, 22.08),
                vector3(3306.24, 5027.84, 23.68),
                vector3(3296.68, 5026.56, 23.24),
                vector3(3294.84, 5015.68, 23.6)
            },
            Shop = {
                vector3(-298.12, -1333.08, 31.28)
            },
            HeroinExtraction = {
                vector3(2433.72, 4969.12, 42.36)
            },
            HeroinMixing = {
                vector3(2431.48, 4971.04, 42.36)
            },
            SellHeroin = {
                vector3(-1270.08, -1296.32, 4.0)
            }
        }
    },
    --Translate yourself. . .
    Translate = {
        --MARKERS
        [0] = "~w~[~r~E~w~] ~s~PICK UP POPPY",
        [1] = "~w~[~r~E~w~] ~s~MINIMARKET",
        [2] = "~w~[~r~E~w~] ~s~EXTRACTING POPPY",
        [3] = "~w~[~r~E~w~] ~s~MIXING",
        [4] = "~w~[~r~E~w~] ~s~SELL",
        --PROGRESS BAR
        [20] = "PICKING UP. . .",
        [21] = "EXTRACTING POPPY. . .",
        [22] = "MIXING 100% HEROIN. . .",
        [23] = "MIXING 75% HEROIN. . .",
        [24] = "MIXING 25% HEROIN. . .",
        [26] = "INJECTING HEROIN. . .",
        --NOTIFICATIONS
        [50] = "You dont have ~r~enough space~s~ in your inventory.",
        [51] = "~g~Well done!~s~ You got 1x Puppy!",
        [52] = "All plants are ~g~harvested~s~ and they need to have a rest. You need to~r~ wait~s~: ",
        [53] = "How much do you want to buy?",
        [54] = "You dont have ~r~enought~s~ money!",
        [55] = "You bought: ~y~",
        [56] = " ~s~for ~g~",
        [57] = "You dont have any Poppy ~r~left~s~ to extract it.",
        [58] = "You didnt success to extract it. Poppy is destroyed.",
        [59] = "You have ~g~successfully~s~ extracted Puppy and you got ~y~1x~s~ Heroin DNA.",
        [60] = "You dont have enough items to start mixing.",
        [61] = "~g~Successfully~s~ mixed 100% Clear Heroin.",
        [62] = "You need at least ~y~5x Caffeine~s~.",
        [63] = "You need at least ~y~3x Acetone~s~.",
        [64] = "~g~Successfully~s~ mixed 50% Heroin.",
        [65] = "You need at least ~y~10x Paracetamol~s~.",
        [66] = "You need at least ~y~3x Heroin DNA~s~.",
        [67] = "~g~Successfully~s~ mixed 25% Heroin.",
        [68] = "You need at least ~y~5x Diacetylmorphine~s~.",
        [69] = "You need at least ~y~1x Citric Acid~s~ to be able to use Heroin.",
        [70] = "How much do you want to sell?",
        [71] = "You sold: ~y~",
        [72] = " ~s~for~g~ ",
        [73] = "You dont have enought items.",
        --LABELS FROM ESX MENU
        [100] = "Merry Minimarket",
        [101] = "MIX, MIX, WORLD MIX!",
        [102] = "SELL YOUR GOODS",
    }
}

