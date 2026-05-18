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
	--L.mender = "Storm Mender" -- NPC 231858
end

-- Gnomeregan

L = BigWigs:NewBossLocale("Grubbis Discovery", "koKR")
if L then
	L.bossName = "그루비스"
	--L.aoe = "AoE melee damage"
	--L.cloud = "A cloud reached the boss"
	--L.cone = "\"Frontal\" cone" -- "Frontal" Cone, it's a rear cone (he's farting)
	--L.warmup_say_chat_trigger = "Gnomeregan" -- There are still ventilation shafts actively spewing radioactive material throughout Gnomeregan.
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
	--L.attack_buff = "+50% attack speed"
	--L.boss_at_hp = "%s at %d%%" -- BOSS_NAME at 50%
	--L.red_button = "Red Button"

	L[218242] = "|T134153:0:0:0:0:64:64:4:60:4:60|t용"
	L[218243] = "|T136071:0:0:0:0:64:64:4:60:4:60|t양"
	L[218244] = "|T133944:0:0:0:0:64:64:4:60:4:60|t다람쥐"
	L[218245] = "|T135996:0:0:0:0:64:64:4:60:4:60|t닭"

	--L.run = "Run to the door"
	--L.run_desc = "Show a message when you defeat this boss to run to the door. This is intended to help you avoid accidentally engaging the next boss."
end

L = BigWigs:NewBossLocale("Mekgineer Thermaplugg Discovery", "koKR")
if L then
	L.bossName = "멕기니어 텔마플러그"
	--L.red_button = "Red Button"
	--L.position = "Position %d" -- Position 5
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
	--L.bossName = "Balnazzar"
end

L = BigWigs:NewBossLocale("High Commander Beatrix", "koKR")
if L then
	--L.bossName = "High Commander Beatrix"
	--L.meteor_yell_trigger = "As you wish" -- As you wish, High Commander!
	--L.waves_footmen_yell_trigger = "Form up" -- Form up and hold the line!
	--L.waves_cavalry_yell_trigger = "Ready your lances" -- Understod! Ready your lances!
	--L.arrows_yell_trigger = "Archers," -- Archers, unleash hell!
	--L.bombing_yell_trigger = "At once," -- At once, Beatrix!
end

L = BigWigs:NewBossLocale("Solistrasza", "koKR")
if L then
	--L.bossName = "Solistrasza"
end

L = BigWigs:NewBossLocale("Alexei the Beastlord", "koKR")
if L then
	--L.bossName = "Alexei the Beastlord"
end

L = BigWigs:NewBossLocale("Mason the Echo", "koKR")
if L then
	--L.bossName = "Mason the Echo"
end

L = BigWigs:NewBossLocale("Reborn Council", "koKR")
if L then
	L.bossName = "부활의 의회"
	--L[240795] = "Herod"
	--L[240809] = "Vishas"
	--L[240810] = "Doan"
end

L = BigWigs:NewBossLocale("Lillian Voss", "koKR")
if L then
	--L.bossName = "Lillian Voss"
end

L = BigWigs:NewBossLocale("Grand Crusader Caldoran", "koKR")
if L then
	--L.bossName = "Grand Crusader Caldoran"
end

-- Storm Cliffs

L = BigWigs:NewBossLocale("Azuregos Season of Discovery", "koKR")
if L then
	L.bossName = "아주어고스"
end

-- Sunken Temple

L = BigWigs:NewBossLocale("Atal'alarion Discovery", "koKR")
if L then
	--L.bossName = "Atal'alarion"
end

L = BigWigs:NewBossLocale("Festering Rotslime Discovery", "koKR")
if L then
	--L.bossName = "Festering Rotslime"
end

L = BigWigs:NewBossLocale("Atal'ai Defenders Discovery", "koKR")
if L then
	--L.bossName = "Atal'ai Defenders"
end

L = BigWigs:NewBossLocale("Dreamscythe and Weaver Discovery", "koKR")
if L then
	--L.bossName = "Dreamscythe and Weaver"
end

L = BigWigs:NewBossLocale("Avatar of Hakkar Discovery", "koKR")
if L then
	--L.bossName = "Avatar of Hakkar"
end

L = BigWigs:NewBossLocale("Jammal'an and Ogom Discovery", "koKR")
if L then
	--L.bossName = "Jammal'an and Ogom"
end

L = BigWigs:NewBossLocale("Morphaz and Hazzas Discovery", "koKR")
if L then
	--L.bossName = "Morphaz and Hazzas"
end

L = BigWigs:NewBossLocale("Shade of Eranikus Discovery", "koKR")
if L then
	--L.bossName = "Shade of Eranikus"
	--L.deep_slumber_clouds = "Clouds" -- Clouds of Slumber
	--L.deep_slumber_player_debuff = "Player"
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
