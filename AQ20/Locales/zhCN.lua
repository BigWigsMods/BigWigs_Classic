local L = BigWigs:NewBossLocale("Moam", "zhCN")
if not L then return end
if L then
	L.starttrigger = "%s察觉到了你的恐惧。"
end

L = BigWigs:NewBossLocale("Ossirian the Unscarred", "zhCN")
if L then
	L.debuff = "虚弱"
	L.debuff_desc = "当各种虚弱类型时发出警报。"
end

L = BigWigs:NewBossLocale("General Rajaxx", "zhCN")
if L then
	L.wave = "来袭警报"
	L.wave_desc = "当新一批敌人来袭时发出警报"

	L.trigger1 = "它们来了。尽量别被它们干掉，新兵。"
	--L.trigger2 = "?????" -- There is no callout for wave 2 ><
	L.trigger3 = "我们复仇的时刻到了！让敌人的内心被黑暗吞噬吧！"
	L.trigger4 = "我们不用再呆在这座石墙里面了！我们很快就能报仇了！在我们的怒火面前，就连那些龙也会战栗！"
	L.trigger5 = "让敌人胆战心惊吧！让他们在恐惧中死去！"
	L.trigger6 = "鹿盔将会呜咽着哀求我饶他一命，就像他那懦弱的儿子一样！一千年来的屈辱会在今天洗清！"
	L.trigger7 = "范达尔！你的死期到了！藏到翡翠梦境里去吧，祈祷我们永远都找不到你！"
	L.trigger8 = "无礼的蠢货！我会亲自要了你们的命！"
	L.trigger9 = "记得"

	L.warn1 = "第 1/8 批敌人来了！注意！"
	L.warn2 = "第 2/8 批敌人来了！注意！"
	L.warn3 = "第 3/8 批敌人来了！注意！"
	L.warn4 = "第 4/8 批敌人来了！注意！"
	L.warn5 = "第 5/8 批敌人来了！注意！"
	L.warn6 = "第 6/8 批敌人来了！注意！"
	L.warn7 = "第 7/8 批敌人来了！注意！"
	L.warn8 = "拉贾克斯将军亲自上阵！"
	L.warn9 = "第 1/8 批敌人来了！注意！" -- trigger for starting the event by pulling the first wave instead of talking to andorov
end

L = BigWigs:NewBossLocale("Ruins of Ahn'Qiraj Trash", "zhCN")
if L then
	L.guardian = "阿努比萨斯守卫者"
end
