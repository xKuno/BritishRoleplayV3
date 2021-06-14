Config = {

MaxJobs = 2, -- Maximum amount of jobs avalable for every player (Only applies to jobs that are auto savable)
AllowAutoJobSavining = true, -- When the script detects a new job it will add it to your jobs Ex. You get police job and it saves that job (if maximum not reached) to your job list

OpenJobUIKey = '', -- The key used to open the UI (Leave blank if you do not want to use key)
OpenJobUICommand = '', -- Command used to open the UI (MUST NOT BE BLANK!!)

--Set up blip info (https://docs.fivem.net/docs/game-references/blips/)
BlipSprite = 457,
BlipColor = 3,
BlipText = 'Job Centre',

MarkerSprite = 27,
MarkerColor = {66, 135, 245},
MarkerSize = 1.5,

LocationsToChangeJobs = { -- If you want you can setup locations to change jobs (Leave without entiries if you dont want locations) (ADDS 0.02 MS)
	{coords = vector3(451.67,-989.05,30.69), blip = false}, -- Police
	{coords = vector3(198.87,-1646.88,29.8), blip  = false}, --  NHS
	{coords = vector3(-207.49,-1341.05,34.89), blip  = false}, -- Mechanics
	{coords = vector3(-552.12,-194.22,38.22), blip  = true}, -- Job centre 1
	{coords = vector3(-550.02,-193.1,38.22), blip  = false} -- Job centre 2
},

OffdutyForEveryone = true, -- Everyone can go into offduty job
JobsThatCanUseOffduty = { -- Jobs that can use offduty if option above is false
	'police',
	'ambulance',
	'mechanic'
},

DefaultJobs = { -- Jobs that will be added in menu by default and wont be removable
 	{job = 'fueler', grade = 0},
	{job = 'lumberjack', grade = 0},
	{job = 'miner', grade = 0},
	{job = 'miner2', grade = 0},
	{job = 'slaughterer', grade = 0},
	{job = 'taxi', grade = 0},
	{job = 'tailor', grade = 0},
	{job = 'unemployed', grade = 0}
},

Text = {

	['cant_offduty'] = 'You cant go offduty!',
	['open_ui_hologram'] = '[~b~E~w~] Open Job Managment',
	['wrong_usage'] = 'Wrong command usage'

}
	

}

-- Only change if you know what are you doing!
function SendTextMessage(msg)
	-- SetNotificationTextEntry('STRING')
	-- AddTextComponentString(msg)
	-- DrawNotification(0,1)

	--EXAMPLE USED IN VIDEO
	exports['mythic_notify']:SendAlert('error', msg)
end
