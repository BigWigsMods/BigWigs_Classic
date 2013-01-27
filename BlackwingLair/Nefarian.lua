------------------------------
--      Are you local?      --
------------------------------

local boss = BB["Nefarian"]
local victor = BB["Lord Victor Nefarius"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

local warnpairs = nil

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Nefarian",

	landing_soon_trigger = "Well done, my minions",
	landing_trigger = "BURN! You wretches",
	zerg_trigger = "Impossible! Rise my",

	triggershamans	= "Shamans, show me",
	triggerdruid	= "Druids and your silly",
	triggerwarlock	= "Warlocks, you shouldn't be playing",
	triggerpriest	= "Priests! If you're going to keep",
	triggerhunter	= "Hunters and your annoying",
	triggerwarrior	= "Warriors, I know you can hit harder",
	triggerrogue	= "Rogues%? Stop hiding",
	triggerpaladin	= "Paladins",
	triggermage		= "Mages too%?",
	triggerdeathknight	= "Deathknight ",

	landing_soon_warning = "Nefarian landing in 10 seconds!",
	landing_warning = "Nefarian is landing!",
	zerg_warning = "Zerg incoming!",
	fear_warning = "Fear in 2 sec!",
	fear_soon_warning = "Possible fear in ~5 sec",
	shadowflame_warning = "Shadow Flame incoming!",
	classcall_warning = "Class call incoming!",

	warnshaman	= "Shamans - Totems spawned!",
	warndruid	= "Druids - Stuck in cat form!",
	warnwarlock	= "Warlocks - Incoming Infernals!",
	warnpriest	= "Priests - Heals hurt!",
	warnhunter	= "Hunters - Bows/Guns broken!",
	warnwarrior	= "Warriors - Stuck in berserking stance!",
	warnrogue	= "Rogues - Ported and rooted!",
	warnpaladin	= "Paladins - Blessing of Protection!",
	warnmage	= "Mages - Incoming polymorphs!",
	warndeathknight	= "Deathknight - ",

	classcall_bar = "Class call",
	fear_bar = "Possible fear",

	shadowflame = "Shadow Flame",
	shadowflame_desc = "Warn for Shadow Flame.",

	fear = "Fear",
	fear_desc = "Warn when Nefarian casts AoE Fear.",

	classcall = "Class Call",
	classcall_desc = "Warn for Class Calls.",

	otherwarn = "Landing and Zerg",
	otherwarn_desc = "Landing and Zerg warnings.",
} end)

L:RegisterTranslations("ruRU", function() return {
	landing_soon_trigger = "Отличная работа мои миньёны!",
	landing_trigger = "СЖЕЧЬ! Вы обречены!",
	zerg_trigger = "Невозможно!",

	triggershamans	= "Шаманы! Покажитесь мне!",
	triggerdruid	= "Друиды, и ваш глупец!",
	triggerwarlock	= "Варлоки, вы должны играть!",
	triggerpriest	= "Присты! If you're going to keep",
	triggerhunter	= "Охотники и ваше раздражение",
	triggerwarrior	= "Войны, Я знаю что вы можете бить сильнее!",
	triggerrogue	= "Разбойники%? Перестаньте скрываться",
	triggerpaladin	= "Паладины",
	triggermage		= "Маги так же%?",

	landing_soon_warning = "Нефариан приземлится через 10 секунд!",
	landing_warning = "Нефариан ПРИЗЕМЛЯЕТСЯ!",
	zerg_warning = "НАЧИНАЕТСЯ ЗЕРГ!",
	fear_warning = "СТРАХ ЧЕРЕЗ 2 СЕКУНДЫ!",
	fear_soon_warning = "ВОЗМОЖНО СТРАХ ЧЕРЕЗ 5 СЕКУНД",
	shadowflame_warning = "Появляется теневое пламя!!",
	classcall_warning = "Начинается классовый вызов!",

	warnshaman	= "Шаманы - ставьте тотемы!",
	warndruid	= "Друиды - пробудите в себе зверя!",
	warnwarlock	= "Чернокнижники - вызывайте инферналов!",
	warnpriest	= "Жрецы - исцеляйте повреждения!",
	warnhunter	= "Охотники - доставайте свои луки!",
	warnwarrior	= "Войны - становитесь в атакующие стойки!",
	warnrogue	= "Разбойники - точите свои клинки!",
	warnpaladin	= "Паладины - улучшайте защиту!",
	warnmage	= "Маги - используйте превращение!",

	classcall_bar = "Классовый вызов",
	fear_bar = "Возможный страх",

	shadowflame = "Теневое пламя",
	shadowflame_desc = "Предупреждать о теневом пламени.",

	fear = "Массовый страх",
	fear_desc = "предупреждать о касте массового страха Нефарианом.",

	classcall = "Классовый вызов",
	classcall_desc = "Предупреждать о классовом вызове.",

	otherwarn = "Приземление и зерг",
	otherwarn_desc = "Предупреждать об опасности приземления и зерга.",
} end)

