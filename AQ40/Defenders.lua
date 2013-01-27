------------------------------
--      Are you local?      --
------------------------------

local boss = BB["Anubisath Defender"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Defender",

	plagueyou = "Plague on you alert",
	plagueyou_desc = "Warn if you got the Plague",

	plagueother = "Plague on others alert",
	plagueother_desc = "Warn if others got the Plague",

	thunderclap = "Thunderclap Alert",
	thunderclap_desc = "Warn for Thunderclap",

	meteor = "Meteor Alert",
	meteor_desc = "Warn for Meteor",

	shadowstorm = "Shadow Storm",
	shadowstorm_desc = "Warn for Shadow Storm",

	explode = "Explode Alert",
	explode_desc = "Warn for Explode",

	enrage = "Enrage Alert",
	enrage_desc = "Warn for Enrage",

	summon = "Summon Alert",
	summon_desc = "Warn for add summons",

	icon = "Place icon",
	icon_desc = "Place raid icon on the last plagued person (requires promoted or higher)",

	explodetrigger = "Anubisath Defender gains Explode.",
	explodewarn = "Exploding!",
	enragetrigger = "Anubisath Defender gains Enrage.",
	enragewarn = "Enraged!",
	summonguardtrigger = "Anubisath Defender casts Summon Anubisath Swarmguard.",
	summonguardwarn = "Swarmguard Summoned",
	summonwarriortrigger = "Anubisath Defender casts Summon Anubisath Warrior.",
	summonwarriorwarn = "Warrior Summoned",
	plaguetrigger = "^([^%s]+) ([^%s]+) afflicted by Plague%.$",
	plaguewarn = " has the Plague!",
	plagueyouwarn = "You have the plague!",
	you = "You",
	are = "are",

	thunderclaptrigger = "^Anubisath Defender's Thunderclap",
	thunderclapwarn = "Thunderclap!",
	meteortrigger = "^Anubisath Defender's Meteor",
	meteorwarn = "Meteor!",
	shadowstormtrigger = "^Anubisath Defender's Shadow Storm",
	shadowstormwarn = "Shadow Storm!",
} end )

L:RegisterTranslations("deDE", function() return {
	plagueyou = "Du hast die Seuche",
	plagueyou_desc = "Warnung, wenn Du die Seuche hast.",

	plagueother = "X hat die Seuche",
	plagueother_desc = "Warnung, wenn andere Spieler die Seuche haben.",

	thunderclap = "Donnerknall",
	thunderclap_desc = "Warnung, wenn Verteidiger des Anubisath Donnerknall wirkt.",

	meteor = "Meteor",
	meteor_desc = "Warnung, wenn Verteidiger des Anubisath Meteor wirkt.",

	shadowstorm = "Schattensturm",
	shadowstorm_desc = "Warnung, wenn Verteidiger des Anubisath Schattensturm wirkt.",

	explode = "Explosion",
	explode_desc = "Warnung, wenn Verteidiger des Anubisath explodiert.",

	enrage = "Wutanfall",
	enrage_desc = "Warnung, wenn Verteidiger des Anubisath w\195\188tend wird.",

	summon = "Beschw\195\182rung",
	summon_desc = "Warnung, wenn Verteidiger des Anubisath Schwarmwachen oder Krieger beschw\195\182rt.",

	icon = "Symbol",
	icon_desc = "Platziert ein Symbol \195\188ber dem Spieler, der die Seuche hat. (Ben\195\182tigt Anf\195\188hrer oder Bef\195\182rdert Status.)",

	explodetrigger = "Verteidiger des Anubisath bekommt 'Explodieren'.",
	explodewarn = "Explosion!",
	enragetrigger = "Verteidiger des Anubisath bekommt 'Wutanfall'.",
	enragewarn = "Wutanfall!",

	summonguardtrigger = "Verteidiger des Anubisath wirkt Schwarmwache des Anubisath beschw\195\182ren.",
	summonguardwarn = "Schwarmwache beschworen!",
	summonwarriortrigger = "Verteidiger des Anubisath wirkt Krieger des Anubisath beschw\195\182ren.",
	summonwarriorwarn = "Krieger beschworen!",

	plaguetrigger = "^([^%s]+) ([^%s]+) von Seuche betroffen%.$",
	plaguewarn = " hat die Seuche!",
	plagueyouwarn = "Du hast die Seuche!",
	you = "Ihr",
	are = "seid",

	thunderclaptrigger = "^Verteidiger des Anubisath's Donnerknall",
	thunderclapwarn = "Donnerknall!",
	meteortrigger = "^Verteidiger des Anubisath's Meteor",
	meteorwarn = "Meteor!",
	shadowstormtrigger = "^Verteidiger des Anubisath's Schattensturm",
	shadowstormwarn = "Schattensturm!",
} end )

