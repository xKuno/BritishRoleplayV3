CFG = {}

CFG.Main = {
	['esx_version'] = '1.1', -- Supported: 1.0, 1.1, 1.2
	['use_onesync_infinity'] = false, -- Use onesync infinity, if you have it enabled
	['toggle_menu_keybind'] = 166, -- https://docs.fivem.net/docs/game-references/controls/
	['allowed_groups'] = {'superadmin', 'admin', 'mod'}, -- Groups which are allowed to open admin menu,
	['commands'] = { -- You can change command names here
		['ban_cmd'] = 'ban', -- Change the /ban command to your liking
		['unban_cmd'] = 'unban', -- Change the /unban command to your liking
		['kick_cmd'] = 'kick', -- Change the /kick command to your liking
	},
	['ban_identifier'] = 'steam', -- You need to write which identifier your ESX uses for users; It can be => (discord, license, steam)
	['permissions'] = {
		['ban'] = {'superadmin'},
		['unban'] = {'superadmin'},
		['kick'] = {'superadmin', 'admin', 'mod'},
		['manage_money'] = {'superadmin'},
		['manage_job'] = {'superadmin', 'admin', 'mod'},
		['manage_group'] = {'superadmin'},
		['freeze'] = {'superadmin', 'admin', 'mod'},
		['goto'] = {'superadmin', 'admin', 'mod'},
		['bring'] = {'superadmin', 'admin', 'mod'},
		['revive'] = {'superadmin', 'admin', 'mod'},
	}
}

CFG.Strings = {
	['esx_object_event'] = 'esx:getSharedObject',
	['ambulance_job_event'] = 'esx_ambulancejob:setDeathStatus', -- if you changed default event name
	['prefix'] = 'British Roleplay Admin',
	['no_permission'] = 'You do not have permission.',
	['freeze_message'] = 'Player ^3%s ^0is now ^3%s^0!', -- First %s is place for player name, the second one is for state
	['freeze_state_on'] = 'FROZEN',  
	['freeze_state_off'] = 'DEFROSTED',
	--['invisiblity_on'] = 'Invsibility has been turned on.',
	--['invisiblity_off'] = 'Invsibility has been turned off.',
	['noclip_message'] = 'Noclip is now %s', -- %s is place for state (ON/OFF)
	['noclip_on'] = '✅',  
	['noclip_off'] = '🛑',
	['marker_teleported'] = 'You have been successfully teleported.',
	['marker_not_found'] = 'Teleport waypoint not found on map.',
	['player_not_found'] = '^0Player not found.',
	['ban_wrong_time_format'] = '^0Time must be in days.',
	['ban_success'] = 'Player ^1%s^0 has been banned on ^1%s^0 days: ^1%s',
	['ban_format'] = '/ban ID TIME(DAYS) REASON',
	['unban_format'] = '/unban identifier', -- Example => (steam:hexid, license:ismj8123j) /unban steam:123456
	['unban_success'] = 'Identifier: %s is unbanned now.',
    ['unban_id_not_found'] = 'Identifier not found',
	['kick_format'] = '/kick ID REASON',
	['kick_success'] = 'Player ^1%s ^0has been kicked for (^1%s^0)',
	['ban_reason'] = 'You are banned from this server for: ',
	['user_money_updated'] = '^1%s ^0of ^1%s ^0is updated to: ^1£%s', -- Black money of Player is updated to £1000
	['user_job_updated'] = '^1%s^0 is now: ^1%s ^0- ^1%s', -- Player is now Police - Officer
	['user_group_updated'] = '^1%s^0 is now: ^1%s', -- Player is now superadmin
}

CFG.ChangeLog = {
	['>>'] = '»',
	['<<'] = '«',
	['line'] = '━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━',
}
