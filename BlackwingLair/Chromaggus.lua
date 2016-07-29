------------------------------
--      Are you local?      --
------------------------------

local boss = BB["Chromaggus"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)
local enraged
local started
local barcount

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Chromaggus",

	frenzy = "Frenzy",
	frenzy_desc = "Warn for Frenzy.",
	frenzy_trigger = "%s goes into a killing frenzy!",
	frenzy_message = "Frenzy Alert!",

	breath = "Breaths",
	breath_desc = "Warn for Breaths.",
	breath_warning = "%s in 10 seconds!",
	breath_message = "%s is casting!",
	breath1_bar = "Breath 1",
	breath2_bar = "Breath 2",
	castingbar = "Cast %s",

	vulnerability = "Vulnerability Change",
	vulnerability_desc = "Warn for Vulnerability changes.",
	vulnerability_trigger = "%s flinches as its skin shimmers.",
	vulnerability_message = "Vulnerability: %s!",
	vulnerability_warning = "Spell vulnerability changed!",

	enrage_warning = "Enrage soon!",
} end )

L:RegisterTranslations("ruRU", function() return {
	frenzy = "Бешенство",
	frenzy_desc = "Предупреждать о бешенстве.",
	frenzy_trigger = "%s впадает в убивающее бешенство!",
	frenzy_message = "ОПАСНОСТЬ БЕШЕНСТВА!",

	breath = "Дыхание",
	breath_desc = "Сообщать о дыхании.",
	breath_warning = "%s через 10 секунд!",
	breath_message = "%s кастуется!",
	breath1_bar = "Дыхание 1",
	breath2_bar = "Дыхание 2",
	castingbar = "Каст %s",

	vulnerability = "Изменение уязвимости",
	vulnerability_desc = "Сообщать когда уязвимость изменяется.",
	vulnerability_trigger = "%s отступает как мерцания его кожи.",
	vulnerability_message = "Уязвимость: %s!",
	vulnerability_warning = "УЯЗВИМОСТЬ К СПЕЛАМ ИЗМЕНЕНА!",

	enrage_warning = "Хроммагус ВПАДАЕТ В ЯРОСТЬ!",
} end )

L:RegisterTranslations("deDE", function() return {
	frenzy = "Raserei",
	frenzy_desc = "Warnung, wenn Chromaggus in Raserei ger\195\164t.",
	frenzy_trigger = "%s ger\195\164t in t\195\182dliche Raserei!",
	frenzy_message = "Raserei - Einlullender Schuss!",

	breath = "Atem",
	breath_desc = "Warnung, wenn Chromaggus seinen Atem wirkt.",
	breath_warning = "%s in 10 Sekunden!",
	breath_message = "Chromaggus wirkt: %s Atem!",
	--breath1_bar = "Breath 1",
	--breath2_bar = "Breath 2",
	castingbar = "Wirkt %s",

	vulnerability = "Zauber-Verwundbarkeiten",
	vulnerability_desc = "Warnung, wenn Chromagguss Zauber-Verwundbarkeit sich \195\164ndert.",
	vulnerability_trigger = "%s weicht zur\195\188ck, als die Haut schimmert.",
	vulnerability_message = "Neue Zauber-Verwundbarkeit: %s",
	vulnerability_warning = "Zauber-Verwundbarkeit ge\195\164ndert!",

	enrage_warning = "Wutanfall steht kurz bevor!",
} end )

L:RegisterTranslations("zhCN", function() return {
	frenzy = "狂暴警报",
	frenzy_desc = "狂暴警报",
	frenzy_trigger = "%s变得极为狂暴！",
	frenzy_message = "狂暴警报 - 猎人立刻使用宁神射击！",

	breath = "吐息警报",
	breath_desc = "吐息警报",
	breath_warning = "%s - 10秒后施放！",
	breath_message = "克洛玛古斯施放 %s！",
	breath1_bar = "元素吐息 1",
	breath2_bar = "元素吐息 2",
	castingbar = "施放%s",

	vulnerability = "弱点警报",
	vulnerability_desc = "克洛玛古斯弱点改变时发出警报",
	vulnerability_trigger = "%s的皮肤闪着微光，它畏缩了。",
	vulnerability_message = "克洛玛古斯新弱点：%s",
	vulnerability_warning = "克洛玛古斯弱点改变",

	enrage_warning = "即将激怒！",
} end )

