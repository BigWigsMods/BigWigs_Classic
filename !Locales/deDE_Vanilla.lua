-- Blackfathom Deeps

local L = BigWigs:NewBossLocale("Baron Aquanis Discovery", "deDE")
if L then
	--L.bossName = "Baron Aquanis"
end

L = BigWigs:NewBossLocale("Ghamoo-ra Discovery", "deDE")
if L then
	--L.bossName = "Ghamoo-ra"
end

L = BigWigs:NewBossLocale("Lady Sarevess Discovery", "deDE")
if L then
	--L.bossName = "Lady Sarevess"
end

L = BigWigs:NewBossLocale("Gelihast Discovery", "deDE")
if L then
	--L.bossName = "Gelihast"
end

L = BigWigs:NewBossLocale("Lorgus Jett Discovery", "deDE")
if L then
	--L.bossName = "Lorgus Jett"
	L.priestess = "Blackfathom-Gezeitenpriesterin"
	L.priestess_short = "Priesterin" -- Shortened version of L.priestess (Blackfathom Tide Priestess)
	L.murloc = "Blackfathom-Murloc"
end

L = BigWigs:NewBossLocale("Twilight Lord Kelris Discovery", "deDE")
if L then
	L.bossName = "Twilight-Lord Kelris"
end

L = BigWigs:NewBossLocale("Aku'mai Discovery", "deDE")
if L then
	--L.bossName = "Aku'mai"
end

-- Crystal Vale

L = BigWigs:NewBossLocale("Thunderaan Season of Discovery", "deDE")
if L then
	L.bossName = "Prinz Donneraan"
	--L.mender = "Storm Mender" -- NPC 231858
end

-- Gnomeregan

L = BigWigs:NewBossLocale("Grubbis Discovery", "deDE")
if L then
	L.bossName = "Grubbis"
	L.aoe = "AoE Nahkampfschaden"
	L.cloud = "Eine Wolke hat den Boss erreicht"
	L.cone = "\"Frontale\" Kegelattacke" -- "Frontal" Cone, it's a rear cone (he's farting)
	--L.warmup_say_chat_trigger = "Gnomeregan" -- There are still ventilation shafts actively spewing radioactive material throughout Gnomeregan.
end

L = BigWigs:NewBossLocale("Viscous Fallout Discovery", "deDE")
if L then
	L.bossName = "Verflüssigte Ablagerung"
	L.desiccated_fallout = "Ausgetrocknete Ablagerungen" -- NPC ID 216810
end

L = BigWigs:NewBossLocale("Crowd Pummeler 9-60 Discovery", "deDE")
if L then
	L.bossName = "Meuteverprügler 9-60"
end

L = BigWigs:NewBossLocale("Electrocutioner 6000 Discovery", "deDE")
if L then
	L.bossName = "Elektrokutor 6000"
end

L = BigWigs:NewBossLocale("Mechanical Menagerie Discovery", "deDE")
if L then
	L.bossName = "Mechanische Menagerie"
	L.attack_buff = "+50% Angriffstempo"
	L.boss_at_hp = "%s auf %d%%" -- BOSS_NAME at 50%
	L.red_button = "Roter Knopf"

	L[218242] = "|T134153:0:0:0:0:64:64:4:60:4:60|tDrache"
	L[218243] = "|T136071:0:0:0:0:64:64:4:60:4:60|tSchaf"
	L[218244] = "|T133944:0:0:0:0:64:64:4:60:4:60|tEichhörnchen"
	L[218245] = "|T135996:0:0:0:0:64:64:4:60:4:60|tHuhn"

	--L.run = "Run to the door"
	--L.run_desc = "Show a message when you defeat this boss to run to the door. This is intended to help you avoid accidentally engaging the next boss."
end

L = BigWigs:NewBossLocale("Mekgineer Thermaplugg Discovery", "deDE")
if L then
	L.bossName = "Robogenieur Thermaplugg"
	L.red_button = "Roter Knopf"
	--L.position = "Position %d" -- Position 5
end

-- Nightmare Grove

L = BigWigs:NewBossLocale("Emeriss Season of Discovery", "deDE")
if L then
	L.bossName = "Emeriss"
end

L = BigWigs:NewBossLocale("Lethon Season of Discovery", "deDE")
if L then
	L.bossName = "Lethon"
end

L = BigWigs:NewBossLocale("Taerar Season of Discovery", "deDE")
if L then
	L.bossName = "Taerar"
end

L = BigWigs:NewBossLocale("Ysondre Season of Discovery", "deDE")
if L then
	L.bossName = "Ysondre"
end

-- Scarlet Enclave

L = BigWigs:NewBossLocale("Balnazzar Scarlet Enclave", "deDE")
if L then
	--L.bossName = "Balnazzar"