L:RegisterTranslations("zhCN", function() return {
	plagueyou = "玩家瘟疫警报",
	plagueyou_desc = "你中了瘟疫时发出警报",

	plagueother = "队友瘟疫警报",
	plagueother_desc = "队友中了瘟疫时发出警报",

	thunderclap = "雷霆一击警报",
	thunderclap_desc = "阿努比萨斯防御者发动雷霆一击时发出警报",

	meteor = "流星警报",
	meteor_desc = "发动流星时发出警报",

	shadowstorm = "暗影风暴",
	shadowstorm_desc = "发动暗影风暴发出警报",

	explode = "爆炸警报",
	explode_desc = "阿努比萨斯防御者即将爆炸时发出警报",

	enrage = "狂怒警报",
	enrage_desc = "阿努比萨斯防御者进入狂怒状态时发出警报",

	summon = "召唤警报",
	summon_desc = "阿努比萨斯防御者召唤增援时发出警报",
	
	icon = "设置标记",
	icon_desc = "设置团队标记，标记中瘟疫的玩家 (需要助理或更高权限)",
	
	explodetrigger = "阿努比萨斯防御者获得了爆炸的效果。",
	explodewarn = "即将爆炸！近战躲开！",
	enragetrigger = "阿努比萨斯防御者获得了狂怒的效果。",
	enragewarn = "进入狂怒状态！",
	summonguardtrigger = "阿努比萨斯防御者施放了召唤阿努比萨斯虫群卫士。",
	summonguardwarn = "虫群卫士已被召唤出来",
	summonwarriortrigger = "阿努比萨斯防御者施放了召唤阿努比萨斯战士。",
	summonwarriorwarn = "阿努比萨斯战士已被召唤出来",
	plaguetrigger = "^(.+)受(.+)了瘟疫效果的影响。$",
	plaguewarn = "受到瘟疫的影响！快躲开！",
	plagueyouwarn = "你受到瘟疫的影响！快跑开！",
	you = "你",
	are = "到",

	thunderclaptrigger = "^阿努比萨斯防御者的雷霆震击",
	thunderclapwarn = "雷霆一击发动！",
	meteortrigger = "^阿努比萨斯防御者的流星",
	meteorwarn = "流星!",
	shadowstormtrigger = "^阿努比萨斯防御者的暗影风暴",
	shadowstormwarn = "暗影风暴!",

} end )


