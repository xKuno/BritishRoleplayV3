locale_to_use = "en"

function _L(str, ...)
	if Locales[locale_to_use] ~= nil then
		if Locales[locale_to_use][str] ~= nil then
			return string.format(Locales[locale_to_use][str], ...)
		else
			Citizen.Trace("Locales["..locale_to_use.."]["..str.."] doesn't exist")
		end
	else
		Citizen.Trace("Locales["..locale_to_use.."] doesn't exist!")
	end
end

Locales = {}
Locales["en"] = {
	["gym"] = "Gym",
	["stamina"] = "Stamina",
	["lung_capacity"] = "Lung Capacity",
	["strength"] = "Strength",
	["lvlup"] = "Your condition has improved! (%s level %s)",
	["lvldown"] = "Your condition has decreased! (%s level %s)",
	["statscmd"] = "Your stats are:",

	["situps"] = "Situps",
	["cranks"] = "Cranks",
	["run"] = "Run",
	["bench"] = "Bench",
	["yoga"] = "Yoga",
	["flex"] = "Flex",
	["stop"] = "Stop Everything",

	["tired"] = "Tired:",

	["press"] = 'Press ~INPUT_CONTEXT~ to open menu.'

}
Locales["cs"] = {
	["gym"] = "Gym",
	["stamina"] = "Výdrž",
	["lung_capacity"] = "Kapacita plic",
	["strength"] = "Síla",
	["lvlup"] = "Váš stav se zlepšil! (%s level %s)",
	["lvldown"] = "Váš stav se zhoršil! (%s level %s)",
	["statscmd"] = "Vaše staty jsou:",

	["situps"] = "Situps",
	["cranks"] = "Cranks",
	["run"] = "Run",
	["bench"] = "Bench",
	["yoga"] = "Yoga",
	["flex"] = "Flex",
	["stop"] = "Stop Everything",

	["tired"] = "Tired: ",

	["press"] = 'Stiskni ~INPUT_CONTEXT~ a otevri menu'
}
