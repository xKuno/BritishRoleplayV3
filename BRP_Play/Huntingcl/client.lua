huntingspawns = {
    [1] = { 
        l = vector3(-394.23, 2384.27, 127.70),  --Location where you can place bait
        spawn = {
            vector3(-405.18, 2350.28, 138.69), --Animal spawn pos
            vector3(-387.98, 2365.77, 126.49),
            vector3(-361.28, 2367.50, 111.14),
            vector3(-368.61, 2409.04, 110.67),
            vector3(-391.08, 2398.48, 124.09),
            vector3(-411.67, 2402.71, 126.26),
            vector3(-425.88, 2390.41, 119.20),
            vector3(-448.54, 2413.67, 91.01),
            vector3(-445.11, 2453.15, 80.86),
            vector3(-417.86, 2497.63, 99.56),
            vector3(-357.90, 2442.23, 99.93),
            vector3(-329.78, 2361.82, 110.53),
            vector3(-408.49, 2322.48, 149.78),
            vector3(-333.27, 2407.20, 89.36),
            vector3(-295.47, 2450.64, 70.67),
            vector3(-268.79, 2467.44, 73.35)
        }
    },
    [2] = { 
        l = vector3(3104.34, 6026.14, 122.96), 
        spawn = {
			vector3(3095.99, 6011.03, 126.97),
			vector3(3125.34, 5994.16, 135.95),
			vector3(3153.83, 5936.96, 155.50),
			vector3(3087.19, 6126.99, 117.63),
			vector3(3161.13, 6069.42, 78.18),
			vector3(3152.59, 6188.57, 74.80),
			vector3(3241.72, 6150.25, 1.61),
			vector3(3147.76, 5993.00, 129.82),
			vector3(3137.95, 5903.21, 142.76),
			vector3(3405.67, 6033.38, 0.62),
			vector3(3321.50, 6130.87, 2.18),
        } 
    },

    [3] ={ 
        l = vector3(-547.59, 4208.50, 190.11), 
        spawn = {
            vector3(-546.35, 4209.38, 189.82),
            vector3(-562.96, 4234.01, 176.98),
            vector3(-598.61, 4236.78, 173.96),
            vector3(-598.49, 4211.38, 179.24),
            vector3(-584.81, 4176.85, 188.76),
            vector3(-581.37, 4148.44, 182.29),
            vector3(-552.95, 4137.48, 179.04),
            vector3(-531.08, 4138.01, 171.89),
            vector3(-506.40, 4147.84, 165.95),
            vector3(-496.35, 4171.48, 169.17),
            vector3(-477.98, 4181.53, 170.65),
            vector3(-468.81, 4203.10, 161.69),
        }
    },

    [4] ={ 
        l = vector3(-405.86, 4689.04, 259.06), 
        spawn = {
            vector3(-413.85, 4677.64, 257.70),
            vector3(-401.95, 4654.79, 237.48),
            vector3(-373.85, 4653.55, 239.55),
            vector3(-342.08, 4681.25, 253.43),
            vector3(-316.00, 4714.15, 240.04),
            vector3(-357.24, 4756.87, 233.89),
            vector3(-402.88, 4767.62, 243.75),
            vector3(-454.49, 4737.84, 244.05),
            vector3(-451.54, 4686.58, 242.70),
            vector3(-424.42, 4647.76, 239.87),
            vector3(-490.55, 4652.38, 204.44),
            vector3(-383.70, 4780.62, 231.80),
            vector3(-412.22, 4840.39, 212.16),
            vector3(-362.84, 4899.03, 211.52),
            vector3(-529.59, 4900.84, 155.79),
        }
    },

    [5] ={ 
        l = vector3(2158.04, -1697.17, 200.24), 
        spawn = {
            vector3(2089.26, -1756.30, 179.49),
            vector3(2042.33, -1766.60, 142.16),
            vector3(2015.75, -1838.51, 118.05),
            vector3(2058.61, -1930.27, 120.64),
            vector3(2110.69, -1926.13, 139.15),
            vector3(2130.52, -1864.51, 150.33),
            vector3(2130.58, -1828.11, 153.74),
            vector3(2155.28, -1802.06, 158.99),
            vector3(2130.70, -1752.35, 183.14),
            vector3(2163.73, -1683.73, 195.43),
            vector3(2202.94, -1712.46, 174.67),
            vector3(2194.84, -1738.20, 161.68),
        }
    }
}

local sella = vector3(-679.83, 5834.09, 17.33) --Selling location



ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    PlayerData = ESX.GetPlayerData()

	for k,v in pairs(huntingspawns) do

		local lovblip = AddBlipForRadius(v.l, 50.0)
		SetBlipHighDetail(lovblip, true)
		SetBlipColour(lovblip, 44)
		SetBlipAlpha(lovblip, 100)
		SetBlipAsShortRange(lovblip, true)

	end

	local sellaBlip = AddBlipForCoord(sella)
	SetBlipHighDetail(sellaBlip, true)
	SetBlipColour(sellaBlip, 44)
	SetBlipSprite(sellaBlip, 273)
	SetBlipAsShortRange(sellaBlip, true)

	BeginTextCommandSetBlipName("STRING")
  	AddTextComponentString('Hunting Sell Store')
  	EndTextCommandSetBlipName(sellaBlip)



