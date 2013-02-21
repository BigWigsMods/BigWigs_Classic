--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Nefarian", 755)
if not mod then return end
mod:RegisterEnableMob(11583, 10162) -- Nefarian, Lord Victor Nefarius
mod.toggleOptions = {23339, 22539, {23340, "ICON"}, "bosskill"}

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "WingBuffet", 23339)
	self:Log("SPELL_CAST_START", "ShadowFlame", 22539)
	self:Log("SPELL_AURA_APPLIED", "Curse", 23340)
	self:Log("SPELL_AURA_REMOVED", "CurseRemoved", 23340)

	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	self:Death("Win", 11583)
end

function mod:OnEngage()
	self:Bar(23339, 29) -- Wing Buffet
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:WingBuffet(args)
	self:Message(args.spellId, "Important")
	self:DelayedMessage(args.spellId, 27, "Urgent", CL.custom_sec:format(args.spellName, 5))
	self:Bar(args.spellId, 32)
end

function mod:ShadowFlame(args)
	self:Message(args.spellId, "Important")
end

function mod:Curse(args)
	self:TargetMessage(args.spellId, args.destName, "Attention")
	self:TargetBar(args.spellId, 8, args.destName)
	self:PrimaryIcon(args.spellId, args.destName)
end

function mod:CurseRemoved(args)
	self:StopBar(args.spellId, args.destName)
	self:PrimaryIcon(args.spellId)
end



------------------------------
--      Are you local?      --
------------------------------

local boss = BB[""]
local victor = BB["Lord Victor Nefarius"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

local warnpairs = nil

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Nefarian",

	L.landing_soon_trigger = "Well done, my minions"
	L.landing_trigger = "BURN! You wretches"
	L.zerg_trigger = "Impossible! Rise my"

	L.triggershamans = "Shamans, show me"
	L.triggerdruid = "Druids and your silly"
	L.triggerwarlock = "Warlocks, you shouldn't be playing"
	L.triggerpriest = "Priests! If you're going to keep"
	L.triggerhunter = "Hunters and your annoying"
	L.triggerwarrior = "Warriors, I know you can hit harder"
	L.triggerrogue = "Rogues%? Stop hiding"
	L.triggerpaladin = "Paladins"
	L.triggermage = "Mages too%?"
	L.triggerdeathknight = "Deathknight "
	L.triggermonk = "Monks,"

	L.landing_soon_warning = "Nefarian landing in 10 seconds!"
	L.landing_warning = "Nefarian is landing!"
	L.zerg_warning = "Zerg incoming!"
	L.fear_warning = "Fear in 2 sec!"
	L.fear_soon_warning = "Possible fear in ~5 sec"
	L.shadowflame_warning = "Shadow Flame incoming!"
	L.classcall_warning = "Class call incoming!"

	L.warnshaman = "Shamans - Totems spawned!"
	L.warndruid = "Druids - Stuck in cat form!"
	L.warnwarlock = "Warlocks - Incoming Infernals!"
	L.warnpriest = "Priests - Heals hurt!"
	L.warnhunter = "Hunters - Bows/Guns broken!"
	L.warnwarrior = "Warriors - Stuck in berserking stance!"
	L.warnrogue = "Rogues - Ported and rooted!"
	L.warnpaladin = "Paladins - Blessing of Protection!"
	L.warnmage = "Mages - Incoming polymorphs!"
	L.warndeathknight = "Deathknight - "

	L.classcall_bar = "Class call"
	L.fear_bar = "Possible fear"

	L.shadowflame = "Shadow Flame"
	L.shadowflame_desc = "Warn for Shadow Flame."

	L.fear = "Fear"
	L.fear_desc = "Warn when Nefarian casts AoE Fear."

	L.classcall = "Class Call"
	L.classcall_desc = "Warn for Class Calls."

	L.otherwarn = "Landing and Zerg"
	L.otherwarn_desc = "Landing and Zerg warnings."
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

