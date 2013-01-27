------------------------------
--      Are you local?      --
------------------------------

local boss = BB["Battleguard Sartura"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)
local L2 = AceLibrary("AceLocale-2.2"):new("BigWigsCommonWords")

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Sartura",

	start_trigger = "defiling these sacred grounds",

	whirlwind = "Whirlwind",
	whirlwind_desc = "Warn for Whirlwind.",
	whirlwind_trigger = "Battleguard Sartura gains Whirlwind.",
	whirlwind_message = "Whirlwind - %s - Whirlwind",
	whirlwind_fade = "Whirlwind faded!",
	whirlwind_bar = "Whirlwind",

	enrage_trigger = "%s becomes enraged!",
} end )

L:RegisterTranslations("frFR", function() return {
	start_trigger = "Vous serez jugés pour avoir profané ces lieux sacrés ! On ne défie pas les lois des Anciens ! Les intrus seront anéantis !",

	whirlwind = "Tourbillon",
	whirlwind_desc = "Préviens quand Sartura gagne Tourbillon.",
	whirlwind_trigger = "Garde de guerre Sartura gagne Tourbillon.",
	whirlwind_message = "Tourbillon - %s - Tourbillon",
	whirlwind_fade = "Tourbillon terminé !",
	whirlwind_bar = "Tourbillon",

	enrage_trigger = "%s devient fou furieux !",
} end )

L:RegisterTranslations("deDE", function() return {
	start_trigger = "Ihr habt heiligen Boden entweiht",

	whirlwind = "Wirbelwind",
	whirlwind_desc = "Warnung, wenn Sartura Wirbelwind wirkt.",
	whirlwind_trigger = "Schlachtwache Sartura bekommt 'Wirbelwind'.",
	whirlwind_message = "Wirbelwind! - %s - Wirbelwind!",
	whirlwind_fade = "Wirbelwind vorbei!",
	whirlwind_bar = "Wirbelwind",

	enrage_trigger = "%s wird w\195\188tend!",
} end )


L:RegisterTranslations("zhCN", function() return {
	start_trigger = "你们玷污了这片神圣的土地，会因此受到惩罚的！上古之神的律法不容藐视！入侵者要付出生命的代价！",--我宣判你死刑

	whirlwind = "旋风斩警报",
	whirlwind_desc = "旋风斩警报",
	whirlwind_trigger = "沙尔图拉获得了旋风斩的效果。",
	whirlwind_message = "旋风斩！ - %s",
	whirlwind_fade = "旋风斩消失 - 立刻击晕！",
	whirlwind_bar = "旋风斩",

	enrage_trigger = "沙尔图拉进入激怒状态！",
} end )

L:RegisterTranslations("zhTW", function() return {
	start_trigger = "玷汙這些神聖之地",

	whirlwind = "旋風斬警報",
	whirlwind_desc = "當沙爾圖拉施放旋風斬發出警報",
	whirlwind_trigger = "沙爾圖拉獲得了旋風斬的效果。",
	whirlwind_message = "沙爾圖拉施放 旋風斬！ - %s",
	whirlwind_fade = "旋風斬消失！",
	whirlwind_bar = "旋風斬",

	enrage_trigger = "沙爾圖拉獲得了狂怒的效果。",
} end )

L:RegisterTranslations("koKR", function() return {
	start_trigger = "성스러운 땅을 더럽힌 죗값을 받게 되리라. 고대의 법률은 거스를 수 없다! 침입자들을 처단하라!",

	whirlwind = "소용돌이",
	whirlwind_desc = "소용돌이에 대한 경고입니다.",
	whirlwind_trigger = "전투감시병 살투라|1이;가; 소용돌이 효과를 얻었습니다.",
	whirlwind_message = "소용돌이 - %s - 소용돌이",
	whirlwind_fade = "소용돌이 사라짐. 스턴! 스턴! 스턴!",
	whirlwind_bar = "소용돌이",

	enrage_trigger = "%s|1이;가; 격노 효과를 얻었습니다.",
} end )

L:RegisterTranslations("ruRU", function() return {
	start_trigger = "Загрязняются эти священные земли",

	whirlwind = "Ураган",
	whirlwind_desc = "Предупреждать о урагане.",
	whirlwind_trigger = "Боевой страж Сартура приобретает ураган.",
	whirlwind_message = "Ураган - %s - ураган",
	whirlwind_fade = "Ураган заканчивается!",
	whirlwind_bar = "Ураган",

	enrage_trigger = "%s впадет я бешенство!",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

local mod = BigWigs:NewModule(boss)
mod.zonename = BZ["Ahn'Qiraj"]
mod.enabletrigger = boss
mod.toggleOptions = {"enrage", "whirlwind", "bosskill"}
mod.revision = tonumber(("$Revision: 328 $"):sub(12, -3))

------------------------------
--      Initialization      --
------------------------------

function mod:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
	self:AddCombatListener("UNIT_DIED", "GenericBossDeath")
	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "SarWW", 5)
end

------------------------------
--      Event Handlers      --
------------------------------

function mod:BigWigs_RecvSync(sync)
	if sync == "SarWW" and self.db.profile.whirlwind then
		self:Message(L["whirlwind_message"]:format(boss), "Important")
		self:DelayedMessage(15, L["whirlwind_fade"], "Attention")
		self:Bar(L["whirlwind_bar"], 15, "Ability_Whirlwind")
	end
end

function mod:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS(msg)
	if msg == L["whirlwind_trigger"] then
		self:Sync("SarWW")
	end
end

function mod:CHAT_MSG_MONSTER_YELL(msg)
	if self.db.profile.enrage and msg:find(L["start_trigger"]) then
		self:Message(L2["enrage_start"]:format(boss, 10), "Attention")
		self:DelayedMessage(300, L2["enrage_min"]:format(5), "Positive")
		self:DelayedMessage(420, L2["enrage_min"]:format(3), "Positive")
		self:DelayedMessage(540, L2["enrage_min"]:format(1), "Positive")
		self:DelayedMessage(570, L2["enrage_sec"]:format(30), "Positive")
		self:DelayedMessage(590, L2["enrage_sec"]:format(10), "Urgent")
		self:DelayedMessage(595, L2["enrage_sec"]:format(5), "Urgent")
		self:Bar(L2["enrage"], 600, "Spell_Shadow_UnholyFrenzy")
	end
end

function mod:CHAT_MSG_MONSTER_EMOTE(msg)
	if self.db.profile.enrage and msg == L["enrage_trigger"] then
		self:Message(L2["enrage_end"]:format(boss), "Attention", nil, "Alarm")
	end
end
