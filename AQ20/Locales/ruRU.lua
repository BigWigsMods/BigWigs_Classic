local L = BigWigs:NewBossLocale("Moam", "ruRU")
if not L then return end
if L then
	--L.starttrigger = "%s senses your fear."
end

L = BigWigs:NewBossLocale("Ossirian the Unscarred", "ruRU")
if L then
	--L.debuff = "Weakness"
	--L.debuff_desc = "Warn for various weakness types."
end

L = BigWigs:NewBossLocale("General Rajaxx", "ruRU")
if L then
	wave = "Волны",
	wave_desc = "Сообщать о наступлении волн.",

	trigger1 = "Kill first, ask questions later... Incoming!",
	--trigger2 = "?????",  -- There is no callout for wave 2 ><
	trigger3 = "The time of our retribution is at hand! Let darkness reign in the hearts of our enemies!",
	trigger4 = "No longer will we wait behind barred doors and walls of stone! No longer will our vengeance be denied! The dragons themselves will tremble before our wrath!\013\n",
	trigger5 = "Fear is for the enemy! Fear and death!",
	trigger6 = "Staghelm will whimper and beg for his life, just as his whelp of a son did! One thousand years of injustice will end this day!\013\n",
	trigger7 = "Fandral! Your time has come! Go and hide in the Emerald Dream and pray we never find you!\013\n",
	trigger8 = "Impudent fool! I will kill you myself!",
	trigger9 = "Remember, Rajaxx, when I said I'd kill you last?",

	warn1 = "Волна 1/8",
	warn2 = "Волна 2/8",
	warn3 = "Волна 3/8",
	warn4 = "Волна 4/8",
	warn5 = "Волна 5/8",
	warn6 = "Волна 6/8",
	warn7 = "Волна 7/8",
	warn8 = "Наступает Генерал Раджах",
	warn9 = "Волна 1/8", -- trigger for starting the event by pulling the first wave instead of talking to andorov
end

L = BigWigs:NewBossLocale("Ruins of Ahn'Qiraj Trash", "ruRU")
if L then
	--L.guardian = "Anubisath Guardian"
end

