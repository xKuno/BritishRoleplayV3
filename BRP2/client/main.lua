RTXCARRY = {}
RTXCARRY.CurrentRequestId  = 0
RTXCARRY.ServerCallbacks = {}

RTXCARRY.TriggerServerCallback = function(name, cb, ...)
	RTXCARRY.ServerCallbacks[RTXCARRY.CurrentRequestId] = cb

	TriggerServerEvent('RTXCARRY:triggerServerCallback', name, RTXCARRY.CurrentRequestId, ...)

	if RTXCARRY.CurrentRequestId < 65535 then
		RTXCARRY.CurrentRequestId = RTXCARRY.CurrentRequestId + 1
	else
		RTXCARRY.CurrentRequestId = 0
	end
end

RegisterNetEvent('RTXCARRY:serverCallback')
AddEventHandler('RTXCARRY:serverCallback', function(requestId, ...)
	RTXCARRY.ServerCallbacks[requestId](...)
	RTXCARRY.ServerCallbacks[requestId] = nil
end)

local RequestSent = false
local Carryed = false

local RequestSecondsRemaining = 0

local TrajectoryShow = false
local TrajectoryPlayerHandler = nil

local TrajectoryShowReceiever = false
local TrajectoryPlayerHandlerReceiever = nil

local CarryPlayer = false

local CarryedPlayer = false

local CarryPlayerHandler = nil

local CarryedPlayerHandler = nil

local CarryTypeChoosed = "type1"

local InMenuCarry = false

local animationscarry = { 
	{animdict = "missfinale_c2mcs_1"},
	{animdict = "nm"},
	{animdict = "amb@code_human_in_car_idles@generic@ps@base"},
	{animdict = "anim@heists@box_carry@"},
	{animdict = "anim@arena@celeb@flat@paired@no_props@"},
}

function GetPlayers()
	local players = {}
	for _, player in ipairs(GetActivePlayers()) do
		local ped = GetPlayerPed(player)
		if DoesEntityExist(ped) then
			table.insert(players, player)
		end
	end
	return players
end

function GetClosestPlayer(coords)
	if coords == nil then
		coords = GetEntityCoords(GetPlayerPed(tonumber("-1")))
	end
	
	local closestPlayers = GetPlayerFromCoords(coords)
	local closestDistance = tonumber("-1")
	local closestPlayer = tonumber("-1")

	for i=1, #closestPlayers, 1 do
		if closestPlayers[i] ~= PlayerId() and closestPlayers[i] ~= tonumber("-1") then
			local pos = GetEntityCoords(GetPlayerPed(closestPlayers[i]))
			local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, coords.x, coords.y, coords.z, true)

			if closestDistance == tonumber("-1") or closestDistance > distance then
				closestPlayer = closestPlayers[i]
				closestDistance = distance
			end
		end
	end

	return closestPlayer, closestDistance
end

function GetPlayerFromCoords(coords, distance)
	local players = GetPlayers()
	local closePlayers = {}

	if coords == nil then
		coords = GetEntityCoords(GetPlayerPed(tonumber("-1")))
	end
	if distance == nil then
		distance = tonumber("5.0")
	end
	for _, player in pairs(players) do
		local target = GetPlayerPed(player)
		local targetCoords = GetEntityCoords(target)
		local targetdistance = GetDistanceBetweenCoords(targetCoords, coords.x, coords.y, coords.z, true)
		if targetdistance <= distance then
			table.insert(closePlayers, player)
		end
	end
	
	return closePlayers
end

RegisterNetEvent("brp2:ShowRequestPlayerReceiever")
AddEventHandler("brp2:ShowRequestPlayerReceiever", function(requesterplayerid, requestedtype)
	TrajectoryShowReceiever = true
	TrajectoryPlayerHandlerReceiever = requesterplayerid
	CarryTypeChoosed = requestedtype
	SendNUIMessage({
		message	= "showcarryrequestreceiever"
	})	
end)

RegisterNetEvent("brp2:ShowRequestPlayerReceieverDisable")
AddEventHandler("brp2:ShowRequestPlayerReceieverDisable", function()
	TrajectoryShowReceiever = false
	TrajectoryPlayerHandlerReceiever = nil
	SendNUIMessage({
		message	= "hide"
	})	
end)

