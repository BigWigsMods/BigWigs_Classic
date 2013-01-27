------------------------------
--      Are you local?      --
------------------------------

local boss = BB["Ayamiss the Hunter"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

local paraID = GetSpellInfo(25725)
L:RegisterTranslations("enUS", function() return {
	cmd = "Ayamiss",

	sacrifice = "Sacrifice",
	sacrifice_desc = "Warn who is being sacrificed (Paralyze).",
	paralyze_warn = "Paralyze: %s",
} end )

L:RegisterTranslations("frFR", function() return {
	sacrifice = "Sacrifice",
	sacrifice_desc = "Préviens quand un joueur est sacrifié (Paralysie).",
	paralyze_warn = "Paralysie : %s",
} end )

L:RegisterTranslations("deDE", function() return {
	sacrifice = "Opferung",
	sacrifice_desc = "Warnung, wenn ein Spieler geopfert wird.",
	paralyze_warn = paraID..": %s", --temporary, please translate properly localizers!
} end )

L:RegisterTranslations("zhCN", function() return {
	sacrifice = "祭品警报",
	sacrifice_desc = "被作为祭品时发出警报",
	paralyze_warn = "麻痹: %s",
} end )

L:RegisterTranslations("zhTW", function() return {
	sacrifice = "祭品警報",
	sacrifice_desc = "玩家成為祭品時發出警報",
	paralyze_warn = paraID..": %s", --temporary, please translate properly localizers!
} end )

L:RegisterTranslations("koKR", function() return {
	sacrifice = "마비 경고",
	sacrifice_desc = "마비에 대한 경고",
	paralyze_warn = paraID..": %s", --temporary, please translate properly localizers!
} end )

L:RegisterTranslations("ruRU", function() return {
	sacrifice = "Жертва",
	sacrifice_desc = "Предупреждает о параличе игрока (Паралич).",
	paralyze_warn = "Парализовало: %s",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

local mod = BigWigs:NewModule(boss)
mod.zonename = BZ["Ruins of Ahn'Qiraj"]
mod.enabletrigger = boss
mod.toggleOptions = {"sacrifice", "bosskill"}
mod.revision = tonumber(("$Revision: 150 $"):sub(12, -3))

------------------------------
--      Initialization      --
------------------------------

function mod:OnEnable()
	self:AddCombatListener("SPELL_AURA_APPLIED", "Paralyze", 25725)
	self:AddCombatListener("UNIT_DIED", "GenericBossDeath")
end

------------------------------
--      Event Handlers      --
------------------------------

function mod:Paralyze(player, spellID)
	if self.db.profile.sacrifice then
		local warn = L["paralyze_warn"]:format(player)
		self:IfMessage(warn, "Attention", spellID)
		self:Bar(warn, 10, spellID)
	end
end

