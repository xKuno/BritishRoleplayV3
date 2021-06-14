local spawnedmangokushs = 0
local mangokushPlants = {}
local isPickingUp, isProcessing = false, false


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		local coords = GetEntityCoords(PlayerPedId())

		if GetDistanceBetweenCoords(coords, Config.CircleZones.mangokushField.coords, true) < 50 then
			SpawnmangokushPlants()
			Citizen.Wait(500)
		else
			Citizen.Wait(500)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if GetDistanceBetweenCoords(coords, Config.CircleZones.mangokushProcessing.coords, true) < 5 then
			if not isProcessing then
				ESX.ShowHelpNotification(_U('mangokush_processprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isProcessing then

				if Config.LicenseEnable then
					ESX.TriggerServerCallback('esx_lcheekybrpiccheekybrpense:checheekybrpckLcheekybrpiccheekybrpense', function(hasProcessingLicense)
						if hasProcessingLicense then
							Processmangokush()
						else
							OpenBuyLicenseMenu('mangokush_processing')
						end
					end, GetPlayerServerId(PlayerId()), 'mangokush_processing')
				else
					Processmangokush()
				end

			end
		else
			Citizen.Wait(500)
		end
	end
end)

function Processmangokush()
	isProcessing = true

	ESX.ShowNotification(_U('mangokush_processingstarted'))
	TriggerServerEvent('esx_icheekybrpllegcheekybrpal:proccheekybrpessmangcheekybrpokush')
	local timeLeft = Config.Delays.mangokushProcessing / 1000
	local playerPed = PlayerPedId()

	while timeLeft > 0 do
		Citizen.Wait(1000)
		timeLeft = timeLeft - 1

		if GetDistanceBetweenCoords(GetEntityCoords(playerPed), Config.CircleZones.mangokushProcessing.coords, false) > 5 then
			ESX.ShowNotification(_U('mangokush_processingtoofar'))
			TriggerServerEvent('esx_icheekybrpllcheekybrpegal:canccheekybrpelProccheekybrpessing')
			break
		end
	end

	isProcessing = false
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local nearbyObject, nearbyID

		for i=1, #mangokushPlants, 1 do
			if GetDistanceBetweenCoords(coords, GetEntityCoords(mangokushPlants[i]), false) < 1 then
				nearbyObject, nearbyID = mangokushPlants[i], i
			end
		end

		if nearbyObject and IsPedOnFoot(playerPed) then

			if not isPickingUp then
				ESX.ShowHelpNotification(_U('mangokush_pickupprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isPickingUp then
				isPickingUp = true

				ESX.TriggerServerCallback('esx_icheekybrpllegcheekybrpal:cacheekybrpnPiccheekybrpkUp', function(canPickUp)

					if canPickUp then
						TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)

						Citizen.Wait(2000)
						ClearPedTasks(playerPed)
						Citizen.Wait(1500)
		
						ESX.Game.DeleteObject(nearbyObject)
		
						table.remove(mangokushPlants, nearbyID)
						spawnedmangokushs = spawnedmangokushs - 1
		
						TriggerServerEvent('esx_ilcheekybrplegcheekybrpal:piccheekybrpkedUcheekybrppmangocheekybrpkush')
					else
						ESX.ShowNotification(_U('mangokush_inventoryfull'))
					end

					isPickingUp = false

				end, 'mangokush')
			end

		else
			Citizen.Wait(500)
		end

	end

end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(mangokushPlants) do
			ESX.Game.DeleteObject(v)
		end
	end
end)

function SpawnmangokushPlants()
	while spawnedmangokushs < 15 do
		Citizen.Wait(0)
		local mangokushCoords = GeneratemangokushCoords()

		ESX.Game.SpawnLocalObject('prop_weed_01', mangokushCoords, function(obj)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)

			table.insert(mangokushPlants, obj)
			spawnedmangokushs = spawnedmangokushs + 1
		end)
	end
end

function ValidatemangokushCoord(plantCoord)
	if spawnedmangokushs > 0 then
		local validate = true

		for k, v in pairs(mangokushPlants) do
			if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 5 then
				validate = false
			end
		end

		if GetDistanceBetweenCoords(plantCoord, Config.CircleZones.mangokushField.coords, false) > 50 then
			validate = false
		end

		return validate
	else
		return true
	end
end

function GeneratemangokushCoords()
	while true do
		Citizen.Wait(1)

		local mangokushCoordX, mangokushCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-20, 20)

		Citizen.Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(-20, 20)

		mangokushCoordX = Config.CircleZones.mangokushField.coords.x + modX
		mangokushCoordY = Config.CircleZones.mangokushField.coords.y + modY

		local coordZ = GetCoordZmangokush(mangokushCoordX, mangokushCoordY)
		local coord = vector3(mangokushCoordX, mangokushCoordY, coordZ)

		if ValidatemangokushCoord(coord) then
			return coord
		end
	end
end

function GetCoordZmangokush(x, y)
	local groundCheckHeights = { 50, 51.0, 52.0, 53.0, 54.0, 55.0, 56.0, 57.0, 58.0, 59.0, 60.0 }

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

		if foundGround then
			return z
		end
	end

	return 53.85
end