L:RegisterTranslations("zhTW", function() return {
	plagueyou = "玩家瘟疫警報",
	plagueyou_desc = "你中了瘟疫時發出警報",

	plagueother = "隊友瘟疫警報",
	plagueother_desc = "隊友中了瘟疫時發出警報",

	thunderclap = "雷霆一擊警報",
	thunderclap_desc = "阿努比薩斯防禦者發動雷霆一擊時發出警報",

	meteor = "隕石警報",
	meteor_desc = "阿努比薩斯防禦者發動隕石時發出警報",

	shadowstorm = "暗影箭警報",
	shadowstorm_desc = "阿努比薩斯防禦者發動暗影箭時發出警報",

	explode = "爆炸警報",
	explode_desc = "阿努比薩斯防禦者即將爆炸時發出警報",

	enrage = "狂怒警報",
	enrage_desc = "阿努比薩斯防禦者進入狂怒狀態時發出警報",

	summon = "召喚警報",
	summon_desc = "阿努比薩斯防禦者召喚增援時發出警報",

	icon = "標記瘟疫",
	icon_desc = "團隊標記中瘟疫的玩家 (需要助理或領隊權限)",

	explodetrigger = "阿努比薩斯防禦者獲得了爆炸的效果。",
	explodewarn = "即將爆炸！近戰躲開！",

	enragetrigger = "阿努比薩斯防禦者獲得了狂怒的效果。",
	enragewarn = "進入狂怒狀態！",

	summonguardtrigger = "阿努比薩斯防禦者施放了召喚阿努比薩斯蟲群衛士。",
	summonguardwarn = "蟲群衛士已被召喚出來",

	summonwarriortrigger = "阿努比薩斯防禦者施放了召喚阿努比薩斯戰士。",
	summonwarriorwarn = "阿努比薩斯戰士已被召喚出來",

	plaguetrigger = "^(.+)受到(.*)瘟疫",
	plaguewarn = "受到瘟疫的影響！快躲開！*",
	plagueyouwarn = "你受到瘟疫的影響！快跑開！",
	you = "你",
	are = "了",

	thunderclaptrigger = "^阿努比薩斯防禦者的雷霆一擊擊中你",
	thunderclapwarn = "雷霆一擊！遠戰退後！",

	meteortrigger = "^阿努比薩斯防禦者的隕石擊中你",
	meteorwarn = "隕石！集中靠近!",

	shadowstormtrigger = "^阿努比薩斯防禦者的暗影風暴擊中你",
	shadowstormwarn = "暗影箭！遠戰靠近！",
} end )


L:RegisterTranslations("koKR", function() return {
	plagueyou = "자신의 역병 경고",
	plagueyou_desc = "자신의 역병에 대한 경고",

	plagueother = "타인의 역병 경고",
	plagueother_desc = "타인의 역병에 대한 경고",

	thunderclap = "천둥벼락 경고",
	thunderclap_desc = "천둥벼락에 대한 경고",

	meteor = "유성 경고",
	meteor_desc = "유성에 대한 경고",

	shadowstorm = "암흑 폭풍 경고",
	shadowstorm_desc = "암흑 폭풍에 대한 경고",

	explode = "폭발 경고",
	explode_desc = "폭발에 대한 경고",

	enrage = "분노 경고",
	enrage_desc = "분노에 대한 경고",

	summon = "소환 경고",
	summon_desc = "추가 소환에 대한 경고",

	icon = "아이콘 지정",
	icon_desc = "마지막 역병에 걸린 사람에게 공격대 아이콘 지정(승급자 이상 필요)",

	explodetrigger = "아누비사스 문지기|1이;가; 폭파 효과를 얻었습니다.",
	explodewarn = "폭파! 떨어지세요!",
	enragetrigger = "아누비사스 문지기|1이;가; 분노 효과를 얻었습니다.",
	enragewarn = "분노 돌입!",
	summonguardtrigger = "아누비사스 문지기|1이;가; 아누비사스 감시병 소환|1을;를; 시전합니다.",
	summonguardwarn = "감시병 소환",
	summonwarriortrigger = "아누비사스 문지기|1이;가; 아누비사스 전사 소환|1을;를; 시전합니다.",
	summonwarriorwarn = "전사 소환",
	plaguetrigger = "^([^|;%s]*)(.*)역병에 걸렸습니다%.$", -- "(.*) 역병에 걸렸습니다.",
	plaguewarn = "님은 역병에 걸렸습니다. 피하세요",
	plagueyouwarn = "당신은 역병에 걸렸습니다! 떨어지세요!",
	you = "당신은",
	are = "", -- "are"

	thunderclaptrigger = "아누비사스 문지기|1이;가; 천둥벼락|1으로;로; (.+)에게 (%d+)의",
	thunderclapwarn = "천둥벼락! - 멀리 떨어지세요",
	meteortrigger = "아누비사스 문지기|1이;가; 유성|1으로;로; (.+)에게",
	meteorwarn = "유성!",
	shadowstormtrigger = "아누비사스 문지기|1이;가; 암흑 폭풍|1으로;로; (.+)에게",
	shadowstormwarn = "암흑 폭풍!",

} end )