end

L = BigWigs:NewBossLocale("High Commander Beatrix", "deDE")
if L then
	--L.bossName = "High Commander Beatrix"
	--L.meteor_yell_trigger = "As you wish" -- As you wish, High Commander!
	--L.waves_footmen_yell_trigger = "Form up" -- Form up and hold the line!
	--L.waves_cavalry_yell_trigger = "Ready your lances" -- Understod! Ready your lances!
	--L.arrows_yell_trigger = "Archers," -- Archers, unleash hell!
	--L.bombing_yell_trigger = "At once," -- At once, Beatrix!
end

L = BigWigs:NewBossLocale("Solistrasza", "deDE")
if L then
	--L.bossName = "Solistrasza"
end

L = BigWigs:NewBossLocale("Alexei the Beastlord", "deDE")
if L then
	--L.bossName = "Alexei the Beastlord"
end

L = BigWigs:NewBossLocale("Mason the Echo", "deDE")
if L then
	--L.bossName = "Mason the Echo"
end

L = BigWigs:NewBossLocale("Reborn Council", "deDE")
if L then
	L.bossName = "Wiedergeborener Rat"
	--L[240795] = "Herod"
	--L[240809] = "Vishas"
	--L[240810] = "Doan"
end

L = BigWigs:NewBossLocale("Lillian Voss", "deDE")
if L then
	--L.bossName = "Lillian Voss"
end

L = BigWigs:NewBossLocale("Grand Crusader Caldoran", "deDE")
if L then
	--L.bossName = "Grand Crusader Caldoran"
end

-- Storm Cliffs

L = BigWigs:NewBossLocale("Azuregos Season of Discovery", "deDE")
if L then
	L.bossName = "Azuregos"
end

-- Sunken Temple

L = BigWigs:NewBossLocale("Atal'alarion Discovery", "deDE")
if L then
	--L.bossName = "Atal'alarion"
end

L = BigWigs:NewBossLocale("Festering Rotslime Discovery", "deDE")
if L then
	--L.bossName = "Festering Rotslime"
end

L = BigWigs:NewBossLocale("Atal'ai Defenders Discovery", "deDE")
if L then
	--L.bossName = "Atal'ai Defenders"
end

L = BigWigs:NewBossLocale("Dreamscythe and Weaver Discovery", "deDE")
if L then
	--L.bossName = "Dreamscythe and Weaver"
end

L = BigWigs:NewBossLocale("Avatar of Hakkar Discovery", "deDE")
if L then
	--L.bossName = "Avatar of Hakkar"
end

L = BigWigs:NewBossLocale("Jammal'an and Ogom Discovery", "deDE")
if L then
	--L.bossName = "Jammal'an and Ogom"
end

L = BigWigs:NewBossLocale("Morphaz and Hazzas Discovery", "deDE")
if L then
	--L.bossName = "Morphaz and Hazzas"
end

L = BigWigs:NewBossLocale("Shade of Eranikus Discovery", "deDE")
if L then
	--L.bossName = "Shade of Eranikus"
	--L.deep_slumber_clouds = "Clouds" -- Clouds of Slumber
	--L.deep_slumber_player_debuff = "Player"
end

-- The Tainted Scar

L = BigWigs:NewBossLocale("Lord Kazzak Season of Discovery", "deDE")
if L then
	L.bossName = "Lord Kazzak"
end

-- World Bosses

L = BigWigs:NewBossLocale("Azuregos", "deDE")
if L then
	L.bossName = "Azuregos"
end

L = BigWigs:NewBossLocale("Lord Kazzak", "deDE")
if L then
	L.bossName = "Lord Kazzak"

	L.engage_trigger = "Für die Legion! Für Kil'jaeden!"
end

L = BigWigs:NewBossLocale("Emeriss", "deDE")
if L then
	L.bossName = "Emeriss"

	L.engage_trigger = "Die Hoffnung ist eine KRANKHEIT der Seele. Dieses Land wird verdorren und sterben!"
end

L = BigWigs:NewBossLocale("Lethon", "deDE")
if L then
	L.bossName = "Lethon"

	L.engage_trigger = "Ich fühle die SCHATTEN in Euren Herzen. Niemals darf das Böse Ruhe finden!"
end

L = BigWigs:NewBossLocale("Taerar", "deDE")
if L then
	L.bossName = "Taerar"

	L.engage_trigger = "Frieden ist nur ein flüchtiger Traum! Von nun an herrscht der ALPTRAUM!"
end

L = BigWigs:NewBossLocale("Ysondre", "deDE")
if L then
	L.bossName = "Ysondre"

	L.engage_trigger = "Die Fäden des LEBENS wurden durchtrennt! Die Träumer müssen gerächt werden!"
end
