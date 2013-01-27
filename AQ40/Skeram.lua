------------------------------
--      Are you local?      --
------------------------------

local boss = BB["The Prophet Skeram"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Skeram",

	ae = "Arcane Explosion",
	ae_desc = "Warn for Arcane Explosion.",
	aewarn = "Casting Arcane Explosion!",

	split = "Split",
	split_desc = "Warn before Create Image.",
	splitwarn = "Splitting!",

	mc = "Mind Control",
	mc_desc = "Warn for Mind Control.",
	mcplayerwarn = "%s is mindcontrolled!",
	mcbar = "MC: %s",

	icon = "Place Icon",
	icon_desc = "Place a skull icon on the mind controlled person. (requires promoted or higher)",
} end )

L:RegisterTranslations("frFR", function() return {
	ae = "Explosion des arcanes",
	ae_desc = "Préviens quand Skeram lance Explosion des arcanes.",
	aewarn = "Incantation d'Explosion des arcanes !",

	split = "Division",
	split_desc = "Préviens quans Skeram se divise.",
	splitwarn = "Division !",

	mc = "Contrôle mental",
	mc_desc = "Préviens quand un joueur subit les effets du Contrôle mental.",
	mcplayerwarn = "%s est sous controle mental !",
	mcbar = "CM : %s",

	icon = "Icône",
	icon_desc = "Place une icône de raid sur le dernier joueur affecté par le Contrôle mental (nécessite d'être promu ou mieux).",
} end )

L:RegisterTranslations("deDE", function() return {
	ae = "Arkane Explosion",
	ae_desc = "Warnung vor Arkaner Explosion.",
	aewarn = "Arkane Explosion!",

	split = "Abbilder",
	split_desc = "Warnung, wenn die Abbilder von Prophet Skeram erscheinen.",
	splitwarn = "Abbilder!",

	mc = "Gedankenkontrolle",
	mc_desc = "Warnung, wenn jemand unter Gedankenkontrolle steht.",
	mcplayerwarn = "%s steht unter Gedankenkontrolle!",
	--mcbar = "MC: %s",

	icon = "Symbol",
	icon_desc = "Platziert ein Symbol \195\188ber dem Spieler, der unter Gedankenkontrolle steht. (Ben\195\182tigt Anf\195\188hrer oder Bef\195\182rdert Status.)",
} end )

L:RegisterTranslations("zhCN", function() return {
	ae = "魔爆术警报",
	ae_desc = "魔爆术警报",
	aewarn = "正在施放魔爆术 - 迅速打断！",

	split = "分裂警报",
	split_desc = "预言者斯克拉姆即将召唤幻象时发出警报",
	splitwarn = "即将分裂！",

	mc = "精神控制警报",
	mc_desc = "精神控制警报",
	mcplayerwarn = "精神控制：>%s<！",
	mcbar = "精神控制: %s",

	icon = "设置标记",
	icon_desc = "为受到精神控制的队友标上团队标记(需要团长L或助理A权限)",
} end )

L:RegisterTranslations("zhTW", function() return {
	ae = "魔爆術警報",
	ae_desc = "預言者斯克拉姆施放魔爆術時發出警報",
	aewarn = "施放魔爆術 - 迅速打斷！",

	split = "幻影分身警報",
	split_desc = "預言者斯克拉姆施放幻影分身時發出警報",
	splitwarn = "即將分裂！",

	mc = "精神控制警報",
	mc_desc = "預言者斯克拉姆進行精神控制時發出警報",
	mcplayerwarn = "%s 被心靈控制，法師快變羊！",
	mcbar = "MC: %s",

	icon = "標記被精神控制的隊友",
	icon_desc = "在被精神控制的隊友頭上設置標記 (需要助手或領隊權限)",
} end )

L:RegisterTranslations("koKR", function() return {
	ae = "신비한 폭발 경고",
	ae_desc = "신비한 폭발에 대한 경고",
	aewarn = "신비한 폭발 시전 - 시전 방해!",

	split = "분리 경고",
	split_desc = "이미지 생성 전 경고",
	splitwarn = "곧 분리 됩니다.!! 경고!!",

	mc = "정신 지배 경고",
	mc_desc = "정신 지배에 대한 경고",
	mcplayerwarn = "%s 님이 정신지배되었습니다. 양변! 공포!",
	mcbar = "예언: %s",

	icon = "아이콘 지정",
	icon_desc = "정신 지배된 사람에게 해골 아이콘 지정 (승급자 이상 필요)",
} end )

L:RegisterTranslations("ruRU", function() return {
	ae = "AoE арканый взрыв!",
	ae_desc = "Предупреждать о АоЕ взрыве.",
	aewarn = "Кастует АоЕ взрыв!",

	split = "Раскол",
	split_desc = "Сообщать о появлении клонов Скерамa.",
	splitwarn = "Раскол!",

	mc = "Контроль разума",
	mc_desc = "Сообщать о контроле разума.",
	mcplayerwarn = "Скерам контролирует разум %s !!",
	mcbar = "КР: %s",

	icon = "Помечать рейдовой иконкой",
	icon_desc = "Метить рейдовой иконкой игрока, разумом которого завладел Скерам! (Необходимо быть лидером группы)",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

local mod = BigWigs:NewModule(boss)
mod.zonename = BZ["Ahn'Qiraj"]
mod.enabletrigger = boss
mod.toggleOptions = {"ae", "split", -1, "mc", "icon", "bosskill"}
mod.revision = tonumber(("$Revision: 330 $"):sub(12, -3))

------------------------------
--      Initialization      --
------------------------------

function mod:OnEnable()
	self:AddCombatListener("SPELL_AURA_APPLIED", "MC", 785)
	self:AddCombatListener("SPELL_CAST_START", "AE", 26192)
	self:AddCombatListener("SPELL_CAST_SUCCESS", "Image", 747)
	self:AddCombatListener("UNIT_DIED", "GenericBossDeath")
end

------------------------------
--      Event Handlers      --
------------------------------

function mod:MC(player, spellID)
	if self.db.profile.mc then
		self:IfMessage(L["mcplayerwarn"]:format(player), "Attention", spellID)
		self:Bar(L["mcbar"]:format(player), 20, spellID)
		self:Icon(player, "icon")
	end
end

function mod:AE(_, spellID)
	if self.db.profile.ae then
		self:IfMessage(L["aewarn"], "Urgent", spellID)
	end
end

function mod:Image(_, spellID)
	if self.db.profile.split then
		self:IfMessage(L["splitwarn"], "Important", spellID)
	end
end

