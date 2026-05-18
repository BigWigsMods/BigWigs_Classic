-- Blackfathom Deeps

local L = BigWigs:NewBossLocale("Baron Aquanis Discovery", "zhCN")
if L then
	L.bossName = "阿奎尼斯男爵"
end

L = BigWigs:NewBossLocale("Ghamoo-ra Discovery", "zhCN")
if L then
	L.bossName = "加摩拉"
end

L = BigWigs:NewBossLocale("Lady Sarevess Discovery", "zhCN")
if L then
	L.bossName = "萨利维丝"
end

L = BigWigs:NewBossLocale("Gelihast Discovery", "zhCN")
if L then
	L.bossName = "格里哈斯特"
end

L = BigWigs:NewBossLocale("Lorgus Jett Discovery", "zhCN")
if L then
	L.bossName = "洛古斯·杰特"
	L.priestess = "黑暗深渊海潮祭司"
	L.priestess_short = "海潮祭司" -- Shortened version of L.priestess (Blackfathom Tide Priestess)
	L.murloc = "黑暗深渊鱼人"
end

L = BigWigs:NewBossLocale("Twilight Lord Kelris Discovery", "zhCN")
if L then
	L.bossName = "梦游者克尔里斯"
end

L = BigWigs:NewBossLocale("Aku'mai Discovery", "zhCN")
if L then
	L.bossName = "阿库麦尔"
end

-- Crystal Vale

L = BigWigs:NewBossLocale("Thunderaan Season of Discovery", "zhCN")
if L then
	L.bossName = "桑德兰王子"
	L.mender = "风暴愈疗者" -- NPC 231858
end

-- Gnomeregan

L = BigWigs:NewBossLocale("Grubbis Discovery", "zhCN")
if L then
	L.bossName = "格鲁比斯"
	L.aoe = "近战AOE"
	L.cloud = "一团毒云接近了首领"
	L.cone = "辐射？" -- "Frontal" Cone, it's a rear cone (he's farting) 还是使用技能名称（诡异的技能）
	L.warmup_say_chat_trigger = "诺莫瑞根" -- 在诺莫瑞根各地，还有一些会喷出辐射性物质的通风井。
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
end

L = BigWigs:NewBossLocale("Mechanical Menagerie Discovery", "zhCN")
if L then
	L.bossName = "机械博览馆"
	L.attack_buff = "+50% 攻击速度"
	--L.boss_at_hp = "%s at %d%%" -- BOSS_NAME at 50%
	L.red_button = "红色按钮"

	L[218242] = "|T134153:0:0:0:0:64:64:4:60:4:60|t龙"
	L[218243] = "|T136071:0:0:0:0:64:64:4:60:4:60|t羊"
	L[218244] = "|T133944:0:0:0:0:64:64:4:60:4:60|t松鼠"
	L[218245] = "|T135996:0:0:0:0:64:64:4:60:4:60|t鸡"

	L.run = "远离中场"
	L.run_desc = "当你击败首领时，会显示一条信息，让你远离中场跑到门口。这样做的目的是帮助你避免引起与新出现的首领开战。"
end

L = BigWigs:NewBossLocale("Mekgineer Thermaplugg Discovery", "zhCN")
if L then
	L.bossName = "机械师瑟玛普拉格"
	L.red_button = "红色按钮"
	L.position = "位置 %d" -- Position 5
end

-- Nightmare Grove

L = BigWigs:NewBossLocale("Emeriss Season of Discovery", "zhCN")
if L then
	L.bossName = "艾莫莉丝"
end

L = BigWigs:NewBossLocale("Lethon Season of Discovery", "zhCN")
if L then
	L.bossName = "莱索恩"
end

L = BigWigs:NewBossLocale("Taerar Season of Discovery", "zhCN")
if L then
	L.bossName = "泰拉尔"
end

L = BigWigs:NewBossLocale("Ysondre Season of Discovery", "zhCN")
if L then
	L.bossName = "伊森德雷"
end

-- Scarlet Enclave

L = BigWigs:NewBossLocale("Balnazzar Scarlet Enclave", "zhCN")
if L then
	L.bossName = "巴纳扎尔"
end

