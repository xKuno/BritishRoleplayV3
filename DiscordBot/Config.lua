DiscordWebhookSystemInfos = 'https://discord.com/api/webhooks/849040820605550622/NwYgjjFqGQ-jsuT55sWAnVIc0RR0aKt7SxGX1ruzJ-nOL1XpvombpS-p0IqdzT_uOmbs'
DiscordWebhookKillinglogs = 'https://discord.com/api/webhooks/849041350929285181/8haTjTmyK_TuDTJnRFO_cLaTsBKfe88MgqPH3CISlGtW0LP0scAVhm9FI4Xx6R_-ey_N'
DiscordWebhookChat = 'https://discord.com/api/webhooks/849043899876245566/Q5oBG_RIeA3x-5wUBYVYhx_X7BUOW5YPL0Z_WpDwHpLWST_cy8kuYsQhbKyHkM0bOA-h'

SystemAvatar = 'https://imgur.com/OwUxwKI'

UserAvatar = 'https://imgur.com/OwUxwKI'

SystemName = 'The BRP Logs..'


--[[ Special Commands formatting
		 *YOUR_TEXT*			--> Make Text Italics in Discord
		**YOUR_TEXT**			--> Make Text Bold in Discord
	   ***YOUR_TEXT***			--> Make Text Italics & Bold in Discord
		__YOUR_TEXT__			--> Underline Text in Discord
	   __*YOUR_TEXT*__			--> Underline Text and make it Italics in Discord
	  __**YOUR_TEXT**__			--> Underline Text and make it Bold in Discord
	 __***YOUR_TEXT***__		--> Underline Text and make it Italics & Bold in Discord
		~~YOUR_TEXT~~			--> Strikethrough Text in Discord
]]
-- Use 'USERNAME_NEEDED_HERE' without the quotes if you need a Users Name in a special command
-- Use 'USERID_NEEDED_HERE' without the quotes if you need a Users ID in a special command


-- These special commands will be printed differently in discord, depending on what you set it to
SpecialCommands = {
				   {'/do', '**[DO]:**'},
				   {'/twt', '**[TWT]:**'},
				   {'/rs', '**[RS]:**'},
				   {'/me', '**[ME]:**'},
				   {'/anontwt', '**[ANONTWT]:**'},
				   {'/fb', '**[FB]:**'},
				   {'/it', '**[IT]:**'},
				   {'/fba', '**[FBA]:**'},
				   {'/ad', '**[ADD]:**'},
				   {'/ooc', '**[OOC]:**'},
				   {'/fix', 'Used /fix on their car'},
				  }

						
-- These blacklisted commands will not be printed in discord
BlacklistedCommands = {
					   '/',
					   '/AnyCommand2',
					  }

-- These Commands will use their own webhook
OwnWebhookCommands = {
					  {'/AnotherCommand', 'https://discordapp.com/api/webhooks/781207605603074067/kmcOe-6hbowc8o58HFec9NARkWcTeFtqZa7WRMeBKx-M0x_zzLXgJ-620WPwd31zIytl'},
					  {'/AnotherCommand2', 'https://discordapp.com/api/webhooks/781207605603074067/kmcOe-6hbowc8o58HFec9NARkWcTeFtqZa7WRMeBKx-M0x_zzLXgJ-620WPwd31zIytl'},
					 }

-- These Commands will be sent as TTS messages
TTSCommands = {
			   '/Whatever',
			   '/Whatever2',
			  }

