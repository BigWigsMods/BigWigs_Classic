local L = BigWigs:NewBossLocale("Moam", "zhTW")
if not L then return end
if L then
	L.starttrigger = "%s因神態失常而坐立不安。"
end

L = BigWigs:NewBossLocale("Ossirian the Unscarred", "zhTW")
if L then
	L.debuff = "虛弱警報"
	L.debuff_desc = "無疤者奧斯里安受到虛弱效果影響時發出警報"
end

L = BigWigs:NewBossLocale("General Rajaxx", "zhTW")
if L then
	L.wave = "來襲警報"
	L.wave_desc = "當新一批敵人來襲時發出警報"

	L.trigger1 = "先殺再說...他們來了！" --開戰了才警告
	--L.trigger2 = "?????" -- There is no callout for wave 2 ><
	L.trigger3 = "我們懲罰的時刻就在眼前！讓黑暗支配敵人的內心吧！"
	L.trigger4 = "我們不需在被禁堵的門與石牆後等待了！我們的復仇將不再被否認！巨龍將在我們的憤怒之前顫抖！"
	L.trigger5 = "恐懼是給敵人的！恐懼與死亡！"
	L.trigger6 = "鹿盔將為了活命而啜泣、乞求，就像他的兒子一樣！一千年的不公將在今日結束！"
	L.trigger7 = "范達爾！你的時候到了！躲進翡翠夢境祈禱我們永遠不會找到你吧！"
	L.trigger8 = "厚顏無恥的笨蛋！我要親手殺了你！"
	L.trigger9 = "記得"

	L.warn1 = "第 1/8 波敵人"
	L.warn2 = "第 2/8 波敵人"
	L.warn3 = "第 3/8 波敵人"
	L.warn4 = "第 4/8 波敵人"
	L.warn5 = "第 5/8 波敵人"
	L.warn6 = "第 6/8 波敵人"
	L.warn7 = "第 7/8 波敵人"
	L.warn8 = "最後一波 拉賈克斯將軍！"
	L.warn9 = "第 1/8 波敵人" -- trigger for starting the event by pulling the first wave instead of talking to andorov
end

L = BigWigs:NewBossLocale("Ruins of Ahn'Qiraj Trash", "zhTW")
if L then
	--L.guardian = "Anubisath Guardian"
end
