------------------------------
--      Are you local?      --
------------------------------

local boss = BB["Moam"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Moam",

	adds = "Mana Fiend",
	adds_desc = "Warn for Mana fiends.",

	paralyze = "Paralyze",
	paralyze_desc = "Warn for Paralyze.",

	starttrigger = "%s senses your fear.",
	startwarn = "Moam Engaged! 90 Seconds until adds!",
	addsbar = "Adds",
	addsincoming = "Mana Fiends incoming in %s seconds!",
	addstrigger = "%s drains your mana and turns to stone.",
	addswarn = "Mana Fiends spawned! Moam Paralyzed for 90 seconds!",
	paralyzebar = "Paralyze",
	returnincoming = "Moam unparalyzed in %s seconds!",
	returnwarn = "Moam unparalyzed! 90 seconds until Mana Fiends!",
} end )

L:RegisterTranslations("frFR", function() return {
	adds = "Démons de mana",
	adds_desc = "Préviens de l'arrivée des Démons de mana.",

	paralyze = "Paralysie",
	paralyze_desc = "Préviens quand Moam est paralysé.",

	starttrigger = "%s sent votre peur.",
	startwarn = "Moam engagé ! 90 sec. avant les Démons de mana !",
	addsbar = "Démons de mana",
	addsincoming = "Arrivée des Démons de mana dans %s sec. !",
	addstrigger = "%s absorbe votre mana et se change en pierre.",
	addswarn = "Démons de mana apparus ! Moam paralysé pendant 90 sec. !",
	paralyzebar = "Paralysie",
	returnincoming = "Moam de retour dans %s sec. !",
	returnwarn = "Retour de Moam ! 90 sec. avant les Démons de mana !",
} end )

L:RegisterTranslations("deDE", function() return {
	adds = "Manageister",
	adds_desc = "Warnung, wenn Manageister erscheinen.",

	paralyze = "Steinform",
	paralyze_desc = "Warnung, wenn Moam in Steinform.",

	starttrigger = "%s sp\195\188rt Eure Angst.",
	startwarn = "Moam angegriffen! Manageister in 90 Sekunden!",

	addsbar = "Manageister",
	addsincoming = "Manageister in %s Sekunden!",
	addstrigger = "%s entzieht Euch Euer Mana und versteinert Euch.",
	addswarn = "Manageister! Moam in Steinform f\195\188r 90 Sekunden.",

	paralyzebar = "Steinform",
	returnincoming = "Moam erwacht in %s Sekunden!",
	returnwarn = "Moam erwacht! Manageister in 90 Sekunden!",
} end )

L:RegisterTranslations("koKR", function() return {
	adds = "정령 경고",
	adds_desc = "정령에 대한 경고",

	paralyze = "마비 경고",
	paralyze_desc = "마비에 대한 경고",

	starttrigger = "%s|1이;가; 당신의 공포를 알아챕니다.",
	startwarn = "모암 행동시작! 90초 후 정령 등장!",
	addsbar = "정령 등장",
	addsincoming = "%s초후 정령 등장!",
	addstrigger = "당신의 마나를 흡수한 %s|1이;가; 돌처럼 변합니다.",
	addswarn = "정령 등장! 모암 90초간 멈춤!",
	paralyzebar = "모암 마비",
	returnincoming = "%s초후 모암 행동 재개!",
	returnwarn = "모암 행동 재개! 90초 후 정령 등장!",
} end )

L:RegisterTranslations("zhCN", function() return {
	adds = "召唤警报",
	adds_desc = "召唤元素恶魔出现时发出警报",

	paralyze = "石化警报",
	paralyze_desc = "莫阿姆进入石化状态时发出警报",

	starttrigger = "%s察觉到了你的恐惧。",
	startwarn = "莫阿姆已激活 - 90秒后召唤元素恶魔",
	addsbar = "召唤",
	addsincoming = "元素恶魔将%s秒后被召唤！",
	addstrigger = "%s吸取了你的魔法能量，变成了石头。",
	addswarn = "元素恶魔被召唤！术士放逐！莫阿姆石化90秒！",
	paralyzebar = "石化",
	returnincoming = "莫阿姆将在%s秒后解除石化！",
	returnwarn = "莫阿姆解除石化！90秒后重新召唤元素恶魔！",
} end )

