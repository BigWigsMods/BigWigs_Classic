------------------------------
--      Are you local?      --
------------------------------

local boss = BB["Vaelastrasz the Corrupt"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)
local pName = UnitName("player")

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Vaelastrasz",

	youburning = "You are burning",
	youburning_desc = "Warn when you are burning.",
	you_warn = "You are burning!",

	elseburning = "Someone else is burning",
	elseburning_desc = "Warn when others are burning.",
	else_warn = "%s is burning!",

	icon = "Raid Icon on bomb",
	icon_desc = "Put a Raid Icon on the person who's the bomb. (Requires promoted or higher).",
} end)

L:RegisterTranslations("ruRU", function() return {
	youburning = "Вы горите",
	youburning_desc = "Предупреждать, когда вы горите.",
	you_warn = "ВЫ ГОРИТЕ!",

	elseburning = "Кто-то горит",
	elseburning_desc = "Предупреждать, когда кто-то горит.",
	else_warn = "%s ГОРИТ!",

	icon = "Рейдовая иконка на бомбе",
	icon_desc = "Помечать рейдовой иконкой игрока, являющегося бомбой (необходимо быть лидером группы или рейда).",
} end)

L:RegisterTranslations("zhCN", function() return {
	youburning = "玩家燃烧警报",
	youburning_desc = "你燃烧时发出警报",
	you_warn = "你在燃烧！",

	elseburning = "队友燃烧警报",
	elseburning_desc = "队友燃烧时发出警报",
	else_warn = "%s 在燃烧！",

	icon = "炸弹图标",
	icon_desc = "在燃烧的队友头上标记骷髅图标（需要助理或领袖权限）",
} end)

L:RegisterTranslations("zhTW", function() return {
	youburning = "玩家燃燒警報",
	youburning_desc = "你燃燒時發出警報",
	you_warn = "你正在燃燒！",

	elseburning = "隊友燃燒警報",
	elseburning_desc = "隊友燃燒時發出警報",
	else_warn = "%s 正在燃燒！",

	icon = "炸彈標記",
	icon_desc = "在被燃燒的隊友頭上標記（需要助理或領隊權限）",
} end)

L:RegisterTranslations("koKR", function() return {
	youburning = "당신의 아드레날린 경고",
	youburning_desc = "당신이 아드레날린에 대한 경고",
	you_warn = "당신은 불타는 아드레날린에 걸렸습니다!",

	elseburning = "타인의 아드레날린 경고",
	elseburning_desc = "타인의 아드레날린에 대한 경고",
	else_warn = "%s님이 불타는 아드레날린에 걸렸습니다!",

	icon = "폭탄에 공격대 아이콘 지정",
	icon_desc = "폭탄이 된 사람에 공격대 아이콘 지정. (승급자 이상 요구)",
} end)

L:RegisterTranslations("deDE", function() return {
	youburning = "Du brennst",
	youburning_desc = "Warnung, wenn Du brennst.",
	you_warn = "Du brennst!",

	elseburning = "X brennt",
	elseburning_desc = "Warnung, wenn andere Spieler brennen.",
	else_warn = "%s brennt!",

	icon = "Symbol",
	icon_desc = "Platziert ein Symbol \195\188ber dem Spieler der brennt. (Ben\195\182tigt Anf\195\188hrer oder Bef\195\182rdert Status.)",
} end)

L:RegisterTranslations("frFR", function() return {
	youburning = "Vous brûlez",
	youburning_desc = "Préviens quand vous brûlez.",
	you_warn = "Vous brûlez !",

	elseburning = "Quelqu'un d'autre brûle",
	elseburning_desc = "Préviens quand quelqu'un d'autre brûle.",
	else_warn = "%s brûle !",

	icon = "Icône",
	icon_desc = "Place une icône de raid sur le dernier joueur affecté par la bombe (nécessite d'être promu ou mieux).",
} end)

----------------------------------
--      Module Declaration      --
----------------------------------

local mod = BigWigs:NewModule(boss)
mod.zonename = BZ["Blackwing Lair"]
mod.enabletrigger = boss
mod.toggleOptions = {"youburning", "elseburning", "icon", "bosskill"}
mod.revision = tonumber(("$Revision: 226 $"):sub(12, -3))

------------------------------
--      Initialization      --
------------------------------

function mod:OnEnable()
	self:AddCombatListener("SPELL_AURA_APPLIED", "Bomb", 18173, 23620)
	self:AddCombatListener("UNIT_DIED", "GenericBossDeath")
end

------------------------------
--      Event Handlers      --
------------------------------

function mod:Bomb(player, spellID)
	local other = L["else_warn"]:format(player)
	if player == pName and self.db.profile.youburning then
		self:LocalMessage(L["you_warn"], "Personal", spellID)
		self:WideMessage(other)
	elseif self.db.profile.elseburning then
		self:IfMessage(other, "Attention", spellID)
		self:Whisper(player, L["you_warn"])
	end
	self:Icon(player, "icon")
	self:Bar(other, 20, spellID)
end