L:RegisterTranslations("zhCN", function() return {
	landing_soon_trigger = "干得好，我的手下。",
	landing_trigger = "燃烧吧！你这个",
	zerg_trigger = "^不可能",

	triggershamans	= "^萨满祭司",
	triggerdruid	= "^德鲁伊",
	triggerwarlock	= "^术士",
	triggerpriest	= "^牧师",
	triggerhunter	= "^猎人",
	triggerwarrior	= "^战士",
	triggerrogue	= "^盗贼",
	triggerpaladin	= "^圣骑士",
	triggermage		= "^你们也是法师",
	triggerdeathknight	= "^死亡骑士",

	landing_soon_warning = "奈法利安将在10秒后降落！",
	landing_warning = "奈法利安已降落！",
	zerg_warning = "骨龙群出现！",
	fear_warning = "2秒后发动群体恐惧！",
	fear_soon_warning = "~5秒后可能发动群体恐惧",
	shadowflame_warning = "暗影烈焰发动！牧师给MT加盾！",
	classcall_warning = "职业点名！",

	warnshaman	= "萨满祭司 - 图腾涌现！",
	warndruid	= "德鲁伊 - 强制猫形态，无法治疗和解诅咒！",
	warnwarlock	= "术士 - 地狱火出现，DPS职业尽快将其消灭！",
	warnpriest	= "牧师 - 停止治疗，静等25秒！",
	warnhunter	= "猎人 - 远程武器损坏！",
	warnwarrior	= "战士 - 强制狂暴姿态，加大对MT的治疗量！",
	warnrogue	= "盗贼 - 被传送和麻痹！",
	warnpaladin	= "圣骑士 - BOSS受到保护祝福，物理攻击无效！",
	warnmage	= "法师 - 变形术发动，注意解除！",
	warndeathknight	= "死亡骑士 - 群体死亡之握！",

	classcall_bar = "职业点名",
	fear_bar = "可能恐惧",

	shadowflame = "暗影烈焰警报",
	shadowflame_desc = "暗影烈焰警报",

	fear = "恐惧警报",
	fear_desc = "恐惧警报",

	classcall = "职业点名警报",
	classcall_desc = "职业点名警报",

	otherwarn = "其他警报",
	otherwarn_desc = "降落与骨龙群出现时发出警报",
} end)

