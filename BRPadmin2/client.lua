ESX = nil
local pos_before_assist,assisting,assist_target,last_assist,IsFirstSpawn = nil, false, nil, nil, true

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	SetNuiFocus(false, false)
end)

RegisterNUICallback("ban", function(data,cb)
	if not data.target or not data.reason then return end
	ESX.TriggerServerCallback("brp_ban:ban",function(success,reason)
		if success then ESX.ShowNotification("~g~Successfully banned player") else ESX.ShowNotification(reason) end 
	end, data.target, data.reason, data.length, data.offline)
end)

RegisterNUICallback("warn", function(data,cb)
	if not data.target or not data.message then return end
	ESX.TriggerServerCallback("brp_ban:warn",function(success)
		if success then ESX.ShowNotification("~g~Successfully warned player") else ESX.ShowNotification("~r~Something went wrong") end
	end, data.target, data.message, data.anon)
end)

RegisterNUICallback("unban", function(data,cb)
	if not data.id then return end
	ESX.TriggerServerCallback("brp_ban:unban",function(success)
		if success then ESX.ShowNotification("~g~Successfully unbanned player") else ESX.ShowNotification("~r~Something went wrong") end
	end, data.id)
end)

RegisterNUICallback("getListData", function(data,cb)
	if not data.list or not data.page then cb(nil); return end
	ESX.TriggerServerCallback("brp_ban:getListData",function(data)
		cb(data)
	end, data.list, data.page)
end)

RegisterNUICallback("hidecursor", function(data,cb)
	SetNuiFocus(false, false)
end)

AddEventHandler("playerSpawned", function(spawn)
    if IsFirstSpawn and Config.backup_kick_method then
        TriggerServerEvent("brp_ban:backupcheck")
        IsFirstSpawn = false
    end
end)

RegisterNetEvent("brp_ban:gotBanned")
AddEventHandler("brp_ban:gotBanned",function(rsn)
	Citizen.CreateThread(function()
		local scaleform = RequestScaleformMovie("mp_big_message_freemode")
		while not HasScaleformMovieLoaded(scaleform) do Citizen.Wait(0) end
		BeginScaleformMovieMethod(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
		PushScaleformMovieMethodParameterString("~r~BANNED")
		PushScaleformMovieMethodParameterString(rsn)
		PushScaleformMovieMethodParameterInt(5)
		EndScaleformMovieMethod()
		PlaySoundFrontend(-1, "LOSER", "HUD_AWARDS")
		ClearDrawOrigin()
		ESX.UI.HUD.SetDisplay(0)
		while true do
			Citizen.Wait(0)
			DisableAllControlActions(0)
			DisableFrontendThisFrame()
			local ped = GetPlayerPed(-1)
			ESX.UI.Menu.CloseAll()
			SetEntityCoords(ped, 0, 0, 0, 0, 0, 0, false)
			FreezeEntityPosition(ped, true)
			DrawRect(0.0,0.0,2.0,2.0,0,0,0,255)
			DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
		end
		SetScaleformMovieAsNoLongerNeeded(scaleform)
	end)
end)

RegisterNetEvent("brp_ban:receiveWarn")
AddEventHandler("brp_ban:receiveWarn",function(sender,message)
	TriggerEvent("chat:addMessage",{color={255,255,0},multiline=true,args={"BRP","You received a warning"..(sender~="" and " from "..sender or "").."!\n-> "..message}})
	Citizen.CreateThread(function()
		local scaleform = RequestScaleformMovie("mp_big_message_freemode")
		while not HasScaleformMovieLoaded(scaleform) do Citizen.Wait(0) end
		BeginScaleformMovieMethod(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
		PushScaleformMovieMethodParameterString("~y~WARNING")
		PushScaleformMovieMethodParameterString(message)
		PushScaleformMovieMethodParameterInt(5)
		EndScaleformMovieMethod()
		PlaySoundFrontend(-1, "LOSER", "HUD_AWARDS")
		local drawing = true
		Citizen.SetTimeout((Config.warning_screentime * 1000),function() drawing = false end)
		while drawing do
			Citizen.Wait(0)
			DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
		end
		SetScaleformMovieAsNoLongerNeeded(scaleform)
	end)
end)

RegisterNetEvent("brp_ban:requestedAssist")
AddEventHandler("brp_ban:requestedAssist",function(tn,t)
	--SendNUIMessage({show=true,window="assistreq",template=Config.popassistformat,data={tn,t}})
	last_assist=t
end)

RegisterNetEvent("brp_ban:acceptedAssist")
AddEventHandler("brp_ban:acceptedAssist",function(t,pos)
	if assisting then return end
	local target = GetPlayerFromServerId(t)
	if target then
		if not pos then pos = NetworkGetPlayerCoords(target) end
		local ped = GetPlayerPed(-1)
		pos_before_assist = GetEntityCoords(ped)
		assisting = true
		assist_target = t
		ESX.Game.Teleport(ped,pos+vector3(0,0.5,0))
		ExecuteCommand("staff")
	end
end)

RegisterNetEvent("brp_ban:assistDone")
AddEventHandler("brp_ban:assistDone",function()
	if assisting then
		assisting = false
		if pos_before_assist~=nil then ESX.Game.Teleport(GetPlayerPed(-1),pos_before_assist+vector3(0,0.5,0)); pos_before_assist = nil end
		assist_target = nil
		ExecuteCommand("staff")
	end
end)

RegisterNetEvent("brp_ban:hideAssistPopup")
AddEventHandler("brp_ban:hideAssistPopup",function(t)
	SendNUIMessage({hide=true})
	last_assist=nil
end)

RegisterNetEvent("brp_ban:showWindow")
AddEventHandler("brp_ban:showWindow",function(win)
	if win=="ban" or win=="warn" then
		ESX.TriggerServerCallback("brp_ban:getIndexedPlayerList",function(indexedPList)
			SendNUIMessage({show=true,window=win,players=indexedPList})
		end)
	elseif win=="banlist" or win=="warnlist" then
		SendNUIMessage({loading=true,window=win})
		ESX.TriggerServerCallback(win=="banlist" and "brp_ban:getBanList" or "brp_ban:getWarnList",function(list,pages)
			SendNUIMessage({show=true,window=win,list=list,pages=pages})
		end)
	end
	SetNuiFocus(true, true)
end)

RegisterCommand("decassist",function(a,b,c)
	TriggerEvent("brp_ban:hideAssistPopup")
end, false)

if Config.assist_keys.enable then
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)
			if IsControlJustPressed(0, Config.assist_keys.accept) then
				if not NetworkIsPlayerActive(GetPlayerFromServerId(last_assist)) then
					last_assist = nil
				else
					TriggerServerEvent("brp_ban:acceptAssistKey",last_assist)
				end
			end
			if IsControlJustPressed(0, Config.assist_keys.decline) then
				TriggerEvent("brp_ban:hideAssistPopup")
			end
		end
	end)
end

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/decassist', 'Hide assist popup',{})
    TriggerEvent('chat:addSuggestion', '/assist', 'Request help from admins',{{name="Reason", help="Why do you need help?"}})
    TriggerEvent('chat:addSuggestion', '/cassist', 'Cancel your pending help request',{})
    TriggerEvent('chat:addSuggestion', '/finassist', 'Finish assist and tp back',{})
    TriggerEvent('chat:addSuggestion', '/accassist', 'Accept a players help request', {{name="Player ID", help="ID of the player you want to help"}})
end)
