------------------------------
--      Are you local?      --
------------------------------

local boss = BB["Fankriss the Unyielding"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)
local worms = 0

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Fankriss",
	worm = "Worm Alert",
	worm_desc = "Warn for Incoming Worms",

	wormtrigger = "Fankriss the Unyielding casts Summon Worm.",
	wormwarn = "Incoming Worm! (%d)",
	wormbar = "Sandworm Enrage (%d)",
} end )

L:RegisterTranslations("deDE", function() return {
	worm = "Wurm beschw\195\182ren",
	worm_desc = "Warnung, wenn Fankriss einen Wurm beschw\195\182rt.",

	wormtrigger = "Fankriss der Unnachgiebige wirkt Wurm beschw\195\182ren.",
	wormwarn = "Wurm wurde beschworen! (%d)",
	wormbar = "Wurm ist w\195\188tend (%d)",
} end )

L:RegisterTranslations("zhCN", function() return {
	worm = "虫子警报",
	worm_desc = "召唤范克瑞斯的爪牙出现时发出警报",
	
	wormtrigger = "顽强的范克瑞斯施放了召唤虫子。",
	wormwarn = "范克瑞斯的爪牙出现 - 快速杀掉！(%d)",
	wormbar = "范克瑞斯的爪牙激怒(%d)",
} end )

L:RegisterTranslations("zhTW", function() return {
	worm = "蟲子警報",
	worm_desc = "范克里斯召喚蟲子時發出警報",

	wormtrigger = "頑強的范克里斯施放了召喚蟲子。",
	wormwarn = "精英蟲子出現！注意！(%d)",
	wormbar = "精英蟲子激怒 (%d)",
} end )

L:RegisterTranslations("koKR", function() return {
	worm = "벌레 경고",
	worm_desc = "벌레에 대한 경고",

	wormtrigger = "불굴의 판크리스|1이;가; 벌레 소환|1을;를; 시전합니다.",
	wormwarn = "벌레 소환 - 제거! (%d)",
	wormbar = "소환! (%d)",
} end )

L:RegisterTranslations("frFR", function() return {
	worm = "Ver",
	worm_desc = "Préviens quand Fankriss invoque un ver.",

	wormtrigger = "Fankriss l'Inflexible lance Invocation d'un ver.",
	wormwarn = "Ver invoqué ! (%d)",
	wormbar = "Ver enragé (%d)",
} end )

L:RegisterTranslations("ruRU", function() return {
	worm = "Угроза червей",
	worm_desc = "Сообщать о появлении червей",

	wormtrigger = "Фанкрисс призывает червей.",
	wormwarn = "Появляется червь! (%d)",
	wormbar = "Песчанный червь впадает в бешенство (%d)",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

local mod = BigWigs:NewModule(boss)
mod.zonename = BZ["Ahn'Qiraj"]
mod.enabletrigger = boss
mod.toggleOptions = {"worm", "bosskill"}
mod.revision = tonumber(string.sub("$Revision: 328 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function mod:OnEnable()
	worms = 0
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF")
	self:AddCombatListener("UNIT_DIED", "GenericBossDeath")

	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "FankrissWormSpawn", .1)
end

------------------------------
--      Event Handlers      --
------------------------------

function mod:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF(msg)
	if msg == L["wormtrigger"] then
		self:Sync("FankrissWormSpawn "..tostring(worms + 1) )
	end
end

function mod:BigWigs_RecvSync(sync, rest)
	if sync ~= "FankrissWormSpawn" then return end
	if not rest then return end
	rest = tonumber(rest)
	if rest == (worms + 1) then
		-- we accept this worm
		-- Yes, this could go completely wrong when you don't reset your module and the whole raid does after a wipe
		-- or you reset your module and the rest doesn't. Anyway. it'll work a lot better than anything else.
		worms = worms + 1
		if self.db.profile.worm then
			self:Message(string.format(L["wormwarn"], worms), "Urgent")
			self:Bar(string.format(L["wormbar"], worms), 20, "Spell_Shadow_UnholyFrenzy")
		end	
	end
end
