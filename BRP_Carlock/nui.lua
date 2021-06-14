local display = false

RegisterCommand("nui2", function(source, args)
    SetDisplay(not display)
end)

RegisterNUICallback("exit", function(data)
    SetDisplay(false)
end)

RegisterNUICallback("main", function(data)
    TriggerEvent("brp_carlock")
    SetDisplay(false)
end)

RegisterNUICallback("main2", function(data)
    TriggerEvent("brp_carlockClosed")
    SetDisplay(false)
end)

RegisterNUICallback("main3", function(data)
    TriggerEvent("KofferraumState")
    SetDisplay(false)
end)

RegisterNUICallback("main4", function(data)
    TriggerEvent("CarOnOff")
    SetDisplay(false)
end)

RegisterNetEvent("CarOnOff")
AddEventHandler("CarOnOff", function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
        SetVehicleEngineOn(vehicle, (not GetIsVehicleEngineRunning(vehicle)), false, true)
    end
end)

interactionDistance = 6.5 

RegisterNetEvent("KofferraumState")
AddEventHandler("KofferraumState", function()
	local player = GetPlayerPed(-1)
			if controlsave_bool == true then
				vehicle = saveVehicle
			else
				vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
			end
			
			local isopen = GetVehicleDoorAngleRatio(vehicle,5)
			local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
			
			if distanceToVeh <= interactionDistance then
				if (isopen == 0) then
				SetVehicleDoorOpen(vehicle,5,0,0)
				else
				SetVehicleDoorShut(vehicle,5,0)
				end
			else
				
			end
end)

RegisterNUICallback("error", function(data)
    SetDisplay(false)
end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({type = "ui",status = bool,})
end

Citizen.CreateThread(function()
    while display do
        Citizen.Wait(0)
        DisableControlAction(0, 1, display) -- LookLeftRight
        DisableControlAction(0, 2, display) -- LookUpDown
        DisableControlAction(0, 142, display) -- MeleeAttackAlternate
        DisableControlAction(0, 18, display) -- Enter
        DisableControlAction(0, 322, display) -- ESC
        DisableControlAction(0, 106, display) -- VehicleMouseControlOverride
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustReleased(1, Config.OpenCarKey) then
            SetDisplay(not display)
        end
    end
end)

------------------------ FUNCTION -------------------------

ESX                           = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

end)

RegisterNetEvent("brp_carlock")
AddEventHandler("brp_carlock", function()
    local dict = "anim@mp_player_intmenu@key_fob@"
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(0)
    end
      --if (IsControlJustPressed(1, 303)) then
          local coords = GetEntityCoords(GetPlayerPed(-1))
          local hasAlreadyLocked = false
          cars = ESX.Game.GetVehiclesInArea(coords, 10)
          local carstrie = {}
          local cars_dist = {}		
          notowned = 0
          if #cars == 0 then
              TriggerEvent("esx:showNotification", Config.NoVehicleNearby)
          else
              for j=1, #cars, 1 do
                  local coordscar = GetEntityCoords(cars[j])
                  local distance = Vdist(coordscar.x, coordscar.y, coordscar.z, coords.x, coords.y, coords.z)
                  table.insert(cars_dist, {cars[j], distance})
              end
              for k=1, #cars_dist, 1 do
                  local z = -1
                  local distance, car = 999
                  for l=1, #cars_dist, 1 do
                      if cars_dist[l][2] < distance then
                          distance = cars_dist[l][2]
                          car = cars_dist[l][1]
                          z = l
                      end
                  end
                  if z ~= -1 then
                      table.remove(cars_dist, z)
                      table.insert(carstrie, car)
                  end
              end
              for i=1, #carstrie, 1 do
                  local plate = ESX.Math.Trim(GetVehicleNumberPlateText(carstrie[i]))
                  ESX.TriggerServerCallback('carlock:isVehicleOwner', function(owner)
                      if owner and hasAlreadyLocked ~= true then
                          local vehicleLabel = GetDisplayNameFromVehicleModel(GetEntityModel(carstrie[i]))
                          vehicleLabel = GetLabelText(vehicleLabel)
                          local lock = GetVehicleDoorLockStatus(carstrie[i])
                          if lock == 2 then
                              SetVehicleDoorsLocked(carstrie[i], 1)
                              PlayVehicleDoorOpenSound(carstrie[i], 0)
                
                              TriggerEvent("esx:showNotification", Config.VehicleOpenMessage)
                              if not IsPedInAnyVehicle(PlayerPedId(), true) then
                                  TaskPlayAnim(PlayerPedId(), dict, "fob_click_fp", 8.0, 8.0, -1, 48, 1, false, false, false)
                              end
                              SetVehicleLights(carstrie[i], 2)
                              Citizen.Wait(150)
                              SetVehicleLights(carstrie[i], 0)
                              Citizen.Wait(150)
                              SetVehicleLights(carstrie[i], 2)
                              Citizen.Wait(150)
                              SetVehicleLights(carstrie[i], 0)
                              hasAlreadyLocked = true
                          end
                      else
                          notowned = notowned + 1
                      end
                      if notowned == #carstrie then
                        TriggerEvent("esx:showNotification", Config.VehicleDontOwnedByYou)
                      end	
                  end, plate)
              end			
      --end
    end
end)

