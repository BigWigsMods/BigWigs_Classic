------------------------------
--      Are you local?      --
------------------------------

local boss = BB["Buru the Gorger"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Buru",

	you = "You're being watched",
	you_desc = "Warn when you're being watched.",

	other = "Others being watched",
	other_desc = "Warn when others are being watched.",

	icon = "Place icon",
	icon_desc = "Place raid icon on watched person. (requires promoted or higher)",

	watchwarn = "%s is being watched!",
	watchwarnyou = "You are being watched!",
} end )

L:RegisterTranslations("frFR", function() return {
	you = "Focalisation sur vous",
	you_desc = "Préviens quand Buru se focalise sur vous.",

	other = "Focalisation sur les autres",
	other_desc = "Préviens quand Buru se focalise sur un autre joueur.",

	icon = "Icône",
	icon_desc = "Place une icône de raid sur le dernier joueur focalisé (nécessite d'être promu ou mieux).",

	watchwarn = "Focalisation sur %s !",
	watchwarnyou = "Focalisation sur VOUS !",
} end )

L:RegisterTranslations("deDE", function() return {
	you = "Du wirst beobachtet",
	you_desc = "Warnung, wenn Du beobachtet wirst.",

	other = "X wird beobachtet",
	other_desc = "Warnung, wenn andere Spieler beobachtet werden.",

	icon = "Symbol",
	icon_desc = "Platziert ein Symbol \195\188ber dem Spieler, der beobachtet wird. (Ben\195\182tigt Anf\195\188hrer oder Bef\195\182rdert Status.)",

	watchwarn = "%s wird beobachtet!",
	watchwarnyou = "Du wirst beobachtet!",
} end )

L:RegisterTranslations("zhCN", function() return {
	you = "凝视警报",
	you_desc = "当你被凝视时发出警报",

	other = "队友凝视警报",
	other_desc = "当队友被凝视时发出警报",

	icon = "设置标记",
	icon_desc = "在被凝视的队友头上标记团队图标（需要助理或领袖权限）",

	watchwarn = "%s 被布鲁盯上了！",
	watchwarnyou = "你被布鲁盯上了！放风筝吧！",
} end )

L:RegisterTranslations("zhTW", function() return {
	you = "玩家凝視警報",
	you_desc = "當你被吞咽者布魯盯住時發出警報。",

	other = "隊友凝視警報",
	other_desc = "當隊友被吞咽者布魯盯住時發出警報。",

	icon = "標記圖標",
	icon_desc = "在被凝視的隊友頭上標記（需要助理或領隊權限）",

	watchwarn = "%s被盯上了！往下一個蛋移動！",
	watchwarnyou = "你被盯上了！往下一個蛋移動！",
} end )

L:RegisterTranslations("koKR", function() return {
	you = "당신을 노려봄 경고",
	you_desc = "당신을 노려볼 때 경고",

	other = "타인을 노려봄 경고",
	other_desc = "타인을 노려볼 때 경고",

	icon = "아이콘 지정",
	icon_desc = "노려보는 사람에게 레이드 아이콘 지정(승급자 이상 요구)",

	watchwarn = "%s님을 노려봅니다!",
	watchwarnyou = "당신을 주시합니다!",
} end )

L:RegisterTranslations("ruRU", function() return {
	you = "На вас смотрит босс",
	you_desc = "Предупреждать когда вас преследуют.",

	other = "За игроками вашего рейда наблюдают",
	other_desc = "Предупреждать о том, что за игроками рейда гонится босс.",

	icon = "Помечать рейдовой иконкой",
	icon_desc = "Отмечать рейдовой иконкой наблюдаемых игроков (Необходимо быть лидером группы или рейда)",

	watchwarn = "%s преследует босс! Бегите!!!",
	watchwarnyou = "Буру вас преследует! Бегите!!!",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

local mod = BigWigs:NewModule(boss)
mod.zonename = BZ["Ruins of Ahn'Qiraj"]
mod.enabletrigger = boss
mod.toggleOptions = {"you", "other", "icon", "bosskill"}
mod.revision = tonumber(("$Revision: 150 $"):sub(12, -3))

------------------------------
--      Initialization      --
------------------------------

function mod:OnEnable()
	self:AddCombatListener("UNIT_DIED", "GenericBossDeath")
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
end

------------------------------
--      Event Handlers      --
------------------------------

function mod:CHAT_MSG_MONSTER_EMOTE(_, unit, _, _, player)
	if unit == boss then
		--19557 Improved Eyes of the Best, suitable icon
		if UnitIsUnit(player, "player") and self.db.profile.you then
			self:LocalMessage(L["watchwarnyou"], "Personal", 19557)
			self:WideMessage(L["watchwarn"]:format(player))
		elseif self.db.profile.other then
			self:IfMessage(L["watchwarn"]:format(player), "Attention", 19557)
			self:Whisper(player, L["watchwarnyou"])
		end
		self:Icon(player, "icon")
	end
end

