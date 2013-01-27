------------------------------
--      Are you local?      --
------------------------------

local boss = BB["Ebonroc"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)
local started 
local pName = UnitName("player")

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Ebonroc",

	wingbuffet = "Wing Buffet",
	wingbuffet_desc = "Warn for Wing Buffet.",
	wingbuffet_message = "Wing Buffet! 30sec to next!",
	wingbuffet_warning = "3sec to Wing Buffet!",
	wingbuffet_approx = "~5sec to first Wing Buffet!",
	wingbuffet_bar = "Wing Buffet",

	shadowflame = "Shadow Flame",
	shadowflame_desc = "Warn for Shadow Flame.",
	shadowflame_warning = "Shadow Flame incoming!",

	youcurse = "Shadow of Ebonroc on you",
	youcurse_desc = "Warn when you got Shadow of Ebonroc.",
	youcurse_warn = "Shadow of Ebonroc on YOU!",

	elsecurse = "Shadow of Ebonroc on others",
	elsecurse_desc = "Warn when others got Shadow of Ebonroc.",
	elsecurse_warn = "%s has Shadow of Ebonroc!",

	icon = "Raid Icon",
	icon_desc = "Place a Raid Icon on the player with Shadow of Ebonroc.",
} end)

L:RegisterTranslations("ruRU", function() return {
	wingbuffet = "Рассечение крылом",
	wingbuffet_desc = "сообщать о рассечении крылом.",
	wingbuffet_message = "Рассечение крылом! 30 секунд!",
	wingbuffet_warning = "3 секунды до рассечения крылом!",
	wingbuffet_approx = "~5 секунд до первого рассечения крылом!",
	wingbuffet_bar = "Рассечение крылом",

	shadowflame = "Теневое пламя",
	shadowflame_desc = "Предупреждать о теневом пламени.",
	shadowflame_warning = "ПОЯВЛЯЕТСЯ ТЕНЕВОЕ ПЛАМЯ!",

	youcurse = "Тень Черноскалa на вас!",
	youcurse_desc = "Предупреждать о тени Черноскалa",
	youcurse_warn = "Тень Черноскалa НА ВАС!!",

	elsecurse = "Тень Черноскалa на других!",
	elsecurse_desc = "Предупреждать о тени Черноскала на других.",
	elsecurse_warn = " Тень Черноскалa на %s!",

	icon = "Рейдовая иконка",
	icon_desc = "Помечать рейдовой иконкой игрока, получившего тень Черноскала.",
} end)

L:RegisterTranslations("zhCN", function() return {
	wingbuffet = "龙翼打击警报",
	wingbuffet_desc = "龙翼打击警报",
	wingbuffet_message = "龙翼打击！30秒后再次发动！",
	wingbuffet_warning = "3秒后发动龙翼打击！副MT嘲讽！",
	wingbuffet_approx = "~5秒后第一发动龙翼打击！",
	wingbuffet_bar = "龙翼打击",

	shadowflame = "暗影烈焰警报",
	shadowflame_desc = "暗影烈焰警报",
	shadowflame_warning = "暗影烈焰发动！牧师给MT加盾！",

	youcurse = "玩家埃博诺克之影警报",
	youcurse_desc = "你中了埃博诺克之影时发出警报",
	youcurse_warn = "你中了埃博诺克之影！",

	elsecurse = "队友埃博诺克之影警报",
	elsecurse_desc = "队友中了埃博诺克之影时发出警报",
	elsecurse_warn = "%s 中了埃博诺克之影！",

	icon = "团队标记",
	icon_desc = "为中博诺克之影的队员标上团队标记.",
} end)

L:RegisterTranslations("zhTW", function() return {
	wingbuffet = "羽翼攻擊警報",
	wingbuffet_desc = "當埃博諾克施放羽翼攻擊時發出警報",
	wingbuffet_message = "羽翼攻擊！ 30 秒後再次發動！",
	wingbuffet_warning = "3 秒後羽翼攻擊！",
	wingbuffet_bar = "羽翼攻擊",

	shadowflame = "暗影烈焰警報",
	shadowflame_desc = "當埃博諾克施放暗影烈焰時發出警報",
	shadowflame_warning = "暗影烈焰發動！",

	youcurse = "埃博諾克之影警報",
	youcurse_desc = "你中了埃博諾克之影時發出警報",
	youcurse_warn = "你中了埃博諾克之影！",

	elsecurse = "隊友埃博諾克之影警報",
	elsecurse_desc = "隊友中了埃博諾克之影時發出警報",
	elsecurse_warn = "%s 中了埃博諾克之影！",

	--icon = "Raid Icon",
	--icon_desc = "Place a Raid Icon on the player with Shadow of Ebonroc.",
} end)

L:RegisterTranslations("koKR", function() return {
	wingbuffet = "폭풍 날개 경고",
	wingbuffet_desc = "폭풍 날개에 대한 경고",
	wingbuffet_message = "폭풍 날개! 다음은 30초 후!",
	wingbuffet_warning = "3초후 폭풍 날개!",
	wingbuffet_approx = "첫 폭풍 날개까지 약 5초!",
	wingbuffet_bar = "폭풍 날개",

	shadowflame = "암흑의 불길 경고",
	shadowflame_desc = "암흑의 불길에 대한 경고",
	shadowflame_warning = "암흑의 불길 경고!",

	youcurse = "자신의 에본로크의 그림자 경고",
	youcurse_desc = "자신이 에본로크의 그림자에 걸렸을 때 경고",
	youcurse_warn = "당신은 에본로크의 그림자에 걸렸습니다!",

	elsecurse = "타인의 에본로크의 그림자 경고",
	elsecurse_desc = "타인이 에본로크의 그림자에 걸렸을 때 경고",
	elsecurse_warn = "%s님이 에본로크의 그림자에 걸렸습니다!",

	icon = "전술 표시",
	icon_desc = "에본로크의 그림자에 걸린 플레이어에 전술 표시를 지정합니다.",
} end)

