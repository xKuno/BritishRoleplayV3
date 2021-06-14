local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX             				 = nil

local cardOpen 					= false
local playerData 				= {}
local windowavg					= false
local windowavd					= false
local windowarg					= false
local windoward					= false
local window 					= false
local engineOn 					= true
local speedkm 					= 0


-- Servern callback
RegisterNetEvent('jsfour-legitimation:open')
AddEventHandler('jsfour-legitimation:open', function(playerData)
	cardOpen = true
	SendNUIMessage({
		action = "open",
		array = playerData
	})
end)

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

-- Giving ID Animation
function OpenGivingID()
  local pP = GetPlayerPed(-1)

  Citizen.CreateThread(function()

    local pP = GetPlayerPed(-1)
    TaskPlayAnim(pP, "mp_common", "givetake1_a", 3.5, -8, -1, 2, 0, 0, 0, 0, 0)
    Citizen.CreateThread(function()
      Citizen.Wait(10000)
      TriggerServerEvent('esx_personmeny:give_id')
      ClearPedTasks(pP)
      end)
    end)
end

-- No one Near Animation
function OpenNoOneNear()
  local pP = GetPlayerPed(-1)

  Citizen.CreateThread(function()

    local pP = GetPlayerPed(-1)
    TaskPlayAnim(pP, "anim@mp_player_intcelebrationmale@face_palm", "face_palm", 3.5, -8, -1, 2, 0, 0, 0, 0, 0)
    Citizen.CreateThread(function()
      Citizen.Wait(10000)
      TriggerServerEvent('esx_personmeny:idnoonenear')
      ClearPedTasks(pP)
      end)
    end)
end

function OpenTrashCan()
  local pP = GetPlayerPed(-1)

  Citizen.CreateThread(function()

    local pP = GetPlayerPed(-1)
    TaskPlayAnim(pP, "mp_common", "givetake2_a", 3.5, -8, -1, 2, 0, 0, 0, 0, 0)
    TaskStartScenarioInPlace(pP, "mp_common", 0, true)
    Citizen.CreateThread(function()
      Citizen.Wait(2000)
      ClearPedTasks(pP)
      end)
    end)
end

function OpenAttansCan()
  local pP = GetPlayerPed(-1)

  Citizen.CreateThread(function()

    local pP = GetPlayerPed(-1)
    TaskPlayAnim(pP, "gestures@m@standing@casual", "gesture_damn", 3.5, -8, -1, 2, 0, 0, 0, 0, 0)
    TaskStartScenarioInPlace(pP, "gestures@m@standing@casual", 0, true)
    FreezeEntityPosition(playerPed, true)
    Citizen.CreateThread(function()
      Citizen.Wait(2000)
      FreezeEntityPosition(playerPed, false)
      ClearPedTasks(pP)
      end)
    end)
end

