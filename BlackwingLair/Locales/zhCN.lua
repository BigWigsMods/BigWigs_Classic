local L = BigWigs:NewBossLocale("Razorgore the Untamed", "zhCN")
if not L then return end
if L then
	L.start_trigger = "入侵者"
	L.start_message = "狂野的拉佐格尔 - 战斗开始!"
	L.start_soon = "5秒开蛋！"
	L.start_mob = "开蛋"

	L.eggs = "取消龙蛋计数"
	L.eggs_desc = "取消剩余龙蛋计数 - 该功能还在完善中。。。"
	L.eggs_message = "%d/30 龙蛋已经摧毁"

	L.phase2_message = "所有龙蛋摧毁"
end

L = BigWigs:NewBossLocale("Nefarian ", "zhCN")
if L then
	L.landing_soon_trigger = "干得好，我的手下。"
	L.landing_trigger = "燃烧吧！你这个"
	L.zerg_trigger = "^不可能"

	L.triggershamans = "^萨满祭司"
	L.triggerwarlock = "^术士"
	L.triggerhunter = "^猎人"
	L.triggermage = "^你们也是法师"
	L.triggerdeathknight = "^死亡骑士"
	--L.triggermonk = "Monks"

	L.landing_soon_warning = "奈法利安将在10秒后降落！"
	L.landing_warning = "奈法利安已降落！"
	L.zerg_warning = "骨龙群出现！"
	L.classcall_warning = "职业点名！"

	L.warnshaman = "萨满祭司 - 图腾涌现！"
	L.warndruid = "德鲁伊 - 强制猫形态，无法治疗和解诅咒！"
	L.warnwarlock = "术士 - 地狱火出现，DPS职业尽快将其消灭！"
	L.warnpriest = "牧师 - 停止治疗，静等25秒！"
	L.warnhunter = "猎人 - 远程武器损坏！"
	L.warnwarrior = "战士 - 强制狂暴姿态，加大对MT的治疗量！"
	L.warnrogue = "盗贼 - 被传送和麻痹！"
	L.warnpaladin = "圣骑士 - BOSS受到保护祝福，物理攻击无效！"
	L.warnmage = "法师 - 变形术发动，注意解除！"
	L.warndeathknight = "死亡骑士 - 群体死亡之握！"
	--L.warnmonk = "Monks - Stuck Rolling"

	L.classcall_bar = "职业点名"

	L.classcall = "职业点名警报"
	L.classcall_desc = "职业点名警报"

	L.otherwarn = "其他警报"
	L.otherwarn_desc = "降落与骨龙群出现时发出警报"
end

L = BigWigs:NewBossLocale("Chromaggus", "zhCN")
if L then
	
end