L:RegisterTranslations("deDE", function() return {
	wingbuffet = "Fl\195\188gelsto\195\159",
	wingbuffet_desc = "Warnung, wenn Schattenschwinge Fl\195\188gelsto\195\159 wirkt.",
	wingbuffet_message = "Fl\195\188gelsto\195\159! N\195\164chster in 30 Sekunden!",
	wingbuffet_warning = "Fl\195\188gelsto\195\159 in 3 Sekunden!",
	wingbuffet_bar = "Fl\195\188gelsto\195\159",

	shadowflame = "Schattenflamme",
	shadowflame_desc = "Warnung, wenn Schattenschwinge Schattenflamme wirkt.",
	shadowflame_warning = "Schattenflamme!",

	youcurse = "Schatten auf Dir",
	youcurse_desc = "Warnung, wenn Du Schattenschwinges Schatten hast.",
	youcurse_warn = "Du hast Schattenschwinges Schatten!",

	elsecurse = "Schatten auf Anderen",
	elsecurse_desc = "Warnung, wenn andere Spieler Schattenschwinges Schatten haben.",
	elsecurse_warn = "%s hat Schattenschwinges Schatten!",

	--icon = "Raid Icon",
	--icon_desc = "Place a Raid Icon on the player with Shadow of Ebonroc.",
} end)

L:RegisterTranslations("frFR", function() return {
	wingbuffet = "Frappe des ailes",
	wingbuffet_desc = "Préviens de l'arrivée des Frappes des ailes.",
	wingbuffet_message = "Frappe des ailes ! Prochain dans 30 sec. !",
	wingbuffet_warning = "3 sec. avant Frappe des ailes !",
	wingbuffet_approx = "~5 sec. avant la première Frappe des ailes !",
	wingbuffet_bar = "Frappe des ailes",

	shadowflame = "Flamme d'ombre",
	shadowflame_desc = "Préviens de l'arrivée des Flammes d'ombre.",
	shadowflame_warning = "Arrivée de la Flamme d'ombre !",

	youcurse = "Ombre de Rochébène sur vous",
	youcurse_desc = "Préviens quand vous subissez les effets de l'Ombre de Rochébène.",
	youcurse_warn = "mbre de Rochébène sur VOUS !",

	elsecurse = "Ombre de Rochébène sur les autres",
	elsecurse_desc = "Préviens quand quelqu'un d'autre subit les effets de l'Ombre de Rochébène.",
	elsecurse_warn = "%s a l'Ombre de Rochébène !",

	icon = "Icône",
	icon_desc = "Place une icône de raid sur le dernier joueur affecté par l'Ombre de Rochébène (nécessite d'être promu ou mieux)."
} end)

----------------------------------
--      Module Declaration      --
----------------------------------

local mod = BigWigs:NewModule(boss)
mod.zonename = BZ["Blackwing Lair"]
mod.enabletrigger = boss
mod.toggleOptions = {"youcurse", "elsecurse", "icon", -1, "wingbuffet", "shadowflame", "bosskill"}
mod.revision = tonumber(("$Revision: 226 $"):sub(12, -3))

------------------------------
--      Initialization      --
------------------------------

function mod:OnEnable()
	self:AddCombatListener("SPELL_CAST_START", "Buffet", 18500, 23339, 29905, 37157, 37319, 32914, 38110, 31475, 38593)
	self:AddCombatListener("SPELL_CAST_START", "Flame", 22539)
	self:AddCombatListener("SPELL_AURA_APPLIED", "Curse", 23340)
	self:AddCombatListener("UNIT_DIED", "GenericBossDeath")

	started = nil

	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("BigWigs_RecvSync")
end

------------------------------
--      Event Handlers      --
------------------------------

function mod:Buffet()
	if not self.db.profile.wingbuffet then return end

	self:IfMessage(L["wingbuffet_message"], "Important", 18500)
	self:DelayedMessage(29, L["wingbuffet_warning"], "Important")
	self:Bar(L["wingbuffet_bar"], 32, 18500)
end

function mod:Flame()
	if self.db.profile.shadowflame then
		self:IfMessage(L["shadowflame_warning"], "Important", 22539)
	end
end

function mod:Curse(player, spellID)
	local other = L["elsecurse_warn"]:format(player)
	if player == pName and self.db.profile.youcurse then
		self:LocalMessage(L["youcurse_warn"], "Personal", spellID)
		self:WideMessage(other)
	elseif self.db.profile.elsecurse then
		self:IfMessage(other, "Attention", spellID)
	end
	self:Bar(other, 8, spellID)
	self:Icon(player, "icon")
end

function mod:BigWigs_RecvSync(sync, rest, nick)
	if self:ValidateEngageSync(sync, rest) and not started then
		started = true
		if self:IsEventRegistered("PLAYER_REGEN_DISABLED") then
			self:UnregisterEvent("PLAYER_REGEN_DISABLED")
		end
		if self.db.profile.wingbuffet then
			self:DelayedMessage(24, L["wingbuffet_approx"], "Important")
			self:Bar(L["wingbuffet_bar"], 29, 18500)
		end
	end
end

