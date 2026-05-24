-- Ahn'Qiraj 20

local L = BigWigs:NewBossLocale("General Rajaxx", "zhCN")
if L then
	L.wave_trigger1a = "它们来了。尽量别被它们干掉，新兵。"
	L.wave_trigger1b = "记得"
end

L = BigWigs:NewBossLocale("Buru the Gorger", "zhCN")
if L then
	L.fixate_desc = "锁定一个目标，忽视其他攻击者的威胁。"
end

L = BigWigs:NewBossLocale("Ayamiss the Hunter", "zhCN")
if L then
	L.sacrifice = "牺牲"
end

L = BigWigs:NewBossLocale("Ruins of Ahn'Qiraj Trash", "zhCN")
if L then
	L.guardian = "阿努比萨斯守卫者"
end

-- Ahn'Qiraj 40

L = BigWigs:NewBossLocale("Viscidus", "zhCN")
if L then
	L.freeze = "冻结状态"
	L.freeze_desc = "当冻结状态改变时发出警报。"

	L.freeze_trigger1 = "%s的速度慢下来了！"
	L.freeze_trigger2 = "%s冻结了！"
	L.freeze_trigger3 = "%s变成了坚硬的固体！"
	L.freeze_trigger4 = "%s开始出现裂缝！"
	L.freeze_trigger5 = "%s看起来就要碎裂了！"

	L.freeze_warn1 = "第一冻结阶段！"
	L.freeze_warn2 = "第二冻结阶段！"
	L.freeze_warn3 = "维希度斯冻住了！"
	L.freeze_warn4 = "开始碎了 - 继续！"
	L.freeze_warn5 = "快裂开了 - 加油！"
	L.freeze_warn_melee = "%d 物理攻击 - 还需%d下！"
	L.freeze_warn_frost = "%d 冰霜攻击 - 还需%d下！"
end

L = BigWigs:NewBossLocale("Silithid Royalty", "zhCN")
if L then
	L[15543] = "亚尔基"
	L[15544] = "维姆"
	L[15511] = "克里"
end

L = BigWigs:NewBossLocale("Ouro", "zhCN")
if L then
	L.emerge_message = "奥罗已出现"
	L.emerge_bar = "奥罗出现"

	L.submerge_message = "奥罗已下潜"
	L.submerge_bar = "奥罗下潜"
	L.submerge_early_message = "提前下潜 - 无人在攻击范围内"

	L.scarab = "甲虫消失"
	L.scarab_desc = "当甲虫消失时发出警报。"
	L.scarab_bar = "甲虫消失"
end

L = BigWigs:NewBossLocale("C'Thun", "zhCN")
if L then
	L.claw_tentacle = "利爪触须"
	L.claw_tentacle_desc = "利爪触须的计时器。"

	L.giant_claw_tentacle = "巨钩触须"
	L.giant_claw_tentacle_desc = "巨钩触须的计时器。"

	L.eye_tentacles = "眼球触须"
	L.eye_tentacles_desc = "眼球触须的计时器。"

	L.giant_eye_tentacle = "巨眼触须"
	L.giant_eye_tentacle_desc = "巨眼触须的计时器。"

	L.weakened_desc = "虚弱状态警报。"

	L.dark_glare_message = "%s: %s (队伍 %s)" -- Dark Glare: PLAYER_NAME (Group 1)
	L.stomach = "内场"
end

L = BigWigs:NewBossLocale("Ahn'Qiraj Trash", "zhCN")
if L then
	L.sentinel = "阿努比萨斯哨兵" -- NPC 15264
	L.brainwasher = "其拉洗脑者" -- NPC 15247
	L.defender = "阿努比萨斯防御者" -- NPC 15277
	L.crawler = "维克尼爬行者" -- NPC 15240

	L.target_buffs = "目标增益警报"
	L.target_buffs_desc = "当你的目标是阿努比萨斯哨兵时，会显示一个警报，提醒你有什么增益。"
	L.target_buffs_message = "目标增益: %s"
	L.detect_magic_missing_message = "你的目标缺少侦测魔法"
	L.detect_magic_warning = "法师必须对你的目标施放 \124cff71d5ff\124Hspell:2855:0\124h[侦测魔法]\124h\124r 这样警报才能生效。"
end