RegisterNetEvent("brp2:ShowRequestPlayerReceieverAccept")
AddEventHandler("brp2:ShowRequestPlayerReceieverAccept", function(receieverid)
	local requesterhandler = PlayerPedId()
	local receieverhandler = GetPlayerFromServerId(receieverid)
	local receieverhandlerped = GetPlayerPed(receieverhandler)
	for i, animations in ipairs(animationscarry) do
		while not HasAnimDictLoaded(animations.animdict) do
			RequestAnimDict(animations.animdict)
			Citizen.Wait(5)
		end			
	end
	if CarryTypeChoosed == "type1" then
		if not IsEntityPlayingAnim(requesterhandler, "missfinale_c2mcs_1", "fin_c2_mcs_1_camman", 3) then
			TaskPlayAnim(requesterhandler, "missfinale_c2mcs_1", "fin_c2_mcs_1_camman", tonumber("8.0"), tonumber("-8.0"), 100000, 49, 0, false, false, false)
		end
		if not IsEntityPlayingAnim(receieverhandlerped, "nm", "firemans_carry", 3) then
			TaskPlayAnim(receieverhandlerped, "nm", "firemans_carry", tonumber("8.0"), tonumber("-8.0"), 100000, 33, 0, false, false, false)
		end
	elseif CarryTypeChoosed == "type2" then
		if not IsEntityPlayingAnim(requesterhandler, "anim@heists@box_carry@", "idle", 3) then
			TaskPlayAnim(requesterhandler, "anim@heists@box_carry@", "idle", tonumber("8.0"), tonumber("-8.0"), 100000, 49, 0, false, false, false)
		end
		if not IsEntityPlayingAnim(receieverhandlerped, "amb@code_human_in_car_idles@generic@ps@base", "base", 3) then
			TaskPlayAnim(receieverhandlerped, "amb@code_human_in_car_idles@generic@ps@base", "base", tonumber("8.0"), tonumber("-8.0"), 100000, 33, 0, false, false, false)
		end	
	elseif CarryTypeChoosed == "type3" then
		if not IsEntityPlayingAnim(requesterhandler, "anim@arena@celeb@flat@paired@no_props@", "piggyback_c_player_a", 3) then
			TaskPlayAnim(requesterhandler, "anim@arena@celeb@flat@paired@no_props@", "piggyback_c_player_a", tonumber("8.0"), tonumber("-8.0"), 100000, 49, 0, false, false, false)
		end
		if not IsEntityPlayingAnim(receieverhandlerped, "anim@arena@celeb@flat@paired@no_props@", "piggyback_c_player_b", 3) then
			TaskPlayAnim(receieverhandlerped, "anim@arena@celeb@flat@paired@no_props@", "piggyback_c_player_b", tonumber("8.0"), tonumber("-8.0"), 100000, 33, 0, false, false, false)
		end	
	end
	CarryPlayer = true
	CarryedPlayerHandler = receieverid
	RequestSecondsRemaining = 0
	RequestSent = false
	TrajectoryShow = false
	TrajectoryPlayerHandler = nil	
	SendNUIMessage({
		message	= "hide"
	})
end)

RegisterNetEvent("brp2:ShowRequestPlayerReceieverDecline")
AddEventHandler("brp2:ShowRequestPlayerReceieverDecline", function()
	Notify(Language[Config.Language]["requestdenied"])
	RequestSecondsRemaining = 0
	RequestSent = false
	TrajectoryShow = false
	TrajectoryPlayerHandler = nil	
	SendNUIMessage({
		message	= "hide"
	})	
end)

RegisterNetEvent("brp2:CarryDisable")
AddEventHandler("brp2:CarryDisable", function()
	local playerped = PlayerPedId()
	CarryedPlayer = false
	DetachEntity(playerped, true, false)
	ClearPedTasks(playerped)
	SendNUIMessage({
		message	= "hide"
	})	
end)

RegisterNUICallback("closetypeselect", function(data, cb)
	TriggerServerEvent("brp2:CarryMenuClosed")
	SetNuiFocus(false, false)
	SendNUIMessage({message = "hide"})
end)

