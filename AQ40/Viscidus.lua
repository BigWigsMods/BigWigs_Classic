
--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Viscidus", 766)
if not mod then return end
mod:RegisterEnableMob(15299)

local swingCount = -1
local frostCount = 0

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.bossName = "Viscidus"

	L.freeze = "Freezing States"
	L.freeze_desc = "Warn for the different frozen states."
	L.freeze_icon = 11836 -- spell_frost_glacier / Freeze Solid
	L.freeze_trigger1 = "%s begins to slow!"
	L.freeze_trigger2 = "%s is freezing up!"
	L.freeze_trigger3 = "%s is frozen solid!"
	L.freeze_trigger4 = "%s begins to crack!"
	L.freeze_trigger5 = "%s looks ready to shatter!"
	L.freeze_warn1 = "First freeze phase!"
	L.freeze_warn2 = "Second freeze phase!"
	L.freeze_warn3 = "Viscidus is frozen!"
	L.freeze_warn4 = "Cracking up - keep going!"
	L.freeze_warn5 = "Cracking up - almost there!"
	L.freeze_warn_melee = "%d melee attacks - %d more to go"
	L.freeze_warn_frost = "%d frost attacks - %d more to go"
end
L = mod:GetLocale()
mod.displayName = L.bossName

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"freeze",
		25991, -- Poison Bolt Volley
		25989, -- Toxin
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "PoisonBoltVolley", 25991)

	self:Log("SPELL_PERIODIC_DAMAGE", "ToxinDamage", 25989)
	self:Log("SPELL_PERIODIC_MISSED", "ToxinDamage", 25989)
	self:Log("SPELL_AURA_APPLIED", "ToxinDamage", 25989)

	self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")

	self:Death("Win", 15299)
end

function mod:OnEngage()
	self:StartWipeCheck()
end

function mod:OnWipe()
	frostCount = 0 -- We might pull with a frost ability, so don't reset on engage
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:PoisonBoltVolley(args)
	swingCount = -1
	self:Message(args.spellId, "Attention")
	self:CDBar(args.spellId, 10)
end

do
	local prev = 0
	function mod:ToxinDamage(args)
		local t = GetTime()
		if t-prev > 2 and self:Me(args.destGUID) then
			prev = t
			self:Message(args.spellId, "Personal", "Alarm", CL.underyou:format(args.spellName))
		end
	end
end

function mod:COMBAT_LOG_EVENT_UNFILTERED(_,_,event,_,_,_,_,_,destGUID,_,_,_,_,_,school)
	if event == "SPELL_DAMAGE" and school == 0x10 and self:MobId(destGUID) == 15299 then -- 0x10 is Frost
		frostCount = frostCount + 1
		if frostCount < 20 and frostCount % 3 == 0 then
			self:Message("freeze", "Positive", nil, L.freeze_warn_frost:format(frostCount, 20-frostCount), L.freeze_icon)
		end
	elseif event == "SWING_DAMAGE" and swingCount ~= -1 and self:MobId(destGUID) == 15299 then
		swingCount = swingCount + 1
		if swingCount < 30 and swingCount % 3 == 0 then
			self:Message("freeze", "Positive", nil, L.freeze_warn_melee:format(swingCount, 30-swingCount), L.freeze_icon)
		end
	end
end

function mod:CHAT_MSG_MONSTER_EMOTE(event, msg)
	if msg == L.freeze_trigger1 then
		self:Message("freeze", "Neutral", nil, L.freeze_warn1, L.freeze_icon)
	elseif msg == L.freeze_trigger2 then
		self:Message("freeze", "Neutral", nil, L.freeze_warn2, L.freeze_icon)
	elseif msg == L.freeze_trigger3 then
		swingCount = 0
		self:Message("freeze", "Important", nil, L.freeze_warn3, L.freeze_icon)
		self:Bar("freeze", 30, L.freeze_warn3, L.freeze_icon)
		self:ScheduleTimer("OnWipe", 27) -- Reset the frostCount
	elseif msg == L.freeze_trigger4 then
		self:Message("freeze", "Urgent", nil, L.freeze_warn4, L.freeze_icon)
	elseif msg == L.freeze_trigger5 then
		self:Message("freeze", "Important", nil, L.freeze_warn5, L.freeze_icon)
	end
