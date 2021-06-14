local open = false
local ESX  = nil
 
-- ESX
-- Added this so you can include the rest of the Usage-stuff found on the GitHub page
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)
 
-- Open ID card
RegisterNetEvent('brp_idcard:open')
AddEventHandler('brp_idcard:open', function( data, type )
    open = true
    SendNUIMessage({
        action = "open",
        array  = data,
        type   = type
    })
end)

-- Key events
Citizen.CreateThread(function()
    while true do
        Wait(0)
        -- Controls found in the FiveM docs:
        -- https://docs.fivem.net/game-references/controls/
 
        -- 38 = E
        if IsControlJustReleased(0, 82) then
 
            TriggerServerEvent('brp_idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
        end
        if IsControlJustReleased(0, 177) then
            SendNUIMessage({
                action = "close"
            })
            open = false
        end
    end
end)
 