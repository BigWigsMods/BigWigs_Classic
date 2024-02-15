local L = BigWigs:NewBossLocale("Grubbis Discovery", "zhCN")
if not L then return end
if L then
	L.bossName = "格鲁比斯"
	L.aoe = "近战AOE"
	L.cloud = "一团毒云接近了首领"
	L.cone = "辐射？" -- "Frontal" Cone, it's a rear cone (he's farting) 还是使用技能名称（诡异的技能）
	--L.warmup_say_chat_trigger = "Gnomeregan" -- There are still ventilation shafts actively spewing radioactive material throughout Gnomeregan.
	L.interruptable = "打断"
end

L = BigWigs:NewBossLocale("Viscous Fallout Discovery", "zhCN")
if L then
	L.bossName = "粘性辐射尘"
	L.desiccated_fallout = "干燥辐射尘" -- NPC ID 216810
end

L = BigWigs:NewBossLocale("Crowd Pummeler 9-60 Discovery", "zhCN")
if L then
	L.bossName = "群体打击者9-60"
end

L = BigWigs:NewBossLocale("Electrocutioner 6000 Discovery", "zhCN")
if L then
	L.bossName = "电刑器6000型"
	L.ready = "|cff20ff20就绪|r"
end

L = BigWigs:NewBossLocale("Mechanical Menagerie Discovery", "zhCN")
if L then
	L.bossName = "机械博览馆"
	L.attack_buff = "+50% 攻击速度"
	--L.boss_at_hp = "%s at %d%%" -- BOSS_NAME at 50%

	L[218242] = "|T134153:0:0:0:0:64:64:4:60:4:60|t龙"
	L[218243] = "|T136071:0:0:0:0:64:64:4:60:4:60|t羊"
	L[218244] = "|T133944:0:0:0:0:64:64:4:60:4:60|t松鼠"
	L[218245] = "|T135996:0:0:0:0:64:64:4:60:4:60|t鸡"
end

L = BigWigs:NewBossLocale("Mekgineer Thermaplugg Discovery", "zhCN")
if L then
	L.bossName = "机械师瑟玛普拉格"
	L.interruptable = "打断"
	L.ready = "|cff20ff20就绪|r"
end
