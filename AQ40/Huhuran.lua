------------------------------
--      Are you local?      --
------------------------------

local boss = BB["Princess Huhuran"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)
local berserkannounced
local prior
local started

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Huhuran",

	wyvern = "Wyvern Sting Alert",
	wyvern_desc = "Warn for Wyvern Sting",

	frenzy = "Frenzy Alert",
	frenzy_desc = "Warn for Frenzy",

	berserk = "Berserk Alert",
	berserk_desc = "Warn for Berserk",

	frenzytrigger = "%s goes into a frenzy!",
	berserktrigger = "%s goes into a berserker rage!",
	frenzywarn = "Frenzy - Tranq Shot!",
	berserkwarn = "Berserk! Berserk! Berserk!",
	berserksoonwarn = "Berserk Soon!",
	stingtrigger = "afflicted by Wyvern Sting",
	stingwarn = "Wyvern Sting!",
	stingdelaywarn = "Possible Wyvern Sting in ~3 seconds!",
	bartext = "Wyvern Sting",

	startwarn = "Huhuran engaged, 5 minutes to berserk!",
	berserkbar = "Berserk",
	berserkwarn1 = "Berserk in 1 minute!",
	berserkwarn2 = "Berserk in 30 seconds!",
	berserkwarn3 = "Berserk in 5 seconds!",

} end )

L:RegisterTranslations("deDE", function() return {
	wyvern = "Stich des Fl\195\188geldrachen",
	wyvern_desc = "Warnung, wenn Huhuran Stich des Fl\195\188geldrachen wirkt.",

	frenzy = "Raserei",
	frenzy_desc = "Warnung, wenn Huhuran in Raserei ger\195\164t.",

	berserk = "Berserkerwut",
	berserk_desc = "Warnung, wenn Huhuran in Berserkerwut verf\195\164llt.",

	frenzytrigger = "%s ger\195\164t in Raserei!",
	berserktrigger = "%s verf\195\164llt in Berserkerwut!",
	frenzywarn = "Raserei - Einlullender Schuss!",
	berserkwarn = "Berserkerwut!",
	berserksoonwarn = "Berserkerwut in K\195\188rze!",
	stingtrigger = "von Stich des Fl\195\188geldrachen betroffen",
	stingwarn = "Stich des Fl\195\188geldrachen!",
	stingdelaywarn = "M\195\182glicher Stich des Fl\195\188geldrachen in ~3 Sekunden!",
	bartext = "Stich",

	startwarn = "Huhuran angegriffen! Berserkerwut in 5 Minuten!",
	berserkbar = "Berserkerwut",
	berserkwarn1 = "Berserkerwut in 1 Minute!",
	berserkwarn2 = "Berserkerwut in 30 Sekunden!",
	berserkwarn3 = "Berserkerwut in 5 Sekunden!",

} end )


L:RegisterTranslations("zhCN", function() return {
	wyvern = "毒性之箭警报",
	wyvern_desc = "毒性之箭警报",

	frenzy = "狂暴警报",
	frenzy_desc = "狂暴警报",

	berserk = "极度狂暴警报",
	berserk_desc = "极度狂暴警报",

	frenzytrigger = "%s变得狂怒无比！",
	berserktrigger = "%s变得狂暴了！",
	frenzywarn = "狂暴警报 - 猎人立刻使用宁神射击！",
	berserkwarn = "极度狂暴 - 治疗注意！",
	berserksoonwarn = "即将极度狂暴 - 做好准备！",
	stingtrigger = "受到了致命剧毒效果的影响。",
	stingwarn = "毒性之箭 - 注意只给MT驱散！",
	stingdelaywarn = "3秒后哈霍兰可能施放毒性之箭！",
	bartext = "毒性之箭",

	startwarn = "哈霍兰公主已激活 - 5分钟后进入极度狂暴状态",
	berserkbar = "极度狂暴",
	berserkwarn1 = "1分钟后极度狂暴！",
	berserkwarn2 = "30秒后极度狂暴！",
	berserkwarn3 = "5秒后极度狂暴！",
} end )

