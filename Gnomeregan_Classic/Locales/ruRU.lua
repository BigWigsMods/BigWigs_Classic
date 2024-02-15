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
	L.dont_attack = "Не атакуйте овец"
	L.sheep_safe = "Овцу можно безопасно атаковать"

	L[218242] = "|T134153:0:0:0:0:64:64:4:60:4:60|tДракон"
	L[218243] = "|T136071:0:0:0:0:64:64:4:60:4:60|tОвца"
	L[218244] = "|T133944:0:0:0:0:64:64:4:60:4:60|tБелка"
	L[218245] = "|T135996:0:0:0:0:64:64:4:60:4:60|tКурица"
end

L = BigWigs:NewBossLocale("Mekgineer Thermaplugg Discovery", "ruRU")
if L then
	L.bossName = "Анжинер Термоштепсель"
	L.interruptable = "Прерываемый"
	L.ready = "|cff20ff20Готов|r"
end
