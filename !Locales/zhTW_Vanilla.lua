-- Blackfathom Deeps

local L = BigWigs:NewBossLocale("Baron Aquanis Discovery", "zhTW")
if L then
	L.bossName = "阿奎尼斯男爵"
end

L = BigWigs:NewBossLocale("Ghamoo-ra Discovery", "zhTW")
if L then
	L.bossName = "加摩拉"
end

L = BigWigs:NewBossLocale("Lady Sarevess Discovery", "zhTW")
if L then
	L.bossName = "薩利維絲女士"
end

L = BigWigs:NewBossLocale("Gelihast Discovery", "zhTW")
if L then
	L.bossName = "格里哈斯特"
end

L = BigWigs:NewBossLocale("Lorgus Jett Discovery", "zhTW")
if L then
	L.bossName = "洛古斯·傑特"
	L.priestess = "黑澗深淵海潮祭司"
	L.priestess_short = "海潮祭司" -- Shortened version of L.priestess (Blackfathom Tide Priestess)
	L.murloc = "黑澗深淵魚人"
end

L = BigWigs:NewBossLocale("Twilight Lord Kelris Discovery", "zhTW")
if L then
	L.bossName = "暮光領主克爾里斯"
end

L = BigWigs:NewBossLocale("Aku'mai Discovery", "zhTW")
if L then
	L.bossName = "阿庫麥爾"
end

-- Crystal Vale

L = BigWigs:NewBossLocale("Thunderaan Season of Discovery", "zhTW")
if L then
	--L.bossName = "Prince Thunderaan"
	--L.mender = "Storm Mender" -- NPC 231858
end

-- Gnomeregan

L = BigWigs:NewBossLocale("Grubbis Discovery", "zhTW")
if L then
	L.bossName = "格魯比斯"
	L.aoe = "近戰AOE"
	L.cloud = "一團毒雲接近了首領"
	--L.cone = "\"Frontal\" cone" -- "Frontal" Cone, it's a rear cone (he's farting)
	--L.warmup_say_chat_trigger = "Gnomeregan" -- There are still ventilation shafts actively spewing radioactive material throughout Gnomeregan.
end

L = BigWigs:NewBossLocale("Viscous Fallout Discovery", "zhTW")
if L then
	L.bossName = "粘性輻射塵"
	L.desiccated_fallout = "乾燥的輻射塵" -- NPC ID 216810
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
	L.attack_buff = "+50% 攻擊速度"
	--L.boss_at_hp = "%s at %d%%" -- BOSS_NAME at 50%
	--L.red_button = "Red Button"

	L[218242] = "|T134153:0:0:0:0:64:64:4:60:4:60|t龍"
	L[218243] = "|T136071:0:0:0:0:64:64:4:60:4:60|t羊"
	L[218244] = "|T133944:0:0:0:0:64:64:4:60:4:60|t松鼠"
	L[218245] = "|T135996:0:0:0:0:64:64:4:60:4:60|t雞"

	--L.run = "Run to the door"
	--L.run_desc = "Show a message when you defeat this boss to run to the door. This is intended to help you avoid accidentally engaging the next boss."
end

L = BigWigs:NewBossLocale("Mekgineer Thermaplugg Discovery", "zhTW")
if L then
	L.bossName = "機電師瑟瑪普拉格"
	--L.red_button = "Red Button"
	--L.position = "Position %d" -- Position 5
end

-- Nightmare Grove

L = BigWigs:NewBossLocale("Emeriss Season of Discovery", "zhTW")
if L then
	L.bossName = "艾莫莉絲"
end

L = BigWigs:NewBossLocale("Lethon Season of Discovery", "zhTW")
if L then
	L.bossName = "雷索"
end

L = BigWigs:NewBossLocale("Taerar Season of Discovery", "zhTW")
if L then
	L.bossName = "泰拉爾"
end

L = BigWigs:NewBossLocale("Ysondre Season of Discovery", "zhTW")
if L then
	L.bossName = "伊索德雷"
end

-- Scarlet Enclave

L = BigWigs:NewBossLocale("Balnazzar Scarlet Enclave", "zhTW")
if L then
	--L.bossName = "Balnazzar"
end

