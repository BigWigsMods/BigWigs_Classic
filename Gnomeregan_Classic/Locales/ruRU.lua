local L = BigWigs:NewBossLocale("Grubbis Discovery", "ruRU")
if not L then return end
if L then
	L.bossName = "Грязнюк"
	L.aoe = "АоЕ урон ближнего боя"
	L.cloud = "Облако достигло босса"
	L.cone = "\"Фронтальный\" конус" -- "Frontal" Cone, it's a rear cone (he's farting)
end

L = BigWigs:NewBossLocale("Viscous Fallout Discovery", "ruRU")
if L then
	L.bossName = "Липкая муть"
	L.desiccated_fallout = "Ожог от радиации" -- NPC ID 216810
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
	L.dont_attack = "Не атакуйте овец"
	L.sheep_safe = "Овцу можно безопасно атаковать"

	L[218242] = "Дракон"
	L[218243] = "Овца"
	L[218244] = "Белка"
	L[218245] = "Курица"
end

L = BigWigs:NewBossLocale("Mekgineer Thermaplugg Discovery", "ruRU")
if L then
	L.bossName = "Анжинер Термоштепсель"
	L.interruptable = "Прерываемый"
end
