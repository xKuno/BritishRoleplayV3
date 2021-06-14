local spawnedhazes = 0
local hazePlants = {}
local isPickingUp, isProcessing = false, false


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		local coords = GetEntityCoords(PlayerPedId())

		if GetDistanceBetweenCoords(coords, Config.CircleZones.hazeField.coords, true) < 50 then
			SpawnhazePlants()
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

		if GetDistanceBetweenCoords(coords, Config.CircleZones.hazeProcessing.coords, true) < 5 then
			if not isProcessing then
				ESX.ShowHelpNotification(_U('haze_processprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isProcessing then

				if Config.LicenseEnable then
					ESX.TriggerServerCallback('esx_lcheekybrpiccheekybrpense:checheekybrpckLcheekybrpiccheekybrpense', function(hasProcessingLicense)
						if hasProcessingLicense then
							Processhaze()
						else
							OpenBuyLicenseMenu('haze_processing')
						end
					end, GetPlayerServerId(PlayerId()), 'haze_processing')
				else
					Processhaze()
				end

			end
		else
			Citizen.Wait(500)
		end
	end
end)

function Processhaze()
	isProcessing = true

	ESX.ShowNotification(_U('haze_processingstarted'))
	TriggerServerEvent('esx_ilcheekybrplegcheekybrpal:proccheekybrpesshcheekybrpaze')
	local timeLeft = Config.Delays.hazeProcessing / 1000
	local playerPed = PlayerPedId()

	while timeLeft > 0 do
		Citizen.Wait(1000)
		timeLeft = timeLeft - 1

		if GetDistanceBetweenCoords(GetEntityCoords(playerPed), Config.CircleZones.hazeProcessing.coords, false) > 5 then
			ESX.ShowNotification(_U('haze_processingtoofar'))
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

		for i=1, #hazePlants, 1 do
			if GetDistanceBetweenCoords(coords, GetEntityCoords(hazePlants[i]), false) < 1 then
				nearbyObject, nearbyID = hazePlants[i], i
			end
		end

		if nearbyObject and IsPedOnFoot(playerPed) then

			if not isPickingUp then
				ESX.ShowHelpNotification(_U('haze_pickupprompt'))
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
		
						table.remove(hazePlants, nearbyID)
						spawnedhazes = spawnedhazes - 1
		
						TriggerServerEvent('esx_illcheekybrpegal:piccheekybrpkedUphcheekybrpaze')
					else
						ESX.ShowNotification(_U('haze_inventoryfull'))
					end

					isPickingUp = false

				end, 'haze')
			end

		else
			Citizen.Wait(500)
		end

	end

end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(hazePlants) do
			ESX.Game.DeleteObject(v)
		end
	end
end)

function SpawnhazePlants()
	while spawnedhazes < 15 do
		Citizen.Wait(0)
		local hazeCoords = GeneratehazeCoords()

		ESX.Game.SpawnLocalObject('prop_weed_01', hazeCoords, function(obj)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)

			table.insert(hazePlants, obj)
			spawnedhazes = spawnedhazes + 1
		end)
	end
end

function ValidatehazeCoord(plantCoord)
	if spawnedhazes > 0 then
		local validate = true

		for k, v in pairs(hazePlants) do
			if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 5 then
				validate = false
			end
		end

		if GetDistanceBetweenCoords(plantCoord, Config.CircleZones.hazeField.coords, false) > 50 then
			validate = false
		end

		return validate
	else
		return true
	end
end

function GeneratehazeCoords()
	while true do
		Citizen.Wait(1)

		local hazeCoordX, hazeCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-20, 20)

		Citizen.Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(-20, 20)

		hazeCoordX = Config.CircleZones.hazeField.coords.x + modX
		hazeCoordY = Config.CircleZones.hazeField.coords.y + modY

		local coordZ = GetCoordZhaze(hazeCoordX, hazeCoordY)
		local coord = vector3(hazeCoordX, hazeCoordY, coordZ)

		if ValidatehazeCoord(coord) then
			return coord
		end
	end
end

function GetCoordZhaze(x, y)
	local groundCheckHeights = { 50, 51.0, 52.0, 53.0, 54.0, 55.0, 56.0, 57.0, 58.0, 59.0, 60.0 }

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

		if foundGround then
			return z
		end
	end

	return 53.85
end