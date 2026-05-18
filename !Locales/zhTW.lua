-- Ahn'Qiraj 20

local L = BigWigs:NewBossLocale("General Rajaxx", "zhTW")
if L then
	L.wave_trigger1a = "先殺再說...他們來了！"
	L.wave_trigger1b = "記得"
end

L = BigWigs:NewBossLocale("Buru the Gorger", "zhTW")
if L then
	L.fixate_desc = "鎖定一個目標，忽視其他攻擊者的威脅。"
end

L = BigWigs:NewBossLocale("Ayamiss the Hunter", "zhTW")
if L then
	L.sacrifice = "犧牲"
end

L = BigWigs:NewBossLocale("Ruins of Ahn'Qiraj Trash", "zhTW")
if L then
	L.guardian = "阿努比薩斯守衛者"
end

-- Ahn'Qiraj 40

L = BigWigs:NewBossLocale("Viscidus", "zhTW")
if L then
	--L.freeze = "Freezing States"
	--L.freeze_desc = "Warn for the different frozen states."

	L.freeze_trigger1 = "%s開始變慢了！"
	L.freeze_trigger2 = "%s開始結冰了！"
	L.freeze_trigger3 = "%s被牢牢凍住了！"
	L.freeze_trigger4 = "%s開始爆裂！"
	L.freeze_trigger5 = "%s看來準備粉碎了！"

	--L.freeze_warn1 = "First freeze phase!"
	--L.freeze_warn2 = "Second freeze phase!"
	--L.freeze_warn3 = "Viscidus is frozen!"
	--L.freeze_warn4 = "Cracking up - keep going!"
	--L.freeze_warn5 = "Cracking up - almost there!"
	--L.freeze_warn_melee = "%d melee attacks - %d more to go"
	--L.freeze_warn_frost = "%d frost attacks - %d more to go"
end

L = BigWigs:NewBossLocale("Silithid Royalty", "zhTW")
if L then
	L[15543] = "亞爾基"
	L[15544] = "維姆"
	L[15511] = "克里"
end

L = BigWigs:NewBossLocale("Ouro", "zhTW")
if L then
	--L.emerge_message = "Ouro has emerged"
	--L.emerge_bar = "Emerge"

	--L.submerge_message = "Ouro has submerged"
	--L.submerge_bar = "Submerge"
	--L.submerge_early_message = "Early Submerge - No one was in range"

	--L.scarab = "Scarab Despawn"
	--L.scarab_desc = "Warn for Scarab Despawn."
	--L.scarab_bar = "Scarabs despawn"
end

L = BigWigs:NewBossLocale("C'Thun", "zhTW")
if L then
	--L.claw_tentacle = "Claw Tentacle"
	--L.claw_tentacle_desc = "Timers for the claw tentacle."

	--L.giant_claw_tentacle = "Giant Claw"
	--L.giant_claw_tentacle_desc = "Timers for the giant claw tentacle."

	--L.eye_tentacles = "Eye Tentacles"
	--L.eye_tentacles_desc = "Timers for the 8 eye tentacles."

	--L.giant_eye_tentacle = "Giant Eye"
	--L.giant_eye_tentacle_desc = "Timers for the giant eye tentacle."

	--L.weakened_desc = "Warn for weakened state."

	--L.dark_glare_message = "%s: %s (Group %s)" -- Dark Glare: PLAYER_NAME (Group 1)
	--L.stomach = "Stomach"
end

L = BigWigs:NewBossLocale("Ahn'Qiraj Trash", "zhTW")
if L then
	L.sentinel = "阿努比薩斯哨兵" -- NPC 15264
	L.brainwasher = "其拉洗腦者" -- NPC 15247
	L.defender = "阿努比薩斯防衛者" -- NPC 15277
	L.crawler = "維克尼斯爬行者" -- NPC 15240

	--L.target_buffs = "Target Buff Warnings"
	--L.target_buffs_desc = "When your target is an Anubisath Sentinel, show a warning for what buff it has."
	--L.target_buffs_message = "Target Buffs: %s"
	--L.detect_magic_missing_message = "Detect Magic is missing from your target"
	--L.detect_magic_warning = "A Mage must cast \124cff71d5ff\124Hspell:2855:0\124h[Detect Magic]\124h\124r on your target for buff warnings to work."
end

-- Blackwing Lair