RegisterNetEvent("brp_carlockClosed")
AddEventHandler("brp_carlockClosed", function()
    local dict = "anim@mp_player_intmenu@key_fob@"
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(0)
    end
      --if (IsControlJustPressed(1, 303)) then
          local coords = GetEntityCoords(GetPlayerPed(-1))
          local hasAlreadyLocked = false
          cars = ESX.Game.GetVehiclesInArea(coords, 10)
          local carstrie = {}
          local cars_dist = {}		
          notowned = 0
          if #cars == 0 then
            TriggerEvent("esx:showNotification", Config.NoVehicleNearby)
          else
              for j=1, #cars, 1 do
                  local coordscar = GetEntityCoords(cars[j])
                  local distance = Vdist(coordscar.x, coordscar.y, coordscar.z, coords.x, coords.y, coords.z)
                  table.insert(cars_dist, {cars[j], distance})
              end
              for k=1, #cars_dist, 1 do
                  local z = -1
                  local distance, car = 999
                  for l=1, #cars_dist, 1 do
                      if cars_dist[l][2] < distance then
                          distance = cars_dist[l][2]
                          car = cars_dist[l][1]
                          z = l
                      end
                  end
                  if z ~= -1 then
                      table.remove(cars_dist, z)
                      table.insert(carstrie, car)
                  end
              end
              for i=1, #carstrie, 1 do
                  local plate = ESX.Math.Trim(GetVehicleNumberPlateText(carstrie[i]))
                  ESX.TriggerServerCallback('carlock:isVehicleOwner', function(owner)
                      if owner and hasAlreadyLocked ~= true then
                          local vehicleLabel = GetDisplayNameFromVehicleModel(GetEntityModel(carstrie[i]))
                          vehicleLabel = GetLabelText(vehicleLabel)
                          local lock = GetVehicleDoorLockStatus(carstrie[i])
                          if lock == 1 or lock == 0 then
                              SetVehicleDoorShut(carstrie[i], 0, false)
                              SetVehicleDoorShut(carstrie[i], 1, false)
                              SetVehicleDoorShut(carstrie[i], 2, false)
                              SetVehicleDoorShut(carstrie[i], 3, false)
                              SetVehicleDoorsLocked(carstrie[i], 2)
                              PlayVehicleDoorCloseSound(carstrie[i], 1)
                
                              TriggerEvent("esx:showNotification", Config.VehicleClosedMessage)
                              if not IsPedInAnyVehicle(PlayerPedId(), true) then
                                  TaskPlayAnim(PlayerPedId(), dict, "fob_click_fp", 8.0, 8.0, -1, 48, 1, false, false, false)
                              end
                              SetVehicleLights(carstrie[i], 2)
                              Citizen.Wait(150)
                              SetVehicleLights(carstrie[i], 0)
                              Citizen.Wait(150)
                              SetVehicleLights(carstrie[i], 2)
                              Citizen.Wait(150)
                              SetVehicleLights(carstrie[i], 0)
                              hasAlreadyLocked = true
                            end
                      else
                          notowned = notowned + 1
                      end
                      if notowned == #carstrie then
                          TriggerEvent("esx:showNotification", Config.ThisIsNotYourVehicle)
                      end	
                  end, plate)
              end			
      --end
    end
end)
