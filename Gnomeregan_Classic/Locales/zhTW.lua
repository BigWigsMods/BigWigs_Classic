local L = BigWigs:NewBossLocale("Grubbis Discovery", "zhTW")
if not L then return end
if L then
	L.bossName = "格魯比斯"
	L.aoe = "近戰AOE"
	L.cloud = "一團毒雲接近了首領"
	--L.cone = "\"Frontal\" cone" -- "Frontal" Cone, it's a rear cone (he's farting)
end

L = BigWigs:NewBossLocale("Viscous Fallout Discovery", "zhTW")
if L then
	L.bossName = "粘性輻射塵"
	--L.desiccated_fallout = "Desiccated Fallout" -- NPC ID 216810
end

L = BigWigs:NewBossLocale("Crowd Pummeler 9-60 Discovery", "zhTW")
if L then
	L.bossName = "群體打擊者9-60"
end

L = BigWigs:NewBossLocale("Electrocutioner 6000 Discovery", "zhTW")
if L then
	L.bossName = "電刑器6000型"
end

L = BigWigs:NewBossLocale("Mechanical Menagerie Discovery", "zhTW")
if L then
	L.bossName = "機械展示廳"
	L.bossName = "機械博覽館"
	L.attack_buff = "+50% 攻擊速度"
	L.dont_attack = "危險不要攻擊羊"
	L.sheep_safe = "安全可以攻擊羊"

	L[218242] = "龍"
	L[218243] = "羊"
	L[218244] = "松鼠"
	L[218245] = "雞"
end

L = BigWigs:NewBossLocale("Mekgineer Thermaplugg Discovery", "zhTW")
if L then
	L.bossName = "機電師瑟瑪普拉格"
	L.interruptable = "打斷"
end
