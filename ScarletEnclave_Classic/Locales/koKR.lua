local L = BigWigs:NewBossLocale("Balnazzar Scarlet Enclave", "koKR")
if not L then return end
if L then
	L.bossName = "발나자르"
end

L = BigWigs:NewBossLocale("High Commander Beatrix", "koKR")
if L then
	L.bossName = "총사령관 베아트릭스"
	L.meteor_yell_trigger = "분부대로" -- As you wish, High Commander!
	L.waves_footmen_yell_trigger = "진열" -- Form up and hold the line!
	L.waves_cavalry_yell_trigger = "기병" -- Understod! Ready your lances!
	L.arrows_yell_trigger = "명사수," -- Archers, unleash hell!
	L.bombing_yell_trigger = "당장," -- At once, Beatrix!
end

L = BigWigs:NewBossLocale("Solistrasza", "koKR")
if L then
	L.bossName = "솔리스트라자"
end

L = BigWigs:NewBossLocale("Alexei the Beastlord", "koKR")
if L then
	L.bossName = "야수군주 알렉세이"
end

L = BigWigs:NewBossLocale("Mason the Echo", "koKR")
if L then
	L.bossName = "메아리의 메이슨"
end

L = BigWigs:NewBossLocale("Reborn Council", "koKR")
if L then
	L.bossName = "부활의 의회"
	L[240795] = "헤로드"
	L[240809] = "비샤"
	L[240810] = "도안"
end

L = BigWigs:NewBossLocale("Lillian Voss", "koKR")
if L then
	L.bossName = "릴리안 보스"
end

L = BigWigs:NewBossLocale("Grand Crusader Caldoran", "koKR")
if L then
	L.bossName = "십자군 사령관 칼도란"
end
