------------------------------
--      Are you local?      --
------------------------------

local boss = BB["Anubisath Guardian"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

local plagueID = GetSpellInfo(22997)
L:RegisterTranslations("enUS", function() return {
	cmd = "Guardian",

	summon = "Summon Adds",
	summon_desc = "Warn for summoned adds.",

	plagueyou = "Plague on you",
	plagueyou_desc = "Warn for plague on you.",

	plagueother = "Plague on others",
	plagueother_desc = "Warn for plague on others.",

	icon = "Place icon",
	icon_desc = "Place raid icon on the last plagued person. (requires promoted or higher)",

	explode = "Explode",
	explode_desc = "Warn for incoming explosion.",

	explodewarn = "Exploding!",
	enragewarn = "Enraged!",
	summonguardwarn = "Swarmguard Summoned",
	summonwarriorwarn = "Warrior Summoned",

	plaguewarnyou = "You have the Plague!",
	plague_other = "Plague: %s",
} end )

L:RegisterTranslations("deDE", function() return {
	summon = "Beschw\195\182rung",
	summon_desc = "Warnung, wenn Besch\195\188tzer des Anubisath Schwarmwachen oder Krieger beschw\195\182rt.",

	plagueyou = "Du hast die Seuche",
	plagueyou_desc = "Warnung, wenn Du die Seuche hast.",

	plagueother = "X hat die Seuche",
	plagueother_desc = "Warnung, wenn andere Spieler die Seuche haben.",

	icon = "Symbol",
	icon_desc = "Platziert ein Symbol \195\188ber dem Spieler, der die Seuche hat. (Ben\195\182tigt Anf\195\188hrer oder Bef\195\182rdert Status.)",

	explode = "Explosion",
	explode_desc = "Warnung vor Explosion.",

	explodewarn = "Explosion!",
	enragewarn = "Wutanfall!",
	summonguardwarn = "Schwarmwache beschworen!",
	summonwarriorwarn = "Krieger beschworen!",

	plaguewarnyou = "Du hast die Seuche!",
	plague_other = plagueID..": %s", --temporary, please translate properly localizers!
} end )

L:RegisterTranslations("zhCN", function() return {
	summon = "召唤警报",
	summon_desc = "阿努比萨斯守卫者召唤增援时发出警报",

	plagueyou = "玩家瘟疫警报",
	plagueyou_desc = "你中了瘟疫时发出警报",

	plagueother = "队友瘟疫警报",
	plagueother_desc = "队友中了瘟疫时发出警报",

	icon = "设置图标",
	icon_desc = "在最后个中瘟疫的队友上标记团队图标 (需要助理或领袖权限)",	

	explode = "爆炸警报",
	explode_desc = "阿努比萨斯守卫者即将爆炸时发出警报",

	explodewarn = "即将爆炸！近战躲开！",
	enragewarn = "进入狂怒状态！",
	summonguardwarn = "虫群卫士已被召唤出来",
	summonwarriorwarn = "阿努比萨斯战士已被召唤出来",

	plaguewarnyou = "你受到瘟疫的影响！快跑开！",
	plague_other = "瘟疫: %s",
} end )

L:RegisterTranslations("zhTW", function() return {
	summon = "召喚警報",
	summon_desc = "阿努比薩斯守衛者召喚增援時發出警報",

	plagueyou = "玩家瘟疫警報",
	plagueyou_desc = "你中了瘟疫時發出警報",

	plagueother = "隊友瘟疫警報",
	plagueother_desc = "隊友中了瘟疫時發出警報",

	explode = "爆炸警報",
	explode_desc = "阿努比薩斯守衛者即將爆炸時發出警報",

	explodewarn = "即將爆炸！快速擊殺！",
	enragewarn = "進入狂怒狀態！",
	summonguardwarn = "蟲群衛士已被召喚出來！",
	summonwarriorwarn = "阿努比薩斯戰士已被召喚出來！",

	plaguewarnyou = "你受到瘟疫的影響！快跑開！",
	plague_other = plagueID..": %s", --temporary, please translate properly localizers!
} end )

L:RegisterTranslations("koKR", function() return {
	summon = "소환 경고",
	summon_desc = "추가 소환에 대한 경고",

	plagueyou = "자신의 역병 경고",
	plagueyou_desc = "자신의 역병에 대한 경고",

	plagueother = "타인의 역병 경고",
	plagueother_desc = "타인의 역병에 대한 경고",

	icon = "아이콘 지정",
	icon_desc = "마지막 역병에 걸린 사람에게 공격대 아이콘 지정 (승급자 이상 요구)",

	explode = "폭발 경고",
	explode_desc = "폭발에 대한 경고",

	explodewarn = "폭파! 피하세요!",
	enragewarn = "분노!",
	summonguardwarn = "감시병 소환",
	summonwarriorwarn = "전사 소환",

	plaguewarnyou = "당신은 역병에 걸렸습니다.",
	plague_other = plagueID..": %s", --temporary, please translate properly localizers!
} end )

L:RegisterTranslations("frFR", function() return {
	summon = "Invocation",
	summon_desc = "Préviens quand le gardien invoque des renforts.",

	plagueyou = "Peste sur vous",
	plagueyou_desc = "Préviens quand vous subissez les effets de la Peste.",

	plagueother = "Peste sur les autres",
	plagueother_desc = "Préviens quand un autre joueur subit les effets de la Peste.",

	icon = "Icône",
	icon_desc = "Place une icône de raid sur le dernier joueur effecté par la Peste (nécessite d'être promu ou mieux).",

	explode = "Explosion",
	explode_desc = "Préviens en cas d'explosion imminente.",

	explodewarn = "Explosion !",
	enragewarn = "Enragé !",
	summonguardwarn = "Garde-essaim invoqué !",
	summonwarriorwarn = "Guerrier invoqué !",

	plaguewarnyou = "Vous avez la Peste !",
	plague_other = "Peste : %s",
} end )

L:RegisterTranslations("ruRU", function() return {
    summon = "Призыв тварей!",
	summon_desc = "Сообщать о появлении новых защитников",

	plagueyou = "Вы заражены чумой",
	plagueyou_desc = "Сообщать о заражении вас чумой.",

	plagueother = "Ваш товарищ заражён чумой!",
	plagueother_desc = "Сообщать о заражении сопартийцев.",

	icon = "Пометить цель рейдовой иконкой",
	icon_desc = "Помечать игрока, заражённого, чумой рейдовой меткой. (Необходимо быть лидером группы)",

	explode = "Взрыв",
	explode_desc = "Сообщать о наступлении взрыва.",

	explodewarn = "Взрывается!",
	enragewarn = "Бешенство!",
	summonguardwarn = "Призыв летающих",
	summonwarriorwarn = "Призыв воинов",

	plaguewarnyou = "Вы заражены чумой!!",
	plague_other = "Чума на: %s",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

local mod = BigWigs:NewModule(boss)
mod.zonename = BZ["Ruins of Ahn'Qiraj"]
mod.enabletrigger = boss
mod.toggleOptions = {"summon", "explode", "enrage", -1, "plagueyou", "plagueother", "icon"}
mod.revision = tonumber(("$Revision: 150 $"):sub(12, -3))

------------------------------
--      Initialization      --
------------------------------

function mod:OnEnable()
	self:AddCombatListener("SPELL_AURA_APPLIED", "Plague", 22997)
	self:AddCombatListener("SPELL_AURA_APPLIED", "Explode", 25698)
	self:AddCombatListener("SPELL_AURA_APPLIED", "Enrage") --do they even enrage?
	self:AddCombatListener("SPELL_SUMMON", "Summon", 17430, 17431)
	self:AddCombatListener("UNIT_DIED", "Deaths")
end

------------------------------
--      Event Handlers      --
------------------------------

function mod:Plague(player, spellID)
	local other = L["plague_other"]:format(player)
	if UnitIsUnit(player, "player") and self.db.profile.plagueyou then
		self:LocalMessage(L["plaguewarnyou"], "Personal", spellID, "Alarm")
		self:WideMessage(other)
	elseif self.db.profile.plagueother then
		self:IfMessage(other, "Attention", spellID)
		self:Whisper(player, L["plaguewarnyou"])
	end
	self:Icon(player, "icon")
end

function mod:Explode(_, spellID)
	if self.db.profile.explode then
		self:IfMessage(L["explodewarn"], "Important", spellID)
		self:Bar(L["explodewarn"], 6, spellID)
	end
end

local enrageID = GetSpellInfo(26527)
function mod:Enrage(unit, spellID, _, _, name)
	if name == enrageID and unit == boss then
		if self.db.profile.enrage then
			self:IfMessage(L["enragewarn"], "Important", spellID)
		end
	BigWigs:Print("Debug: Post this on BigWigs forums > "..spellID)
	end
end

function mod:Summon(_, spellID)
	if not self.db.profile.summon then return end

	if spellID == 17430 then --swarmguard
		self:Message(L["summonguardwarn"], "Attention")
	elseif spellID == 17431 then --warrior
		self:Message(L["summonwarriorwarn"], "Attention")
	end
end

function mod:Deaths(unit)
	if unit == boss then
		BigWigs:ToggleModuleActive(self, false)
	end
end

