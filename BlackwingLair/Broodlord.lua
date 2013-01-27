------------------------------
--      Are you local?      --
------------------------------

local boss = BB["Broodlord Lashlayer"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)
local pName = UnitName("player")

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Broodlord",

	youms = "Mortal strike on you",
	youms_desc = "Warn when you get mortal strike.",
	you_warn = "Mortal Strike on YOU!",

	elsems = "Mortal strike on others",
	elsems_desc = "Warn when someone else gets mortal strike.",
	else_warn = "Mortal Strike: %s!",
} end )

L:RegisterTranslations("zhCN", function() return {
	you_warn = "你中了致死打击！",
	else_warn = "%s中了致死打击！",

	youms = "玩家致死打击警报",
	youms_desc = "你中了致死打击时发出警报",

	elsems = "队友致死打击警报",
	elsems_desc = "队友中了致死打击时发出警报",
} end )

L:RegisterTranslations("zhTW", function() return {
	you_warn = "你中了致死打擊！",
	else_warn = "%s 中了致死打擊！",

	youms = "玩家致死打擊警報",
	youms_desc = "你中了致死打擊時發出警報",

	elsems = "隊友致死打擊警報",
	elsems_desc = "隊友中了致死打擊時發出警報",
} end )

L:RegisterTranslations("deDE", function() return {
	you_warn = "T\195\182dlicher Sto\195\159 auf Dir!",
	else_warn = "T\195\182dlicher Sto\195\159 auf %s!",

	youms = "T\195\182dlicher Sto\195\159 auf Dir",
	youms_desc = "Warnung, wenn Du von T\195\182dlicher Sto\195\159 betroffen bist.",

	elsems = "T\195\182dlicher Sto\195\159 auf X",
	elsems_desc = "Warnung, wenn andere Spieler von T\195\182dlicher Sto\195\159 betroffen sind.",
} end )

L:RegisterTranslations("koKR", function() return {
	you_warn = "당신은 죽음의 일격!",
	else_warn = "<<%s>> 죽음의 일격!",

	youms = "자신의 죽음의 일격 경고",
	youms_desc = "당신이 죽음의 일격에 걸렸을 때 경고",

	elsems = "타인의 죽음의 일격 경고",
	elsems_desc = "타인이 죽음의 일격에 걸렸을 때 경고",
} end )

L:RegisterTranslations("frFR", function() return {
	youms = "Frappe mortelle sur vous",
	youms_desc = "Préviens quand vous subissez les effets de la Frappe mortelle.",
	you_warn = "Frappe mortelle sur VOUS !",

	elsems = "Frappe mortelle sur les autres",
	elsems_desc = "Préviens quand quelqu'un d'autre subit les effets de la Frappe mortelle.",
	else_warn = "Frappe mortelle : %s!",
} end )

L:RegisterTranslations("ruRU", function() return {
	youms = "Смертельный удар на вас",
	youms_desc = "Предупреждать о смертельном ударе против вас.",
	you_warn = "Смертельный удар на ВАС!!",

	elsems = "Смертельный удар на других",
	elsems_desc = "Предупреждать о смертельном ударе на других.",
	else_warn = "Смертельный удар: %s!",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

local mod = BigWigs:NewModule(boss)
mod.zonename = BZ["Blackwing Lair"]
mod.enabletrigger = boss
mod.toggleOptions = {"youms", "elsems", "bosskill"}
mod.revision = tonumber(("$Revision: 226 $"):sub(12, -3))

------------------------------
--      Initialization      --
------------------------------

function mod:OnEnable()
	self:AddCombatListener("SPELL_AURA_APPLIED", "MS", 13737, 15708, 16856, 17547, 19643, 24573, 29572, 31911, 32736, 35054) --XXX speaks for itself
	self:AddCombatListener("UNIT_DIED", "GenericBossDeath")
end

------------------------------
--      Event Handlers      --
------------------------------

function mod:MS(player, spellID)
	local other = L["else_warn"]:format(player)
	if player == pName and self.db.profile.youms then
		self:LocalMessage(L["you_warn"], "Personal", spellID)
		self:WideMessage(other)
	elseif self.db.profile.elsems then
		self:IfMessage(other, "Attention", spellID)
	end
	self:Bar(other, 5, spellID)
end