L:RegisterTranslations("zhTW", function() return {
	landing_soon_trigger = "幹得好，我的手下。",
	landing_trigger = "燃燒吧！你這個",
	zerg_trigger = "^不可能",

	triggershamans	= "^薩滿，讓我看看",
	triggerdruid	= "^德魯伊和你們愚蠢的變形。讓我們看看什麼會發生吧!",
	triggerwarlock	= "^術士，不要隨便去玩那些你不理解的法術。看看會發生什麼吧?",
	triggerpriest	= "^牧師！如果你要繼續這麼治療的話，那我們來玩點有趣的東西!",
	triggerhunter	= "^獵人和你那討厭的豌豆射擊!",
	triggerwarrior	= "^戰士，我知道你應該比較抗打!讓我們來見識一下吧!",
	triggerrogue	= "^盜賊?不要躲了，面對我吧!",
	triggerpaladin	= "^聖騎士……聽說你有無數條命。讓我看看到底是怎麼樣的吧。",
	triggermage		= "^還有法師？你應該小心使用你的魔法……",
	triggerdeathknight	= "^死亡騎士們…來這。",

	landing_soon_warning	= "10秒後降落！",
	landing_warning		= "奈法利安已降落！",
	zerg_warning		= "龍獸出現！",
	fear_warning		= "群體恐懼 - 2 秒後發動",
	fear_soon_warning	= "群體恐懼 - 5 秒後發動",
	shadowflame_warning	= "暗影烈焰發動！",
	classcall_warning	= "5 秒後開始點名！",

	warnshaman	= "薩滿 - 圖騰湧現",
	warndruid	= "德魯伊 - 強制貓形態，無法治療和解詛咒",
	warnwarlock	= "術士 - 地獄火出現，DPS職業盡快將其消滅",
	warnpriest	= "牧師 - 停止治療，靜等 25 秒",
	warnhunter	= "獵人 - 遠程武器損壞",
	warnwarrior	= "戰士 - 強制狂暴姿態，加大對MT的治療量",
	warnrogue	= "盜賊 - 被傳送和麻痺",
	warnpaladin	= "聖騎士 - BOSS受到保護祝福，物理攻擊無效",
	warnmage	= "法師 - 變形術發動，注意解除",
	warndeathknight	= "死亡騎士 - 集體死亡之握",

	classcall_bar = "職業點名",
	fear_bar = "可能恐懼",

	shadowflame = "暗影烈焰警報",
	shadowflame_desc = "當奈法利安施放暗影烈焰時發出警報",

	fear = "恐懼警報",
	fear_desc = "當奈法利安施放群體恐懼時發出警報",

	classcall = "職業點名警報",
	classcall_desc = "當奈法利安進行職業點名時發出警報",

	otherwarn = "其他警報",
	otherwarn_desc = "降落及龍獸出現時發出警報",
} end)

L:RegisterTranslations("koKR", function() return {
	landing_soon_trigger = "적들의 사기가 떨어지고 있다",
	landing_trigger = "불타라! 활활!",
	zerg_trigger = "말도 안 돼! 일어나라!",

	triggershamans	= "주술사",
	triggerdruid	= "드루이드 녀석, 그 바보",
	triggerwarlock	= "흑마법사여, 네가 이해하지도 못하는",
	triggerpriest	= "사제야, 그렇게 치유를",
	triggerhunter	= "그 장난감",
	triggerwarrior	= "전사들이로군, 네가 그보다 더 강하게 내려 칠 수",
	triggerrogue	= "도적들인가?",
	triggerpaladin	= "성기사여",
	triggermage		= "네가 마법사냐?",

	landing_soon_warning = "네파리안이 10초 후 착지합니다!",
	landing_warning = "네파리안이 착지했습니다!",
	zerg_warning = "해골 등장!",
	fear_warning = "2초 후 공포!",
	fear_soon_warning = "약 5초내 공포!",
	shadowflame_warning = "암흑의 불길 주의!",
	classcall_warning = "곧 직업이 지목됩니다!",

	warnshaman	= "주술사 - 토템 파괴!",
	warndruid	= "드루이드 - 강제 표범 변신!",
	warnwarlock	= "흑마법사 - 지옥불정령 등장!",
	warnpriest	= "사제 - 치유 주문 금지!",
	warnhunter	= "사냥꾼 - 원거리 무기 파손!",
	warnwarrior	= "전사 - 광태 강제 전환!",
	warnrogue	= "도적 - 강제 소환!",
	warnpaladin	= "성기사 - 강제 보축 사용!",
	warnmage	= "마법사 - 변이!",

	classcall_bar = "직업 지목",
	fear_bar = "공포 가능",

	shadowflame = "암흑의 불길 경고",
	shadowflame_desc = "암흑의 불길에 대한 경고",

	fear = "공포 경고",
	fear_desc = "네파리안이 공포 시전시 경고",

	classcall = "직업 지목 경고",
	classcall_desc = "직업 지목에 대한 경고",

	otherwarn = "기타 경고",
	otherwarn_desc = "착지와 소환에 대한 경고",
} end)

