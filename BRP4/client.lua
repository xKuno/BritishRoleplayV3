--[[ local prevtent = 0
RegisterCommand('tent', function(source, args, rawCommand)
    if prevtent ~= 0 then
        SetEntityAsMissionEntity(prevtent)
        DeleteObject(prevtent)
        prevtent = 0
    end
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.95))
    local tents = {
        'prop_skid_tent_01',
        'prop_skid_tent_01b',
        'prop_skid_tent_03'
    }
    local randomint = math.random(1,3)
    local tent = GetHashKey(tents[randomint])
    local prop = CreateObject(tent, x, y, z, true, false, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    prevtent = prop
end, false)


RegisterCommand('deltent', function(source, args, rawCommand)
    if prevtent == 0 then
        TriggerEvent('chatMessage', '', {255,255,255}, '^8Error: ^0no previous tent spawned, or your previous tent has already been deleted.')
    else
        SetEntityAsMissionEntity(prevtent)
        DeleteObject(prevtent)
        prevtent = 0
    end
end, false)


local prevchair = 0
RegisterCommand('chair', function(source, args, rawCommand)
    if prevchair ~= 0 then
        SetEntityAsMissionEntity(prevchair)
        DeleteObject(prevchair)
        prevchair = 0
    end
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.02))
    local chair = {
        'prop_chair_02',
        'prop_chair_05',
		'prop_chair_10'
    }
    local randomint = math.random(1,3)
    local chair = GetHashKey(chair[randomint])
    local prop = CreateObject(chair, x, y, z, true, false, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    prevchair = prop
end, false)

RegisterCommand('delchair', function(source, args, rawCommand)
    if prevchair == 0 then
        TriggerEvent('chatMessage', '', {255,255,255}, '^8Error: ^0no previous chair spawned, or your previous chair has already been deleted.')
    else
        SetEntityAsMissionEntity(prevchair)
        DeleteObject(prevchair)
        prevchair = 0
    end
end, false)

local prevfire = 0
RegisterCommand('campfire', function(source, args, rawCommand)
    if prevfire ~= 0 then
        SetEntityAsMissionEntity(prevfire)
        DeleteObject(prevfire)
        prevfire = 0
    end
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
    local prop = CreateObject(GetHashKey("prop_beach_fire"), x, y, z, true, false, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    prevfire = prop
end, false)

RegisterCommand('delcampfire', function(source, args, rawCommand)
    if prevfire == 0 then
        TriggerEvent('chatMessage', '', {255,255,255}, '^8Error: ^0no previous campfire spawned, or your previous campfire has already been deleted.')
    else
        SetEntityAsMissionEntity(prevfire)
        DeleteObject(prevfire)
        prevfire = 0
    end
end, false)

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/tent', 'Spawn a tent in front of you. If you already have a tent then this will override your old tent.')
    TriggerEvent('chat:addSuggestion', '/deltent', 'Deletes your tent.')
    TriggerEvent('chat:addSuggestion', '/chair', 'Spawn a chair in front of you. If you already have a chair then this will override your old chair.')
    TriggerEvent('chat:addSuggestion', '/delchair', 'Deletes your chair.')
    TriggerEvent('chat:addSuggestion', '/campfire', 'Spawn a campfire in front of you. If you already have a campfire then this will override your old campfire.')
    TriggerEvent('chat:addSuggestion', '/delcampfire', 'Deletes your campfire.')
end)
 ]]
-- carwash 
Key = 38 -- E

vehicleWashStation = {
	{26.5906,  -1392.0261,  27.3634},
	{167.1034,  -1719.4704,  27.2916},
	{-74.5693,  6427.8715,  29.4400},
	{-699.6325,  -932.7043,  17.0139},
	{1362.5385, 3592.1274, 33.9211}
}

Citizen.CreateThread(function ()
	Citizen.Wait(0)
	for i = 1, #vehicleWashStation do
		garageCoords = vehicleWashStation[i]
		stationBlip = AddBlipForCoord(garageCoords[1], garageCoords[2], garageCoords[3])
		SetBlipSprite(stationBlip, 100)
		SetBlipAsShortRange(stationBlip, true)
	end
    return
end)

local timer2 = false
local mycie = false

function es_better_carwash_DrawSubtitleTimed(m_text, showtime)
	SetTextEntry_2('STRING')
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end