L:RegisterTranslations("frFR", function() return {
	plagueyou = "Peste sur vous",
	plagueyou_desc = "Préviens vous subissez les effets de la Peste.",

	plagueother = "Peste sur les autres",
	plagueother_desc = "Préviens quand un joueur subit les effets de la Peste",

	thunderclap = "Coup de tonnerre",
	thunderclap_desc = "Préviens de l'arrivée des Coups de tonnerre.",

	meteor = "Météore",
	meteor_desc = "Préviens de l'arrivée des Météores.",

	shadowstorm = "Tempête d'ombre",
	shadowstorm_desc = "Préviens de l'arrivée des Tempêtes d'ombre.",

	explode = "Explosion",
	explode_desc = "Préviens quand le défenseur se prépare à exploser.",

	enrage = "Enrager",
	enrage_desc = "Préviens quand le défenseur devient enragé.",

	summon = "Invocation",
	summon_desc = "Préviens quand le défenseur invoque des gardes-essaim.",

	icon = "Icône",
	icon_desc = "Place une icône de raid sur le dernier joueur affecté par la Peste (nécessite d'être promu ou mieux).",

	explodetrigger = "Défenseur Anubisath gagne Exploser.",
	explodewarn = "Explosion imminente !",
	enragetrigger = "Défenseur Anubisath gagne Enrager.",
	enragewarn = "Enragé !",
	summonguardtrigger = "Défenseur Anubisath lance Invocation d'un garde-essaim anubisath.",
	summonguardwarn = "Garde-essaim invoqué",
	summonwarriortrigger = "Défenseur Anubisath lance Invocation d'un guerrier anubisath.",
	summonwarriorwarn = "Guerrier invoqué",
	plaguetrigger = "^([^%s]+) ([^%s]+) les effets .* Peste%.$",
	plaguewarn = " a la Peste !",
	plagueyouwarn = "Vous avez la Peste !",
	you = "Vous",
	are = "subissez",

	thunderclaptrigger = "^Défenseur Anubisath .* Coup de tonnerre",
	thunderclapwarn = "Coup de tonnerre !",
	meteortrigger = "^Défenseur Anubisath .* Météore",
	meteorwarn = "Météore !",
	shadowstormtrigger = "^Défenseur Anubisath .* Tempête d'ombre",
	shadowstormwarn = "Tempête d'ombre !",
} end )

