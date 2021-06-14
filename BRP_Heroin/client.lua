local b = nil
Citizen.CreateThread(
    function()
        while b == nil do
            TriggerEvent(
                Config.ESXLibrary,
                function(c)
                    b = c
                end
            )
            Citizen.Wait(0)
        end
    end
)
PoppySpawnedTable = {}
sProp, puppyFarmed = 0, 0
local d, e, f = false, false, false
ESEGA = function(g, h)
    AddTextEntry("FloatingNotify", g)
    SetFloatingHelpTextWorldPosition(1, h)
    SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
    BeginTextCommandDisplayHelp("FloatingNotify")
    EndTextCommandDisplayHelp(2, false, false, -1)
end
Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(2000)
            local i = PlayerPedId()
            local j = GetEntityCoords(i)
            local k = true
            for l, m in pairs(Config.Coords) do
                for n = 1, #m.HeroinLoc, 1 do
                    local o = #(j - m.HeroinLoc[n])
                    if o < 50 then
                        SHB()
                    end
                end
            end
            if k then
                Citizen.Wait(1000)
            end
        end
    end
)
Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(0)
            local i = PlayerPedId()
            local j = GetEntityCoords(i)
            local k = true
            for l, m in pairs(Config.Coords) do
                for n = 1, #m.HeroinLoc, 1 do
                    local o = #(j - m.HeroinLoc[n])
                    if o < 20 then
                        k = false
                        if o < 1 and not d then
                            k = false
                            b.Game.Utils.DrawText3D(m.HeroinLoc[n], Config.Translate[0], 0.7)
                            if IsControlJustReleased(0, 38) and not d then
                                PUH()
                            end
                        end
                    end
                end
            end
            for l, m in pairs(Config.Coords) do
                for n = 1, #m.HeroinExtraction, 1 do
                    local o = #(j - m.HeroinExtraction[n])
                    if o < 20 then
                        k = false
                        if o < 15 and not e then
                            k = false
                            b.Game.Utils.DrawText3D(m.HeroinExtraction[n], Config.Translate[2], 0.7)
                            if o < 1.5 then
                                if IsControlJustReleased(0, 38) and not e then
                                    TriggerServerEvent("brp:caNexHeroin")
                                end
                            end
                        end
                    end
                end
            end
            for l, m in pairs(Config.Coords) do
                for n = 1, #m.HeroinMixing, 1 do
                    local o = #(j - m.HeroinMixing[n])
                    if o < 20 then
                        k = false
                        if o < 15 and not f then
                            k = false
                            b.Game.Utils.DrawText3D(m.HeroinMixing[n], Config.Translate[3], 0.7)
                            if o < 1.5 then
                                if IsControlJustReleased(0, 38) and not f then
                                    MXF()
                                end
                            end
                        end
                    end
                end
            end
            for l, m in pairs(Config.Coords) do
                for n = 1, #m.SellHeroin, 1 do
                    local o = #(j - m.SellHeroin[n])
                    if o < 20 then
                        k = false
                        if o < 15 and not f then
                            k = false
                            b.Game.Utils.DrawText3D(m.SellHeroin[n], Config.Translate[4], 0.7)
                            if o < 1.5 then
                                if IsControlJustReleased(0, 38) and not f then
                                    SLF()
                                end
                            end
                        end
                    end
                end
            end
            if Config.EnableShop then
                for l, m in pairs(Config.Coords) do
                    for n = 1, #m.Shop, 1 do
                        local o = #(j - m.Shop[n])
                        if o < 20 then
                            k = false
                            if o < 15 then
                                k = false
                                b.Game.Utils.DrawText3D(m.Shop[n], Config.Translate[1], 0.7)
                                if o < 1.5 then
                                    if IsControlJustReleased(0, 38) then
                                        SHF()
                                    end
                                end
                            end
                        end
                    end
                end
            end
            if k then
                Citizen.Wait(1000)
            end
        end
    end
)
SLF = function()
    local q = PlayerPedId()
    FreezeEntityPosition(q, true)
    local r = {}
    for s, t in pairs(Config.SellingItems) do
        table.insert(
            r,
            {
                label = t.label .. " | " .. ('<span style="color:green;">%s</span>'):format("$" .. t.SellPrice .. ""),
                DB_Name = t.DB_Name,
                SellPrice = t.SellPrice
            }
        )
    end
    b.UI.Menu.Open(
        "default",
        GetCurrentResourceName(),
        "sell_point_menu",
        {title = Config.Translate[102], align = "bottom-right", elements = r},
        function(u, v)
            if u.current.DB_Name == u.current.DB_Name then
                DMF(u.current.DB_Name, u.current.SellPrice)
            end
        end,
        function(u, v)
            v.close()
            a = false
            FreezeEntityPosition(q, false)
        end,
        function(u, v)
        end
    )
