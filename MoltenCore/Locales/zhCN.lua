
local L = BigWigs:NewBossLocale("Lucifron", "zhCN")
if L then
	L.mc_bar = "控制: %s"
end

L = BigWigs:NewBossLocale("Majordomo Executus", "zhCN")
if L then
	L.disabletrigger = "不可能！等一下"
	L.warn = "5秒后释放反射护盾！"
end

L = BigWigs:NewBossLocale("Ragnaros", "zhCN")
if L then
	L.knockback_trigger = "尝尝萨弗隆的火焰吧"
	L.submerge_trigger = "出现吧，我的奴仆"
	L.engage_trigger = "现在轮到你们了"

	L.knockback = "群体击退警报"
	L.knockback_desc = "拉格纳罗斯施放群体击退发出警报"
	L.knockback_bar = "群体击退"
	L.knockback_message = "群体击退！"

	L.emerge = "出现警报"
	L.emerge_desc = "出现警报"
	L.emerge_message = "拉格纳罗斯已经激活，将在3分钟后暂时消失并召唤烈焰之子！"
	L.emerge_bar = "拉格纳罗斯出现"

	L.submerge = "消失警报"
	L.submerge_desc = "拉格纳罗斯消失，儿子出现发出警报"
	L.submerge_message = "拉格纳罗斯消失90秒。烈焰之子出现！"
	L.submerge_bar = "拉格纳罗斯消失"
end

