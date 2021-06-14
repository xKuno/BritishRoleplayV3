ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

local MenuIsShowed = false
local hasAlreadyEnteredMarker = false
local lastZone = nil
local isInMarker = false
local maxexhaustion = 10
local exhaustion = 0
local stopcvicenie = false
local cvicenie = false

local stats = {}
stats.stamina = 10
stats.stamina_xp = 0
stats.stamina_lvl = 1
stats.lung_capacity = 10
stats.lung_capacity_xp = 0
stats.lung_capacity_lvl = 1
stats.strength = 10
stats.strength_xp = 0
stats.strength_lvl = 1
stats.maxexhaustion = 10

function drawstat(string, order)
  SetTextFont(4)
  SetTextProportional(1)
  SetTextScale(0.5, 0.5)
  SetTextColour(255,255,255,255)
  SetTextDropShadow(0, 0, 0, 0, 255)
  SetTextEdge(1, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextEntry("STRING")
  if param4 then
	AddTextComponentString(string)
  else
	AddTextComponentString(string)
  end
  DrawText(Config.x, Config.y - order * 0.025)
end
local showxp = false
Citizen.CreateThread(function()
	while true do
		if stats.stamina_xp==nil or stats.lung_capacity_xp==nil or stats.strength_xp==nil then end
		if stats.stamina==nil or stats.strength==nil then end
		local pped = GetPlayerPed(-1)
		local staminaxpup = stats.stamina_lvl*1000
		local lung_capacityxpup = stats.lung_capacity_lvl*1000
		local strengthxpup = stats.strength_lvl*1000
		if stats.stamina~=nil or stats.strength~=nil then maxexhaustion = stats.stamina + stats.strength end
		Citizen.Wait(1)
		if IsPedRunning(pped) or IsPedSprinting(pped) then
			stats.stamina_xp = stats.stamina_xp + 0.1
			stats.lung_capacity_xp = stats.lung_capacity_xp + 0.0001
		elseif IsPedWalking(pped) then
			stats.stamina_xp = stats.stamina_xp + 0.0075
		elseif IsPedSwimmingUnderWater(pped) then
			stats.lung_capacity_xp = stats.lung_capacity_xp + 0.1
		end
		
		if stats.stamina_xp > 0 and IsPedStill(pped) then stats.stamina_xp = stats.stamina_xp - 0.005 end
		if stats.stamina_xp < 0 and IsPedStill(pped) and stats.stamina_lvl ~= 1 then
			stats.stamina_xp = staminaxpup - 1100
			stats.stamina_lvl = stats.stamina_lvl - 1
			stats.stamina = stats.stamina_lvl * 2
			setstat("STAMINA", stats.stamina)
			TriggerEvent('chatMessage', "Stats", {0, 200, 255}, _L("lvldown", _L("stamina", ""), stats.stamina_lvl))
		end
		if stats.stamina_xp >= staminaxpup and stats.stamina_lvl<10 then
			stats.stamina_xp = stats.stamina_xp - staminaxpup
			stats.stamina_lvl = stats.stamina_lvl + 1
			stats.stamina = stats.stamina_lvl * 2
			setstat("STAMINA", stats.stamina)
			TriggerEvent('chatMessage', "Stats", {0, 200, 255}, _L("lvlup", _L("stamina", ""), stats.stamina_lvl))
		end
		if stats.lung_capacity_xp >= lung_capacityxpup and stats.lung_capacity_lvl<10 then
			stats.lung_capacity_xp = stats.lung_capacity_xp - lung_capacityxpup
			stats.lung_capacity_lvl = stats.lung_capacity_lvl + 1
			lungcapacity = stats.lung_capacity_lvl * 2
			setstat("LUNG_CAPACITY", stats.lung_capacity)
			TriggerEvent('chatMessage', "Stats", {0, 200, 255}, _L("lvlup", _L("lung_capacity", ""), stats.lung_capacity_lvl))
		end
		if stats.strength_xp >= strengthxpup and stats.strength_lvl<10 then
			stats.strength_xp = stats.strength_xp - strengthxpup
			stats.strength_lvl = stats.strength_lvl + 1
			stats.strength = stats.strength_lvl * 2
			setstat("STRENGTH", stats.strength)
			TriggerEvent('chatMessage', "Stats", {0, 200, 255}, _L("lvlup", _L("strength", ""), stats.strength_lvl))
		end
		
		if showxp then
			drawstat("Stamina XP: "..string.format("%.2f",stats.stamina_xp).."/"..staminaxpup, 1)
			drawstat("Lung Capacity XP: "..string.format("%.2f",stats.lung_capacity_xp).."/"..lung_capacityxpup, 2)
			drawstat("Strength XP: "..string.format("%.2f",stats.strength_xp).."/"..strengthxpup, 3)
		end
	end
end)

RegisterNetEvent("stats:playerLoaded")
AddEventHandler("stats:playerLoaded", function(newstats)
	TriggerEvent("stats:set", "stamina", "", newstats.stamina)
	TriggerEvent("stats:set", "lung_capacity", "", newstats.lung_capacity)
	TriggerEvent("stats:set", "strength", "", newstats.strength)
	stats.stamina_xp = newstats.stamina_xp
	stats.lung_capacity_xp = newstats.lung_capacity_xp
	stats.strength_xp = newstats.strength_xp
	stats.stamina_lvl = newstats.stamina_lvl
	stats.lung_capacity_lvl = newstats.lung_capacity_lvl
	stats.strength_lvl = newstats.strength_lvl
	maxexhaustion = stats.stamina_lvl*4 + stats.strength_lvl*4
end)

function setstat(name,val)
	Citizen.CreateThread(function()
	    StatSetInt(GetHashKey('MP0_'..name), val)
		StatSetInt(GetHashKey('MP1_'..name), val)
		StatSetInt(GetHashKey('MP2_'..name), val)
		StatSetInt(GetHashKey('MP3_'..name), val)
		StatSetInt(GetHashKey('MP4_'..name), val)
		StatSetInt(GetHashKey('MP5_'..name), val)
		StatSetInt(GetHashKey('MP6_'..name), val)
	end)
end

RegisterNetEvent("stats:set")
AddEventHandler("stats:set", function(name, type, val)
	if type == "xp" then
		if name == "stamina" then stats.stamina_xp = val end
		if name == "lung_capacity" then stats.lung_capacity_xp = val end
		if name == "strength" then stats.strength_xp = val end
	elseif type == "lvl" then
		if name == "stamina" then stats.stamina_lvl = val end
		if name == "lung_capacity" then stats.lung_capacity_lvl = val end
		if name == "strength" then stats.strength_lvl = val end
	else
		if name == "stamina" then
			stats.stamina = val
			setstat("STAMINA", val)
		end
		if name == "lung_capacity" then
			stats.lung_capacity = val
			setstat("LUNG_CAPACITY", val)
		end
		if name == "strength" then
			stats.strength = val
			setstat("STRENGTH", val)
		end
	end

end)

RegisterNetEvent("stats:add")
AddEventHandler("stats:add", function(name, type, val)
	if type == "xp" then
		if name == "stamina" then stats.stamina_xp = stats.stamina_xp + val end
		if name == "lungcapacity" then stats.lung_capacity_xp = stats.lung_capacity_xp + val end
		if name == "strength" then stats.strength_xp = stats.strength_xp + val end
	elseif type == "lvl" then
		if name == "stamina" then stats.stamina_lvl = stats.stamina_lvl + val end
		if name == "lungcapacity" then stats.lung_capacity_lvl = stats.lung_capacity_lvl + val end
		if name == "strength" then stats.strength_lvl = stats.strength_lvl + val end
	else
		if name == "stamina" then
			stats.stamina = stats.stamina + val
			setstat("STAMINA", val)
		end
		if name == "lungcapacity" then
			stats.lung_capacity = stats.lung_capacity + val
			setstat("LUNG_CAPACITY", val)
		end
		if name == "strength" then
			stats.strength = stats.strength + val
			setstat("STRENGTH", val)
		end
	end

end)

RegisterNetEvent("stats:getStats")
AddEventHandler("stats:getStats", function(cb)
	cb(stats)
end)

RegisterNetEvent("stats:togglexp")
AddEventHandler("stats:togglexp", function()
	showxp = not showxp
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(150000)
		TriggerServerEvent("stats:CacheStats", stats)
	end 
end)

Citizen.CreateThread(function()
	while true do
		if exhaustion > 0 and not cvicenie then exhaustion = exhaustion - 1 end 
		TriggerEvent("stats:getStats", function(stats)
			if stats then
				maxexhaustion = stats.maxexhaustion
			end
		end)
		Citizen.Wait(1000)
	end
end)

function startcvicenie(n)
	Citizen.CreateThread(function()
		while true do
			cvicenie = true
			TriggerEvent("stats:add", "strength", "xp", n)
			exhaustion = exhaustion + 1
			if stopcvicenie or maxexhaustion <= exhaustion then
			 	stopcvicenie = false
			 	cvicenie = false
			 	ClearPedTasks(PlayerPedId())
			 	return
			end
			Citizen.Wait(1000)
		end
	end)
end

function Gym(data)
		ESX.UI.Menu.CloseAll()
		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'stats',
			{
				title    = _L('gym'),
				elements = {
					{label = _L('situps'), value = 'situps'},
					{label = _L('cranks'), value = 'cranks'},
					{label = _L('yoga'), value = 'yoga'},
					{label = _L('run'), value = 'run'},
					{label = _L('bench'), value = 'bench'},
					{label = _L('flex'), value = 'flex'},
					{label = '---- ---- ----', value = 'xxx'},
					{label = _L('stop'),   value ='stop'},
				},
			},
			function(data, menu)
			menu.close()

			local ped = PlayerPedId()

			if data.current.value == 'situps' then
			    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_SIT_UPS", 0, true)
                startcvicenie(5)	
			end

			
			if data.current.value == 'cranks' then
                TaskStartScenarioInPlace(ped, "WORLD_HUMAN_PUSH_UPS", 0, true)
                startcvicenie(10)
			end
			
			if data.current.value == 'run' then
                TaskStartScenarioInPlace(ped, "WORLD_HUMAN_JOG_STANDING", 0, true)
                startcvicenie(5)
			end
			
			if data.current.value == 'yoga' then
                TaskStartScenarioInPlace(ped, "WORLD_HUMAN_YOGA", 0, true)
                startcvicenie(2)
			end
			
			if data.current.value == 'bench' then
                TaskStartScenarioInPlace(ped, "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS", 0, true)
                startcvicenie(15)
			end
			
			if data.current.value == 'flex' then
                TaskStartScenarioInPlace(ped, "WORLD_HUMAN_MUSCLE_FLEX", 0, true)
                startcvicenie(0)
			end
			
			if data.current.value == 'stop' then
                stopcvicenie = true
			end
		end,
			function(data, menu)
				menu.close()
			end
		)