L:RegisterTranslations("ruRU", function() return {
        plagueyou = "Чума на вас",
	plagueyou_desc = "Сообщать о заражении чумой",

	plagueother = "Чума на других",
	plagueother_desc = "Сообщать о заражении сопартийцев",

	thunderclap = "Раскат грома",
	thunderclap_desc = "Сообщать о раскате грома",

	meteor = "Метеор",
	meteor_desc = "Сообщать о метеоре",

	shadowstorm = "Теневой шторм",
	shadowstorm_desc = "Сообщать о теневом шторме",

	explode = "Опасность взрыва",
	explode_desc = "Сообщать о взрыве",

	enrage = "Бешенство",
	enrage_desc = "Сообщать о бешенстве",

	summon = "Опасность призыва",
	summon_desc = "Сообщать о призыве",

	icon = "Помечать рейдовой иконкой",
	icon_desc = "Помечать рейдовой иконкой игроков, заражённых чумой (Необходимо быть лидером группы)",

	explodetrigger = "Анубисат-защитник взрывается.",
	explodewarn = "Взрыв!",
	enragetrigger = "Анубисат-защитник впадает в бешенство.",
	enragewarn = "Бешенство!",
	summonguardtrigger = "Анубисат-защитник начинает призывать Анубисата-стража роя.",
	summonguardwarn = "Стража роя призвана",
	summonwarriortrigger = "Анубисат-защитник начинает призывать Анубисата-воина.",
	summonwarriorwarn = "Воин призван",
	plaguetrigger = "^([^%s]+) ([^%s]+) заражён чумой%.$",
	plaguewarn = " заражён чумой чуму!",
	plagueyouwarn = "Вы заражены чумой!",
	you = "Ты",
	are = "есть",

	thunderclaptrigger = "^ раскат грома Анубисата-защитника",
	thunderclapwarn = "Раскат грома!",
	meteortrigger = "^метеор Анубисата-защитника",
	meteorwarn = "Метеор!",
	shadowstormtrigger = "^Теневой шторм Анубисата-защитника",
	shadowstormwarn = "Теневой шторм!",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

local mod = BigWigs:NewModule(boss)
mod.zonename = BZ["Ahn'Qiraj"]
mod.enabletrigger = boss
mod.toggleOptions = { "plagueyou", "plagueother", "icon", -1, "thunderclap", "meteor", "shadowstorm", "explode", "enrage", "bosskill"}
mod.revision = tonumber(string.sub("$Revision: 328 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function mod:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "CheckPlague")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "CheckPlague")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "CheckPlague")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Abilities")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Abilities")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Abilities")
	self:AddCombatListener("UNIT_DIED", "Deaths")

	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "DefenderEnrage", 10)
	self:TriggerEvent("BigWigs_ThrottleSync", "DefenderExplode", 10)
	self:TriggerEvent("BigWigs_ThrottleSync", "DefenderThunderclap", 12)
	self:TriggerEvent("BigWigs_ThrottleSync", "DefenderMeteor", 12)
	self:TriggerEvent("BigWigs_ThrottleSync", "DefenderShadowstorm", 12)
end

------------------------------
--      Event Handlers      --
------------------------------

function mod:Deaths(unit)
	if unit == boss then
		BigWigs:ToggleModuleActive(self, false)
	end
end

function mod:BigWigs_RecvSync(sync, rest, nick)
	if sync == "DefenderExplode" and self.db.profile.explode then
		self:Message(L["explodewarn"], "Important")
		self:Bar(L["explodewarn"], 6, "Spell_Fire_SelfDestruct")
	elseif sync == "DefenderEnrage" and self.db.profile.enrage then
		self:Message(L["enragewarn"], "Important")
	elseif sync == "DefenderThunderclap" and self.db.profile.thunderclap then
		self:Message(L["thunderclapwarn"], "Important")
	elseif sync == "DefenderMeteor" and self.db.profile.meteor then
		self:Message(L["meteorwarn"], "Important")
	elseif sync == "DefenderShadowstorm" and self.db.profile.shadowstorm then
		self:Message(L["shadowstormwarn"], "Important")
	end
end

function mod:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS(msg)
	if msg == L["explodetrigger"] then
		self:Sync("DefenderExplode")
	elseif msg == L["enragetrigger"] then
		self:Sync("DefenderEnrage")
	end
end

function mod:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF(msg)
	if not self.db.profile.summon then return end
	if msg == L["summonguardtrigger"] then
		self:Message(L["summonguardwarn"], "Attention")
	elseif msg == L["summonwarriortrigger"] then
		self:Message(L["summonwarriorwarn"], "Attention")
	end
end

function mod:CheckPlague(msg)
	local pplayer, ptype = select(3, msg:find(L["plaguetrigger"]))
	if pplayer then
		if self.db.profile.plagueyou and pplayer == L["you"] then
			self:Message(L["plagueyouwarn"], "Personal", true)
			self:Message(UnitName("player") .. L["plaguewarn"], "Attention", nil, nil, true)
		elseif self.db.profile.plagueother then
			self:Message(pplayer .. L["plaguewarn"], "Attention")
			self:Whisper(pplayer, L["plagueyouwarn"])
		end

		if self.db.profile.icon then
			self:Icon(pplayer)
		end
	end
end

function mod:Abilities(msg)
	if msg:find(L["thunderclaptrigger"]) then
		self:Sync("DefenderThunderclap")
	elseif msg:find(L["meteortrigger"]) then
		self:Sync("DefenderMeteor")
	elseif msg:find(L["shadowstormtrigger"]) then
		self:Sync("DefenderShadowstorm")
	end
end