end
DMF = function(w, x)
    b.UI.Menu.Open(
        "dialog",
        GetCurrentResourceName(),
        "dialogmenu_sell",
        {title = Config.Translate[70]},
        function(u, v)
            v.close()
            amountToSell = tonumber(u.value)
            totalSellPrice = x * amountToSell
            TriggerServerEvent("brp:heroinProdaja", amountToSell, totalSellPrice, w)
        end,
        function(u, v)
            v.close()
        end
    )
end
MXF = function()
    b.UI.Menu.CloseAll()
    b.UI.Menu.Open(
        "default",
        GetCurrentResourceName(),
        "shf",
        {
            title = Config.Translate[101],
            align = "bottom-right",
            elements = {
                {
                    label = "HEROIN CLEAR > " .. ('<span style="color:green;">%s |</span>'):format("| QUALITY: 100%"),
                    value = "a"
                },
                {
                    label = "HEROIN MIXED > " .. ('<span style="color:yellow;">%s |</span>'):format("| QUALITY: 50%"),
                    value = "b"
                },
                {
                    label = "HEROIN SELLING > " .. ('<span style="color:red;">%s |</span>'):format("| QUALITY: 25%"),
                    value = "c"
                }
            }
        },
        function(y, z)
            if y.current.value == "a" then
                b.TriggerServerCallback(
                    "brp:heroinChInvClear",
                    function(items)
                        if items then
                            Mix100()
                        end
                    end,
                    items
                )
            end
            if y.current.value == "b" then
                b.TriggerServerCallback(
                    "brp:heroinChInvMixed",
                    function(items)
                        if items then
                            Mix75()
                        end
                    end,
                    items
                )
            end
            if y.current.value == "c" then
                b.TriggerServerCallback(
                    "brp:heroinChInvlow",
                    function(items)
                        if items then
                            Mix25()
                        end
                    end,
                    items
                )
            end
        end,
        function(y, z)
            z.close()
        end
    )
end
Mix25 = function()
    local i = PlayerPedId()
    f = true
    exports[Config.FolderNameOfMythicProgbar]:Progress(
        {
            name = "unique_action_name",
            duration = 8000,
            label = Config.Translate[24],
            useWhileDead = true,
            canCancel = true,
            controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true
            },
            animation = {animDict = "anim@amb@board_room@supervising@", anim = "idle_01_hi_amy_skater_01"}
        },
        function(A)
            if not A then
                ClearPedTasks(i)
                TriggerServerEvent("brp:mix25")
            else
                ClearPedTasks(i)
            end
        end
    )
    Citizen.Wait(8000)
    f = false
end
Mix75 = function()
    local i = PlayerPedId()
    f = true
    exports[Config.FolderNameOfMythicProgbar]:Progress(
        {
            name = "unique_action_name",
            duration = 8000,
            label = Config.Translate[23],
            useWhileDead = true,
            canCancel = true,
            controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true
            },
            animation = {animDict = "anim@amb@board_room@supervising@", anim = "idle_01_hi_amy_skater_01"}
        },
        function(A)
            if not A then
                ClearPedTasks(i)
                TriggerServerEvent("brp:mix75")
            else
                ClearPedTasks(i)
            end
        end
    )
    Citizen.Wait(8000)
    f = false