RegisterNUICallback("selecttype", function(data, cb)
	InMenuCarry = false
	CarryTypeChoosed = tostring(data.carrytype)
	SetNuiFocus(false, false)
	local playerped = PlayerPedId()
	if CarryPlayer == false and CarryedPlayer == false then
		if not IsPedSittingInAnyVehicle(playerped) then
			local ClosestPlayer, distance = GetClosestPlayer()
			if ClosestPlayer ~= tonumber("-1") and distance < Config.CarryDistance then
				if Carryed == false then
					if RequestSent == false then
						RTXCARRY.TriggerServerCallback("brp2:IsPlayerCarryed", function(carrydata)		
							if carrydata == true then
								RequestSent = true
								TrajectoryShow = true
								TrajectoryPlayerHandler = ClosestPlayer		
								RequestSecondsRemaining = Config.RequestDuration
							elseif carrydata == "playercarrysomeone" then
								Notify(Language[Config.Language]["targetcarrysomeone"])
							elseif carrydata == "youarecarryed" then
								Notify(Language[Config.Language]["someonecarryou"])		
							elseif carrydata == "targetalreadycarry" then
								Notify(Language[Config.Language]["targetcarryed"])		
							elseif carrydata == "alreadysentrequest" then
								Notify(Language[Config.Language]["requestalready"])	
							elseif carrydata == "targethaverequestfromsomeone" then
								Notify(Language[Config.Language]["targethaverequest"])	
							elseif carrydata == "playerincarrymenu" then
								Notify(Language[Config.Language]["targetmenu"])	
							end
						end, GetPlayerServerId(ClosestPlayer), CarryTypeChoosed)
					else
						Notify(Language[Config.Language]["requestalready"])
					end
				else
					Notify(Language[Config.Language]["someonecarryou"])
				end
			else
				Notify(Language[Config.Language]["noplayernearby"])
			end
		else
			Notify(Language[Config.Language]["invehicle"])
		end	
	else
		Notify(Language[Config.Language]["youcarrysomeone"])
	end
end)

function RGBRainbow(frequency)
	local result = {}
	local curtime = GetGameTimer() / 1000
	result.r = math.floor( math.sin( curtime * frequency + 0 ) * 127 + 128 )
	result.g = math.floor( math.sin( curtime * frequency + 2 ) * 127 + 128 )
	result.b = math.floor( math.sin( curtime * frequency + 4 ) * 127 + 128 )
	return result
end

RegisterNetEvent("brp2:Carry")
AddEventHandler("brp2:Carry", function(carrytype)
	Carry(carrytype)
end)

if Config.CarryViaCommand then
	RegisterCommand(Config.CarryCommand, function(source, args)
		Carry(args[1])
	end)
end

