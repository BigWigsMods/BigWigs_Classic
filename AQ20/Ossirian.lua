
--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Ossirian the Unscarred", 717)
if not mod then return end
mod:RegisterEnableMob(15339)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.bossName = "Ossirian the Unscarred"

	L.debuff = "Weakness"
	L.debuff_desc = "Warn for various weakness types."
end
L = mod:GetLocale()
mod.displayName = L.bossName

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"debuff",
		25176, -- Strength of Ossirian
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Weakness", 25181, 25177, 25178, 25180, 25183)
	self:Log("SPELL_AURA_REMOVED", "WeaknessRemoved", 25181, 25177, 25178, 25180, 25183)
	self:Log("SPELL_AURA_APPLIED", "StrengthOfOssirian", 25176)

	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")

	self:Death("Win", 15339)
end

function mod:OnEngage()
	self:StartWipeCheck()
	self:Message(25176, "Important") -- Strength of Ossirian
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Weakness(args)
	self:Message("debuff", "Attention", "Info", args.spellId)
	self:Bar("debuff", 45, args.spellId)

	self:DelayedMessage(25176, 30, "Attention", CL.custom_sec:format(self:SpellName(25176), 15))
	self:DelayedMessage(25176, 35, "Urgent", CL.custom_sec:format(self:SpellName(25176), 10))
	self:DelayedMessage(25176, 40, "Important", CL.custom_sec:format(self:SpellName(25176), 5))
	self:Bar(25176, 45)
end

function mod:WeaknessRemoved(args)
	self:Message("debuff", "Attention", nil, CL.over:format(args.spellName), args.spellId)
end

function mod:StrengthOfOssirian(args)
	self:Message(args.spellId, "Important")
end

--[[
L:RegisterTranslations("enUS", function() return {
	cmd = "Ossirian",

	supreme = "Supreme",
	supreme_desc = "Warn for Supreme Mode.",

	debuff = "Weakness",
	debuff_desc = "Warn for various weakness types.",

	supremewarn = "Ossirian Supreme Mode!",
	supremedelaywarn = "Supreme in %d seconds!",
	bartext = "Supreme",
} end )

L:RegisterTranslations("frFR", function() return {
	supreme = "Suprême",
	supreme_desc = "Préviens quand Ossirian passe en mode Suprême.",

	debuff = "Affaiblissements",
	debuff_desc = "Préviens quand Ossirian est affaibli face à certaines écoles de magie.",

	supremewarn = "Ossirian est en mode Suprême !",
	supremedelaywarn = "Suprême dans %d sec. !",
	bartext = "Suprême",
} end )

L:RegisterTranslations("deDE", function() return {
	supreme = "St\195\164rke des Ossirian",
	supreme_desc = "Warnung vor St\195\164rke des Ossirian.",

	debuff = "Debuff",
	debuff_desc = "Warnung vor Debuff.",

	supremewarn = "St\195\164rke des Ossirian!",
	supremedelaywarn = "St\195\164rke des Ossirian in %d Sekunden!",
	bartext = "St\195\164rke des Ossirian",
} end )

L:RegisterTranslations("zhCN", function() return {
	supreme = "无敌警报",
	supreme_desc = "奥斯里安进入无敌状态时发出警报",

	debuff = "虚弱警报",
	debuff_desc = "奥斯里安受到虚弱效果影响时发出警报",

	supremewarn = "无疤者奥斯里安无敌了！速退！",
	supremedelaywarn = "%d秒后奥斯里安无敌",
	bartext = "无敌",
} end )

L:RegisterTranslations("zhTW", function() return {
	supreme = "無敵警報",
	supreme_desc = "無疤者奧斯里安進入無敵狀態時發出警報",

	debuff = "虛弱警報",
	debuff_desc = "無疤者奧斯里安受到虛弱效果影響時發出警報",

	supremewarn = "已經進入了無敵模式！",
	supremedelaywarn = "%d 秒後無敵！",
	bartext = "無敵",
} end )

L:RegisterTranslations("koKR", function() return {
	supreme = "무적 경고",
	supreme_desc = "무적 모드에 대한 경고",

	debuff = "약화마법 경고",
	debuff_desc = "약화마법에 대한 경고",

	supremewarn = "오시리안 무적 상태!",
	supremedelaywarn = "%d초후 무적 상태 돌입!",
	bartext = "무적 상태",
} end )

L:RegisterTranslations("ruRU", function() return {
	supreme = "Божественный режим",
	supreme_desc = "Сообщать о божественном режиме.",

	debuff = "Слабость",
	debuff_desc = "Предупреждать о наложении слабости на игроков.",

	supremewarn = "Оссириан переходит в божественный режим и начинает биться на пределе своих возможностей!",
	supremedelaywarn = "Божественный режим через %d секунд!",
	bartext = "Божественный режим",
} end )
]]