L:RegisterTranslations("zhTW", function() return {
	adds = "召喚警報",
	adds_desc = "召喚元素惡魔出現時發出警報",

	paralyze = "石化警報",
	paralyze_desc = "莫阿姆進入石化狀態時發出警報",

	starttrigger = "%s因神態失常而坐立不安。",
	startwarn = "莫阿姆已進入戰鬥 - 90 秒後召喚元素惡魔",
	addsbar = "召喚惡魔",
	addsincoming = "將在 %s 秒後召喚惡魔！",
	addstrigger = "%s吸取你的法力後變成了石頭。",
	addswarn = "元素惡魔出現！術士放逐！莫阿姆進入石化狀態 90 秒！",
	paralyzebar = "石化狀態",
	returnincoming = "將在 %s 秒後解除石化！",
	returnwarn = "已解除石化！ 90 秒後再次召喚元素惡魔！",
} end )

L:RegisterTranslations("ruRU", function() return {
	adds = "Исчадия маны",
	adds_desc = "Сообщать о появлении исчадий маны.",

	paralyze = "Паралич",
	paralyze_desc = "Предупреждать о параличе",

	starttrigger = "%s был запуган и бежит в страхе.",
	startwarn = "Моам в бешенстве на 90 секунд!",
	addsbar = "Ады!",
	addsincoming = "Исчадия маны появятся через %s секунд!",
	addstrigger = "  %s высосал вышу ману и превратился в камень!",
	addswarn = "Появились исчадия маны!! Моам парализован на 90 секунд!",
	paralyzebar = "Парализован",
	returnincoming = "Моам выйдет из окаменения через %s секунд!",
	returnwarn = "Моам вышел из окаменения! 90 секунд до появления исчадий маны!!",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

local mod = BigWigs:NewModule(boss)
mod.zonename = BZ["Ruins of Ahn'Qiraj"]
mod.enabletrigger = boss
mod.toggleOptions = {"adds", "paralyze", "bosskill"}
mod.revision = tonumber(("$Revision: 150 $"):sub(12, -3))

------------------------------
--      Initialization      --
------------------------------

function mod:OnEnable()
	self:AddCombatListener("SPELL_AURA_APPLIED", "Return", 25685)
	self:AddCombatListener("UNIT_DIED", "GenericBossDeath")

	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
end

------------------------------
--      Event Handlers      --
------------------------------

function mod:Return()
	if self.db.profile.paralyze then
		self:IfMessage(L["returnwarn"], "Important", 25685)
	end
	self:AddsStart()
end

function mod:AddsStart()
	if self.db.profile.adds then
		self:DelayedMessage(30, format(L["addsincoming"], 60), "Attention")
		self:DelayedMessage(60, format(L["addsincoming"], 30), "Attention")
		self:DelayedMessage(75, format(L["addsincoming"], 15), "Urgent")
		self:DelayedMessage(85, format(L["addsincoming"], 5), "Important")
		self:Bar(L["addsbar"], 90, "Spell_Shadow_CurseOfTounges") 
	end
end

function mod:CHAT_MSG_MONSTER_EMOTE(msg)
	if msg == L["starttrigger"] then
		if self.db.profile.adds then self:Message(L["startwarn"], "Important") end
		self:AddsStart()
	elseif msg == L["addstrigger"] then
		if self.db.profile.adds then
			self:Message(L["addswarn"], "Important")
		end
		if self.db.profile.paralyze then
			self:DelayedMessage(30, format(L["returnincoming"], 60), "Attention")
			self:DelayedMessage(60, format(L["returnincoming"], 30), "Attention")
			self:DelayedMessage(75, format(L["returnincoming"], 15), "Urgent")
			self:DelayedMessage(85, format(L["returnincoming"], 5), "Important")
			self:Bar(L["paralyzebar"], 90, "Spell_Shadow_CurseOfTounges")
		end
	end
end