function Carry(carrytype)
	local playerid = PlayerId()
	local dead = IsPlayerDead(playerid)
	if dead == false then
		local playerped = PlayerPedId()
		if CarryPlayer == true then
			local PlayerReceiever = GetPlayerFromServerId(CarryedPlayerHandler)
			local PlayerReceieverPed = GetPlayerPed(PlayerReceiever)				
			CarryPlayer = false
			if CarryedPlayerHandler ~= nil then
				ClearPedTasks(PlayerReceieverPed)
			end
			TriggerServerEvent("brp2:DisableCarryServer")
			CarryedPlayerHandler = nil
			DetachEntity(playerped, true, false)
			ClearPedTasks(playerped)
		elseif TrajectoryShow == true and TrajectoryPlayerHandler then	
			TriggerServerEvent("brp2:CancelCarryRequestReceiever", GetPlayerServerId(TrajectoryPlayerHandler))
			RequestSent = false
			TrajectoryShow = false
			TrajectoryPlayerHandler = nil	
			SendNUIMessage({
				message	= "hide"
			})								
		else
			if tostring(carrytype) == "1" then
				InMenuCarry = false
				CarryTypeChoosed = "type1"
				if CarryPlayer == false and CarryedPlayer == false then
					if not IsPedSittingInAnyVehicle(playerped) then
						local ClosestPlayer, distance = GetClosestPlayer()
						if ClosestPlayer ~= tonumber("-1") and distance < Config.CarryDistance then
							if Carryed == false then
								if RequestSent == false then
									RTXCARRY.TriggerServerCallback("brp2:IsPlayerCarryed", function(carrydata)		
										if carrydata == true then
											RequestSent = true
											TrajectoryShow = true
											TrajectoryPlayerHandler = ClosestPlayer		
											RequestSecondsRemaining = Config.RequestDuration
										elseif carrydata == "playercarrysomeone" then
											Notify(Language[Config.Language]["targetcarrysomeone"])
										elseif carrydata == "youarecarryed" then
											Notify(Language[Config.Language]["someonecarryou"])		
										elseif carrydata == "targetalreadycarry" then
											Notify(Language[Config.Language]["targetcarryed"])		
										elseif carrydata == "alreadysentrequest" then
											Notify(Language[Config.Language]["requestalready"])	
										elseif carrydata == "targethaverequestfromsomeone" then
											Notify(Language[Config.Language]["targethaverequest"])	
										elseif carrydata == "playerincarrymenu" then
											Notify(Language[Config.Language]["targetmenu"])	
										end
									end, GetPlayerServerId(ClosestPlayer), CarryTypeChoosed)
								else
									Notify(Language[Config.Language]["requestalready"])
								end
							else
								Notify(Language[Config.Language]["someonecarryou"])
							end
						else
							Notify(Language[Config.Language]["noplayernearby"])
						end
					else
						Notify(Language[Config.Language]["invehicle"])
					end	
				else
					Notify(Language[Config.Language]["youcarrysomeone"])
				end	
			elseif tostring(carrytype) == "2" then
				InMenuCarry = false
				CarryTypeChoosed = "type2"
				if CarryPlayer == false and CarryedPlayer == false then
					if not IsPedSittingInAnyVehicle(playerped) then
						local ClosestPlayer, distance = GetClosestPlayer()
						if ClosestPlayer ~= tonumber("-1") and distance < Config.CarryDistance then
							if Carryed == false then
								if RequestSent == false then
									RTXCARRY.TriggerServerCallback("brp2:IsPlayerCarryed", function(carrydata)		
										if carrydata == true then
											RequestSent = true
											TrajectoryShow = true
											TrajectoryPlayerHandler = ClosestPlayer		
											RequestSecondsRemaining = Config.RequestDuration
										elseif carrydata == "playercarrysomeone" then
											Notify(Language[Config.Language]["targetcarrysomeone"])
										elseif carrydata == "youarecarryed" then
											Notify(Language[Config.Language]["someonecarryou"])		
										elseif carrydata == "targetalreadycarry" then
											Notify(Language[Config.Language]["targetcarryed"])		
										elseif carrydata == "alreadysentrequest" then
											Notify(Language[Config.Language]["requestalready"])	
										elseif carrydata == "targethaverequestfromsomeone" then
											Notify(Language[Config.Language]["targethaverequest"])	
										elseif carrydata == "playerincarrymenu" then
											Notify(Language[Config.Language]["targetmenu"])	
										end
									end, GetPlayerServerId(ClosestPlayer), CarryTypeChoosed)
								else
									Notify(Language[Config.Language]["requestalready"])
								end
							else
								Notify(Language[Config.Language]["someonecarryou"])
							end
						else
							Notify(Language[Config.Language]["noplayernearby"])
						end
					else
						Notify(Language[Config.Language]["invehicle"])
					end	
				else
					Notify(Language[Config.Language]["youcarrysomeone"])
				end		
			elseif tostring(carrytype) == "3" then
				InMenuCarry = false
				CarryTypeChoosed = "type3"
				if CarryPlayer == false and CarryedPlayer == false then
					if not IsPedSittingInAnyVehicle(playerped) then
						local ClosestPlayer, distance = GetClosestPlayer()
						if ClosestPlayer ~= tonumber("-1") and distance < Config.CarryDistance then
							if Carryed == false then
								if RequestSent == false then
									RTXCARRY.TriggerServerCallback("brp2:IsPlayerCarryed", function(carrydata)		
										if carrydata == true then
											RequestSent = true
											TrajectoryShow = true
											TrajectoryPlayerHandler = ClosestPlayer		
											RequestSecondsRemaining = Config.RequestDuration
										elseif carrydata == "playercarrysomeone" then
											Notify(Language[Config.Language]["targetcarrysomeone"])
										elseif carrydata == "youarecarryed" then
											Notify(Language[Config.Language]["someonecarryou"])		
										elseif carrydata == "targetalreadycarry" then
											Notify(Language[Config.Language]["targetcarryed"])		
										elseif carrydata == "alreadysentrequest" then
											Notify(Language[Config.Language]["requestalready"])	
										elseif carrydata == "targethaverequestfromsomeone" then
											Notify(Language[Config.Language]["targethaverequest"])	
										elseif carrydata == "playerincarrymenu" then
											Notify(Language[Config.Language]["targetmenu"])	
										end
									end, GetPlayerServerId(ClosestPlayer), CarryTypeChoosed)
								else
									Notify(Language[Config.Language]["requestalready"])
								end
							else
								Notify(Language[Config.Language]["someonecarryou"])
							end
						else
							Notify(Language[Config.Language]["noplayernearby"])
						end
					else
						Notify(Language[Config.Language]["invehicle"])
					end	
				else
					Notify(Language[Config.Language]["youcarrysomeone"])
				end		
			else
				if CarryPlayer == false and CarryedPlayer == false then
					if not IsPedSittingInAnyVehicle(playerped) then
						local ClosestPlayer, distance = GetClosestPlayer()
						if ClosestPlayer ~= tonumber("-1") and distance < Config.CarryDistance then
							if Carryed == false then
								if RequestSent == false then
									RTXCARRY.TriggerServerCallback("brp2:CheckCarryStatus", function(carrydata)		
										if carrydata == true then
											InMenuCarry = true
											SetNuiFocus(true, true)
											SendNUIMessage({
												message	= "showtypes"
											})										
										elseif carrydata == "playercarrysomeone" then
											Notify(Language[Config.Language]["targetcarrysomeone"])
										elseif carrydata == "youarecarryed" then
											Notify(Language[Config.Language]["someonecarryou"])		
										elseif carrydata == "targetalreadycarry" then
											Notify(Language[Config.Language]["targetcarryed"])		
										elseif carrydata == "alreadysentrequest" then
											Notify(Language[Config.Language]["requestalready"])	
										elseif carrydata == "targethaverequestfromsomeone" then
											Notify(Language[Config.Language]["targethaverequest"])	
										elseif carrydata == "playerincarrymenu" then
											Notify(Language[Config.Language]["targetmenu"])												
										end
									end, GetPlayerServerId(ClosestPlayer))
								else
									Notify(Language[Config.Language]["requestalready"])
								end
							else
								Notify(Language[Config.Language]["someonecarryou"])
							end
						else
							Notify(Language[Config.Language]["noplayernearby"])
						end
					else
						Notify(Language[Config.Language]["invehicle"])
					end	
				else
					Notify(Language[Config.Language]["youcarrysomeone"])
				end	
			end
		end	
	end