end

-- Display markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100000)
		local coords = GetEntityCoords(PlayerPedId())
		for i=1, #Config.Zones, 1 do
			if(GetDistanceBetweenCoords(coords, Config.Zones[i].x, Config.Zones[i].y, Config.Zones[i].z, true) < Config.DrawDistance) then
				DrawMarker(Config.MarkerType, Config.Zones[i].x, Config.Zones[i].y, Config.Zones[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
			end
		end
	end
end)

-- Activate menu when player is inside marker
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10000)
		local coords      = GetEntityCoords(PlayerPedId())
		isInMarker  = false
		local currentZone = nil
		for i=1, #Config.Zones, 1 do
			if(GetDistanceBetweenCoords(coords, Config.Zones[i].x, Config.Zones[i].y, Config.Zones[i].z, true) < Config.ZoneSize.x) then
				isInMarker  = true
				if cvicenie == false then
					SetTextComponentFormat('STRING')
	            	AddTextComponentString(_L('press'))
	            	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
	            end
			end
		end
		if isInMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
		end
		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			ESX.UI.Menu.CloseAll()
		end
		if isInMarker then
			local n = (100*exhaustion)/maxexhaustion
			SetTextFont(4)
			SetTextProportional(1)
			SetTextScale(0.5, 0.5)
			SetTextColour(255,255,255,255)
			SetTextDropShadow(0, 0, 0, 0, 255)
			SetTextEdge(1, 0, 0, 0, 255)
			SetTextDropShadow()
			SetTextOutline()
			SetTextEntry("STRING")
			if n < 50 then AddTextComponentString("~y~".. _L('tired') .." ~g~"..string.format("%.2f",n).."%") elseif n < 75 then AddTextComponentString("~y~".. _L('tired').. " ~o~"..string.format("%.2f",n).."%") else AddTextComponentString("~y~".. _L('tired') .. " ~r~"..string.format("%.2f",n).."%") end
			DrawText(0.230, 0.855)
		end
	end
end)

-- Menu Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		if IsControlJustReleased(0, Config.KeyPress) and isInMarker and not MenuIsShowed and cvicenie == false then
			Gym()
		end
	end
end)

