local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168,["F11"] = 344, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
  }

ESX = nil
isSmokeMouth = false
isSmokeHand = false

p_smoke_particle = "exp_grd_bzgas_smoke"
p_smoke_particle_asset = "core" 

p_smokecigarette_particle = "exp_grd_bzgas_smoke"
p_smokecigarette_particle_asset = "core" 

p_smokemouth_particle = "exp_grd_bzgas_smoke"
p_smokemouth_particle_asset = "core" 

p_fire_particle = "ent_amb_torch_fire"
p_fire_particle_asset = "core" 

cigaratte_name = cigaratte_name or 'ng_proc_cigarette01a'
cigarettenolight_name = cigarettenolight_name or 'prop_amb_ciggy_01'
cigarettepack_name = cigarettepack_name or 'prop_cigar_pack_01'
light_name = light_name or 'ex_prop_exec_lighter_01'

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(7)
    end
end)


RegisterNetEvent('brp_play:CigarettesLightingAnim')
AddEventHandler('brp_play:CigarettesLightingAnim', function(source)
	local playerPed = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(playerPed))
	if isSmokeJointHand == true or isSmokeHand == true or isSmokeCigarHand == true or isSmokeMouth == true or isSmokeCigarMouth == true or isSmokeJointMouth == true then
		exports['mythic_notify']:DoHudText('inform', _U('already_have'))
	  else


	playAnim('amb@world_human_smoking@male@male_a@enter', 'enter', 1800)
	Citizen.Wait(1000)
	cigarettenolight = CreateObject(GetHashKey(cigarettenolight_name), x, y, z+0.9,  true,  true, true)
	AttachEntityToEntity(cigarettenolight, playerPed, GetPedBoneIndex(playerPed, 64097), 0.020, 0.02, -0.008, 100.0, 0.0, 100.0, true, true, false, true, 1, true)
			Citizen.Wait(800)

	light = CreateObject(GetHashKey(light_name), x, y, z+0.9,  true,  true, true)
	AttachEntityToEntity(light, playerPed, GetPedBoneIndex(playerPed, 4089), 0.020, -0.03, -0.010, 100.0, 0.0, 150.0, true, true, false, true, 1, true)

			playAnim('misscarsteal2peeing', 'peeing_loop', 2000)
			Citizen.Wait(800)
			TriggerServerEvent("brp_play:eff_lighter", ObjToNet(light))
			Citizen.Wait(1000)
			DetachEntity(cigarettenolight, 1, 1)
			DeleteObject(cigarettenolight)

			cigaratte = CreateObject(GetHashKey(cigaratte_name), x, y, z+0.9,  true,  true, true)
			AttachEntityToEntity(cigaratte, playerPed, GetPedBoneIndex(playerPed, 64097), 0.020, 0.02, -0.008, 100.0, 0.0, 100.0, true, true, false, true, 1, true)

			isSmokeHand = true
			isSmokeMouth = false
			Citizen.Wait(1000)
			DetachEntity(light, 1, 1)
			DeleteObject(light)
			TriggerServerEvent("brp_play:eff_cigarette", ObjToNet(cigaratte))
	  end
end)

RegisterNetEvent('brp_play:CigarettesPackAnim')
AddEventHandler('brp_play:CigarettesPackAnim', function(source)
	local playerPed = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(playerPed))

	playAnim('amb@world_human_smoking@male@male_a@enter', 'enter', 1000)
	Citizen.Wait(800)
	pack = CreateObject(GetHashKey(cigarettepack_name), x, y, z+0.9,  true,  true, true)
	AttachEntityToEntity(pack, playerPed, GetPedBoneIndex(playerPed, 64016), 0.020, -0.05, -0.010, 100.0, 0.0, 0.0, true, true, false, true, 1, true)

		playAnim('mp_arresting', 'a_uncuff', 3000)
		Citizen.Wait(3000)
		playAnim('random@hitch_lift', 'idle_f', 250)
			Citizen.Wait(250)
		DetachEntity(pack, 1, 1)
	Citizen.Wait(2000)
	DeleteObject(pack)
end)

RegisterNetEvent('brp_play:CigaretteMouth')
AddEventHandler('brp_play:CigaretteMouth', function(source)
	local playerPed = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(playerPed))

			playAnim('move_p_m_two_idles@generic', 'fidget_sniff_fingers', 1000)
			Citizen.Wait(800)
		
			AttachEntityToEntity(cigaratte, playerPed, GetPedBoneIndex(playerPed, 47419), 0.015, -0.009, 0.003, 55.0, 0.0, 110.0, true, true, false, true, 1, true)
			isSmokeHand = false
			isSmokeMouth = true
end)

