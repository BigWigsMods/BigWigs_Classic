local L = BigWigs:NewBossLocale("Grubbis Discovery", "ruRU")
if not L then return end
if L then
	L.bossName = "Грязнюк"
	--L.aoe = "AoE melee damage"
	--L.cloud = "A cloud reached the boss"
	--L.cone = "\"Frontal\" cone" -- "Frontal" Cone, it's a rear cone (he's farting)
end

L = BigWigs:NewBossLocale("Viscous Fallout Discovery", "ruRU")
if L then
	L.bossName = "Липкая муть"
	--L.desiccated_fallout = "Desiccated Fallout" -- NPC ID 216810
end

L = BigWigs:NewBossLocale("Crowd Pummeler 9-60 Discovery", "ruRU")
if L then
	L.bossName = "\"Толпогон 9-60\""
end

L = BigWigs:NewBossLocale("Electrocutioner 6000 Discovery", "ruRU")
if L then
	L.bossName = "\"Электрошокер-6000\""
end

L = BigWigs:NewBossLocale("Mechanical Menagerie Discovery", "ruRU")
if L then
	L.bossName = "Механический зверинец"
	--L.attack_buff = "+50% attack speed"
	--L.dont_attack = "Don't attack the sheep"
	--L.sheep_safe = "Sheep is safe to attack"

	--L[218242] = "Dragon"
	--L[218243] = "Sheep"
	--L[218244] = "Squirrel"
	--L[218245] = "Chicken"
end

L = BigWigs:NewBossLocale("Mekgineer Thermaplugg Discovery", "ruRU")
if L then
	L.bossName = "Анжинер Термоштепсель"
	--L.interruptable = "Interruptable"
end