L:RegisterTranslations("deDE", function() return {
	landing_soon_trigger = "Sehr gut, meine Diener",
	landing_trigger = "BRENNT! Ihr Elenden!",
	zerg_trigger = "Unm\195\182glich! Erhebt euch",

	triggershamans	= "Schamane, zeigt mir was",
	triggerdruid	= "Druiden und ihre l\195\164cherliche",
	triggerwarlock	= "Hexenmeister, Ihr solltet nicht mit Magie",
	triggerpriest	= "Priester! Wenn Ihr weiterhin",
	triggerhunter	= "J\195\164ger und ihre l\195\164stigen",
	triggerwarrior	= "Krieger, Ich bin mir sicher",
	triggerrogue	= "Schurken%? Kommt aus den Schatten",
	triggerpaladin	= "Paladine",
	triggermage		= "Auch Magier%? Ihr solltet vorsichtiger",

	landing_soon_warning = "Nefarian landet in 10 Sekunden!",
	landing_warning = "Nefarian ist gelandet!",
	zerg_warning = "Diener herbeigerufen!",
	fear_warning = "AoE Furcht in 2 Sekunden!",
	fear_soon_warning = "M\195\182gliche AoE Furcht in ~5 sec",
	shadowflame_warning = "Schattenflamme!",
	classcall_warning = "Klassenruf in K\195\188rze!",

	warnshaman	= "Schamanen - Totems!",
	warndruid	= "Druiden - Gefangen in Katzenform!",
	warnwarlock	= "Hexenmeister - H\195\182llenbestien herbeigerufen!",
	warnpriest	= "Priester - Heilung schadet!",
	warnhunter	= "J\195\164ger - Angelegte Fernkampfwaffen defekt!",
	warnwarrior	= "Krieger - Gefangen in Berserkerhaltung!",
	warnrogue	= "Schurken - Teleportiert und festgewurzelt!",
	warnpaladin	= "Paladine - Segen des Schutzes!",
	warnmage	= "Magier - Verwandlung!",

	classcall_bar = "Klassenruf",
	fear_bar = "M\195\182gliche AoE Furcht",

	shadowflame = "Schattenflamme",
	shadowflame_desc = "Warnung, wenn Nefarian Schattenflamme wirkt.",

	fear = "Furcht",
	fear_desc = "Warnung, wenn Nefarian AoE Furcht wirkt.",

	classcall = "Klassenruf",
	classcall_desc = "Warnung vor Klassenrufen.",

	otherwarn = "Anderes",
	otherwarn_desc = "Warnung, wenn Nefarian landet und seine Diener ruft.",
} end)

L:RegisterTranslations("frFR", function() return {
	landing_soon_trigger = "Beau travail",
	landing_trigger = "BRÛLEZ, misérables",
	zerg_trigger = "C'est impossible ! Relevez%-vous, serviteurs !",

	triggershamans	= "Chamans, montrez moi",
	triggerdruid	= "Les druides et leur stupides",
	triggerwarlock	= "Démonistes, vous ne devriez pas jouer",
	triggerpriest	= "Prêtres ! Si vous continuez",
	triggerhunter	= "Ah, les chasseurs et les stupides",
	triggerwarrior	= "Guerriers, je sais que vous pouvez frapper plus fort",
	triggerrogue	= "Voleurs, arrêtez de vous cacher",
	triggerpaladin	= "Les paladins",
	triggermage		= "Les mages aussi",

	landing_soon_warning = "Nefarian atterit dans 10 sec. !",
	landing_warning = "Nefarian atterit !",
	zerg_warning = "Zerg imminent !",
	fear_warning = "Peur dans 2 sec. !",
	fear_soon_warning = "Peur probable dans ~5 sec.",
	shadowflame_warning = "Arrivée de la Flamme d'ombre !",
	classcall_warning = "Arrivée de l'appel des classes !",

	warnshaman	= "Chamans - Totems posés !",
	warndruid	= "Druides - Coincés en forme de félin !",
	warnwarlock	= "Démonistes - Arrivée d'infernaux !",
	warnpriest	= "Prêtre - Soins blessants !",
	warnhunter	= "Chasseurs - Arcs/Fusils cassés !",
	warnwarrior	= "Guerriers - Coincés en posture berseker !",
	warnrogue	= "Voleurs - Téléportés et immobilisés !",
	warnpaladin	= "Paladins - Bénédiction de protection !",
	warnmage	= "Mages - Arrivée des métamorphoses !",

	classcall_bar = "Appel des classes",
	fear_bar = "Peur probable",

	shadowflame = "Flamme d'ombre",
	shadowflame_desc = "Préviens de l'arrivée de la Flamme d'ombre.",

	fear = "Peur",
	fear_desc = "Préviens quand Nefarian incante sa peur de zone.",

	classcall = "Appel de classe",
	classcall_desc = "Préviens de l'arrivée des appels de classe.",

	otherwarn = "Atterissage et zerg",
	otherwarn_desc = "Préviens quand les Zergs arrivent et quand Nefarian atterit.",
} end)

