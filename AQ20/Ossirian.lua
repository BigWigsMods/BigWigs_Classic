------------------------------
--      Are you local?      --
------------------------------

local boss = BB["Ossirian the Unscarred"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

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

----------------------------------
--      Module Declaration      --
----------------------------------

local mod = BigWigs:NewModule(boss)
mod.zonename = BZ["Ruins of Ahn'Qiraj"]
mod.enabletrigger = boss
mod.toggleOptions = {"supreme", "debuff", "bosskill"}
mod.revision = tonumber(("$Revision: 150 $"):sub(12, -3))

------------------------------
--      Initialization      --
------------------------------

function mod:OnEnable()
	self:AddCombatListener("SPELL_AURA_APPLIED", "Weakness", 25181, 25177, 25178, 25180, 25183)
	self:AddCombatListener("SPELL_AURA_APPLIED", "Supreme", 25176)
	self:AddCombatListener("UNIT_DIED", "GenericBossDeath")
end

------------------------------
--      Event Handlers      --
------------------------------

function mod:Weakness(_, spellID, _, _, name)
	if self.db.profile.debuff then
		self:IfMessage(name, "Important", spellID)
	end

	self:CancelScheduledEvent("BWOssiSupreme1")
	self:CancelScheduledEvent("BWOssiSupreme2")
	self:CancelScheduledEvent("BWOssiSupreme3")
	self:TriggerEvent("BigWigs_StopBar", self, L["bartext"])

	if self.db.profile.supreme then
		self:ScheduleEvent("BWOssiSupreme1", "BigWigs_Message", 30, L["supremedelaywarn"]:format(15), "Attention")
		self:ScheduleEvent("BWOssiSupreme2", "BigWigs_Message", 35, L["supremedelaywarn"]:format(10), "Urgent")
		self:ScheduleEvent("BWOssiSupreme3", "BigWigs_Message", 40, L["supremedelaywarn"]:format(5), "Important")
		self:Bar(L["bartext"], 45, 25176)
	end
end

function mod:Supreme()
	if self.db.profile.supreme then
		self:IfMessage(L["supremewarn"], "Attention", 25176)
	end
end

