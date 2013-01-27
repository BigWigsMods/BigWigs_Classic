------------------------------
--      Are you local?      --
------------------------------

local kri = BB["Lord Kri"]
local yauj = BB["Princess Yauj"]
local vem = BB["Vem"]
local boss = BB["The Bug Family"]

local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)
local kill = AceLibrary("AceLocale-2.2"):new("BigWigs")["%s has been defeated"]:format(boss)
local deaths = 0
local started = nil

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "BugFamily",

	engage_message = "The Bug Family Engaged",

	fear = "Fear",
	fear_desc = "Fear timers.",
	feartrigger = " afflicted by Fear%.$",
	fearbar = "AoE Fear",
	fearwarn1 = "AoE Fear! Next in 20 Seconds!",
	fearwarn2 = "AoE Fear in 5 Seconds!",

	heal = "Heal",
	heal_desc = "Warn when Yauj casts a heal.",
	healtrigger = "Princess Yauj begins to cast Great Heal.",
	healwarn = "Casting heal!",
} end )

L:RegisterTranslations("frFR", function() return {
	engage_message = "La famille insecte engagée",

	fear = "Peur",
	fear_desc = "Préviens de l'arrivée des Peurs.",
	feartrigger = "les effets .* Peur%.$",
	fearbar = "Peur de zone",
	fearwarn1 = "Peur de zone ! Prochain dans 20 sec. !",
	fearwarn2 = "Peur de zone dans 5 sec. !",

	heal = "Soin",
	heal_desc = "Préviens quand Yauj incante un soin.",
	healtrigger = "Princesse Yauj commence à lancer Soins exceptionnels.",
	healwarn = "Soins en incantation !",
} end )

L:RegisterTranslations("deDE", function() return {
	--engage_message = "The Bug Family Engaged",

	fear = "Furcht",
	fear_desc = "Warnung, wenn wenn Prinzessin Yauj AoE Furcht wirkt.",
	feartrigger = "ist von Furcht betroffen%.$",
	fearbar = "AoE Furcht",
	fearwarn1 = "AoE Furcht! N\195\164chste in 20 Sekunden!",
	fearwarn2 = "AoE Furcht in 5 Sekunden!",

	heal = "Heilung",
	heal_desc = "Warnung, wenn Prinzessin Yauj versucht sich zu heilen.",
	healtrigger = "Prinzessin Yauj beginnt Gro\195\159es Heilen zu wirken.",
	healwarn = "Prinzessin Yauj versucht sich zu heilen!",
} end )

L:RegisterTranslations("zhCN", function() return {
	engage_message = "吉祥三宝激活.",
	
	fear = "恐惧警报",
	fear_desc = "敌人发动群体恐惧时发出警报",
	feartrigger = "受到了恐惧效果的影响。",
	fearbar = "群体恐惧",
	fearwarn1 = "群体恐惧 - 20秒后再次发动",
	fearwarn2 = "5秒后发动群体恐惧！",

	heal = "治疗警报",
	heal_desc = "亚尔基公主施放治疗时发出警报",
	healtrigger = "亚尔基公主开始施放强效治疗术。",
	healwarn = "亚尔基公主在施放治疗 - 迅速打断！",
} end )

L:RegisterTranslations("zhTW", function() return {
	--engage_message = "The Bug Family Engaged",

	fear = "恐懼警報",
	fear_desc = "亞爾基公主發動群體恐懼時發出警報",
	feartrigger = "受到恐懼術的傷害",
	fearbar = "群體恐懼",
	fearwarn1 = "群體恐懼 - 20 秒後再次發動",
	fearwarn2 = "5 秒後群體恐懼！",

	heal = "治療警報",
	heal_desc = "亞爾基公主施放治療時發出警報",
	healtrigger = "亞爾基公主開始施放強效治療術。",
	healwarn = "正在施放治療！ 打斷！",
} end )