function es_better_carwash_DrawNotification(m_text)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(m_text)
	DrawNotification(true, false)
end

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
		if IsPedSittingInAnyVehicle(PlayerPedId()) then 
			for i = 1, #vehicleWashStation do
				garageCoords2 = vehicleWashStation[i]
				DrawMarker(1, garageCoords2[1], garageCoords2[2], garageCoords2[3], 0, 0, 0, 0, 0, 0, 5.0, 5.0, 2.0, 0, 157, 0, 155, 0, 0, 2, 0, 0, 0, 0)
				if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), garageCoords2[1], garageCoords2[2], garageCoords2[3], true ) < 5 then
					if mycie == false then
					HelpPromt('Press ~INPUT_CONTEXT~ to ~b~clean ~s~vehicle for ~g~(£25)')
					if IsControlJustPressed(1, Key) then
						TriggerServerEvent('es_better_carwash:checkmoney')
					end
				else
					HelpPromt('Press ~INPUT_CONTEXT~ to ~o~stop')
					if IsControlJustPressed(1, Key) then
						mycie = false
						timer2 = false
						StopParticleFxLooped(particles, 0)
						StopParticleFxLooped(particles2, 0)
						FreezeEntityPosition(GetVehiclePedIsUsing(PlayerPedId()), false)
					end
				end
				end
			end
		end
	end
end)

RegisterNetEvent('es_better_carwash:success')
AddEventHandler('es_better_carwash:success', function (price)
	local car = GetVehiclePedIsUsing(PlayerPedId())
	local coords = GetEntityCoords(PlayerPedId())
	mycie = true
	FreezeEntityPosition(car, true)
	if not HasNamedPtfxAssetLoaded("core") then
		RequestNamedPtfxAsset("core")
		while not HasNamedPtfxAssetLoaded("core") do
			Wait(1)
		end
	end
	UseParticleFxAssetNextCall("core")
	particles  = StartParticleFxLoopedAtCoord("ent_amb_waterfall_splash_p", coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
	UseParticleFxAssetNextCall("core")
	particles2  = StartParticleFxLoopedAtCoord("ent_amb_waterfall_splash_p", coords.x + 2, coords.y, coords.z, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
	timer = 15
	timer2 = true
    Citizen.CreateThread(function()
		while timer2 do
            Citizen.Wait(0)
            Citizen.Wait(1000)
            if(timer > 0)then
				timer = timer - 1
			elseif (timer == 0) then
				mycie = false
				WashDecalsFromVehicle(car, 1.0)
				SetVehicleDirtLevel(car)
				FreezeEntityPosition(car, false)
				TriggerEvent("pNotify:SendNotification", {text = "Your vehicle has been cleaned! For £25", type = "warning", queue = "global", timeout = 5000, layout = "centerLeft"})
				StopParticleFxLooped(particles, 0)
				StopParticleFxLooped(particles2, 0)
				timer2 = false
			end
        end
    end)
	Citizen.CreateThread(function()
        while true do
			Citizen.Wait(0)
			if mycie == true then
				for i = 1, #vehicleWashStation do
				garageCoords3 = vehicleWashStation[i]
				if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), garageCoords3[1], garageCoords3[2], garageCoords3[3], true ) < 4 then
					DrawText3D(garageCoords3[1], garageCoords3[2], garageCoords3[3] + 3, '~b~Cleaning... ~s~Time:~b~ '.. timer ..' ~s~seconds.')
				end
				end
			end
		end
	end)
end)

RegisterNetEvent('es_better_carwash:notenoughmoney')
AddEventHandler('es_better_carwash:notenoughmoney', function (moneyleft)
	TriggerEvent("pNotify:SendNotification", {text = "You don't have enough money! You need:" .. moneyleft .."£ more.", type = "warning", queue = "global", timeout = 5000, layout = "centerLeft"}) 
end)

function DrawText3D(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x, y, z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
end

function HelpPromt(text)
	Citizen.CreateThread(function()
		SetTextComponentFormat("STRING")
		AddTextComponentString(text)
		DisplayHelpTextFromStringLabel(0, state, 0, -1)

	end)
end

-- Add weapons to the 'compatable_weapon_hashes' table below to make them show up on a player's back (can use GetHashKey(...) if you don't know the hash) --
local AR = {
    back_bone = 24816,
    --OLD
    -- x = 0.15,
    -- y = 0.21,
    -- z = 0.035,
    -- x_rotation = 0.0,
    -- y_rotation = 150.0,
    -- z_rotation = 0.0,
    --NEW
    x = 0.05,
    y = 0.25,
    z = 0.00,
    x_rotation = 0.0,
    y_rotation = 170.0,
    z_rotation = 0.0,
    compatable_weapon_hashes = {
      ["w_ar_g36c"] = GetHashKey("WEAPON_G36BRP"),
      ["w_ar_m4a1brp"] = GetHashKey("WEAPON_M4A1BRP")
    }
}