L:RegisterTranslations("zhTW", function() return {
	frenzy = "狂怒警報",
	frenzy_desc = "當克洛瑪古斯狂怒時發出警報",
	frenzy_trigger = "%s變得極為狂暴！", --完全比對
	frenzy_message = "狂怒警報 - 獵人立刻使用寧神射擊！",

	breath = "吐息警報",
	breath_desc = "當克洛瑪古斯吐息時發出警報",
	breath_warning = "%s - 10 秒後施放！",
	breath_message = "克洛瑪古斯施放：%s ！",
	--breath1_bar = "Breath 1",
	--breath2_bar = "Breath 2",
	castingbar = "施放 %s",

	vulnerability = "弱點改變警報",
	vulnerability_desc = "當克洛瑪古斯弱點改變時發出警報",
	vulnerability_trigger = "%s因皮膚閃著微光而驚訝退縮。", --完全比對
	vulnerability_message = "克洛瑪古斯新弱點：%s ！",
	vulnerability_warning = "克洛瑪古斯弱點改變",

	enrage_warning = "即將暴怒！",
} end )

L:RegisterTranslations("koKR", function() return {
	frenzy = "광폭화 경고",
	frenzy_desc = "광폭화에 대한 경고",
	frenzy_trigger = "%s|1이;가; 살기를 띤 듯한 광란의 상태에 빠집니다!",
	frenzy_message = "광폭화 - 평정 사격!",

	breath = "브레스 경고",
	breath_desc = "브레스에 대한 경고",
	breath_warning = "%s 10초전!",
	breath_message = "%s 시전!",
	--breath1_bar = "Breath 1",
	--breath2_bar = "Breath 2",
	castingbar = "%s 시전",

	vulnerability = "약화 속성 경고",
	vulnerability_desc = "약화 속성 변경에 대한 경고",
	vulnerability_trigger = "%s|1이;가; 주춤하면서 물러나면서 가죽이 빛납니다.", --"가죽이 점점 빛나면서 물러서기 시작합니다.",
	vulnerability_message = "새로운 취약 속성: %s",
	vulnerability_warning = "취약 속성이 변경되었습니다!",

	enrage_warning = "격노 경고!",
} end )

