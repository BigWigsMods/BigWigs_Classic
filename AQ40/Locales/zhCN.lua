local L = BigWigs:NewBossLocale("Battleguard Sartura", "zhCN")
if not L then return end
if L then
	L.engage_trigger = "你们玷污了这片神圣的土地，会因此受到惩罚的！上古之神的律法不容藐视！入侵者要付出生命的代价！" -- You will be judged for defiling these sacred grounds!  The laws of the Ancients will not be challenged!  Trespassers will be annihilated!\r\n
end

L = BigWigs:NewBossLocale("Viscidus", "zhCN")
if L then
	L.freeze = "冻结状态"
	L.freeze_desc = "当冻结状态改变时发出警报。"
	L.freeze_trigger1 = "%s的速度慢下来了！"
	L.freeze_trigger2 = "%s冻结了！"
	L.freeze_trigger3 = "%s变成了坚硬的固体！"
	L.freeze_trigger4 = "%s突然裂开了！"
	L.freeze_trigger5 = "%s看起来就要碎裂了！"
	L.freeze_warn1 = "第一冻结阶段！"
	L.freeze_warn2 = "第二冻结阶段！"
	L.freeze_warn3 = "维希度斯冻住了！"
	L.freeze_warn4 = "开始碎了 - 继续！"
	L.freeze_warn5 = "快裂开了 - 加油！"
	L.freeze_warn_melee = ">%d<物理攻击 - 还需>%d<下！"
	L.freeze_warn_frost = ">%d<冰霜攻击 - 还需>%d<下！"
end

L = BigWigs:NewBossLocale("Ouro", "zhCN")
if L then
	L.engage_message = "奥罗已进入战斗！90秒后可能下潜！"
	L.possible_submerge_bar = "可能下潜"

	L.emergeannounce = "奥罗已出现！"
	L.emergewarn = "15秒后可能下潜！"
	L.emergewarn2 = "15秒后奥罗下潜！"
	L.emergebartext = "奥罗下潜"

	L.submergeannounce = "奥罗已下潜！"
	L.submergewarn = "5秒后奥罗出现！"
	L.submergebartext = "奥罗出现"

	L.scarab = "甲虫消失"
	L.scarab_desc = "当甲虫消失时发出警报。"
	L.scarabdespawn = "10秒后甲虫消失"
	L.scarabbar = "甲虫消失"
end

L = BigWigs:NewBossLocale("Ahn'Qiraj Trash", "zhCN")
if L then
	L.defender = "阿努比萨斯防御者"
	L.crawler = "维克尼爬行者"
end

L = BigWigs:NewBossLocale("C'Thun", "zhCN")
if L then
	L.tentacle_desc = "触须警报"

	L.giant = "巨眼警报"
	L.giant_desc = "巨眼警报。"

	L.weakened = "虚弱警报"
	L.weakened_desc = "虚弱状态警报。"
	L.weakenedtrigger = "%s的力量被削弱了！"

	L.weakened_msg = "克苏恩已虚弱持续45秒"
	L.invulnerable2 = "5秒后结束"
	L.invulnerable1 = "克苏恩无敌"

	L.giant3 = "10秒后 - 巨眼"
	L.giant2 = "5秒后 - 巨眼"
	L.giant1 = "巨眼 - 快打！"

	L.startwarn = "克苏恩进入战斗 - 45秒后黑暗闪耀和眼睛"

	L.tentacleParty = "大量触须！"
	L.barWeakened = "克苏恩已虚弱！"
	L.barGiant = "巨眼！"

	L.groupwarning = "黑暗闪耀位于队伍%s（%s）"
	L.phase2starting = "眼睛已死！真身降临！"
end