L:RegisterTranslations("zhTW", function() return {
	wyvern = "翼龍釘刺警報",
	wyvern_desc = "哈霍蘭公主翼龍釘刺警報",

	frenzy = "狂暴模式警報",
	frenzy_desc = "當哈霍蘭公主進入狂暴模式時發出警報",

	berserk = "極度狂暴模式警報",
	berserk_desc = "哈霍蘭公主進入極度狂暴模式的倒數警報",

	frenzytrigger = "%s變得狂暴起來！",
	berserktrigger = "%s進入狂暴狀態！",
	frenzywarn = "狂暴警報 - 獵人立刻使用寧神射擊！",
	berserkwarn = "極度狂暴 - 治療注意！",
	berserksoonwarn = "即將極度狂暴 - 做好準備！",
	stingtrigger = "^(.+)受到翼龍釘刺",
	stingwarn = "翼龍釘刺！淨化 MT！",
	stingdelaywarn = "3 秒後可能施放翼龍釘刺！",
	bartext = "翼龍釘刺",

	startwarn = "哈霍蘭公主已進入戰鬥 - 5 分鐘後進入極度狂暴狀態",
	berserkbar = "極度狂暴",
	berserkwarn1 = "1 分鐘後極度狂暴！",
	berserkwarn2 = "30 秒後極度狂暴！",
	berserkwarn3 = "5 秒後極度狂暴！",
} end )

L:RegisterTranslations("koKR", function() return {
	wyvern = "비룡 쐐기 경고",
	wyvern_desc = "비룡 쐐기에 대한 경고",

	frenzy = "광폭화 경고",
	frenzy_desc = "광폭화에 대한 경고",

	berserk = "광기 경고",
	berserk_desc = "광기에 대한 경고",

	frenzytrigger = "%s|1이;가; 광란의 상태에 빠집니다!",
	berserktrigger = "%s|1이;가; 광폭해집니다!",
	frenzywarn = "광폭화 - 평정 사격!",
	berserkwarn = "광기 - 독 빈도 증가!",
	berserksoonwarn = "광폭화 경보 - 준비!",
	stingtrigger = "비룡 쐐기에 걸렸습니다.",--"공주 후후란|1이;가; 비룡 쐐기|1으로;로;",
	stingwarn = "비룡 쐐기 - 메인탱커 해제!",
	stingdelaywarn = "비룡 쐐기 약 3초전!",
	bartext = "비룡 쐐기",

	startwarn = "후후란 전투 개시, 5분 후 광기!!",
	berserkbar = "광기",
	berserkwarn1 = "광기 - 1 분전!",
	berserkwarn2 = "광기 - 30 초전!",
	berserkwarn3 = "광기 - 5 초전!",
} end )

L:RegisterTranslations("frFR", function() return {
	wyvern = "Piqûre de wyverne",
	wyvern_desc = "Pr&viens de l'arrivée des Piqûres de wyverne.",

	frenzy = "Frénésie",
	frenzy_desc = "Préviens quand Huhuran est prise de frénésie.",

	berserk = "Berserk",
	berserk_desc = "Préviens quand Huhuran entre dans une rage démente.",

	frenzytrigger = "%s est pris de frénésie !",
	berserktrigger = "%s entre dans une rage démente !",

	frenzywarn = "Frénésie - Tir tranquillisant !",
	berserkwarn = "Berserk ! Berserk ! Berserk !",
	berserksoonwarn = "Berserk imminent !",
	stingtrigger = "les effets .* Piqûre de wyverne",
	stingwarn = "Piqûre de wyverne !",
	stingdelaywarn = "Piqûre de wyverne probable dans ~3 sec. !",
	bartext = "Piqûre de wyverne",

	startwarn = "Huhuran engagée, 5 min. avant berserk !",
	berserkbar = "Berserk",
	berserkwarn1 = "Berserk dans 1 min.!",
	berserkwarn2 = "Berserk dans 30 sec. !",
	berserkwarn3 = "Berserk dans 5 sec. !",
} end )

