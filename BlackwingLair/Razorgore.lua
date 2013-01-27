------------------------------
--      Are you local?      --
------------------------------

local boss = BB["Razorgore the Untamed"]
local controller = BB["Grethok the Controller"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)
local eggs

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Razorgore",

	start_trigger = "Intruders have breached",
	start_message = "Razorgore engaged! Mobs in 45sec!",
	start_soon = "Mob Spawn in 5sec!",
	start_mob = "Mob Spawn",

	mc = "Mind Control",
	mc_desc = "Warn when players are mind controlled.",
	mindcontrol_trigger = "Foolish ([^%s]+).",
	mindcontrol_message = "%s has been mind controlled!",

	eggs = "Count Eggs",
	eggs_desc = "Count the destroyed eggs.",
	egg_message = "%d/30 eggs destroyed!",

	phase = "Phases",
	phase_desc = "Alert on phase 1 and 2.",
	phase2_trigger = "Razorgore the Untamed's Warming Flames heals Razorgore the Untamed for .*.",
	phase2_message = "All eggs destroyed, Razorgore loose!",
} end)

L:RegisterTranslations("ruRU", function() return {
	start_trigger = "Злоумышленники проломились",
	start_message = "Бритвосмерт в бещенстве! Помощники появятся через 45 секунд!",
	start_soon = "Помощники через 5 секунд!",
	start_mob = "Появляются помощники!",

	mc = "Контроль разума",
	mc_desc = "Предупреждать, когда Бритвосмерт управляет разумом игроков.",
	mindcontrol_trigger = "Глупый ([^%s]+).",
	mindcontrol_message = "Бритвосмерт УПРАВЛЯЕТ РАЗУМОМ %s !",

	eggs = "Считать яйца",
	eggs_desc = "Пересчитывать уничтоженные яйца.",
	egg_message = "%d/30 яиц уничтожено!",

	phase = "Фазы",
	phase_desc = "Предупреждать о фазах 1 и 2.",
	phase2_trigger = "Согревающее пламя Бритвосмерта Неукротимого исцеляет Бритвосмерта Неукротимого на .*.",
	phase2_message = "Все яйца уничтоже, Бритвосметр повержен!",
} end)

L:RegisterTranslations("koKR", function() return {
	start_trigger = "침입자들이 들어왔다! 어떤 희생이 있더라도 알을 반드시 수호하라!",
	start_message = "폭군 서슬송곳니 전투 시작",
	start_soon = "몹 소환 5초전!",
	start_mob = "몹 소환",

	mc = "정신 지배",
	mc_desc = "플레이어가 정신 지배 되었을 때 경고",
	mindcontrol_trigger = "자! ([^%s]+), 이제부터 나를 섬겨라!",
	mindcontrol_message = "<<%s>> 정신 지배 되었습니다.",

	eggs = "알 개수 알림 미사용",
	eggs_desc = "남은 알 개수 알림 미사용",
	egg_message = "%d/30 알을 파괴하였습니다.",

	phase = "단계",
	phase_desc = "단계 1 과 2 알림",
	phase2_trigger = "Razorgore the Untamed's Warming Flames heals Razorgore the Untamed for .*.", -- CHECK
	phase2_message = "모든 알이 파괴되었습니다, 서슬송곳니가 풀려납니다.", -- CHECK
} end)

L:RegisterTranslations("deDE", function() return {
	start_trigger = "Eindringlinge sind in die",
	start_message = "Razorgore angegriffen!",
	start_soon = "Mob Spawn in 5sec!",
	start_mob = "Mob Spawn",

	mc = "Gedankenkontrolle",
	mc_desc = "Warnung, wenn Spieler \195\188bernommen werden.",
	mindcontrol_trigger = "^([^%s]+), Ihr Narr, Ihr dient jetzt mir!",
	mindcontrol_message = "%s wurde \195\188bernommen!",

	eggs = "Eier nicht z\195\164hlen",
	eggs_desc = "Die zerst\195\182rten Eier nicht z\195\164hlen.",
	egg_message = "%d/30 Eier zerst\195\182rt!",

	phase = "Phasen",
	phase_desc = "Warnung beim Eintritt in Phase 1 und 2.",
	phase2_trigger = "Razorgore the Untamed's Warming Flames heals Razorgore the Untamed for .*.", -- CHECK
	phase2_message = "Alle Eier zerst\195\182rt!",
} end)