end

if Config.CarryMarker or Config.CarryLine then
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(5)
			if TrajectoryShow == true and TrajectoryPlayerHandler then
				local PlayerSender = PlayerPedId()
				local PlayerSenderCoords = GetEntityCoords(PlayerSender)
				local PlayerReceiever = GetPlayerPed(TrajectoryPlayerHandler)
				local PlayerReceieverCoords = GetEntityCoords(PlayerReceiever)
				local distance = #(PlayerSenderCoords - PlayerReceieverCoords)
				local rainbow = RGBRainbow(1)
				if PlayerReceiever then
					if distance < Config.CarryDistanceDraw then
						if Config.CarryMarker then
							DrawMarker(2, PlayerReceieverCoords.x, PlayerReceieverCoords.y, PlayerReceieverCoords.z+tonumber("1.0"), tonumber("0.0"), tonumber("0.0"), tonumber("0.0"), 0, tonumber("0.0"), tonumber("0.0"), tonumber("0.3"), tonumber("0.3"), tonumber("0.3"), rainbow.r, rainbow.g, rainbow.b, 255, false, true, 2, false, false, false, false)
						end
						if Config.CarryLine then
							DrawLine(PlayerSenderCoords.x, PlayerSenderCoords.y, PlayerSenderCoords.z, PlayerReceieverCoords.x, PlayerReceieverCoords.y, PlayerReceieverCoords.z, rainbow.r, rainbow.g, rainbow.b, 255)
						end
					end
				end
			else
				Citizen.Wait(1000)
			end
		end
	end)
end

