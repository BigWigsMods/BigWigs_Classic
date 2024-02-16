local L = BigWigs:NewBossLocale("Ragnaros Classic", "zhCN")
if not L then return end
if L then
	L.submerge_trigger = "出现吧，我的奴仆"

	L.submerge = "消失"
	L.submerge_desc = "当拉格纳罗斯消失时发出警报。"
	L.submerge_message = "拉格纳罗斯消失90秒！"
	L.submerge_bar = "消失"

	L.emerge = "出现"
	L.emerge_desc = "当拉格纳罗斯出现时发出警报。"
	L.emerge_message = "拉格纳罗斯已经激活，3分钟后消失！"
	L.emerge_bar = "出现"
end
