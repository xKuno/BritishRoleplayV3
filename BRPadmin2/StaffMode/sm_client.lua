local duty = false
ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

function cleanPlayer(playerPed)
    SetPedArmour(playerPed, 0)
    ClearPedBloodDamage(playerPed)
    ResetPedVisibleDamage(playerPed)
    ClearPedLastWeaponDamage(playerPed)
    ResetPedMovementClipset(playerPed, 0)
end

function setUniform(playerPed)
    local playerPed = PlayerPedId()
    
    TriggerEvent('skinchanger:getSkin', function(skin)
    ESX.TriggerServerCallback("Admin:getRankFromPlayer", function(group)
        if skin.sex == 0 then
            if group == "superadmin" then
                    TriggerEvent("skinchanger:loadClothes", skin, Config.Admin.superadmin.male)
                elseif group == "admin" then
                    TriggerEvent("skinchanger:loadClothes", skin, Config.Admin.admin.male)
                elseif group == "mod" then
                    TriggerEvent("skinchanger:loadClothes", skin, Config.Admin.mod.male)
                -- elseif group == "support" then
                --     TriggerEvent("skinchanger:loadClothes", skin, Config.Admin.support.male)					
                end
            else
                if group == "superadmin" then
                    TriggerEvent("skinchanger:loadClothes", skin, Config.Admin.superadmin.female)
                elseif group == "admin" then
                    TriggerEvent("skinchanger:loadClothes", skin, Config.Admin.admin.female)
                elseif group == "mod" then
                    TriggerEvent("skinchanger:loadClothes", skin, Config.Admin.mod.female)
                -- elseif group == "support" then
                --     TriggerEvent("skinchanger:loadClothes", skin, Config.Admin.support.female)					
                end
            end
        end)
    end)
end

RegisterNetEvent("toggleDuty")
AddEventHandler("toggleDuty", function()
    local playerPed = PlayerPedId()
    if duty then
        duty = false
        TriggerEvent("chatMessage", " ^1B^0R^4P ^0| ^1Staff Mode Deactived Use /staff to Reactivate.")
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
            TriggerEvent('skinchanger:loadSkin', skin)
        end)
        --SetEntityInvincible(GetPlayerPed(-1), false)
            --SetPlayerInvincible(PlayerId(), false)
            --SetPedCanRagdoll(GetPlayerPed(-1), true)
            --ClearPedLastWeaponDamage(GetPlayerPed(-1))
            --SetEntityProofs(GetPlayerPed(-1), false, false, false, false, false, false, false, false)
            --SetEntityOnlyDamagedByPlayer(GetPlayerPed(-1), true)
            --SetEntityCanBeDamaged(GetPlayerPed(-1), true)
    else
        duty = true
        TriggerEvent("chatMessage", " ^1B^0R^4P ^0| ^2Staff Mode Activated Use /staff to deactive.")
        setUniform()
        --SetEntityInvincible(GetPlayerPed(-1), true)
            --SetPlayerInvincible(PlayerId(), true)
            --SetPedCanRagdoll(GetPlayerPed(-1), false)
            --ClearPedBloodDamage(GetPlayerPed(-1))
            --ResetPedVisibleDamage(GetPlayerPed(-1))
            --ClearPedLastWeaponDamage(GetPlayerPed(-1))
            --SetEntityProofs(GetPlayerPed(-1), true, true, true, true, true, true, true, true)
            --SetEntityOnlyDamagedByPlayer(GetPlayerPed(-1), false)
            --SetEntityCanBeDamaged(GetPlayerPed(-1), false)
    end 
end)