L:RegisterTranslations("koKR", function() return {
	engage_message = "벌레 무리 전투 개시",

	fear = "공포",
	fear_desc = "공포 타이머입니다.",
	feartrigger = "공포에 걸렸습니다%.$",
	fearbar = "공포",
	fearwarn1 = "공포 시전! 다음 시전 20초후!",
	fearwarn2 = "5초후 공포!",

	heal = "치유",
	heal_desc = "야유즈가 치유 시전 시 알립니다.",
	healtrigger = "공주 야우즈|1이;가; 상급 치유|1을;를; 시전합니다.",
	healwarn = "치유 시전 - 시전 방해!",
} end )

L:RegisterTranslations("ruRU", function() return {
	cmd = "BugFamily",

	engage_message = "Жуки в ярости!",

	fear = "Страх",
	fear_desc = "Таймеры страха.",
	feartrigger = " подвержен страху%.$",
	fearbar = "С.Т.Р.А.Х.",
	fearwarn1 = "Массовый страх через 20 секунд!!",
	fearwarn2 = "Массовый через 5 секунд!!",

	heal = "Исцеление",
	heal_desc = "Предупреждать, когда принцесса Яудж начнёт произносить заклинание исцеления.",
	healtrigger = "Princess Yauj begins to cast Great Heal.",
	healwarn = "Кастует исцеление!!",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

local mod = BigWigs:NewModule(boss)
mod.zonename = BZ["Ahn'Qiraj"]
mod.enabletrigger = {kri, yauj, vem}
mod.toggleOptions = {"fear", "heal", "bosskill"}
mod.revision = tonumber(("$Revision: 328 $"):sub(12, -3))

------------------------------
--      Initialization      --
------------------------------

function mod:OnEnable()
	deaths = 0
	started = nil

	self:AddCombatListener("UNIT_DIED", "Deaths")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF")

	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "FearEvent")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "FearEvent")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "FearEvent")

	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "TrioFear", 10)
	self:TriggerEvent("BigWigs_ThrottleSync", "TrioHeal", 3)
	self:TriggerEvent("BigWigs_ThrottleSync", "TrioKri", 20)
	self:TriggerEvent("BigWigs_ThrottleSync", "TrioYauj", 20)
	self:TriggerEvent("BigWigs_ThrottleSync", "TrioVem", 20)
end

------------------------------
--      Event Handlers      --
------------------------------

function mod:FearEvent(msg)
	if msg:find(L["feartrigger"]) then
		self:Sync("TrioFear")
	end
end

function mod:Deaths(unit)
	if unit == kri then
		self:Sync("TrioKri")
	elseif unit == yauj then
		self:Sync("TrioYauj")
	elseif unit == vem then
		self:Sync("TrioVem")
	end
end

function mod:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF(msg)
	if msg == L["healtrigger"] then
		self:Sync("TrioHeal")
	end
end

function mod:BigWigs_RecvSync(sync, rest, nick)
	if self:ValidateEngageSync(sync, rest) and not started then
		deaths = 0
		started = true
		if self:IsEventRegistered("PLAYER_REGEN_DISABLED") then
			self:UnregisterEvent("PLAYER_REGEN_DISABLED")
		end
		self:Message(L["engage_message"], "Positive")
	elseif sync == "TrioFear" and self.db.profile.fear then
		self:Bar(L["fearbar"], 20, "Spell_Shadow_Possession")
		self:Message(L["fearwarn1"], "Important")
		self:DelayedMessage(15, L["fearwarn2"], "Urgent")
	elseif sync == "TrioHeal" and self.db.profile.heal then
		self:Message(L["healwarn"], "Urgent")
		self:Bar(L["healwarn"], 2, "Spell_Holy_Heal")
	elseif sync == "TrioKri" or sync == "TrioYauj" or sync == "TrioVem" then
		deaths = deaths + 1
		if deaths == 3 then
			self:GenericBossDeath(boss)
		end
	end
end
