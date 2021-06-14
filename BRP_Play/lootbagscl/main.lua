ESX = nil
local PlayerData              	= {}
local kuprine = false
local SpawnObject

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()


	while true do

		Citizen.Wait(1000)


	    for _,v in pairs(loot) do

			
			playerCoords = GetEntityCoords(PlayerPedId(), true)	

	        if GetDistanceBetweenCoords(playerCoords, v.x, v.y, v.z, true)  < Config.LootSpawnDistance then

				ESX.TriggerServerCallback('Florentinas:isActive', function(isActive)

					if isActive < 1 and not kuprine  then	
						    searchableProp = LootBag[math.random(1, #LootBag)]
				            local HashKey = GetHashKey(searchableProp)
							TriggerServerEvent('Florentinas:registerActivity', 1)
				            local SpawnObject = CreateObject(HashKey, v.x , v.y , v.z)
							
				            PlaceObjectOnGroundProperly(SpawnObject)

							if Config.LootBlips then

						          BotaiBlip = AddBlipForEntity(SpawnObject)
						          SetBlipSprite(BotaiBlip, 1)
						          BeginTextCommandSetBlipName("STRING")
						          AddTextComponentString(Config.LootBlipName)
						          EndTextCommandSetBlipName(BotaiBlip) 
						          SetBlipColour(BotaiBlip, 1) 
								  

							end
							
							kuprine = true
				            while true do

							Citizen.Wait(0)
				        				               
				               playerX, playerY, playerZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
				               pedX, pedY, pedZ = table.unpack(GetEntityCoords(SpawnObject, true))
				            		   
				                if (Vdist(playerX, playerY, playerZ, pedX, pedY, pedZ) < 1.5)then
												             
				            		ESX.Game.Utils.DrawText3D({x = pedX, y = pedY, z = pedZ + 0.2}, Config.LootText, 0.8, 4)

									if not IsPedInAnyVehicle(PlayerPedId(), false) then
				            	 
				            			if IsControlJustPressed(0, 38)  then
				            			
											
											Animation()	
											
											Citizen.Wait(11000)
                                        				            									 
				            			end
									end

									if Istrinti then
										SetModelAsNoLongerNeeded(SpawnObject)
										DeleteObject(SpawnObject)
										
										Istrinti = false
									end																						
								
								
				                end

				            end 
					end

				end)

														
			end
			
			 		
	    end
	 			
	end

end)




RegisterNetEvent('Florentinas:Istrinti')
AddEventHandler('Florentinas:Istrinti', function()
	Istrinti = true
end)	



function  Animation()

	ClearPedTasks(PlayerPedId())

				TriggerEvent("mythic_progbar:client:progress", {
					name = "unique_action_name",
					duration = 10000,
					label = "",
					useWhileDead = false,
					canCancel = true,
					controlDisables = {
						disableMovement = true,
						disableCarMovement = true,
						disableMouse = false,
						disableCombat = true,
						},
					   animation = {
						   
						animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
						anim = "machinic_loop_mechandplayer",
				   },                                    								
					}, function(status)
						if not status then
							-- Do Something If Event Wasn't Cancelled
						end
						
						
						Item()						
						
				end)



end 


Citizen.CreateThread(function()
	while true do

		Citizen.Wait(60000*Config.LootCooldownMinutes)
		 
		TriggerServerEvent('Florentinas:registerActivity', 0)

		kuprine = false

	end
end)


function Item() 

     	randomChance = math.random(1, 100)
     	randomItem1 = Config.randomItem1[math.random(1, #Config.randomItem1)]
     	randomItem2 = Config.randomItem2[math.random(1, #Config.randomItem2)]
     	randomItem3 = Config.randomItem3[math.random(1, #Config.randomItem3)]
		 
     if randomChance > 0 and randomChance < 10 then
     
       TriggerServerEvent('Florentinas:randomItem1', randomItem1)
     
     elseif randomChance >= 10 and randomChance <= 40 then
     
		TriggerServerEvent('Florentinas:randomItem2', randomItem2)
    
     elseif randomChance > 40   then
       
		TriggerServerEvent('Florentinas:randomItem3', randomItem3)
     
     end 


end