end)

local AnimalTable = {}
local Blipovi = {}



RegisterNetEvent("hunting_bait:drop", function(lokacije)

	local pPed = PlayerPedId()
	TaskStartScenarioInPlace(pPed, "WORLD_HUMAN_GARDENER_PLANT", 2, true)
	Citizen.Wait(10000)
	SpawnJeleneOkolo(lokacije)


	ClearPedTasks(PlayerPedId())
	LocalPlayer.state.block_everything = false

end)


AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		DeleteEntity(TestZivotinja)

		for i = 1, #AnimalTable do
			DeleteEntity(AnimalTable[i])
		end

	end
end)


function showHelpNotification(msg)
    local _x, _y = 0.13, 0.10

	SetTextScale(0.45, 0.45)
	SetTextFont(4)
	SetTextJustification(1)
	SetTextColour(255, 255, 255, 255)
	SetTextEntry("TWOSTRINGS")
	AddTextComponentString(msg)

	local factor = string.len(msg) / 350

	DrawText(_x - 0.10, _y)
	DrawRect(_x - 0.08,_y + 0.0145, 0.250 + factor, 0.03, 28, 16, 11, 68)
end

local DozvoljeneZivotinje = {
	[`a_c_deer`] = true,
	[`a_c_pig`] = true,
	[`a_c_coyote`] = true,
	--[`a_c_panther`] = true,
	[`a_c_cow`] = true,
	[`a_c_coyote`] = true,
	[`a_c_rabbit_01`] = true,
}

local srvID = GetPlayerServerId(PlayerId())

Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(1)
		LetSleep = true

		local animalPool = GetGamePool("CPed")
		local Ped = PlayerPedId()
		local PedPos = GetEntityCoords(Ped)
		
		if not Player(srvID).state.dontknow then
			for i = 1, #animalPool do
				if IsEntityDead(animalPool[i]) then
					local AnimPos = GetEntityCoords(animalPool[i])

					if #(PedPos - AnimPos) < 2 then
						if DozvoljeneZivotinje[GetEntityModel(animalPool[i])] then

							Draw3DText(AnimPos.x, AnimPos.y, AnimPos.z , "Press [E] to harvest the animal!")

							if IsControlJustReleased(0, 38) then
								if not Entity(animalPool[i]).state.Already_skinned then
									NetworkRequestControlOfEntity(animalPool[i])
									Wait(100)
									SetEntityAsMissionEntity(animalPool[i], true, true)

									local AnimNetId = PedToNet(animalPool[i])
									SetNetworkIdExistsOnAllMachines(AnimNetId, true)

									if ImalNoz() then
										Player(srvID).state:set("dontknow", true, true)
										TriggerServerEvent("hunting:try_hunting", AnimNetId)
									else
										ESX.ShowNotification("You dont have a hutning knife!")
									end
								else
									ESX.ShowNotification("The animal is already harvested!")
								end
							end

							LetSleep = false
						end
					end
				end
			end
		end
		
		if #(sella - PedPos) < 5 then
			LetSleep = false
			DrawMarker(2, sella, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.2, 255, 255, 255, 100, false, true, 2, true, false, false, false)

			if #(sella - PedPos) < 2 then
				showHelpNotification("Press [E] to open hunting sell store!")
				if IsControlJustReleased(0, 38) then
					open_shop()
				end
			end
		end
		if LetSleep then
			Citizen.Wait(1000)
		end

	end
end)

local Prices = {
	["Wood_Grade_4"] = 300,
	["Leather_Grade_1"] = 30,
	["Leather_Grade_2"] = 100,
	["Leather_Grade_3"] = 150,
	["Animal_Bones"] = 50,
	["Animal_Fat"] = 30,
	["meat"] = 24
}

function GetInvVal()

	local elements = {}

	for k, v in pairs(ESX.GetPlayerData().inventory) do
		for item, cijena in pairs(Prices) do
			if item == v.name and v.count > 0 then
				table.insert(elements, {
					label = ('%s - <span style="color:wheat;">$%s</span>'):format(v.label, cijena),
					name = v.name,
					price = cijena,

					type = 'slider',
					value = 1,
					min = 1,
					max = v.count
				})
			end
		end
	end

	return elements
end

function open_shop()

	local elements = {}

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'open_shop', {
        title    = 'Selling...',
        align    = 'center',
        elements = GetInvVal()
    }, function(data, menu)

    if tonumber(data.current.value) > 0 then
		local quantity = tonumber(data.current.value)

		if quantity > 0 then
			TriggerServerEvent("hunting:sell", data.current.name, quantity)
			Wait(100)
			open_shop()
		end
	end

    end, function(data, menu)
        menu.close()
    end)