----------------------------------
--      Module Declaration      --
----------------------------------

local mod = BigWigs:NewModule(boss)
mod.zonename = BZ["Blackwing Lair"]
mod.enabletrigger = {boss, victor}
mod.toggleOptions = {"shadowflame", "fear", "classcall", "otherwarn", "bosskill"}
mod.revision = tonumber(("$Revision: 229 $"):sub(12, -3))

------------------------------
--      Initialization      --
------------------------------

function mod:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:AddCombatListener("SPELL_CAST_START", "Fear", 22686)
	self:AddCombatListener("SPELL_CAST_START", "Flame", 22539)
	self:AddCombatListener("UNIT_DIED", "GenericBossDeath")

	warnpairs = {
		[L["triggershamans"]] = {L["warnshaman"], true},
		[L["triggerdruid"]] = {L["warndruid"], true},
		[L["triggerwarlock"]] = {L["warnwarlock"], true},
		[L["triggerpriest"]] = {L["warnpriest"], true},
		[L["triggerhunter"]] = {L["warnhunter"], true},
		[L["triggerwarrior"]] = {L["warnwarrior"], true},
		[L["triggerrogue"]] = {L["warnrogue"], true},
		[L["triggerpaladin"]] = {L["warnpaladin"], true},
		[L["triggermage"]] = {L["warnmage"], true},
		[L["triggerdeathknight"]] = {L["warndeathknight"], true},
		[L["landing_soon_trigger"]] = {L["landing_soon_warning"]},
		[L["landing_trigger"]] = {L["landing_warning"]},
		[L["zerg_trigger"]] = {L["zerg_warning"]},
	}
end

------------------------------
--      Event Handlers      --
------------------------------

function mod:Fear(_, spellID)
	if not self.db.profile.fear then return end

	self:CancelScheduledEvent("bwneffearsoon")
	self:IfMessage(L["fear_warning"], "Positive", spellID)
	self:ScheduleEvent("bwneffearsoon", "BigWigs_Message", 26, L["fear_soon_warning"], "Important")
	self:Bar(L["fear_bar"], 32, spellID)
end

function mod:Flame()
	if self.db.profile.shadowflame then
		self:IfMessage(L["shadowflame_warning"], "Important", 22539)
	end
end

function mod:CHAT_MSG_MONSTER_YELL(msg)
	if msg:find(L["landing_soon_trigger"]) then
		self:Bar(L["landing_warning"], 10, "INV_Misc_Head_Dragon_Black")
		return
	end
	for i,v in pairs(warnpairs) do
		if msg:find(i) then
			if v[2] then
				if self.db.profile.classcall then
					self:Message(v[1], "Important")
					self:DelayedMessage(27, L["classcall_warning"], "Important")
					self:Bar(L["classcall_bar"], 30, "Spell_Shadow_Charm")
				end
			else
				if self.db.profile.otherwarn then self:Message(v[1], "Important") end
			end
			return
		end
	end
end