function OpenShowGiveID()

ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'id_card_menu',
	{
		title    = _U('id_menu'),
		elements = {
			{label = _U('check_id'), value = 'check'},
			{label = _U('show_id'), value = 'show'}
		}
	},
	function(data2, menu2)
		if data2.current.value == 'check' then
			TriggerServerEvent('brp_idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
		elseif data2.current.value == 'show' then
			local player, distance = ESX.Game.GetClosestPlayer()

			if distance ~= -1 and distance <= 3.0 then
				TriggerServerEvent('brp_idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player))
				OpenTrashCan()
			else
				OpenAttansCan()
				ESX.ShowNotification(_U('nobody_near'))
			end
		end
	end,
	function(data2, menu2)
		menu2.close()
		OpenCivilianActionsMenu()
	end
)

end
----------------------------------------------
function OpenShowGiveDL()

ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'id_card_menu',
	{
		title    = _U('dl_menu'),
		elements = {
			{label = _U('check_id2'), value = 'check'},
			{label = _U('show_id2'), value = 'show'}
		}
	},
	function(data2, menu2)
		if data2.current.value == 'check' then
				TriggerServerEvent('brp_idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
		elseif data2.current.value == 'show' then
			local player, distance = ESX.Game.GetClosestPlayer()

			if distance ~= -1 and distance <= 3.0 then
				TriggerServerEvent('brp_idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'driver')
				OpenTrashCan()
			else
				OpenAttansCan()
				ESX.ShowNotification(_U('nobody_near'))
			end
		end
	end,
	function(data2, menu2)
		menu2.close()
		OpenCivilianActionsMenu()
	end
)

end
----------------------------------------------
function OpenShowGiveGL()

ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'id_card_menu',
	{
		title    = _U('gl_menu'),
		elements = {
			{label = _U('check_id3'), value = 'check'},
			{label = _U('show_id3'), value = 'show'}
		}
	},
	function(data2, menu2)
		if data2.current.value == 'check' then
				TriggerServerEvent('brp_idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')
		elseif data2.current.value == 'show' then
			local player, distance = ESX.Game.GetClosestPlayer()

			if distance ~= -1 and distance <= 3.0 then
				TriggerServerEvent('brp_idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'weapon')
				OpenTrashCan()
			else
				OpenAttansCan()
				ESX.ShowNotification(_U('nobody_near'))
			end
		end
	end,
	function(data2, menu2)
		menu2.close()
		OpenCivilianActionsMenu()
	end
)

end
----------------------------------------------

function OpenCivilianActionsMenu()

  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
  'default', GetCurrentResourceName(), 'civilian_actions',
  {
    title    = _U('citizen_interactions'),
    align    = 'bottom-right',
    elements = {
      {label = _U('id_card'), value = 'id_kort'},
	  {label = _U('id_card2'), value = 'id_kort2'},
	  {label = _U('id_card3'), value = 'id_kort3'},	  
    }
  },
    
    function(data, menu)

      if data.current.value == 'id_kort' then
      	OpenShowGiveID()
      end
	  
	  if data.current.value == 'id_kort2' then
      	OpenShowGiveDL()
      end
	  
	  if data.current.value == 'id_kort3' then
      	OpenShowGiveGL()
      end

      if data.current.value == 'blindfold' then
        local player, distance = ESX.Game.GetClosestPlayer()

      if distance ~= -1 and distance <= 3.0 then
           ESX.TriggerServerCallback('jsfour-blindfold:itemCheck', function( hasItem )
              TriggerServerEvent('jsfour-blindfold', GetPlayerServerId(player), hasItem)
           end)
      else
           ESX.ShowAdvancedNotification('Individual actions ',' ~ b ~ Blindfold', _U('nobody_near'), 'CHAR_DEFAULT', 8)
          end
      end

      if data.current.value == 'vehiclemenu' then
        local playerPed = GetPlayerPed(-1)
        if IsPedSittingInAnyVehicle(playerPed) then
            local playerVeh = GetVehiclePedIsIn(playerPed, false)
            local drivingPed = GetPedInVehicleSeat(playerVeh, -1)
            if drivingPed == playerPed then
                OpenVehicleMenu()
            end
        end
      end

      -- if data.current.value == 'pee' then
      --     TriggerEvent('pee')
      -- elseif data.current.value == 'poop' then
      --     TriggerEvent('poop')
      --  end

    end,
    function(data, menu)
      menu.close()
    end
  )
end

-- Key events
Citizen.CreateThread(function()
	while true do
		Wait(0)
		if IsControlPressed(0, 322) or IsControlPressed(0, 177) and cardOpen then
			SendNUIMessage({
				action = "close"
			})
			cardOpen = false
		end
	end
end)

Citizen.CreateThread(function()
  while true do
    Wait(0)
    if IsControlPressed(0, Keys["-"]) then
      OpenCivilianActionsMenu()
    end
  end
end)

-- Bälte


local speedBuffer  = {}
local velBuffer    = {}
local beltOn       = false
local wasInCar     = false

IsCar = function(veh)
        local vc = GetVehicleClass(veh)
        return (vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 12) or (vc >= 17 and vc <= 20)
        end 

Fwv = function (entity)
        local hr = GetEntityHeading(entity) + 90.0
        if hr < 0.0 then hr = 360.0 + hr end
        hr = hr * 0.0174533
        return { x = math.cos(hr) * 2.0, y = math.sin(hr) * 2.0 }
      end

Citizen.CreateThread(function()
  Citizen.Wait(500)
  while true do
    
    local ped = GetPlayerPed(-1)
    local car = GetVehiclePedIsIn(ped)
    
    if car ~= 0 and (wasInCar or IsCar(car)) then
    
      wasInCar = true
      
      if beltOn then DisableControlAction(0, 75) end
      
      speedBuffer[2] = speedBuffer[1]
      speedBuffer[1] = GetEntitySpeed(car)
      
      if speedBuffer[2] ~= nil 
         and not beltOn
         and GetEntitySpeedVector(car, true).y > 1.0  
         and speedBuffer[1] > 19.25 
         and (speedBuffer[2] - speedBuffer[1]) > (speedBuffer[1] * 0.255) then
         
        local co = GetEntityCoords(ped)
        local fw = Fwv(ped)
        SetEntityCoords(ped, co.x + fw.x, co.y + fw.y, co.z - 0.47, true, true, true)
        SetEntityVelocity(ped, velBuffer[2].x, velBuffer[2].y, velBuffer[2].z)
        Citizen.Wait(1)
        SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
      end
        
      velBuffer[2] = velBuffer[1]
      velBuffer[1] = GetEntityVelocity(car)
        
      if IsControlJustReleased(0, 29) then
        beltOn = not beltOn         
        if beltOn then  TriggerEvent("pNotify:SendNotification", {text = _U('seatbelt_on'), type = "success", queue = "belt", timeout = 1000, layout = "bottomLeft"})
        else TriggerEvent("pNotify:SendNotification", {text = _U('seatbelt_off'), type = "error", queue = "belt", timeout = 1000, layout = "bottomLeft"}) end
      end
      
    elseif wasInCar then
      wasInCar = false
      beltOn = false
      speedBuffer[1], speedBuffer[2] = 0.0, 0.0
    end
    Citizen.Wait(0)
  end
end)

local disableShuffle = true
function disableSeatShuffle(flag)
  disableShuffle = flag
end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if IsPedInAnyVehicle(GetPlayerPed(-1), false) and disableShuffle then
      if GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) == GetPlayerPed(-1) then
        if GetIsTaskActive(GetPlayerPed(-1), 165) then
          SetPedIntoVehicle(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
        end
      end
    end
  end
end)

RegisterNetEvent("SeatShuffle")
AddEventHandler("SeatShuffle", function()
  if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
    disableSeatShuffle(false)
    Citizen.Wait(5000)
    disableSeatShuffle(true)
  else
    CancelEvent()
  end
end)

RegisterCommand("shuff", function(source, args, raw) --change command here
    TriggerEvent("SeatShuffle")
end, false)