RegisterNetEvent('brp_play:CigaretteHand')
AddEventHandler('brp_play:CigaretteHand', function(source)
	local playerPed = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(playerPed))

			playAnim('move_p_m_two_idles@generic', 'fidget_sniff_fingers', 1000)
			Citizen.Wait(1100)
		
			AttachEntityToEntity(cigaratte, playerPed, GetPedBoneIndex(playerPed, 64097), 0.020, 0.02, -0.008, 100.0, 0.0, 100.0, true, true, false, true, 1, true)
			isSmokeHand = true
			isSmokeMouth = false
end)



RegisterNetEvent("brp_play:c_eff_lighter")
AddEventHandler("brp_play:c_eff_lighter", function(light)
	createdLighter = UseParticleFxAssetNextCall(p_fire_particle_asset)
	createdPartLighter = StartParticleFxLoopedOnEntity(p_fire_particle, NetToPed(light), 0.0, 0.0, 0.050, 0.0, 0.0, 0.0, 0.03, 0.0, 0.0, 0.0)
	Wait(1200)
	while DoesParticleFxLoopedExist(createdLighter) do
		StopParticleFxLooped(createdLighter, 1)
	  Wait(0)
	end
	while DoesParticleFxLoopedExist(createdPartLighter) do
		StopParticleFxLooped(createdPartLighter, 1)
	  Wait(0)
	end
	while DoesParticleFxLoopedExist(p_fire_particle) do
		StopParticleFxLooped(p_fire_particle, 1)
	  Wait(0)
	end
	while DoesParticleFxLoopedExist(p_fire_particle_asset) do
		StopParticleFxLooped(p_fire_particle_asset, 1)
	  Wait(0)
	end 
	Wait(1900)
			RemoveParticleFxFromEntity(light)
end)

RegisterNetEvent("brp_play:c_eff_cigarette")
AddEventHandler("brp_play:c_eff_cigarette", function(cigaratte)
	createdCigarette = UseParticleFxAssetNextCall(p_smokecigarette_particle_asset)
	createdPartCigarette = StartParticleFxLoopedOnEntity(p_smokecigarette_particle, NetToPed(cigaratte), -0.050, 0.0, 0.0, 0.0, 0.0, 0.0, Config.SmokeSizeCigarette, 0.0, 0.0, 0.0)
	Wait(Config.CigaretteSmokingTime)
	while DoesParticleFxLoopedExist(createdCigarette) do
		StopParticleFxLooped(createdCigarette, 1)
	  Wait(0)
	end
	while DoesParticleFxLoopedExist(createdPartCigarette) do
		StopParticleFxLooped(createdPartCigarette, 1)
	  Wait(0)
	end
	while DoesParticleFxLoopedExist(p_smokecigarette_particle) do
		StopParticleFxLooped(p_smokecigarette_particle, 1)
	  Wait(0)
	end
	while DoesParticleFxLoopedExist(p_smokecigarette_particle_asset) do
		StopParticleFxLooped(p_smokecigarette_particle_asset, 1)
	  Wait(0)
	end 
	if Config.CancelSmoke then
	Wait(1000)
		SmokeDone()
	end
end)


RegisterNetEvent("brp_play:c_eff_smokes")
AddEventHandler("brp_play:c_eff_smokes", function(c_ped)
	local ped = GetPlayerPed(-1)

		Citizen.Wait(4000)
		createdSmoke = UseParticleFxAssetNextCall(p_smoke_particle_asset)
		createdPart = StartParticleFxLoopedOnEntityBone(p_smoke_particle, NetToPed(c_ped), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, GetPedBoneIndex(NetToPed(c_ped), 20279), Config.SmokeMouth, 0.0, 0.0, 0.0)
		Wait(Config.CigaretteHangTime)
			while DoesParticleFxLoopedExist(createdSmoke) do
				StopParticleFxLooped(createdSmoke, 1)
			  Wait(0)
			end
			while DoesParticleFxLoopedExist(createdPart) do
				StopParticleFxLooped(createdPart, 1)
			  Wait(0)
			end
			while DoesParticleFxLoopedExist(p_smoke_particle) do
				StopParticleFxLooped(p_smoke_particle, 1)
			  Wait(0)
			end
			while DoesParticleFxLoopedExist(p_smoke_particle_asset) do
				StopParticleFxLooped(p_smoke_particle_asset, 1)
			  Wait(0)
			end
			Wait(Config.CigaretteHangTime*3)
			RemoveParticleFxFromEntity(playerPed)
	end)