L = BigWigs:NewBossLocale("High Commander Beatrix", "zhCN")
if L then
	L.bossName = "高阶指挥官碧阿崔克丝"
	--L.meteor_yell_trigger = "如您所愿" -- 如您所愿，高阶指挥官！
	--L.waves_footmen_yell_trigger = "列队防守" -- 列队防守！
	--L.waves_cavalry_yell_trigger = "举起长矛" -- 明白！举起长矛！
	--L.arrows_yell_trigger = "Archers," -- Archers, unleash hell!
	--L.bombing_yell_trigger = "At once," -- At once, Beatrix!
end

L = BigWigs:NewBossLocale("Solistrasza", "zhCN")
if L then
	L.bossName = "瑟莉斯塔萨"
end

L = BigWigs:NewBossLocale("Alexei the Beastlord", "zhCN")
if L then
	L.bossName = "兽王阿莱克谢"
end

L = BigWigs:NewBossLocale("Mason the Echo", "zhCN")
if L then
	L.bossName = "回响者梅森"
end

L = BigWigs:NewBossLocale("Reborn Council", "zhCN")
if L then
	L.bossName = "复生议会"
	L[240795] = "赫洛德"
	L[240809] = "韦沙斯"
	L[240810] = "杜安"
end

L = BigWigs:NewBossLocale("Lillian Voss", "zhCN")
if L then
	L.bossName = "莉莉安·沃斯"
end

L = BigWigs:NewBossLocale("Grand Crusader Caldoran", "zhCN")
if L then
	L.bossName = "大十字军战士凯尔多兰"
end

-- Storm Cliffs

L = BigWigs:NewBossLocale("Azuregos Season of Discovery", "zhCN")
if L then
	L.bossName = "艾索雷苟斯"
end

-- Sunken Temple

L = BigWigs:NewBossLocale("Atal'alarion Discovery", "zhCN")
if L then
	L.bossName = "阿塔拉利恩"
end

L = BigWigs:NewBossLocale("Festering Rotslime Discovery", "zhCN")
if L then
	L.bossName = "腐溃烂泥"
end

L = BigWigs:NewBossLocale("Atal'ai Defenders Discovery", "zhCN")
if L then
	L.bossName = "阿塔莱防御者"
end

L = BigWigs:NewBossLocale("Dreamscythe and Weaver Discovery", "zhCN")
if L then
	L.bossName = "德姆塞卡尔和德拉维沃尔"
end

L = BigWigs:NewBossLocale("Avatar of Hakkar Discovery", "zhCN")
if L then
	L.bossName = "哈卡的化身"
end

L = BigWigs:NewBossLocale("Jammal'an and Ogom Discovery", "zhCN")
if L then
	L.bossName = "预言者迦玛兰和可悲的奥戈姆"
end

L = BigWigs:NewBossLocale("Morphaz and Hazzas Discovery", "zhCN")
if L then
	L.bossName = "摩弗拉斯和哈扎斯"
end

L = BigWigs:NewBossLocale("Shade of Eranikus Discovery", "zhCN")
if L then
	L.bossName = "伊兰尼库斯的阴影"
	L.deep_slumber_clouds = "云雾" -- 昏睡迷云
	L.deep_slumber_player_debuff = "玩家"
end

-- The Tainted Scar

L = BigWigs:NewBossLocale("Lord Kazzak Season of Discovery", "zhCN")
if L then
	L.bossName = "卡扎克"
end

-- World Bosses

L = BigWigs:NewBossLocale("Azuregos", "zhCN")
if L then
	L.bossName = "艾索雷苟斯"
end

L = BigWigs:NewBossLocale("Lord Kazzak", "zhCN")
if L then
	L.bossName = "卡扎克"

	L.engage_trigger = "为了军团！为了基尔加丹！"
end

L = BigWigs:NewBossLocale("Emeriss", "zhCN")
if L then
	L.bossName = "艾莫莉丝"

	L.engage_trigger = "希望是灵魂染上的疾病！这片土地应该枯竭，从此死气腾腾！"
end

L = BigWigs:NewBossLocale("Lethon", "zhCN")
if L then
	L.bossName = "莱索恩"

	L.engage_trigger = "我能感受到你内心的阴影。邪恶的侵蚀永远不会停止！"
end

L = BigWigs:NewBossLocale("Taerar", "zhCN")
if L then
	L.bossName = "泰拉尔"

	L.engage_trigger = "和平不过是短暂的梦想！让梦魇统治整个世界吧！"
end

L = BigWigs:NewBossLocale("Ysondre", "zhCN")
if L then
	L.bossName = "伊森德雷"

	L.engage_trigger = "生命的希冀已被切断！梦游者要展开报复！"
end