L:RegisterTranslations("ruRU", function() return {
	wyvern = "Опасность жала дракона",
	wyvern_desc = "Предупреждать о жле дракона",

	frenzy = "Опасность безумия",
	frenzy_desc = "Предупреждать о безумии",

	berserk = "Опасность берсерка",
	berserk_desc = "Предупреждать о берсерке",

	frenzytrigger = "%s впадает в безумие!",
	berserktrigger = "%s впадает в раж берсерка!",
	frenzywarn = "Безумие - Усмиряющий выстрел!",
	berserkwarn = "Берсерк! Берсерк! Берсерк!",
	berserksoonwarn = "Скоро бешенство!",
	stingtrigger = "поражён жалом Дракона",
	stingwarn = "Жало дракона!",
	stingdelaywarn = "Возможно появление жала дракона примерно через 3 секунды!",
	bartext = "Жало дракона",

	startwarn = "Хухуран впадает в бешенство, 5 минут до берсерка!",
	berserkbar = "Берсерк",
	berserkwarn1 = "Берсерк через 1 минуту!",
	berserkwarn2 = "Берсерк через 30 секунд!",
	berserkwarn3 = "Берсерк через 5 секунд!",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

local mod = BigWigs:NewModule(boss)
mod.zonename = BZ["Ahn'Qiraj"]
mod.enabletrigger = boss
mod.toggleOptions = {"wyvern", "frenzy", "berserk", "bosskill"}
mod.revision = tonumber(string.sub("$Revision: 328 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function mod:OnEnable()
	prior = nil
	berserkannounced = nil
	started = nil

	self:RegisterEvent("BigWigs_Message")

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")

	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
	self:RegisterEvent("UNIT_HEALTH")
	self:AddCombatListener("UNIT_DIED", "GenericBossDeath")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "checkSting")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "checkSting")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "checkSting")

	self:RegisterEvent("BigWigs_RecvSync")
end

------------------------------
--      Event Handlers      --
------------------------------

function mod:BigWigs_RecvSync(sync, rest, nick)
	if self:ValidateEngageSync(sync, rest) and not started then
		started = true
		if self:IsEventRegistered("PLAYER_REGEN_DISABLED") then
			self:UnregisterEvent("PLAYER_REGEN_DISABLED")
		end
		if self.db.profile.berserk then
			self:Message(L["startwarn"], "Important")
			self:Bar(L["berserkbar"], 300, "INV_Shield_01")
			self:ScheduleEvent("bwhuhuranenragewarn1", "BigWigs_Message", 240, L["berserkwarn1"], "Attention")
			self:ScheduleEvent("bwhuhuranenragewarn2", "BigWigs_Message", 270, L["berserkwarn2"], "Urgent")
			self:ScheduleEvent("bwhuhuranenragewarn3", "BigWigs_Message", 295, L["berserkwarn3"], "Important")
		end
	end
end

function mod:CHAT_MSG_MONSTER_EMOTE(arg1)
	if self.db.profile.frenzy and arg1 == L["frenzytrigger"] then
		self:Message(L["frenzywarn"], "Urgent")
	elseif self.db.profile.berserk and arg1 == L["berserktrigger"] then
		self:CancelScheduledEvent("bwhuhuranenragewarn1")
		self:CancelScheduledEvent("bwhuhuranenragewarn2")
		self:CancelScheduledEvent("bwhuhuranenragewarn3")

		self:TriggerEvent("BigWigs_StopBar", self, L["berserkbar"])

		self:Message(L["berserkwarn"], "Important")

		berserkannounced = true
	end
end

function mod:UNIT_HEALTH(arg1)
	if not self.db.profile.berserk then return end
	if UnitName(arg1) == boss then
		local health = UnitHealth(arg1)
		if health > 30 and health <= 33 and not berserkannounced then
			self:Message(L["berserksoonwarn"], "Important")
			berserkannounced = true
		elseif (health > 40 and berserkannounced) then
			berserkannounced = false
		end
	end
end

function mod:checkSting(arg1)
	if not self.db.profile.wyvern then return end
	if not prior and arg1:find(L["stingtrigger"]) then
		self:Message(L["stingwarn"], "Urgent")
		self:Bar(L["bartext"], 25, "INV_Spear_02")
		self:DelayedMessage(22, L["stingdelaywarn"], "Urgent")
		prior = true
	end
end

function mod:BigWigs_Message(text)
	if text == L["stingdelaywarn"] then prior = nil end
end
