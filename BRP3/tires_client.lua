ESX = nil

local propModel = nil
local propSpawned = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('Tire:Use')
AddEventHandler('Tire:Use', function()
	local ad = "anim@heists@box_carry@"
	loadAnimDict( ad )
	TaskPlayAnim( PlayerPedId(), ad, "idle", 3.0, -8, -1, 63, 0, 0, 0, 0 )

	local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
	propModel = 'prop_wheel_tyre'
	propSpawned = CreateObject(GetHashKey(propModel), x, y, z + 0.2, true, true, true)
	AttachEntityToEntity(propSpawned, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), 0.10, 0.26, 0.32, 90.0, 110.0, 0.0, true, true, false, true, 1, true)
	Citizen.Wait(10000)
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if propSpawned then
			if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
				local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
				Draw3DText(x, y, z, "~r~[G] ~w~cancel")
				local vehicle = ESX.Game.GetClosestVehicle()
				if vehicle ~= nil then
					local tire = GetClosestVehicleTire(vehicle)
					if tire ~= nil then
						Draw3DText(tire.bonePos.x, tire.bonePos.y, tire.bonePos.z, "~g~[E] ~w~Use")

						if IsControlJustPressed(1, 38) then
							ClearPedSecondaryTask(PlayerPedId())
							TaskStartScenarioInPlace(PlayerPedId(), 'world_human_gardener_plant', 0, false)
							FreezeEntityPosition(PlayerPedId(), true)
							--exports['progressBars']:startUI(100, "Tu attaches le Tire")
							Citizen.Wait(100)
							SetVehicleTyreFixed(vehicle, tire.tireIndex, 0, 1)
							TriggerServerEvent('Tire:Used')
							deleteProp()
						end
					end
				end
				
				if IsControlJustPressed(1, 47) then
					deleteProp()
				end
			end
		end
	end
end)

RegisterCommand('tirefix', function()
	deleteProp()
end)

function deleteProp()
	DetachEntity(propSpawned, 1, 1)
	DeleteObject(propSpawned)
	ClearPedSecondaryTask(PlayerPedId())
	ClearPedTasks(PlayerPedId())
	FreezeEntityPosition(PlayerPedId(), false)
	propSpawned = nil
end

function GetClosestVehicleTire(vehicle)
	local tireBones = {"wheel_lf", "wheel_rf", "wheel_lm1", "wheel_rm1", "wheel_lm2", "wheel_rm2", "wheel_lm3", "wheel_rm3", "wheel_lr", "wheel_rr"}
	local tireIndex = {
		["wheel_lf"] = 0,
		["wheel_rf"] = 1,
		["wheel_lm1"] = 2,
		["wheel_rm1"] = 3,
		["wheel_lm2"] = 45,
		["wheel_rm2"] = 47,
		["wheel_lm3"] = 46,
		["wheel_rm3"] = 48,
		["wheel_lr"] = 4,
		["wheel_rr"] = 5,
	}
	local player = PlayerId()
	local plyPed = GetPlayerPed(player)
	local plyPos = GetEntityCoords(plyPed, false)
	local minDistance = 1.0
	local closestTire = nil
	
	for a = 1, #tireBones do
		local bonePos = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, tireBones[a]))
		local distance = Vdist(plyPos.x, plyPos.y, plyPos.z, bonePos.x, bonePos.y, bonePos.z)

		if closestTire == nil then
			if distance <= minDistance then
				closestTire = {bone = tireBones[a], boneDist = distance, bonePos = bonePos, tireIndex = tireIndex[tireBones[a]]}
			end
		else
			if distance < closestTire.boneDist then
				closestTire = {bone = tireBones[a], boneDist = distance, bonePos = bonePos, tireIndex = tireIndex[tireBones[a]]}
			end
		end
	end

	return closestTire
end

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(50)
	end
end

function Draw3DText(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.0*scale, 0.75*scale)
        SetTextFont(4)
        SetTextProportional(1)
        -- SetTextScale(0.0, 0.55)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end