-- Blackfathom Deeps

local L = BigWigs:NewBossLocale("Baron Aquanis Discovery", "koKR")
if L then
	L.bossName = "군주 아쿠아니스"
end

L = BigWigs:NewBossLocale("Ghamoo-ra Discovery", "koKR")
if L then
	L.bossName = "가무라"
end

L = BigWigs:NewBossLocale("Lady Sarevess Discovery", "koKR")
if L then
	L.bossName = "여왕 사레베스"
end

L = BigWigs:NewBossLocale("Gelihast Discovery", "koKR")
if L then
	L.bossName = "겔리하스트"
end

L = BigWigs:NewBossLocale("Lorgus Jett Discovery", "koKR")
if L then
	L.bossName = "로구스 제트"
	L.priestess = "검은심연의 바다여사제"
	L.priestess_short = "여사제" -- Shortened version of L.priestess (Blackfathom Tide Priestess)
	L.murloc = "검은심연 멀록"
end

L = BigWigs:NewBossLocale("Twilight Lord Kelris Discovery", "koKR")
if L then
	L.bossName = "황혼의 군주 켈리스"
end

L = BigWigs:NewBossLocale("Aku'mai Discovery", "koKR")
if L then
	L.bossName = "아쿠마이"
end

-- Crystal Vale

L = BigWigs:NewBossLocale("Thunderaan Season of Discovery", "koKR")
if L then
	L.bossName = "왕자 썬더란"
	L.mender = "폭풍 치유사" -- NPC 231858
end

-- Gnomeregan

L = BigWigs:NewBossLocale("Grubbis Discovery", "koKR")
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

-- Nightmare Grove

L = BigWigs:NewBossLocale("Emeriss Season of Discovery", "koKR")
if L then
	L.bossName = "에메리스"
end

L = BigWigs:NewBossLocale("Lethon Season of Discovery", "koKR")
if L then
	L.bossName = "레손"
end

L = BigWigs:NewBossLocale("Taerar Season of Discovery", "koKR")
if L then
	L.bossName = "타에라"
end

L = BigWigs:NewBossLocale("Ysondre Season of Discovery", "koKR")
if L then
	L.bossName = "이손드레"
end

-- Scarlet Enclave

L = BigWigs:NewBossLocale("Balnazzar Scarlet Enclave", "koKR")
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

-- Storm Cliffs

L = BigWigs:NewBossLocale("Azuregos Season of Discovery", "koKR")
if L then
	L.bossName = "아주어고스"
end

-- Sunken Temple

L = BigWigs:NewBossLocale("Atal'alarion Discovery", "koKR")
if L then
	L.bossName = "아탈알라리온"
end

L = BigWigs:NewBossLocale("Festering Rotslime Discovery", "koKR")
if L then
	L.bossName = "곪아가는 부식수액"
end

L = BigWigs:NewBossLocale("Atal'ai Defenders Discovery", "koKR")
if L then
	L.bossName = "아탈라이 수호병"
end

L = BigWigs:NewBossLocale("Dreamscythe and Weaver Discovery", "koKR")
if L then
	L.bossName = "드림스사이드와 위버"
end

L = BigWigs:NewBossLocale("Avatar of Hakkar Discovery", "koKR")
if L then
	L.bossName = "학카르의 화신"
end

L = BigWigs:NewBossLocale("Jammal'an and Ogom Discovery", "koKR")
if L then
	L.bossName = "예언자 잠말란"
end

L = BigWigs:NewBossLocale("Morphaz and Hazzas Discovery", "koKR")
if L then
	L.bossName = "몰파즈와 하자스"
end

L = BigWigs:NewBossLocale("Shade of Eranikus Discovery", "koKR")
if L then
	L.bossName = "에라니쿠스의 사령"
	L.deep_slumber_clouds = "구름" -- Clouds of Slumber
	L.deep_slumber_player_debuff = "플레이어"
end

-- The Tainted Scar

L = BigWigs:NewBossLocale("Lord Kazzak Season of Discovery", "koKR")
if L then
	L.bossName = "군주 카자크"
end

-- World Bosses

L = BigWigs:NewBossLocale("Azuregos", "koKR")
if L then
	L.bossName = "아주어고스"
end

L = BigWigs:NewBossLocale("Lord Kazzak", "koKR")
if L then
	L.bossName = "군주 카자크"

	L.engage_trigger = "불타는 군단과 킬제덴을 위하여!"
end

L = BigWigs:NewBossLocale("Emeriss", "koKR")
if L then
	L.bossName = "에메리스"

	L.engage_trigger = "희망은 영혼의 병! 이 땅은 말라 죽을 것이다!"
end

L = BigWigs:NewBossLocale("Lethon", "koKR")
if L then
	L.bossName = "레손"

	L.engage_trigger = "네놈들의 마음속에서 어둠이 느껴지는구나. 사악한 존재가 쉴 곳은 없다!"
end

L = BigWigs:NewBossLocale("Taerar", "koKR")
if L then
	L.bossName = "타에라"

	L.engage_trigger = "평화란 부질없는 꿈일 뿐! 이 세상은 악몽이 지배할 것이다!"
end

L = BigWigs:NewBossLocale("Ysondre", "koKR")
if L then
	L.bossName = "이손드레"

	L.engage_trigger = "생명의 끈이 끊어졌다! 꿈꾸는 자들이 복수하는 것이 틀림없다!"
end
