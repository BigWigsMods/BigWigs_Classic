local L = BigWigs:NewBossLocale("Grubbis Discovery", "koKR")
if not L then return end
if L then
	L.bossName = "그루비스"
	--L.aoe = "AoE melee damage"
	--L.cloud = "A cloud reached the boss"
	--L.cone = "\"Frontal\" cone" -- "Frontal" Cone, it's a rear cone (he's farting)
	--L.warmup_say_chat_trigger = "Gnomeregan" -- There are still ventilation shafts actively spewing radioactive material throughout Gnomeregan.
	--L.interruptable = "Interruptible"
end

L = BigWigs:NewBossLocale("Viscous Fallout Discovery", "koKR")
if L then
	L.bossName = "방사성 폐기물"
	--L.desiccated_fallout = "Desiccated Fallout" -- NPC ID 216810
end

L = BigWigs:NewBossLocale("Crowd Pummeler 9-60 Discovery", "koKR")
if L then
	L.bossName = "고철 압축기 9-60"
end

L = BigWigs:NewBossLocale("Electrocutioner 6000 Discovery", "koKR")
if L then
	L.bossName = "기계화 문지기 6000"
	L.ready = "|cff20ff20준비|r"
end

L = BigWigs:NewBossLocale("Mechanical Menagerie Discovery", "koKR")
if L then
	L.bossName = "기계 동물원"
	--L.attack_buff = "+50% attack speed"
	--L.boss_at_hp = "%s at %d%%" -- BOSS_NAME at 50%

	L[218242] = "|T134153:0:0:0:0:64:64:4:60:4:60|t용"
	L[218243] = "|T136071:0:0:0:0:64:64:4:60:4:60|t양"
	L[218244] = "|T133944:0:0:0:0:64:64:4:60:4:60|t다람쥐"
	L[218245] = "|T135996:0:0:0:0:64:64:4:60:4:60|t닭"
end

L = BigWigs:NewBossLocale("Mekgineer Thermaplugg Discovery", "koKR")
if L then
	L.bossName = "멕기니어 텔마플러그"
	L.ready = "|cff20ff20준비|r"
	--L.red_button = "Red Button"
end
