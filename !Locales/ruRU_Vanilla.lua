-- Blackfathom Deeps

local L = BigWigs:NewBossLocale("Baron Aquanis Discovery", "ruRU")
if L then
	L.bossName = "Барон Акванис"
end

L = BigWigs:NewBossLocale("Ghamoo-ra Discovery", "ruRU")
if L then
	L.bossName = "Гхаму-ра"
end

L = BigWigs:NewBossLocale("Lady Sarevess Discovery", "ruRU")
if L then
	L.bossName = "Леди Саревесс"
end

L = BigWigs:NewBossLocale("Gelihast Discovery", "ruRU")
if L then
	L.bossName = "Гелихаст"
end

L = BigWigs:NewBossLocale("Lorgus Jett Discovery", "ruRU")
if L then
	L.bossName = "Лоргус Джетт"
	L.priestess = "Жрица прилива из Непроглядной Пучины"
	L.priestess_short = "Жрица" -- Shortened version of L.priestess (Blackfathom Tide Priestess)
	L.murloc = "Мурлок Непроглядной Пучины"
end

L = BigWigs:NewBossLocale("Twilight Lord Kelris Discovery", "ruRU")
if L then
	L.bossName = "Повелитель сумрака Келрис"
end

L = BigWigs:NewBossLocale("Aku'mai Discovery", "ruRU")
if L then
	L.bossName = "Аку'май"
end

-- Crystal Vale

L = BigWigs:NewBossLocale("Thunderaan Season of Discovery", "ruRU")
if L then
	L.bossName = "Принц Громораан"
	--L.mender = "Storm Mender" -- NPC 231858
end

-- Gnomeregan

L = BigWigs:NewBossLocale("Grubbis Discovery", "ruRU")
if L then
	L.bossName = "Грязнюк"
	L.aoe = "АоЕ урон ближнего боя"
	L.cloud = "Облако достигло босса"
	L.cone = "\"Фронтальный\" конус" -- "Frontal" Cone, it's a rear cone (he's farting)
	--L.warmup_say_chat_trigger = "Gnomeregan" -- There are still ventilation shafts actively spewing radioactive material throughout Gnomeregan.
end

L = BigWigs:NewBossLocale("Viscous Fallout Discovery", "ruRU")
if L then
	L.bossName = "Липкая муть"
	L.desiccated_fallout = "Иссохший выброс" -- NPC ID 216810
end

L = BigWigs:NewBossLocale("Crowd Pummeler 9-60 Discovery", "ruRU")
if L then
	L.bossName = "Толпогон 9-60"
end

L = BigWigs:NewBossLocale("Electrocutioner 6000 Discovery", "ruRU")
if L then
	L.bossName = "Электрошокер-6000"
end

L = BigWigs:NewBossLocale("Mechanical Menagerie Discovery", "ruRU")
if L then
	L.bossName = "Механический зверинец"
	L.attack_buff = "+50% скорость атаки"
	L.boss_at_hp = "%s на %d%%" -- BOSS_NAME at 50%
	L.red_button = "Красная кнопка"

	L[218242] = "|T134153:0:0:0:0:64:64:4:60:4:60|tДракон"
	L[218243] = "|T136071:0:0:0:0:64:64:4:60:4:60|tОвца"
	L[218244] = "|T133944:0:0:0:0:64:64:4:60:4:60|tБелка"
	L[218245] = "|T135996:0:0:0:0:64:64:4:60:4:60|tКурица"

	--L.run = "Run to the door"
	--L.run_desc = "Show a message when you defeat this boss to run to the door. This is intended to help you avoid accidentally engaging the next boss."
end

L = BigWigs:NewBossLocale("Mekgineer Thermaplugg Discovery", "ruRU")
if L then
	L.bossName = "Анжинер Термоштепсель"
	L.red_button = "Красная кнопка"
	--L.position = "Position %d" -- Position 5
end

-- Nightmare Grove

L = BigWigs:NewBossLocale("Emeriss Season of Discovery", "ruRU")
if L then
	L.bossName = "Эмерисс"
end

L = BigWigs:NewBossLocale("Lethon Season of Discovery", "ruRU")
if L then
	L.bossName = "Летон"
end

L = BigWigs:NewBossLocale("Taerar Season of Discovery", "ruRU")
if L then
	L.bossName = "Таэрар"
end

L = BigWigs:NewBossLocale("Ysondre Season of Discovery", "ruRU")
if L then
	L.bossName = "Исондра"
end

-- Scarlet Enclave

L = BigWigs:NewBossLocale("Balnazzar Scarlet Enclave", "ruRU")
if L then
	--L.bossName = "Balnazzar"
end

