------------------------------
--      Are you local?      --
------------------------------

local veklor = BB["Emperor Vek'lor"]
local veknilash = BB["Emperor Vek'nilash"]
local boss = BB["The Twin Emperors"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs" .. boss)

local started = nil

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Twins",

	teleport = "Teleport Alert",
	teleport_desc = "Warn for Teleport",

	enrage = "Enrage Alert",
	enrage_desc = "Warn for Enrage",

	heal = "Heal Alert",
	heal_desc = "Warn for Twins Healing",

	portwarn = "Teleport!",
	portdelaywarn = "Teleport in ~5 seconds!",
	portdelaywarn2 = "Teleport in ~10 seconds!",
	bartext = "Teleport",

	healwarn = "Casting Heal!",
} end )

L:RegisterTranslations("deDE", function() return {
	teleport = "Teleport",
	teleport_desc = "Warnung, wenn die Zwillings Imperatoren sich teleportieren.",

	enrage = "Wutanfall",
	enrage_desc = "Warnung, wenn die Zwillings Imperatoren w\195\188tend werden.",

	heal = "Heilung",
	heal_desc = "Warnung, wenn die Zwillings Imperatoren sich heilen.",

	portwarn = "Teleport!",
	portdelaywarn = "Teleport in ~5 Sekunden!",
	portdelaywarn2 = "Teleport in ~10 Sekunden!",
	bartext = "Teleport",

	healwarn = "Heilung gewirkt!",
} end )

L:RegisterTranslations("zhCN", function() return {
	teleport = "传送警报",
	teleport_desc = "传送警报",

	enrage = "激怒警报",
	enrage_desc = "激怒警报",

	heal = "治疗警报",
	heal_desc = "双子皇帝互相治疗时发出警报",

	portwarn = "双子传送发动！",
	portdelaywarn = "~5秒后发动双子传送！",
	portdelaywarn2 = "~10秒后发动双子传送！",
	bartext = "双子传送",

	healwarn = "正在施放治疗兄弟 - 快将他们分开！",
} end )

L:RegisterTranslations("zhTW", function() return {
	teleport = "傳送警報",
	teleport_desc = "雙子皇帝施放雙子傳送時發出警報",

	enrage = "狂怒警報",
	enrage_desc = "雙子皇帝的狂怒倒數計時與時警報",

	heal = "治療警報",
	heal_desc = "雙子皇帝互相治療時發出警報",

	portwarn = "雙子傳送發動！",
	portdelaywarn = "5 秒後發動雙子傳送！",
	portdelaywarn2 = "10 秒後發動雙子傳送！",
	bartext = "雙子傳送",

	healwarn = "正在施放治療兄弟 - 快拉開！",
} end )

L:RegisterTranslations("koKR", function() return {
--	bug = "벌레 폭발 경고",
--	bug_desc = "벌레 폭발에 대한 경고",

	teleport = "순간이동 경고",
	teleport_desc = "순간이동에 대한 경고",

	enrage = "격노 경고",
	enrage_desc = "격노에 대한 경고",

	heal = "치유 경고",
	heal_desc = "형제 치유에 대한 경고",

	portwarn = "순간 이동!",
	portdelaywarn = "약 5초후 순간 이동!",
	portdelaywarn2 = "약 10초후 순간 이동!",
	bartext = "순간 이동",

	healwarn = "형제 치유 시전중 - 쌍둥이 분리!",
} end )

L:RegisterTranslations("frFR", function() return {
	teleport = "Téléportation",
	teleport_desc = "Préviens quand les jumeaux échangent leurs places.",

	enrage = "Enrager",
	enrage_desc = "Préviens quand les jumeaux deviennent enragés.",

	heal = "Soin",
	heal_desc = "Préviens quand les jumeaux utilisent leur sort Soigner frère.",

	portwarn = "Téléportation !",
	portdelaywarn = "Téléportation dans ~5 sec. !",
	portdelaywarn2 = "Téléportation dans ~10 sec. !",
	bartext = "Téléportation",

	healwarn = "Incante un soin !",
} end )

L:RegisterTranslations("ruRU", function() return {
	teleport = "Опасность телепорта",
	teleport_desc = "Предупреждать о телепорте",

	enrage = "Опасность бешенства",
	enrage_desc = "Предупреждать о бешенстве",

	heal = "Опасность лечения",
	heal_desc = "Предупреждать о лечении императоров",

	portwarn = "Телепорт!",
	portdelaywarn = "Телепорт через 5 секунд! ",
	portdelaywarn2 = "Телепорт через 10 секунд!",
	bartext = "Телепорт",

	healwarn = "Кастует лечение!",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

local mod = BigWigs:NewModule(boss)
mod.zonename = BZ["Ahn'Qiraj"]
mod.enabletrigger = {veklor, veknilash}
mod.guid = 15275
mod.toggleOptions = {"teleport", "enrage", "heal", "bosskill"}
mod.revision = tonumber(("$Revision: 328 $"):sub(12, -3))

------------------------------
--      Initialization      --
------------------------------

function mod:OnEnable()
	started = nil

	self:AddCombatListener("UNIT_DIED", "Deaths")

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("BigWigs_RecvSync")

	self:AddCombatListener("SPELL_AURA_APPLIED", "Teleport", 800)
	self:AddCombatListener("SPELL_HEAL", "Heal", 7393)
end

------------------------------
--      Event Handlers      --
------------------------------

function mod:Teleport(_, spellID)
	if self.db.profile.teleport then
		self:IfMessage(L["portwarn"], "Attention", spellID)
		self:DelayedMessage(20, L["portdelaywarn2"], "Urgent")
		self:DelayedMessage(25, L["portdelaywarn"], "Important")
		self:Bar(L["bartext"], 30, spellID)
	end
end

function mod:Deaths(_, guid)
	guid = tonumber((guid):sub(-12,-7),16)
	if guid == self.guid or guid == 15276 then
		self:BossDeath(nil, self.guid, true)
	end
end

function mod:BigWigs_RecvSync(sync, rest)
	if self:ValidateEngageSync(sync, rest) and not started then
		started = true
		if self:IsEventRegistered("PLAYER_REGEN_DISABLED") then
			self:UnregisterEvent("PLAYER_REGEN_DISABLED")
		end
		if self.db.profile.teleport then
			self:DelayedMessage(20, L["portdelaywarn2"], "Urgent")
			self:DelayedMessage(25, L["portdelaywarn"], "Important")
			self:Bar(L["bartext"], 30, 800)
		end
		if self.db.profile.enrage then
			self:Enrage(900)
		end
	end
end

function mod:Heal(_, spellID)
	if self.db.profile.heal then
		self:IfMessage(L["healwarn"], "Positive", spellID)
	end
end