L = BigWigs:NewBossLocale("High Commander Beatrix", "zhTW")
if L then
	--L.bossName = "High Commander Beatrix"
	--L.meteor_yell_trigger = "As you wish" -- As you wish, High Commander!
	--L.waves_footmen_yell_trigger = "Form up" -- Form up and hold the line!
	--L.waves_cavalry_yell_trigger = "Ready your lances" -- Understod! Ready your lances!
	--L.arrows_yell_trigger = "Archers," -- Archers, unleash hell!
	--L.bombing_yell_trigger = "At once," -- At once, Beatrix!
end

L = BigWigs:NewBossLocale("Solistrasza", "zhTW")
if L then
	--L.bossName = "Solistrasza"
end

L = BigWigs:NewBossLocale("Alexei the Beastlord", "zhTW")
if L then
	--L.bossName = "Alexei the Beastlord"
end

L = BigWigs:NewBossLocale("Mason the Echo", "zhTW")
if L then
	--L.bossName = "Mason the Echo"
end

L = BigWigs:NewBossLocale("Reborn Council", "zhTW")
if L then
	L.bossName = "重生議會"
	--L[240795] = "Herod"
	--L[240809] = "Vishas"
	--L[240810] = "Doan"
end

L = BigWigs:NewBossLocale("Lillian Voss", "zhTW")
if L then
	--L.bossName = "Lillian Voss"
end

L = BigWigs:NewBossLocale("Grand Crusader Caldoran", "zhTW")
if L then
	--L.bossName = "Grand Crusader Caldoran"
end

-- Storm Cliffs

L = BigWigs:NewBossLocale("Azuregos Season of Discovery", "zhTW")
if L then
	L.bossName = "艾索雷葛斯"
end

-- Sunken Temple

L = BigWigs:NewBossLocale("Atal'alarion Discovery", "zhTW")
if L then
	--L.bossName = "Atal'alarion"
end

L = BigWigs:NewBossLocale("Festering Rotslime Discovery", "zhTW")
if L then
	--L.bossName = "Festering Rotslime"
end

L = BigWigs:NewBossLocale("Atal'ai Defenders Discovery", "zhTW")
if L then
	--L.bossName = "Atal'ai Defenders"
end

L = BigWigs:NewBossLocale("Dreamscythe and Weaver Discovery", "zhTW")
if L then
	--L.bossName = "Dreamscythe and Weaver"
end

L = BigWigs:NewBossLocale("Avatar of Hakkar Discovery", "zhTW")
if L then
	--L.bossName = "Avatar of Hakkar"
end

L = BigWigs:NewBossLocale("Jammal'an and Ogom Discovery", "zhTW")
if L then
	--L.bossName = "Jammal'an and Ogom"
end

L = BigWigs:NewBossLocale("Morphaz and Hazzas Discovery", "zhTW")
if L then
	--L.bossName = "Morphaz and Hazzas"
end

L = BigWigs:NewBossLocale("Shade of Eranikus Discovery", "zhTW")
if L then
	--L.bossName = "Shade of Eranikus"
	--L.deep_slumber_clouds = "Clouds" -- Clouds of Slumber
	--L.deep_slumber_player_debuff = "Player"
end

-- The Tainted Scar

L = BigWigs:NewBossLocale("Lord Kazzak Season of Discovery", "zhTW")
if L then
	L.bossName = "卡札克"
end

-- World Bosses

L = BigWigs:NewBossLocale("Azuregos", "zhTW")
if L then
	L.bossName = "艾索雷葛斯"
end

L = BigWigs:NewBossLocale("Lord Kazzak", "zhTW")
if L then
	L.bossName = "卡札克"

	L.engage_trigger = "為了軍團！為了基爾加德！"
end

L = BigWigs:NewBossLocale("Emeriss", "zhTW")
if L then
	L.bossName = "艾莫莉絲"

	L.engage_trigger = "希望是靈魂染上的疾病！這片土地應該枯竭，從此死氣騰騰！"
end

L = BigWigs:NewBossLocale("Lethon", "zhTW")
if L then
	L.bossName = "雷索"

	L.engage_trigger = "我能感受到你內心的陰影。邪惡的侵蝕永遠不會停止！"
end

L = BigWigs:NewBossLocale("Taerar", "zhTW")
if L then
	L.bossName = "泰拉爾"

	L.engage_trigger = "和平不過是短暫的夢想！讓夢魘統治整個世界吧！"
end

L = BigWigs:NewBossLocale("Ysondre", "zhTW")
if L then
	L.bossName = "伊索德雷"

	L.engage_trigger = "生命的希冀已被切斷！夢遊者要展開報復！"
end