L:RegisterTranslations("frFR", function() return {
	frenzy = "Frénésie",
	frenzy_desc = "Préviens quand Chromaggus entre en frénésie.",
	frenzy_trigger = "%s entre dans une frénésie sanglante !",
	frenzy_message = "Alerte frénésie !",

	breath = "Souffles",
	breath_desc = "Préviens de l'arrivée des souffles.",
	breath_warning = "%s dans 10 sec. !",
	breath_message = "%s en incantation !",
	breath1_bar = "Souffle 1",
	breath2_bar = "Souffle 2",
	castingbar = "Incantation %s",

	vulnerability = "Changement de vulnérabilité",
	vulnerability_desc = "Préviens quand la vulnérabilité change.",
	vulnerability_trigger = "%s grimace lorsque sa peau se met à briller.",
	vulnerability_message = "Vulnerabilité : %s !",
	vulnerability_warning = "Vulnérabilité aux sorts changée !",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

local mod = BigWigs:NewModule(boss)
mod.zonename = BZ["Blackwing Lair"]
mod.enabletrigger = boss
mod.toggleOptions = {"enrage", "frenzy", "breath", "vulnerability"}
mod.revision = tonumber(("$Revision: 226 $"):sub(12, -3))

------------------------------
--      Initialization      --
------------------------------

function mod:OnEnable()
	self:AddCombatListener("SPELL_CAST_START", "Breath",
		23310, 23312, --Time Lapse
		23313, 23314, 33551, --Corrosive Acid
		23315, 23316, --Ignite Flesh
		23308, 23309, --Incinerate
		23187, 23189 --Frost Burn
	)
	self:AddCombatListener("UNIT_DIED", "GenericBossDeath")

	-- in the module itself for resetting via schedule
	--self.vulnerability = nil
	enraged = nil
	started = nil
	barcount = 2

	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
	self:RegisterEvent("UNIT_HEALTH")

	self:RegisterEvent("BigWigs_RecvSync")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
end

------------------------------
--      Event Handlers      --
------------------------------

function mod:Breath(_, spellID)
	if not self.db.profile.breath then return end

	if barcount == 2 then
		barcount = 1
		self:TriggerEvent("BigWigs_StopBar", self, L["breath1_bar"])
	elseif barcount == 1 then
		barcount = 0
		self:TriggerEvent("BigWigs_StopBar", self, L["breath2_bar"])
	end

	local spellName = GetSpellInfo(spellID)
	self:Bar(L["castingbar"]:format(spellName), 2, spellID)
	self:IfMessage(L["breath_message"]:format(spellName), "Attention", spellID)
	self:DelayedMessage(50, L["breath_warning"]:format(spellName), "Important")
	self:Bar(spellName, 60, spellID)
end

function mod:UNIT_HEALTH(msg)
	if self.db.profile.enrage and UnitName(msg) == boss then
		local health = UnitHealth(msg)
		if health > 20 and health <= 23 and not enraged then
			if self.db.profile.enrage then self:Message(L["enrage_warning"], "Important") end
			enraged = true
		elseif health > 40 and enraged then
			enraged = nil
		end
	end
end

function mod:BigWigs_RecvSync(sync, rest)
	if self:ValidateEngageSync(sync, rest) and not started then
		started = true
		if self:IsEventRegistered("PLAYER_REGEN_DISABLED") then
			self:UnregisterEvent("PLAYER_REGEN_DISABLED")
		end
		if self.db.profile.breath then
			self:Bar(L["breath1_bar"], 30, "INV_Misc_QuestionMark")
			self:Bar(L["breath2_bar"], 60, "INV_Misc_QuestionMark")

			self:DelayedMessage(20, L["breath_warning"]:format(L["breath1_bar"]), "Positive")
			self:DelayedMessage(50, L["breath_warning"]:format(L["breath2_bar"]), "Positive")
		end
	end
end

function mod:CHAT_MSG_MONSTER_EMOTE(msg)
	if msg == L["frenzy_trigger"] and self.db.profile.frenzy then
		self:Message(L["frenzy_message"], "Important")
	elseif msg == L["vulnerability_trigger"] then
		if self.db.profile.vulnerability then
			self:Message(L["vulnerability_warning"], "Positive")
		end
		--self:ScheduleEvent("BWChromNilSurv", function() mod.vulnerability = nil end, 2.5)
	end
end

--[[
if (GetLocale() == "koKR") or (GetLocale() == "zhCN") then
	function mod:PlayerDamageEvents(msg)
		if (not self.vulnerability) then
			local dmg, school, type = select(4, msg:find(L["vulnerability_test"]))
			if ( type == L["hit"] or type == L["crit"] ) and tonumber(dmg or "") and school then
				if (tonumber(dmg) >= 550 and type == L["hit"]) or (tonumber(dmg) >= 1100 and type == L["crit"]) then
					self.vulnerability = school
					if self.db.profile.vulnerability then self:Message(format(L["vulnerability_message"], school), "Positive") end
				end
			end
		end
	end
else
	function mod:PlayerDamageEvents(msg)
		if (not self.vulnerability) then
			local type, dmg, school = select(3, msg:find(L["vulnerability_test"]))
			if ( type == L["hit"] or type == L["crit"] ) and tonumber(dmg or "") and school then
				if (tonumber(dmg) >= 550 and type == L["hit"]) or (tonumber(dmg) >= 1100 and type == L["crit"]) then
					self.vulnerability = school
					if self.db.profile.vulnerability then self:Message(format(L["vulnerability_message"], school), "Positive") end
				end
			end
		end
	end
end
]]