L:RegisterTranslations("frFR", function() return {
	start_trigger = "Sonnez l'alarme",
	start_message = "Tranchetripe engagé ! Gardes dans 45 sec. !",
	start_soon = "Arrivée des gardes dans 5 sec. !",
	start_mob = "Arrivée des gardes",

	mc = "Contrôle mental",
	mc_desc = "Préviens quand un joueur subit les effets du Contrôle mental.",
	mindcontrol_trigger = "Stupide ([^%s]+), tu es mon esclave maintenant !",
	mindcontrol_message = "%s est sous Contrôle mental !",

	eggs = "Comptage des œufs",
	eggs_desc = "Compte le nombre d'œufs détruits.",
	egg_message = "%d/30 œuf(s) détruit(s) !",

	phase = "Phases",
	phase_desc = "Préviens de l'arrivée des phases 1 & 2.",
	phase2_trigger = "^Flammes échauffantes .* Tranchetripe l'Indompté guérit Tranchetripe l'Indompté de",
	phase2_message = "Tous les œufs ont été détruits !",
} end)

L:RegisterTranslations("zhCN", function() return {
	start_trigger = "入侵者",
	start_message = "狂野的拉佐格尔 - 战斗开始!",
	start_soon = "5秒开蛋！",
	start_mob = "开蛋",

	mc = "精神控制",
	mc_desc = "当一个玩家使用精神控制时向团队发出警报。",
	mindcontrol_trigger = "愚蠢的(.+)",
	mindcontrol_message = "%s 被精神控制！",

	eggs = "取消龙蛋计数",
	eggs_desc = "取消剩余龙蛋计数 - 该功能还在完善中。。。",
	egg_message = "%d/30 龙蛋已经摧毁",

	phase = "第二阶段警报",
	phase_desc = "第二阶段警报",
	phase2_trigger = "狂野的拉佐格尔的温暖之焰为狂野的拉佐格尔恢复了.*点生命值。",--check
	phase2_message = "所有龙蛋摧毁",
} end)

L:RegisterTranslations("zhTW", function() return {
	start_trigger = "入侵者",
	start_message = "狂野的拉佐格爾進入戰鬥！",
	start_soon = "5 秒後小兵出現！",
	start_mob = "小兵出現",

	mc = "精神控制",
	mc_desc = "當隊友被精神控制時發出警報",
	mindcontrol_trigger = "愚蠢的(.+)，",
	mindcontrol_message = "%s 被心靈控制",

	eggs = "取消龍蛋計數",
	eggs_desc = "取消剩餘龍蛋計數 - 該功能還在改善中。。。",
	egg_message = "已摧毀 %d/30 個龍蛋！",

	phase = "第二階段警報",
	phase_desc = "第二階段警報",
	phase2_trigger = "狂野的拉佐格爾的溫暖之焰為狂野的拉佐格爾恢復了.*點生命力。",
	phase2_message = "已摧毀所有龍蛋",
} end)

----------------------------------
--      Module Declaration      --
----------------------------------

local mod = BigWigs:NewModule(boss)
mod.zonename = BZ["Blackwing Lair"]
mod.enabletrigger = {boss, controller}
mod.toggleOptions = {"mc", "eggs", "phase", "bosskill"}
mod.revision = tonumber(("$Revision: 226 $"):sub(12, -3))

------------------------------
--      Initialization      --
------------------------------

function mod:OnEnable()
	self:AddCombatListener("SPELL_CAST_SUCCESS", "Eggs", 19873)
	self:AddCombatListener("UNIT_DIED", "GenericBossDeath")

	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")

	eggs = 0
end

------------------------------
--      Event Handlers      --
------------------------------

function mod:Eggs()
	eggs = eggs + 1

	if self.db.profile.eggs then
		self:IfMessage(L["egg_message"]:format(eggs), "Positive", 19873)
	end

	if eggs == 30 and self.db.profile.phase then
		self:Message(L["phase2_message"], "Important")
	end
end

function mod:CHAT_MSG_MONSTER_YELL(msg)
	if msg:find(L["start_trigger"]) then
		if self.db.profile.phase then
			self:Message(L["start_message"], "Urgent")
			self:Bar(L["start_mob"], 45, "Spell_Holy_PrayerOfHealing")
			self:DelayedMessage(40, L["start_soon"], "Important")
		end
		eggs = 0
	elseif self.db.profile.mc then
		local player = select(3, msg:find(L["mindcontrol_trigger"]))
		if player then
			self:IfMessage(L["mindcontrol_message"]:format(player), "Important", 32974)
		end
	end
end