end
Mix100 = function()
    local i = PlayerPedId()
    f = true
    exports[Config.FolderNameOfMythicProgbar]:Progress(
        {
            name = "unique_action_name",
            duration = 8000,
            label = Config.Translate[22],
            useWhileDead = true,
            canCancel = true,
            controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true
            },
            animation = {animDict = "anim@amb@board_room@supervising@", anim = "idle_01_hi_amy_skater_01"}
        },
        function(A)
            if not A then
                ClearPedTasks(i)
                TriggerServerEvent("brp:mix100")
            else
                ClearPedTasks(i)
            end
        end
    )
    Citizen.Wait(8000)
    f = false
end
RegisterNetEvent("brp:heroinExAnim")
AddEventHandler(
    "brp:heroinExAnim",
    function()
        EXH()
    end
)
EXH = function()
    local i = PlayerPedId()
    e = true
    exports[Config.FolderNameOfMythicProgbar]:Progress(
        {
            name = "unique_action_name",
            duration = 8000,
            label = Config.Translate[21],
            useWhileDead = true,
            canCancel = true,
            controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true
            },
            animation = {animDict = "anim@amb@board_room@supervising@", anim = "confused_01_lo_amy_skater_01"}
        },
        function(A)
            if not A then
                ClearPedTasks(i)
                d = false
                puppyFarmed = puppyFarmed + 1
                TriggerServerEvent("brp:exHeroin")
            else
                ClearPedTasks(i)
            end
        end
    )
    Citizen.Wait(8000)
    e = false
end
PUH = function()
    if puppyFarmed > Config.MaxFarmTime then
        b.ShowNotification(Config.Translate[52] .. Config.CDTime .. " min.")
        Citizen.Wait(Config.CDTime * 60 * 1000)
        puppyFarmed = 0
        d = false
    else
        d = true
        local i = PlayerPedId()
        exports[Config.FolderNameOfMythicProgbar]:Progress(
            {
                name = "unique_action_name",
                duration = 4500,
                label = Config.Translate[20],
                useWhileDead = true,
                canCancel = true,
                controlDisables = {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true
                },
                animation = {
                    animDict = "anim@amb@business@weed@weed_inspecting_lo_med_hi@",
                    anim = "weed_spraybottle_crouch_base_inspector"
                }
            },
            function(A)
                if not A then
                    ClearPedTasks(i)
                    d = false
                    puppyFarmed = puppyFarmed + 1
                    TriggerServerEvent("brp:addPopy")
                else
                    ClearPedTasks(i)
                end
            end
        )
        Citizen.Wait(4500)
    end
end
SHB = function()
    while sProp < 10 do
        Citizen.Wait(0)
        for l, m in pairs(Config.Coords) do
            for n = 1, #m.HeroinLoc, 1 do
                local B = m.HeroinLoc[n]
                b.Game.SpawnLocalObject(
                    "prop_cs_plant_01",
                    B,
                    function(C)
                        PlaceObjectOnGroundProperly(C)
                        FreezeEntityPosition(C, true)
                        table.insert(PoppySpawnedTable, C)
                        sProp = sProp + 1
                    end
                )
                Wait(100)
            end
        end
    end