if Config.CarryMarker or Config.CarryLine then
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(5)
			if TrajectoryShowReceiever == true and TrajectoryPlayerHandlerReceiever then
				local PlayerSender = PlayerPedId()
				local PlayerSenderCoords = GetEntityCoords(PlayerSender)
				local PlayerReceiever = GetPlayerFromServerId(TrajectoryPlayerHandlerReceiever)
				local PlayerReceieverPed = GetPlayerPed(PlayerReceiever)
				local PlayerReceieverCoords = GetEntityCoords(PlayerReceieverPed)
				local distance = #(PlayerSenderCoords - PlayerReceieverCoords)
				local rainbow = RGBRainbow(1)
				if PlayerReceiever then
					if distance < Config.CarryDistanceDraw then
						if Config.CarryMarker then
							DrawMarker(2, PlayerReceieverCoords.x, PlayerReceieverCoords.y, PlayerReceieverCoords.z+tonumber("1.0"), tonumber("0.0"), tonumber("0.0"), tonumber("0.0"), 0, tonumber("0.0"), tonumber("0.0"), tonumber("0.3"), tonumber("0.3"), tonumber("0.3"), rainbow.r, rainbow.g, rainbow.b, 255, false, true, 2, false, false, false, false)
						end
						if Config.CarryLine then
							DrawLine(PlayerSenderCoords.x, PlayerSenderCoords.y, PlayerSenderCoords.z, PlayerReceieverCoords.x, PlayerReceieverCoords.y, PlayerReceieverCoords.z, rainbow.r, rainbow.g, rainbow.b, 255)
						end
					end
				end
			else
				Citizen.Wait(1000)
			end
		end
	end)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if TrajectoryShow == true and TrajectoryPlayerHandler and RequestSecondsRemaining > 0 then
			RequestSecondsRemaining = RequestSecondsRemaining-tonumber("1")
			SendNUIMessage({
				message	= "showcarryrequestrequester",
				remainingseconds = RequestSecondsRemaining
			})			
			if RequestSecondsRemaining == 0 then
				TriggerServerEvent("brp2:CancelCarryRequestReceiever", GetPlayerServerId(TrajectoryPlayerHandler))
				RequestSent = false
				TrajectoryShow = false
				TrajectoryPlayerHandler = nil	
				SendNUIMessage({
					message	= "hide"
				})						
			end
		else
			Citizen.Wait(1000)
		end
	end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
		if CarryPlayer == true then
			if CarryedPlayerHandler ~= nil then
				local PlayerSender = PlayerPedId()
				local PlayerReceiever = GetPlayerFromServerId(CarryedPlayerHandler)
				local PlayerReceieverPed = GetPlayerPed(PlayerReceiever)		
				if CarryTypeChoosed == "type1" then
					if not IsEntityPlayingAnim(PlayerSender, "missfinale_c2mcs_1", "fin_c2_mcs_1_camman", 3) then
						TaskPlayAnim(PlayerSender, "missfinale_c2mcs_1", "fin_c2_mcs_1_camman", tonumber("8.0"), tonumber("-8.0"), 100000, 49, 0, false, false, false)
					end
					if not IsEntityPlayingAnim(PlayerReceieverPed, "nm", "firemans_carry", 3) then
						TaskPlayAnim(PlayerReceieverPed, "nm", "firemans_carry", tonumber("8.0"), tonumber("-8.0"), 100000, 33, 0, false, false, false)
					end
				elseif CarryTypeChoosed == "type2" then
					if not IsEntityPlayingAnim(PlayerSender, "anim@heists@box_carry@", "idle", 3) then
						TaskPlayAnim(PlayerSender, "anim@heists@box_carry@", "idle", tonumber("8.0"), tonumber("-8.0"), 100000, 49, 0, false, false, false)
					end
					if not IsEntityPlayingAnim(PlayerReceieverPed, "amb@code_human_in_car_idles@generic@ps@base", "base", 3) then
						TaskPlayAnim(PlayerReceieverPed, "amb@code_human_in_car_idles@generic@ps@base", "base", tonumber("8.0"), tonumber("-8.0"), 100000, 33, 0, false, false, false)
					end			
				elseif CarryTypeChoosed == "type3" then
					if not IsEntityPlayingAnim(PlayerSender, "anim@arena@celeb@flat@paired@no_props@", "piggyback_c_player_a", 3) then
						TaskPlayAnim(PlayerSender, "anim@arena@celeb@flat@paired@no_props@", "piggyback_c_player_a", tonumber("8.0"), tonumber("-8.0"), 100000, 49, 0, false, false, false)
					end
					if not IsEntityPlayingAnim(PlayerReceieverPed, "anim@arena@celeb@flat@paired@no_props@", "piggyback_c_player_b", 3) then
						TaskPlayAnim(PlayerReceieverPed, "anim@arena@celeb@flat@paired@no_props@", "piggyback_c_player_b", tonumber("8.0"), tonumber("-8.0"), 100000, 33, 0, false, false, false)
					end			
				end
			end
		elseif CarryedPlayer == true then
			if CarryedPlayerHandler ~= nil then
				local PlayerSender = PlayerPedId()
				local PlayerReceiever = GetPlayerFromServerId(CarryedPlayerHandler)
				local PlayerReceieverPed = GetPlayerPed(PlayerReceiever)			
				if CarryTypeChoosed == "type1" then
					if not IsEntityAttachedToEntity(PlayerReceieverPed, PlayerSender) then
						AttachEntityToEntity(PlayerSender, PlayerReceieverPed, 0, tonumber("0.30"), tonumber("0.16"), tonumber("0.65"), tonumber("0.5"), tonumber("0.5"), 180, false, false, false, false, 2, false)	
					end
				elseif CarryTypeChoosed == "type2" then
					if not IsEntityAttachedToEntity(PlayerReceieverPed, PlayerSender) then
						AttachEntityToEntity(PlayerSender, PlayerReceieverPed, 9816, tonumber("0.02"), tonumber("0.4"), tonumber("0.10"), tonumber("0.10"), tonumber("0.30"), tonumber("90.0"), false, false, false, false, 2, false)	
					end			
				elseif CarryTypeChoosed == "type3" then
					if not IsEntityAttachedToEntity(PlayerReceieverPed, PlayerSender) then
						AttachEntityToEntity(PlayerSender, PlayerReceieverPed, 0, tonumber("0.0"), tonumber("-0.07"), tonumber("0.45"), tonumber("0.5"), tonumber("0.5"), 180, false, false, false, false, 2, false)
					end			
				end
			end
		else
			Citizen.Wait(1000)
		end
	end