local Sniper = {
  back_bone = 24818,
  x = -0.12,
  y = -0.14,
  z = -0.13,
  x_rotation = 100.0,
  y_rotation = -3.0,
  z_rotation = 5.0,
    compatable_weapon_hashes = {
      ["w_sr_re6brp"] = GetHashKey("WEAPON_RE6BRP"),
      ["w_sr_msr"] = GetHashKey("WEAPON_MSR"),
      ["w_ar_mosin"] = GetHashKey("WEAPON_MOSINBRP"),
      ["w_sg_winchester12"] = GetHashKey("WEAPON_WINCHESTER12BRP"),
      ["w_ar_sigmpx"] = GetHashKey("WEAPON_SIGMPX")
    }
}

local AR2 = {
  back_bone = 24818,
  x = -0.12,
  y =  -0.12,
  z = -0.13,
  x_rotation = 100.0,
  y_rotation = -3.0,
  z_rotation = 5.0,
    compatable_weapon_hashes = {
      ["w_ar_akm"] = GetHashKey("WEAPON_AKMBRP")
    }
}

local attached_weapons = {}

Citizen.CreateThread(function()
  while true do
      local me = GetPlayerPed(-1)
      ---------------------------------------
      -- attach if player has large weapon --
      ---------------------------------------
      for wep_name, wep_hash in pairs(AR.compatable_weapon_hashes) do
          if HasPedGotWeapon(me, wep_hash, false) then
              if not attached_weapons[wep_name] then
                  AttachWeapon(wep_name, wep_hash, AR.back_bone, AR.x, AR.y, AR.z, AR.x_rotation, AR.y_rotation, AR.z_rotation)
              end
          end
      end
      ---------------------------------------
      -- Sniper -----------------------------
      ---------------------------------------
      for wep_name, wep_hash in pairs(Sniper.compatable_weapon_hashes) do
        if HasPedGotWeapon(me, wep_hash, false) then
            if not attached_weapons[wep_name] then
                AttachWeapon(wep_name, wep_hash, Sniper.back_bone, Sniper.x, Sniper.y, Sniper.z, Sniper.x_rotation, Sniper.y_rotation, Sniper.z_rotation)
            end
        end
    end
      ---------------------------------------
      -- AR2 --------------------------------
      ---------------------------------------
    for wep_name, wep_hash in pairs(AR2.compatable_weapon_hashes) do
      if HasPedGotWeapon(me, wep_hash, false) then
          if not attached_weapons[wep_name] then
              AttachWeapon(wep_name, wep_hash, AR2.back_bone, AR2.x, AR2.y, AR2.z, AR2.x_rotation, AR2.y_rotation, AR2.z_rotation)
          end
      end
  end
      --------------------------------------------
      -- remove from back if equipped / dropped --
      --------------------------------------------
      for name, attached_object in pairs(attached_weapons) do
          -- equipped? delete it from back:
          if GetSelectedPedWeapon(me) ==  attached_object.hash or not HasPedGotWeapon(me, attached_object.hash, false) then -- equipped or not in weapon wheel
            DeleteObject(attached_object.handle)
            attached_weapons[name] = nil
          end
      end
  Wait(200)
  end
end)

function AttachWeapon(attachModel,modelHash,boneNumber,x,y,z,xR,yR,zR)
	local bone = GetPedBoneIndex(GetPlayerPed(-1), boneNumber)
	RequestModel(attachModel)
	while not HasModelLoaded(attachModel) do
		Wait(3000)
	end

  attached_weapons[attachModel] = {
    hash = modelHash,
    handle = CreateObject(GetHashKey(attachModel), 1.0, 1.0, 1.0, true, true, false)
  }

	AttachEntityToEntity(attached_weapons[attachModel].handle, GetPlayerPed(-1), bone, x, y, z, xR, yR, zR, 1, 1, 0, 0, 2, 1)
end