L = BigWigs:NewBossLocale("Razorgore the Untamed", "zhTW")
if L then
	L.start_trigger = "入侵者"

	L.eggs = "龍蛋計數"
	L.eggs_desc = "已摧毀龍蛋計數。"
	L.eggs_message = "已摧毀 %d/30 個龍蛋"
end

L = BigWigs:NewBossLocale("Vaelastrasz the Corrupt", "zhTW")
if L then
	--L.warmup_trigger = "Too late, friends!"
end

L = BigWigs:NewBossLocale("Chromaggus", "zhTW")
if L then
	L.breath = "吐息警報"
	L.breath_desc = "當克洛瑪古斯吐息時發出警報"

	L.debuffs_message = "3/5 減益，注意！"
	L.debuffs_warning = "4/5 減益， 5層後將%s！"
	L.bronze = "青銅"

	L.vulnerability = "弱點改變警報"
	L.vulnerability_desc = "當克洛瑪古斯弱點改變時發出警報。"
	L.vulnerability_message = "克洛瑪古斯新弱點：%s"
	--L.detect_magic_missing = "Detect Magic is missing from Chromaggus"
	--L.detect_magic_warning = "A Mage must cast \124cff71d5ff\124Hspell:2855:0\124h[Detect Magic]\124h\124r on Chromaggus for vulnerability warnings to work."
end

L = BigWigs:NewBossLocale("Nefarian Classic", "zhTW")
if L then
	L.engage_yell_trigger = "讓賽事開始吧！"
	L.stage3_yell_trigger = "不可能！來吧，我的僕人！再次為你們的主人服務！"

	L.shaman_class_call_yell_trigger = "薩滿，讓我看看你圖騰到底是什麼用處的"
	L.deathknight_class_call_yell_trigger = "死亡騎士們…來這"
	L.monk_class_call_yell_trigger = "武僧"
	L.hunter_class_call_yell_trigger = "獵人和你那討厭的豌豆射擊"

	L.warnshaman = "薩滿 - 圖騰湧現"
	L.warndruid = "德魯伊 - 強制貓形態，無法治療和解詛咒"
	L.warnwarlock = "術士 - 地獄火出現，DPS職業盡快將其消滅"
	L.warnpriest = "牧師 - 停止治療，靜等 25 秒"
	L.warnhunter = "獵人 - 遠程武器損壞"
	L.warnwarrior = "戰士 - 強制狂暴姿態，加大對MT的治療量"
	L.warnrogue = "盜賊 - 被傳送和麻痺"
	L.warnpaladin = "聖騎士 - BOSS受到保護祝福，物理攻擊無效"
	L.warnmage = "法師 - 變形術發動，注意解除"
	L.warndeathknight = "死亡騎士 - 死亡之握"
	L.warnmonk = "武僧 - 翻滾"
	L.warndemonhunter = "惡魔獵人 - 致盲"

	L.classcall = "職業點名"
	L.classcall_desc = "當奈法利安進行職業點名時發出警報"

	--L.add = "Drakonid deaths"
	--L.add_desc = "Announce the number of adds killed in stage 1 before Nefarian lands."
end

L = BigWigs:NewBossLocale("Blackwing Lair Trash", "zhTW")
if L then
	--L.wyrmguard_overseer = "Death Talon Wyrmguard / Death Talon Overseer" -- NPC 12460 / 12461
	--L.sandstorm = "Sandstorm"

	--L.target_vulnerability = "Target Vulnerability Warnings"
	--L.target_vulnerability_desc = "When your target is a Death Talon Wyrmguard or a Death Talon Overseer, show a warning for what vulnerability it has."
	--L.target_vulnerability_message = "Target Vulnerability: %s"
	--L.detect_magic_missing_message = "Detect Magic is missing from your target"
	--L.detect_magic_warning = "A Mage must cast \124cff71d5ff\124Hspell:2855:0\124h[Detect Magic]\124h\124r on your target for vulnerability warnings to work."

	--L.warlock = "Blackwing Warlock" -- NPC 12459
end

-- Molten Core

L = BigWigs:NewBossLocale("Ragnaros Classic", "zhTW")
if L then
	L.submerge_trigger = "出現吧，我的奴僕"
	--L.son = "Son of Flame" -- NPC ID 12143
end

L = BigWigs:NewBossLocale("The Molten Core", "zhTW")
if L then
	--L.bossName = "The Molten Core"
end