end)	

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if CarryedPlayer == true then
			DisableAllControlActions(tonumber("0"))
			EnableControlAction(tonumber("0"), tonumber("245"), true)
			EnableControlAction(tonumber("0"), tonumber("38"), true)
			EnableControlAction(tonumber("0"), tonumber("1"), true)
			EnableControlAction(tonumber("0"), tonumber("2"), true)			
		else
			Citizen.Wait(1000)
		end
	end
end)	

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(3000)
		local playerid = PlayerId()
		local dead = IsPlayerDead(playerid)
		if dead == 1 then
			if InMenuCarry == true then
				TriggerServerEvent("brp2:CarryMenuClosed")
				SetNuiFocus(false, false)
				SendNUIMessage({message = "hide"})
			end
			if TrajectoryShow == true and TrajectoryPlayerHandler then	
				TriggerServerEvent("brp2:CancelCarryRequestReceiever", GetPlayerServerId(TrajectoryPlayerHandler))
				RequestSent = false
				TrajectoryShow = false
				TrajectoryPlayerHandler = nil	
				SendNUIMessage({
					message	= "hide"
				})						
			end
			local playerped = PlayerPedId()
			if CarryPlayer == true then
				local PlayerReceiever = GetPlayerFromServerId(CarryedPlayerHandler)
				local PlayerReceieverPed = GetPlayerPed(PlayerReceiever)				
				CarryPlayer = false
				if CarryedPlayerHandler ~= nil then
					ClearPedTasks(PlayerReceieverPed)
				end
				TriggerServerEvent("brp2:DisableCarryServer")
				CarryedPlayerHandler = nil
				DetachEntity(playerped, true, false)
				ClearPedTasks(playerped)		
			end
		end
	end
end)	