-- Blackwing Lair

L = BigWigs:NewBossLocale("Razorgore the Untamed", "zhCN")
if L then
	L.start_trigger = "入侵者"

	L.eggs = "龙蛋计数"
	L.eggs_desc = "已摧毁龙蛋计数。"
	L.eggs_message = "%d/30 龙蛋已被摧毁"
end

L = BigWigs:NewBossLocale("Vaelastrasz the Corrupt", "zhCN")
if L then
	L.warmup_trigger = "太晚了，朋友们" -- 太晚了，朋友们！奈法利安的堕落力量已经生效……我无法……控制自己。
end

L = BigWigs:NewBossLocale("Chromaggus", "zhCN")
if L then
	L.breath = "吐息警报"
	L.breath_desc = "吐息警报"

	L.debuffs_message = "3/5 减益，注意！"
	L.debuffs_warning = "4/5 减益， 5层后将%s！"
	L.bronze = "青铜"

	L.vulnerability = "弱点警报"
	L.vulnerability_desc = "克洛玛古斯弱点改变时发出警报。"
	L.vulnerability_message = "克洛玛古斯新弱点：%s"
	L.detect_magic_missing = "克洛玛古斯身上缺少侦测魔法"
	L.detect_magic_warning = "法师必须对克洛玛古斯施放 \124cff71d5ff\124Hspell:2855:0\124h[侦测魔法]\124h\124r ，这样弱点的警报才有效。"
end

L = BigWigs:NewBossLocale("Nefarian Classic", "zhCN")
if L then
	L.engage_yell_trigger = "比赛现在开始"
	L.stage3_yell_trigger = "不可能"

	L.shaman_class_call_yell_trigger = "萨满祭司"
	L.deathknight_class_call_yell_trigger = "死亡骑士"
	L.monk_class_call_yell_trigger = "武僧"
	L.hunter_class_call_yell_trigger = "猎人"

	L.warnshaman = "萨满祭司 - 图腾出现！"
	L.warndruid = "德鲁伊 - 强制猫形态，无法治疗和解诅咒！"
	L.warnwarlock = "术士 - 地狱火出现，输出职业尽快将其消灭！"
	L.warnpriest = "牧师 - 停止治疗，静等25秒！"
	L.warnhunter = "猎人 - 远程武器损坏！"
	L.warnwarrior = "战士 - 强制狂暴姿态，加大对坦克的治疗量！"
	L.warnrogue = "盗贼 - 被传送和麻痹！"
	L.warnpaladin = "圣骑士 - 首领受到保护祝福，物理攻击无效！"
	L.warnmage = "法师 - 变形术发动，注意解除！"
	L.warndeathknight = "死亡骑士 - 死亡之握！"
	L.warnmonk = "武僧 - 翻滚！"
	L.warndemonhunter = "恶魔猎手 - 致盲！"

	L.classcall = "职业点名"
	L.classcall_desc = "职业点名警报"

	L.add = "龙兽死亡"
	L.add_desc = "第1阶段奈法利安降落之前增援击杀计数警报。"
end

L = BigWigs:NewBossLocale("Blackwing Lair Trash", "zhCN")
if L then
	L.wyrmguard_overseer = "黑翼龙人护卫 / 黑翼监工" -- NPC 12460 / 12461
	L.sandstorm = "沙尘暴"

	L.target_vulnerability = "目标弱点警报"
	L.target_vulnerability_desc = "当你的目标是黑翼龙人护卫/黑翼监工时，显示它的弱点警报。"
	L.target_vulnerability_message = "目标弱点: %s"
	L.detect_magic_missing_message = "目标缺少侦测魔法"
	L.detect_magic_warning = "法师必须对你的目标施放\124cff71d5ff\124Hspell:2855:0\124h[侦测魔法]\124h\124r，弱点警报才会有效。"

	L.warlock = "黑翼管理者" -- NPC 12459
end

-- Molten Core

L = BigWigs:NewBossLocale("Ragnaros Classic", "zhCN")
if L then
	L.submerge_trigger = "出现吧，我的奴仆"
	L.son = "烈焰之子" -- NPC ID 12143
end

L = BigWigs:NewBossLocale("The Molten Core", "zhCN")
if L then
	L.bossName = "熔火之心"
end
