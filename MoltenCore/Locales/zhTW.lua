local L = BigWigs:NewBossLocale("Ragnaros Classic", "zhTW")
if not L then return end
if L then
	L.submerge_trigger = "出現吧，我的奴僕"

	L.submerge = "消失"
	L.submerge_desc = "當拉格納羅斯消失時發出警報"
	L.submerge_message = "消失 90 秒！ 烈焰之子出現！"
	L.submerge_bar = "拉格納羅斯消失"

	L.emerge = "出現"
	L.emerge_desc = "當拉格納羅斯出現時發出警報。"
	L.emerge_message = "拉格納羅斯已經進入戰鬥，3分鐘後消失！"
	L.emerge_bar = "出現"
end