L = BigWigs:NewBossLocale("High Commander Beatrix", "ruRU")
if L then
	--L.bossName = "High Commander Beatrix"
	--L.meteor_yell_trigger = "As you wish" -- As you wish, High Commander!
	--L.waves_footmen_yell_trigger = "Form up" -- Form up and hold the line!
	--L.waves_cavalry_yell_trigger = "Ready your lances" -- Understod! Ready your lances!
	--L.arrows_yell_trigger = "Archers," -- Archers, unleash hell!
	--L.bombing_yell_trigger = "At once," -- At once, Beatrix!
end

L = BigWigs:NewBossLocale("Solistrasza", "ruRU")
if L then
	--L.bossName = "Solistrasza"
end

L = BigWigs:NewBossLocale("Alexei the Beastlord", "ruRU")
if L then
	--L.bossName = "Alexei the Beastlord"
end

L = BigWigs:NewBossLocale("Mason the Echo", "ruRU")
if L then
	--L.bossName = "Mason the Echo"
end

L = BigWigs:NewBossLocale("Reborn Council", "ruRU")
if L then
	L.bossName = "Возрожденный совет"
	--L[240795] = "Herod"
	--L[240809] = "Vishas"
	--L[240810] = "Doan"
end

L = BigWigs:NewBossLocale("Lillian Voss", "ruRU")
if L then
	--L.bossName = "Lillian Voss"
end

L = BigWigs:NewBossLocale("Grand Crusader Caldoran", "ruRU")
if L then
	--L.bossName = "Grand Crusader Caldoran"
end

-- Storm Cliffs

L = BigWigs:NewBossLocale("Azuregos Season of Discovery", "ruRU")
if L then
	L.bossName = "Азурегос"
end

-- Sunken Temple

L = BigWigs:NewBossLocale("Atal'alarion Discovery", "ruRU")
if L then
	--L.bossName = "Atal'alarion"
end

L = BigWigs:NewBossLocale("Festering Rotslime Discovery", "ruRU")
if L then
	--L.bossName = "Festering Rotslime"
end

L = BigWigs:NewBossLocale("Atal'ai Defenders Discovery", "ruRU")
if L then
	--L.bossName = "Atal'ai Defenders"
end

L = BigWigs:NewBossLocale("Dreamscythe and Weaver Discovery", "ruRU")
if L then
	--L.bossName = "Dreamscythe and Weaver"
end

L = BigWigs:NewBossLocale("Avatar of Hakkar Discovery", "ruRU")
if L then
	--L.bossName = "Avatar of Hakkar"
end

L = BigWigs:NewBossLocale("Jammal'an and Ogom Discovery", "ruRU")
if L then
	--L.bossName = "Jammal'an and Ogom"
end

L = BigWigs:NewBossLocale("Morphaz and Hazzas Discovery", "ruRU")
if L then
	--L.bossName = "Morphaz and Hazzas"
end

L = BigWigs:NewBossLocale("Shade of Eranikus Discovery", "ruRU")
if L then
	--L.bossName = "Shade of Eranikus"
	--L.deep_slumber_clouds = "Clouds" -- Clouds of Slumber
	--L.deep_slumber_player_debuff = "Player"
end

-- The Tainted Scar

L = BigWigs:NewBossLocale("Lord Kazzak Season of Discovery", "ruRU")
if L then
	L.bossName = "Владыка Каззак"
end

-- World Bosses

L = BigWigs:NewBossLocale("Azuregos", "ruRU")
if L then
	L.bossName = "Азурегос"
end

L = BigWigs:NewBossLocale("Lord Kazzak", "ruRU")
if L then
	L.bossName = "Владыка Каззак"

	L.engage_trigger = "За Легион! За Кил'джедена!"
end

L = BigWigs:NewBossLocale("Emeriss", "ruRU")
if L then
	L.bossName = "Эмерисс"

	L.engage_trigger = "Надежда – это БОЛЕЗНЬ души! Эта земля зачахнет и умрет!"
end

L = BigWigs:NewBossLocale("Lethon", "ruRU")
if L then
	L.bossName = "Летон"

	L.engage_trigger = "Я чувствую ТЕНЬ, нависшую над вашими сердцами. Нечестивцам не будет покоя!"
end

L = BigWigs:NewBossLocale("Taerar", "ruRU")
if L then
	L.bossName = "Таэрар"

	L.engage_trigger = "Мир – это всего лишь мимолетный сон. Пусть правит КОШМАР!"
end

L = BigWigs:NewBossLocale("Ysondre", "ruRU")
if L then
	L.bossName = "Исондра"

	L.engage_trigger = "Нити ЖИЗНИ разорваны! Отомстим за Спящих!"
end
