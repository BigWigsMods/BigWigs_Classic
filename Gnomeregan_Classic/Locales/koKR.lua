local L = BigWigs:NewBossLocale("Grubbis Discovery", "koKR")
if not L then return end
if L then
	L.bossName = "그루비스"
	L.aoe = "광역 근접 피해"
	L.cloud = "구름이 보스에게 도달"
	L.cone = "\"전방\" 부채꼴" -- "Frontal" Cone, it's a rear cone (he's farting)
	L.warmup_say_chat_trigger = "놈리건" -- There are still ventilation shafts actively spewing radioactive material throughout Gnomeregan.
end

L = BigWigs:NewBossLocale("Viscous Fallout Discovery", "koKR")
if L then
	L.bossName = "방사성 폐기물"
	L.desiccated_fallout = "메마른 낙진" -- NPC ID 216810
end

L = BigWigs:NewBossLocale("Crowd Pummeler 9-60 Discovery", "koKR")
if L then
	L.bossName = "고철 압축기 9-60"
end

L = BigWigs:NewBossLocale("Electrocutioner 6000 Discovery", "koKR")
if L then
	L.bossName = "기계화 문지기 6000"
end

L = BigWigs:NewBossLocale("Mechanical Menagerie Discovery", "koKR")
if L then
	L.bossName = "기계 동물원"
	L.attack_buff = "공격 속도 +50%"
	L.boss_at_hp = "%s 생명력 %d%%" -- BOSS_NAME at 50%
	L.red_button = "빨간 버튼"

	L[218242] = "|T134153:0:0:0:0:64:64:4:60:4:60|t용"
	L[218243] = "|T136071:0:0:0:0:64:64:4:60:4:60|t양"
	L[218244] = "|T133944:0:0:0:0:64:64:4:60:4:60|t다람쥐"
	L[218245] = "|T135996:0:0:0:0:64:64:4:60:4:60|t닭"

	L.run = "문으로 이동"
	L.run_desc = "이 보스를 처치하면 문으로 이동하라는 메시지를 표시합니다. 다음 보스와 우발적으로 전투하는 것을 피하기 위한 기능입니다."
end

L = BigWigs:NewBossLocale("Mekgineer Thermaplugg Discovery", "koKR")
if L then
	L.bossName = "멕기니어 텔마플러그"
	L.red_button = "빨간 버튼"
	L.position = "위치 %d" -- Position 5
end
