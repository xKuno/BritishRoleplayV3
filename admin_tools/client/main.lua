-- Admin Menu Config
-- Author: Notix#0001
-- Version 1.0.2
--
-- This script is IP Protected, you are not allowed to distribute it.
--

Framework = nil
local nevidljivost, zaledjen, noclip, brzinaX, heading = false, {}, false, 0.5, 0
local states = {frozen = false, frozenPos = nil}

Citizen.CreateThread(function()
	while not Framework do
		TriggerEvent(CFG.Strings['esx_object_event'], function(object) Framework = object end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if IsControlJustReleased(0, CFG.Main.toggle_menu_keybind) then
		    Framework.TriggerServerCallback("admin_tools:getPlayers", function(data)
		    	if data.players then otvoriMeni(data) else Framework.ShowNotification(CFG.Strings['no_permission']) end
		    end)
		end
	end
end)

Citizen.CreateThread(function()
  	while true do
   	 	Citizen.Wait(0)
	    if noclip then
	    	local playerPed = PlayerPedId()

	      	SetEntityCoordsNoOffset(playerPed, noclip_pos.x, noclip_pos.y, noclip_pos.z, 0, 0, 0)

	      	if IsControlPressed(1, 34)then
	        	heading = heading + 2.25
	        	if heading > 360 then heading = 0 end
	        	SetEntityHeading(playerPed,  heading)
	      	end

	      	if IsControlPressed(1, 9) then
	        	heading = heading - 2.25
	        	if heading < 0 then heading = 360 end
	        	SetEntityHeading(playerPed,  heading)
	      	end

	      	if IsControlPressed(1, 8) then
	        	noclip_pos = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, brzinaX, 0.0)
	      	end

	      	if IsControlPressed(1, 32) then
	        	noclip_pos = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, -brzinaX, 0.0)
	     	end

	      	if IsControlPressed(1, 27) then
	        	noclip_pos = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 0.0, 0.75)
	      	end

	      	if IsControlPressed(1, 173) then
	        	noclip_pos = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 0.0, -0.75)
	      	end

	    else
	      	Citizen.Wait(1000)
	    end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if states.frozen then
			ClearPedTasks(PlayerPedId())
			SetEntityCoords(PlayerPedId(), states.frozenPos)
		else
			Citizen.Wait(500)
		end
	end
end)


otvoriMeni = function(serverData)
	SetNuiFocus(true, true)
	SendNUIMessage(serverData)
end

zalediIgraca = function(id, ime)
	local igrac = tonumber(id)
    local state = CFG.Strings['freeze_state_on']
    if zaledjen[igrac] then state = CFG.Strings['freeze_state_off'] end
    TriggerEvent('chat:addMessage', {args = {string.format(CFG.Strings['prefix'] .. CFG.Strings['freeze_message'], ime, state)}})
  	zaledjen[igrac] = not zaledjen[igrac]
    TriggerServerEvent('admin_tools:posaljiZaled', igrac, zaledjen[igrac])
end

--[[ toggleInvisibility = function()
	local playerPed = PlayerPedId()
	SetEntityVisible(playerPed, nevidljivost)
    if nevidljivost then Framework.ShowNotification(CFG.Strings['invisiblity_off']) else Framework.ShowNotification(CFG.Strings['invisiblity_on']) end
    nevidljivost = not nevidljivost
end ]]

teleportToMarker = function()
	local WaypointHandle = GetFirstBlipInfoId(8)

    if DoesBlipExist(WaypointHandle) then
        local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)

        for height = 1, 1000 do
            SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

            local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)

            if foundGround then
                SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)
                break
            end
            Citizen.Wait(5)
        end

        Framework.ShowNotification(CFG.Strings['marker_teleported'])
    else
        Framework.ShowNotification(CFG.Strings['marker_not_found'])
    end
end

noclipToggle = function()
  	local state = CFG.Strings['noclip_off']
  	if not noclip then
    	noclip_pos = GetEntityCoords(PlayerPedId(), false)
    	state = CFG.Strings['noclip_on'] 		
 	end
  	noclip = not noclip
  	TriggerEvent('chat:addMessage', {args = {string.format(CFG.Strings['prefix'] .. CFG.Strings['noclip_message'], state)}})
end

RegisterNUICallback('zatvoriMeni', function()
    SetNuiFocus(false, false)
end)

RegisterNUICallback('user_management', function(data)
	TriggerServerEvent('admin_tools:manageUser', data)
end)

RegisterNUICallback('noClip', function(data)
	brzinaX = data.brzina
    noclipToggle()
end)

RegisterNUICallback('noclip_onSpeedChange', function(data)
    brzinaX = data.brzina
end)

--[[ RegisterNUICallback('nevidljivost', function()
	toggleInvisibility()
end) ]]

RegisterNUICallback('marker', function()
    teleportToMarker()
end)

RegisterNUICallback('zaledi', function(data)
    zalediIgraca(data.id, data.ime)
end)

RegisterNUICallback('idi', function(data)
    TriggerServerEvent('admin_tools:gotoMeni', data.id)
end)

RegisterNUICallback('donesi', function(data)
    TriggerServerEvent('admin_tools:bringMeni', data.id)
end)

 RegisterNUICallback('ban', function(data)
	print(json.encode(data))
	TriggerServerEvent('admin_tools:banMeni', data.id, data.vreme, data.razlog)
end) 

RegisterNUICallback('kick', function(data)
	TriggerServerEvent('admin_tools:kickMeni', data.id, data.razlog)
end)

RegisterNUICallback('revive', function(data)
	TriggerServerEvent('admin_tools:revive', data.id)
end)

RegisterNetEvent('admin_tools:zalediIgraca')
AddEventHandler("admin_tools:zalediIgraca", function(state)
  	local player = PlayerId()
  	local ped = PlayerPedId()

  	states.frozen = state
  	states.frozenPos = GetEntityCoords(ped, false)

  	if not state then
	   	if not IsEntityVisible(ped) then
	      	SetEntityVisible(ped, true)
	    end

	    if not IsPedInAnyVehicle(ped) then
	      SetEntityCollision(ped, true)
	    end

	    FreezeEntityPosition(ped, false)
	    SetPlayerInvincible(player, false)
  	else
	    SetEntityCollision(ped, false)
	    FreezeEntityPosition(ped, true)
	    SetPlayerInvincible(player, true)

    	if not IsPedFatallyInjured(ped) then
    		ClearPedTasks(ped)
    	end
  	end
end)

RegisterNetEvent('admin_tools:setCoords')
AddEventHandler('admin_tools:setCoords', function(x, y, z)
  	SetEntityCoords(PlayerPedId(), x, y, z)
end)

-- Taken from ambulancejob
function RespawnPed(ped, coords, heading)
	SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, true)
	NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
	SetPlayerInvincible(ped, false)
	ClearPedBloodDamage(ped)

	TriggerServerEvent('esx:onPlayerSpawn')
	TriggerEvent('esx:onPlayerSpawn')
	TriggerEvent('playerSpawned')
end

RegisterNetEvent('admin_tools:revive')
AddEventHandler('admin_tools:revive', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	TriggerServerEvent(CFG.Strings['ambulance_job_event'], false)
	DoScreenFadeOut(800)
	while not IsScreenFadedOut() do
		Citizen.Wait(50)
	end
	RespawnPed(playerPed, {x = Framework.Math.Round(coords.x, 1), y = Framework.Math.Round(coords.y, 1), z = Framework.Math.Round(coords.z, 1)}, 0.0)
	StopScreenEffect('DeathFailOut')
	DoScreenFadeIn(800)
end)