RegisterCommand("aggrecarry", function()
	if TrajectoryPlayerHandlerReceiever then
		local PlayerSender = PlayerPedId()
		local PlayerSenderCoords = GetEntityCoords(PlayerSender)
		local PlayerReceiever = GetPlayerFromServerId(TrajectoryPlayerHandlerReceiever)
		local PlayerReceieverPed = GetPlayerPed(PlayerReceiever)
		local PlayerReceieverCoords = GetEntityCoords(PlayerReceieverPed)
		local distance = #(PlayerSenderCoords - PlayerReceieverCoords)	
		if distance < Config.CarryDistance then
			ClearPedTasks(PlayerSender)
			for i, animations in ipairs(animationscarry) do
				while not HasAnimDictLoaded(animations.animdict) do
					RequestAnimDict(animations.animdict)
					Citizen.Wait(5)
				end			
			end			
			if CarryTypeChoosed == "type1" then
				AttachEntityToEntity(PlayerSender, PlayerReceieverPed, 0, tonumber("0.30"), tonumber("0.16"), tonumber("0.65"), tonumber("0.5"), tonumber("0.5"), 180, false, false, false, false, 2, false)	
				if not IsEntityPlayingAnim(PlayerReceieverPed, "missfinale_c2mcs_1", "fin_c2_mcs_1_camman", 3) then
					TaskPlayAnim(PlayerReceieverPed, "missfinale_c2mcs_1", "fin_c2_mcs_1_camman",  tonumber("8.0"), tonumber("-8.0"), 100000, 49, 0, false, false, false)
				end
				if not IsEntityPlayingAnim(PlayerSender, "nm", "firemans_carry", 3) then
					TaskPlayAnim(PlayerSender, "nm", "firemans_carry",  tonumber("8.0"), tonumber("-8.0"), 100000, 33, 0, false, false, false)
				end					
			elseif CarryTypeChoosed == "type2" then
				AttachEntityToEntity(PlayerSender, PlayerReceieverPed, 9816, tonumber("0.02"), tonumber("0.4"), tonumber("0.10"), tonumber("0.10"), tonumber("0.30"), tonumber("90.0"), false, false, false, false, 2, false)
				if not IsEntityPlayingAnim(PlayerReceieverPed, "anim@heists@box_carry@", "idle", 3) then
					TaskPlayAnim(PlayerReceieverPed, "anim@heists@box_carry@", "idle",  tonumber("8.0"), tonumber("-8.0"), 100000, 49, 0, false, false, false)
				end
				if not IsEntityPlayingAnim(PlayerSender, "amb@code_human_in_car_idles@generic@ps@base", "base", 3) then
					TaskPlayAnim(PlayerSender, "amb@code_human_in_car_idles@generic@ps@base", "base",  tonumber("8.0"), tonumber("-8.0"), 100000, 33, 0, false, false, false)
				end					
			elseif CarryTypeChoosed == "type3" then
				AttachEntityToEntity(PlayerSender, PlayerReceieverPed, 0, tonumber("0.0"), tonumber("-0.07"), tonumber("0.45"), tonumber("0.5"), tonumber("0.5"), 180, false, false, false, false, 2, false)
				if not IsEntityPlayingAnim(PlayerReceieverPed, "anim@arena@celeb@flat@paired@no_props@", "piggyback_c_player_a", 3) then
					TaskPlayAnim(PlayerReceieverPed, "anim@arena@celeb@flat@paired@no_props@", "piggyback_c_player_a",  tonumber("8.0"), tonumber("-8.0"), 100000, 49, 0, false, false, false)
				end
				if not IsEntityPlayingAnim(PlayerSender, "anim@arena@celeb@flat@paired@no_props@", "piggyback_c_player_b", 3) then
					TaskPlayAnim(PlayerSender, "anim@arena@celeb@flat@paired@no_props@", "piggyback_c_player_b", tonumber("8.0"), tonumber("-8.0"), 100000, 33, 0, false, false, false)
				end					
			end			
			CarryedPlayerHandler = TrajectoryPlayerHandlerReceiever
			TriggerServerEvent("brp2:CancelCarryRequestReceieverAccept", TrajectoryPlayerHandlerReceiever)
			TrajectoryShowReceiever = false
			TrajectoryPlayerHandlerReceiever = nil
			if Config.CarryInterfaceWhileCarryed then
				SendNUIMessage({
					message	= "showcarryed"
				})
			end
			CarryedPlayer = true
		else
			Notify(Language[Config.Language]["norequestdistance"])
		end
	end
end)

RegisterCommand("declinecarry", function()
	if TrajectoryPlayerHandlerReceiever then
		TriggerServerEvent("brp2:CancelCarryRequestReceieverDecline", TrajectoryPlayerHandlerReceiever)
		TrajectoryShowReceiever = false
		TrajectoryPlayerHandlerReceiever = nil
		SendNUIMessage({
			message	= "hide"
		})					
	end
end)

RegisterKeyMapping("aggrecarry", Language[Config.Language]["agreecarry"], "keyboard", Config.DefaultKeyBindAccept)

RegisterKeyMapping("declinecarry", Language[Config.Language]["declinecarry"], "keyboard", Config.DefaultKeyBindDecline)