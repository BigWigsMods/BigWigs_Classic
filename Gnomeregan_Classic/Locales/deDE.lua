local L = BigWigs:NewBossLocale("Grubbis Discovery", "deDE")
if not L then return end
if L then
	L.bossName = "Grubbis"
	L.aoe = "AoE Nahkampfschaden"
	L.cloud = "Eine Wolke hat den Boss erreicht"
	L.cone = "\"Frontale\" Kegelattacke" -- "Frontal" Cone, it's a rear cone (he's farting)
end

L = BigWigs:NewBossLocale("Viscous Fallout Discovery", "deDE")
if L then
	L.bossName = "Verflüssigte Ablagerung"
	--L.desiccated_fallout = "Desiccated Fallout" -- NPC ID 216810
end

L = BigWigs:NewBossLocale("Crowd Pummeler 9-60 Discovery", "deDE")
if L then
	L.bossName = "Meute-Verprügler 9-60"
end

L = BigWigs:NewBossLocale("Electrocutioner 6000 Discovery", "deDE")
if L then
	L.bossName = "Elektrokutor 6000"
end

L = BigWigs:NewBossLocale("Mechanical Menagerie Discovery", "deDE")
if L then
	L.bossName = "Mechanische Menagerie"
	L.attack_buff = "+50% Angriffstempo"
	L.dont_attack = "Nicht das Schaf angreifen"
	L.sheep_safe = "Schaf kann sicher angegriffen werden"

	L[218242] = "Drache"
	L[218243] = "Schaf"
	L[218244] = "Eichhörnchen"
	L[218245] = "Huhn"
end

L = BigWigs:NewBossLocale("Mekgineer Thermaplugg Discovery", "deDE")
if L then
	L.bossName = "Robogenieur Thermaplugg"
	L.interruptable = "Unterbrechbar"
end