end


--[[
L:RegisterTranslations("enUS", function() return {
	cmd = "Viscidus",

	volley = "Poison Volley",
	volley_desc = "Warn for Poison Volley.",
	volley_trigger = "afflicted by Poison Bolt Volley.$",
	volley_bar = "Poison Bolt Volley",
	volley_message = "Poison Bolt Volley!",
	volley_warning = "Poison Bolt Volley in ~3 sec!",

	toxinyou = "Toxin Cloud on You",
	toxinyou_desc = "Warn if you are standing in a toxin cloud.",
	toxin_you = "You are in the toxin cloud!",

	toxinother = "Toxin Cloud on Others",
	toxinother_desc = "Warn if others are standing in a toxin cloud.",
	toxin_other = " is in a toxin cloud!",

	whisper = "Whisper Others",
	whisper_desc = "Whisper others that are standing in a toxin cloud.",



	toxin_trigger = "^([^%s]+) ([^%s]+) afflicted by Toxin.$",
} end )

L:RegisterTranslations("deDE", function() return {
	volley = "Poison Volley Alert", -- ?
	volley_desc = "Warn for Poison Volley", -- ?
	volley_trigger = "afflicted by Poison Bolt Volley", -- ?
	volley_bar = "Poison Bolt Volley",
	volley_message = "Poison Bolt Volley!", -- ?
	volley_warning = "Incoming Poison Bolt Volley in ~3 Sekunden!", -- ?

	toxinyou = "Toxin Wolke",
	toxinyou_desc = "Warnung, wenn Du in einer Toxin Wolke stehst.",
	toxin_you = "Du bist in einer Toxin Wolke!",

	toxinother = "Toxin Wolke auf Anderen",
	toxinother_desc = "Warnung, wenn andere Spieler in einer Toxin Wolke stehen.",
	toxin_other = " ist in einer Toxin Wolke!",

	freeze = "Freeze Phasen",
	freeze_desc = "Zeigt die verschiedenen Freeze Phasen an.",
	freeze_trigger1 = "wird langsamer!",
	freeze_trigger2 = "friert ein!",
	freeze_trigger3 = "ist tiefgefroren!",
	freeze_trigger4 = "geht die Puste aus!", --CHECK
	freeze_trigger5 = "ist kurz davor, zu zerspringen!",
	freeze_warn1 = "Erste Freeze Phase!",
	freeze_warn2 = "Zweite Freeze Phase!",
	freeze_warn3 = "Dritte Freeze Phase!",
	freeze_warn4 = "Zerspringen - etwas noch!",
	freeze_warn5 = "Zerspringen - fast da!",

	toxin_trigger = "^([^%s]+) ([^%s]+) von Toxin betroffen.$",
} end )

L:RegisterTranslations("zhCN", function() return {
	volley = "毒性之箭警报",
	volley_desc = "毒性之箭警报",
	volley_trigger = "受到了毒性之箭效果",
	volley_bar = "毒性之箭",
	volley_message = "毒性之箭 - 迅速解毒！",
	volley_warning = "3秒后发动毒性之箭！",

	toxinyou = "玩家毒云警报",
	toxinyou_desc = "你站在毒云中时发出警报",
	toxin_you = "你在毒云中 - 快跑开！",

	toxinother = "队友毒云警报",
	toxinother_desc = "队友站在毒云中时发出警报",
	toxin_other = " 在毒云中 - 快跑开！",

	freeze = "冻结状态警报",
	freeze_desc = "冻结状态警报",
	freeze_trigger1 = "的速度慢下来了！",
	freeze_trigger2 = "冻结了！",
	freeze_trigger3 = "变成了坚硬的固体！",
	freeze_trigger4 = "开始碎裂了！",
	freeze_trigger5 = "马上就要碎裂的样子！",
	freeze_warn1 = "冻结第一阶段！",
	freeze_warn2 = "冻结第二阶段 - 做好准备",
	freeze_warn3 = "冻结第三阶段 - DPS全开！",
	freeze_warn4 = "即将碎裂 - 加大火力！",
	freeze_warn5 = "即将碎裂 - 几近成功！",

	toxin_trigger = "^(.+)受(.+)了剧毒效果的影响。$",
} end )

L:RegisterTranslations("zhTW", function() return {
	volley = "毒性之箭警報",
	volley_desc = "當維希度斯施放毒性之箭時時發出警報",
	volley_trigger = "受到了毒性之箭效果",
	volley_bar = "毒性之箭",
	volley_message = "毒性之箭 - 迅速解毒！",
	volley_warning = "3 秒後發動毒性之箭！",

	toxinyou = "玩家毒雲警報",
	toxinyou_desc = "你站在毒雲中時發出警報",
	toxin_you = "你在毒雲中！快跑開！",

	toxinother = "隊友毒雲警報",
	toxinother_desc = "隊友站在毒雲中時發出警報",
	toxin_other = "在毒雲中！快跑開！！",

	freeze = "凍結狀態警報",
	freeze_desc = "友方被凍結時發出警報",
	freeze_trigger1 = "的速度慢下來了！",
	freeze_trigger2 = "凍住了！",
	freeze_trigger3 = "變成了堅硬的固體！",
	freeze_trigger4 = "開始碎裂了！",
	freeze_trigger5 = "馬上就要碎裂的樣子！",
	freeze_warn1 = "凍結階段 1/3 ！",
	freeze_warn2 = "凍結階段 2/3 ！做好准備！",
	freeze_warn3 = "凍結階段 3/3 ！火力全開！",
	freeze_warn4 = "碎裂階段 1/3 ！加大火力！",
	freeze_warn5 = "碎裂階段 2/3 ！幾近成功！",

	toxin_trigger = "^(.+)受到(.*)劇毒的",
} end )

L:RegisterTranslations("koKR", function() return {
	volley = "연발 독액",
	volley_desc = "연발 독액에 대한 경고입니다.",
	volley_trigger = "연발 독액에 걸렸습니다.$",	-- CHECK
	volley_bar = "연발 독액",
	volley_message = "연발 독액 - 독 해제 하세요!",
	volley_warning = "연발 독액 - 약 3 초후 시전!",

	toxinyou = "당신에 독구름",
	toxinyou_desc = "당신이 독구름에 걸리면 알립니다.",
	toxin_you = "당신은 독구름에 걸렸습니다!",

	toxinother = "타인에 독구름",
	toxinother_desc = "타인이 독구름에 걸리면 알립니다.",
	toxin_other = "님이 독소에 걸렸습니다 - 대피!",

	freeze = "빙결 상태",
	freeze_desc = "각각의 빙결 상태에 대해 경고합니다.",
	freeze_trigger1 = "%s|1이;가; 느려지기 시작했습니다!",	-- CHECK
	freeze_trigger2 = "%s|1이;가; 얼어붙고 있습니다!",	-- CHECK
	freeze_trigger3 = "%s|1이;가; 단단하게 얼었습니다!",	-- CHECK
	freeze_trigger4 = "%s|1이;가; 분해되기 시작합니다!",	-- CHECK
	freeze_trigger5 = "%s|1이;가; 부서질 것 같습니다!",	-- CHECK
	freeze_warn1 = "1 단계 - 느려집니다!",
	freeze_warn2 = "2 단계 - 얼어붙고 있습니다!",
	freeze_warn3 = "3 단계 - 얼었습니다! 물리 공격 시작!",
	freeze_warn4 = "4 단계 - 좀 더 빠르게 공격!",
	freeze_warn5 = "5 단계 - 거의 부서졌습니다!",

	toxin_trigger = "^([^|;%s]*)(.*)독소에 걸렸습니다%.$", -- CHECK
} end )

L:RegisterTranslations("frFR", function() return {
	volley = "Salve d'éclairs de poison",
	volley_desc = "Préviens de l'arrivée des Salve d'éclairs de poison.",
	volley_trigger = "les effets .* Salve d'éclairs de poison.$",
	volley_bar = "Salve d'éclairs de poison",
	volley_message = "Salve d'éclairs de poison !",
	volley_warning = "Salve d'éclairs de poison dans ~3 sec. !",

	toxinyou = "Nuage de toxines sur vous",
	toxinyou_desc = "Préviens si vous vous trouvez dans un nuage de toxines.",
	toxin_you = "Vous êtes dans un nuage de toxines !",

	toxinother = "Nuage de toxines sur les autres",
	toxinother_desc = "Préviens si un joueur se trouve dans un nuage de toxines.",
	toxin_other = " est dans un nuage de toxines !",

	whisper = "Chuchoter aux autres",
	whisper_desc = "Préviens les autres par chuchotements qu'ils sont dans un nuage de toxines.",

	freeze = "Etats de gel",
	freeze_desc = "Préviens quand Viscidus entre dans un nouvel état de gel.",
	freeze_trigger1 = "%s commence à ralentir !",
	freeze_trigger2 = "%s est gelé !",
	freeze_trigger3 = "%s est congelé !",
	freeze_trigger4 = "%s commence à se briser !",
	freeze_trigger5 = "%s semble prêt à se briser !",
	freeze_warn1 = "Premère phase de gel !",
	freeze_warn2 = "Deuxième phase de gel !",
	freeze_warn3 = "Viscidus est congelé !",
	freeze_warn4 = "Se brise - encore un peu !",
	freeze_warn5 = "Se brise - on y est presque !",

	toxin_trigger = "^([^%s]+) ([^%s]+) les effets .* Toxine.$",
} end )

L:RegisterTranslations("ruRU", function() return {
	volley = "Ядовитый залп",
	volley_desc = "Сообщать о ядовитом залпе.",
	volley_trigger = "Повреждения ядовитым залпом.$",
	volley_bar = "Выстрел ядовитым залпом",
	volley_message = "Выстрел ядовитым залпом!",
	volley_warning = "Выстрел ядовитым залпом через 3 секунды!",

	toxinyou = "Вы в облаке токсинов",
	toxinyou_desc = "Сообщать о том, что вы стоите в облаке токсинов",
	toxin_you = "Вы стоите в облаке токсинов ! Выйдите из него!",

	toxinother = "Игроки в облаке токсинов!",
	toxinother_desc = "Сообщать о том, что игроки рейда стоят в облаке токсинов",
	toxin_other = " стоит в облаке токсинов!",

	whisper = "Шептать стоящему в облаке токсинов",
	whisper_desc = "Отправлять сообщения игрокам, стоящим в облаке токсинов",

	freeze = "Замораживание Статов",
	freeze_desc = "Предупреждать о различных замороженых статах.",
	freeze_trigger1 = "%s замедлен!!",
	freeze_trigger2 = "%s заморожен!",
	freeze_trigger3 = "%s заморожен!\ тело!",
	freeze_trigger4 = "%s Начинает трескаться!",
	freeze_trigger5 = "%s Скоро разобьётся на части!!",
	freeze_warn1 = "Первая стадия заморозки!",
	freeze_warn2 = "Вторая стадия заморозки!",
	freeze_warn3 = "Нечистотон заморожен!",
	freeze_warn4 = "Скоро может разбится!",
	freeze_warn5 = "сейчас разобьёться!",

	toxin_trigger = "^([^%s]+) ([^%s]+) поражён токсинами.$",
} end )
]]