RegisterNetEvent("brp_play:c_eff_smokes_mouth")
AddEventHandler("brp_play:c_eff_smokes_mouth", function(c_ped)
	local ped = GetPlayerPed(-1)

		Citizen.Wait(2000)
		createdSmokeMouth = UseParticleFxAssetNextCall(p_smokemouth_particle_asset)
		createdPartMouth = StartParticleFxLoopedOnEntityBone(p_smokemouth_particle, NetToPed(c_ped), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, GetPedBoneIndex(NetToPed(c_ped), 20279), Config.SmokeMouth, 0.0, 0.0, 0.0)
		Wait(Config.CigaretteHangTime)
			while DoesParticleFxLoopedExist(createdSmokeMouth) do
				StopParticleFxLooped(createdSmokeMouth, 1)
			  Wait(0)
			end
			while DoesParticleFxLoopedExist(createdPartMouth) do
				StopParticleFxLooped(createdPartMouth, 1)
			  Wait(0)
			end
			while DoesParticleFxLoopedExist(p_smokemouth_particle) do
				StopParticleFxLooped(p_smokemouth_particle, 1)
			  Wait(0)
			end
			while DoesParticleFxLoopedExist(p_smokemouth_particle_asset) do
				StopParticleFxLooped(p_smokemouth_particle_asset, 1)
			  Wait(0)
			end
			Wait(Config.CigaretteHangTime*3)
			RemoveParticleFxFromEntity(playerPed)
	end)

	function SmokeDone()
		local playerPed = PlayerPedId()
			if isSmokeMouth == true then

			playAnim('move_p_m_two_idles@generic', 'fidget_sniff_fingers', 1000)
				Citizen.Wait(1000)
					AttachEntityToEntity(cigaratte, playerPed, GetPedBoneIndex(playerPed, 64097), 0.020, 0.02, -0.008, 100.0, 0.0, 100.0, true, true, false, true, 1, true)
					Citizen.Wait(1000)
					playAnim('random@hitch_lift', 'idle_f', 250)
					Citizen.Wait(250)
					DetachEntity(cigaratte, 1, 1)
					isSmokeHand = false
					Citizen.Wait(2000)
					DeleteObject(cigaratte)
					RemoveParticleFxFromEntity(cigaratte)
					isSmokeMouth = false
			else

			playAnim('random@hitch_lift', 'idle_f', 250)
				Citizen.Wait(250)
					DetachEntity(cigaratte, 1, 1)
					isSmokeHand = false
					Citizen.Wait(2000)
					DeleteObject(cigaratte)
					RemoveParticleFxFromEntity(cigaratte)
					isSmokeMouth = false
			end
	end

Citizen.CreateThread(function(source)
	
	while true do
		Citizen.Wait(7)
		 if isSmokeMouth then
			local playerPed = PlayerPedId()
			ESX.ShowHelpNotification(_U('Ciggaret_mouth'))
			if IsEntityInWater(playerPed) then
				Citizen.Wait(800)
				SmokeDone()
			else
			if IsControlJustPressed(0, Config.Smoke) then
				local ped = GetPlayerPed(-1)
				TriggerServerEvent("brp_play:eff_smokes_mouth", PedToNet(ped))
				Citizen.Wait(2200)
			elseif IsControlJustPressed(0, Config.Throw) then
				if IsPedInAnyVehicle(playerPed, true) then
					playAnim('move_p_m_two_idles@generic', 'fidget_sniff_fingers', 1000)
					Citizen.Wait(1000)
						AttachEntityToEntity(cigaratte, playerPed, GetPedBoneIndex(playerPed, 64097), 0.020, 0.02, -0.008, 100.0, 0.0, 100.0, true, true, false, true, 1, true)
						Citizen.Wait(250)
						DetachEntity(cigaratte, 1, 1)
						isSmokeHand = false
						DeleteObject(cigaratte)
						RemoveParticleFxFromEntity(cigaratte)
						isSmokeMouth = false
					else
					SmokeDone()
				end
			elseif IsControlJustPressed(0, Config.Mouth) then
					TriggerEvent('brp_play:CigaretteHand')
				end
			end
		else
			Wait(500)
		end
	end
end)


Citizen.CreateThread(function(source)
	while true do
		Citizen.Wait(7)
		 if isSmokeHand then

			local playerPed = PlayerPedId()
			ESX.ShowHelpNotification(_U('Ciggaret_hand'))
			if IsPedInAnyVehicle(playerPed, true) then
				local playerVeh = GetVehiclePedIsIn(playerPed, false)
				RollDownWindow(playerVeh, 0)
				Citizen.Wait(1500)
			TriggerEvent('brp_play:CigaretteMouth')
			else
				if IsEntityInWater(playerPed) then
					Citizen.Wait(800)
					SmokeDone()
				else
			if IsControlJustPressed(0, Config.Smoke) then
				local ped = GetPlayerPed(-1)
				playAnim('amb@world_human_aa_smoke@male@idle_a', 'idle_a', 2800)
				TriggerServerEvent("brp_play:eff_smokes", PedToNet(ped))
				Citizen.Wait(4500)
			elseif IsControlJustPressed(0, Config.Throw) then
				SmokeDone()
			elseif IsControlJustPressed(0, Config.inHand) then
				TriggerEvent('brp_play:CigaretteMouth')
				end
			end
		end
			else
				Wait(500)
		end
	end
end)

function playAnim(animDict, animName, duration)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do Citizen.Wait(0) end
	TaskPlayAnim(GetPlayerPed(-1), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
	RemoveAnimDict(animDict)
end