end
SHF = function()
    b.UI.Menu.CloseAll()
    b.UI.Menu.Open(
        "default",
        GetCurrentResourceName(),
        "shf",
        {
            title = Config.Translate[100],
            align = "bottom-right",
            elements = {
                {
                    label = "ACETONE - " .. ('<span style="color:green;">%s$</span>'):format(Config.ShopPrice.Acetone),
                    value = "a"
                },
                {
                    label = "DIACETYLMORPHINE - " ..
                        ('<span style="color:green;">%s$</span>'):format(Config.ShopPrice.Diacetylmorphine),
                    value = "b"
                },
                {
                    label = "PARACETAMOL - " ..
                        ('<span style="color:green;">%s$</span>'):format(Config.ShopPrice.Paracetamol),
                    value = "c"
                },
                {
                    label = "CAFFEINE - " .. ('<span style="color:green;">%s$</span>'):format(Config.ShopPrice.Caffeine),
                    value = "d"
                },
                {
                    label = "CITRIC ACID - " ..
                        ('<span style="color:green;">%s$</span>'):format(Config.ShopPrice.CitricAcid),
                    value = "e"
                }
            }
        },
        function(y, z)
            if y.current.value == "a" then
                b.UI.Menu.Open(
                    "dialog",
                    GetCurrentResourceName(),
                    "348fh834unf8un34f12e32d",
                    {title = Config.Translate[53]},
                    function(u, v)
                        v.close()
                        local D = Config.ShopPrice.Acetone
                        amount = tonumber(u.value)
                        novac = D * amount
                        droga = "acetone"
                        b.TriggerServerCallback(
                            "brp:shopHeroine",
                            function(novac, droga, amount)
                                if not novac then
                                    b.ShowNotification(Config.Translate[54])
                                end
                            end,
                            novac,
                            droga,
                            amount
                        )
                    end,
                    function(u, v)
                        v.close()
                    end
                )
            end
            if y.current.value == "b" then
                b.UI.Menu.Open(
                    "dialog",
                    GetCurrentResourceName(),
                    "348fh834unf8un34f12e32d",
                    {title = Config.Translate[53]},
                    function(u, v)
                        v.close()
                        local D = Config.ShopPrice.Diacetylmorphine
                        amount = tonumber(u.value)
                        novac = D * amount
                        droga = "diacetylmorphine"
                        b.TriggerServerCallback(
                            "brp:shopHeroine",
                            function(novac, droga, amount)
                                if not novac then
                                    b.ShowNotification(Config.Translate[54])
                                end
                            end,
                            novac,
                            droga,
                            amount
                        )
                    end,
                    function(u, v)
                        v.close()
                    end
                )
            end
            if y.current.value == "c" then
                b.UI.Menu.Open(
                    "dialog",
                    GetCurrentResourceName(),
                    "348fh834unf8un34f12e32d",
                    {title = Config.Translate[53]},
                    function(u, v)
                        v.close()
                        local D = Config.ShopPrice.Paracetamol
                        amount = tonumber(u.value)
                        novac = D * amount
                        droga = "paracetamol"
                        b.TriggerServerCallback(
                            "brp:shopHeroine",
                            function(novac, droga, amount)
                                if not novac then
                                    b.ShowNotification(Config.Translate[54])
                                end
                            end,
                            novac,
                            droga,
                            amount
                        )
                    end,
                    function(u, v)
                        v.close()
                    end
                )
            end
            if y.current.value == "d" then
                b.UI.Menu.Open(
                    "dialog",
                    GetCurrentResourceName(),
                    "348fh834unf8un34f12e32d",
                    {title = Config.Translate[53]},
                    function(u, v)
                        v.close()
                        local D = Config.ShopPrice.Caffeine
                        amount = tonumber(u.value)
                        novac = D * amount
                        droga = "caffeine"
                        b.TriggerServerCallback(
                            "brp:shopHeroine",
                            function(novac, droga, amount)
                                if not novac then
                                    b.ShowNotification(Config.Translate[54])
                                end
                            end,
                            novac,
                            droga,
                            amount
                        )
                    end,
                    function(u, v)
                        v.close()
                    end
                )
            end
            if y.current.value == "e" then
                b.UI.Menu.Open(
                    "dialog",
                    GetCurrentResourceName(),
                    "348fh834unf8un34f12e32d",
                    {title = Config.Translate[53]},
                    function(u, v)
                        v.close()
                        local D = Config.ShopPrice.CitricAcid
                        amount = tonumber(u.value)
                        novac = D * amount
                        droga = "citricacid"
                        b.TriggerServerCallback(
                            "brp:shopHeroine",
                            function(novac, droga, amount)
                                if not novac then
                                    b.ShowNotification(Config.Translate[54])
                                end
                            end,
                            novac,
                            droga,
                            amount
                        )
                    end,
                    function(u, v)
                        v.close()
                    end
                )
            end
        end,
        function(y, z)
            z.close()
        end
    )