end


function ImalNoz()
	local Inv = ESX.GetPlayerData().inventory
	for i=1, #Inv, 1 do
		if Inv[i].name == "hunting_tool" and Inv[i].count > 0 then
			return true
		end
	end	
	return false
end

local items = {
    "Leather_Grade_1", "Leather_Grade_2", "Leather_Grade_3","Animal_Bones",
}

RegisterNetEvent("hunting:attempts:can", function(RNGitem, RNGbroj, itemLabel, RNGbrojMeso, AnimNetId)

	TriggerEvent("inventory:sakrijoruzje")
	loadAnimDict('amb@medic@standing@kneel@base')
	loadAnimDict('anim@gangops@facility@servers@bodysearch@')
	TaskPlayAnim(GetPlayerPed(-1), "amb@medic@standing@kneel@base", "base", 8.0, -8.0, -1, 1, 0, false, false, false)
	TaskPlayAnim(GetPlayerPed(-1),"anim@gangops@facility@servers@bodysearch@","player_search", 8.0, -8.0, -1, 48, 0, false, false, false)

		
		local animal = NetworkGetEntityFromNetworkId(AnimNetId)
		NetworkRequestControlOfEntity(animal)
		Wait(10000)
		SetEntityAsMissionEntity(animal, true, true)
		TriggerServerEvent("hunting:DeleteAnima", AnimNetId)

		DeleteEntity(animal)
		TriggerServerEvent("hunting:RandomIt", RNGitem, RNGbroj, itemLabel, RNGbrojMeso)
		Entity(animal).state:set("Already_skinned", true, true)
	
		math.randomseed(GetGameTimer())
		local PucanjeSansa = math.random(1,20)
		TriggerServerEvent("hunting:DeleteAnima", AnimNetId)

		DeleteEntity(animal)
		if PucanjeSansa >= 19 then
			TriggerServerEvent("hunting:cracked_Knife")
		end
		

		ClearPedTasks(PlayerPedId())

		TriggerServerEvent("hunting:SetState", AnimNetId, false)
		Player(srvID).state:set("dontknow", false, true)
		LocalPlayer.state:set("block_everything", false, true)


end)



function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(0)
    end
end

function loadAnimalModel(model)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Wait(50)
	end
end

function randAnimal()
	local RandTable = {}
	for k,v in pairs(DozvoljeneZivotinje) do
		table.insert(RandTable, k)
	end

	local randNim = RandTable[math.random(1, #RandTable)]
	loadAnimalModel(randNim)

	return randNim
end

function SpawnJeleneOkolo(lokacije)
	local animalPool = GetGamePool("CPed")
	local UkupanBrojOkolo = 0

	for i = 1, #animalPool do
		if #( GetEntityCoords(animalPool[i]) - GetEntityCoords(PlayerPedId()) ) < 200 then
			if DozvoljeneZivotinje[GetEntityModel(animalPool[i])] then
				UkupanBrojOkolo  =  UkupanBrojOkolo + 1
			end
		end
	end

	if UkupanBrojOkolo <= 2 then

		for i = 1, #lokacije do

			local newAnimal = CreatePed(28, randAnimal(), lokacije[i], 150.0, true, true)

			while not DoesEntityExist(newAnimal) do
				Wait(10)
			end

			SetPedSeeingRange(newAnimal, 100.0)
			SetPedHearingRange(newAnimal, 100.0)

			TaskWanderStandard(newAnimal, true, true)

			table.insert(AnimalTable, newAnimal)

		end

		ESX.ShowNotification("You set the bait and the animals came close to you !")
		ClearPedTasks(PlayerPedId())
		LocalPlayer.state:set("block_everything", false, true)
	else
		ESX.ShowNotification("There are too many animals in the area and they have come to their senses !")
		ClearPedTasks(PlayerPedId())
		LocalPlayer.state:set("block_everything", false, true)
	end
	

end


local TrenutniBlipovi = {}

RegisterNetEvent("hunting:cuts", function()

	local animalPool = GetGamePool("CPed")

	for i = 1, #animalPool do
		if #( GetEntityCoords(animalPool[i]) - GetEntityCoords(PlayerPedId()) ) < 300 then
			if DozvoljeneZivotinje[GetEntityModel(animalPool[i])] then
				local tempAnBlip = AddBlipForEntity(animalPool[i])

				SetBlipColour(tempAnBlip, 1)
				SetBlipDisplay(tempAnBlip, 6)

				table.insert(TrenutniBlipovi, tempAnBlip)
			end
		end
	end

	Citizen.Wait(8000)

	for i = 1, #TrenutniBlipovi do
		RemoveBlip(TrenutniBlipovi[i])
	end

end)

function Draw3DText(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 68)
end