end
if Config.EnableShopBlip then
    Citizen.CreateThread(
        function()
            for l, m in pairs(Config.Coords) do
                for n = 1, #m.Shop, 1 do
                    local E = AddBlipForCoord(m.Shop[n])
                    SetBlipSprite(E, 78)
                    SetBlipDisplay(E, 4)
                    SetBlipScale(E, 0.6)
                    SetBlipColour(E, 2)
                    SetBlipAsShortRange(E, true)
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentSubstringPlayerName(Config.ShopBlipName)
                    EndTextCommandSetBlipName(E)
                end
            end
        end
    )
end
AddEventHandler(
    "onResourceStop",
    function(F)
        if F == GetCurrentResourceName() then
            for l, m in pairs(PoppySpawnedTable) do
                b.Game.DeleteObject(m)
            end
        end
    end
)
RegisterNetEvent("brp:heroinOU")
AddEventHandler(
    "brp:heroinOU",
    function()
        local i = PlayerPedId()
        exports[Config.FolderNameOfMythicProgbar]:Progress(
            {
                name = "unique_action_name",
                duration = 25000,
                label = Config.Translate[26],
                useWhileDead = false,
                canCancel = true,
                controlDisables = {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true
                }
            },
            function(G)
                if not G then
                end
            end
        )
        IH()
        Wait(50)
        SetTimecycleModifier("hud_def_blur")
        SetPedMotionBlur(i, true)
        RequestAnimSet("move_m@drunk@moderatedrunk")
        SetPedMovementClipset(PlayerPedId(), "move_m@drunk@moderatedrunk", 1.0)
        ShakeGameplayCam("DRUNK_SHAKE", 3.0)
        p = true
        while p do
            Citizen.Wait(0)
            local u = GetEntityCoords(GetPlayerPed(-1))
            local H = GetEntityCoords(GetPlayerPed(-1))
            local o = #(u - H)
            if o < 1 then
                SendNUIMessage({status = "play"})
                Citizen.Wait(40000)
                p = false
            end
        end
        Wait(100)
        SetTimecycleModifier("default")
        SetPedMotionBlur(i, false)
        StopGameplayCamShaking(true)
        ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 1.0)
        ResetPedMovementClipset(GetPlayerPed(-1))
        ResetPedWeaponMovementClipset(GetPlayerPed(-1))
        ResetPedStrafeClipset(GetPlayerPed(-1))
        SendNUIMessage({status = "stop"})
    end
)
IH = function()
    local i = PlayerPedId()
    FreezeEntityPosition(i, true)
    Wait(100)
    RequestAnimDict("rcmpaparazzo1ig_4")
    while not HasAnimDictLoaded("rcmpaparazzo1ig_4") do
        Citizen.Wait(150)
    end
    RequestModel("prop_syringe_01")
    while not HasModelLoaded("prop_syringe_01") do
        Citizen.Wait(150)
    end
    local I = CreateObject("prop_syringe_01", 0.0, 0.0, 0.0, true, true, false)
    local J = GetPedBoneIndex(i, 28422)
    SetCurrentPedWeapon(i, "weapon_unarmed", true)
    AttachEntityToEntity(I, i, J, 0, 0, 0, 0, 0, 0, false, false, false, false, 2, true)
    SetModelAsNoLongerNeeded("prop_syringe_01")
    local K = GetEntityCoords(GetPlayerPed(-1))
    local L = GetEntityHeading(GetPlayerPed(-1))
    TaskPlayAnimAdvanced(
        GetPlayerPed(-1),
        "rcmpaparazzo1ig_4",
        "miranda_shooting_up",
        K.x,
        K.y,
        K.z - 0.25,
        0,
        0,
        L,
        8.0,
        1.0,
        25000,
        50,
        0.0,
        0,
        0
    )
    FreezeEntityPosition(i, false)
    ResetPedMovementClipset(i, 0)
    Citizen.Wait(25000)
    ClearPedTasks(i)
    DeleteEntity(I)
end
