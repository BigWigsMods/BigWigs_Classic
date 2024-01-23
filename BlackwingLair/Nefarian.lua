--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Nefarian Classic", 469, 1536)
if not mod then return end
mod:RegisterEnableMob(11583, 10162) -- Nefarian, Lord Victor Nefarius
mod:SetEncounterID(617)
mod:SetRespawnTime(900)

--------------------------------------------------------------------------------
-- Locals
--

local classCallYellTable = {}
local classCallSpellTable = {}
local adds_dead = 0

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale()
if L then
	L.engage_yell_trigger = "Let the games begin"
	L.landing_soon_trigger = "Well done, my minions"
	L.stage2_yell_trigger = "BURN! You wretches"
	L.stage3_yell_trigger = "Impossible! Rise my"

	L.shaman_class_call_yell_trigger = "Shamans"
	L.deathknight_class_call_yell_trigger = "Death Knights" -- Death Knights... get over here!
	L.monk_class_call_yell_trigger = "Monks"

	L.warnshaman = "Shamans - Totems spawned!"
	L.warndruid = "Druids - Stuck in cat form!"
	L.warnwarlock = "Warlocks - Incoming Infernals!"
	L.warnpriest = "Priests - Heals hurt!"
	L.warnhunter = "Hunters - Bows/Guns broken!"
	L.warnwarrior = "Warriors - Stuck in berserking stance!"
	L.warnrogue = "Rogues - Ported and rooted!"
	L.warnpaladin = "Paladins - Blessing of Protection!"
	L.warnmage = "Mages - Incoming polymorphs!"
	L.warndeathknight = "Death Knights - Death Grip"
	L.warnmonk = "Monks - Stuck Rolling"
	L.warndemonhunter = "Demon Hunters - Blinded"

	L["22686_icon"] = "spell_shadow_psychicscream"

	L.classcall = "Class Call"
	L.classcall_desc = "Warn for Class Calls."

	L.add = "Drakonid deaths"
	L.add_desc = "Announce the number of adds killed in Phase 1 before Nefarian lands."
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"stages",
		{22539, "CASTBAR"}, -- Shadow Flame
		{22686, "CASTBAR"}, -- Bellowing Roar
		22687, -- Veil of Shadow
		"classcall",
		"add"
	},nil,{
		[22686] = CL.fear, -- Bellowing Roar (Fear)
		[22687] = CL.curse, -- Veil of Shadow (Curse)
	}
end

function mod:VerifyEnable(unit, mobId)
	if mobId == 11583 then -- Nefarian
		return true
	elseif mobId == 10162 then -- Lord Victor Nefarius, prevent enabling at Vael
		return UnitReaction("player", unit) == 5
	end
end

function mod:OnRegister()
	classCallYellTable = {
		[L.shaman_class_call_yell_trigger] = L.warnshaman,
		[L.deathknight_class_call_yell_trigger] = L.warndeathknight,
		[L.monk_class_call_yell_trigger] = L.warnmonk,
	}
	classCallSpellTable = {
		[23414] = L.warnrogue,
		[23398] = L.warndruid,
		[350567] = L.warndruid,
		[23397] = L.warnwarrior,
		[23401] = L.warnpriest,
		[23410] = L.warnmage,
		[23418] = L.warnpaladin,
		[23427] = L.warnwarlock,
		[204813] = L.warndemonhunter,
		[23436] = L.warnhunter,
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "BellowingRoar", 22686)
	self:Log("SPELL_CAST_START", "ShadowFlame", 22539)
	self:Log("SPELL_AURA_APPLIED", "VeilOfShadow", 22687)

	-- Rogue, Druid, Druid (Retail WoW), Warrior, Priest, Mage, Paladin, Warlock, Demon Hunter
	self:Log("SPELL_AURA_APPLIED", "ClassCall", 23414, 23398, 350567, 23397, 23401, 23410, 23418, 23427, 204813)
	self:Log("SPELL_DURABILITY_DAMAGE", "ClassCall", 23436) -- Hunter

	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")

	self:Death("AddDied", 14261, 14262, 14263, 14264, 14265, 14302) -- Blue, Green, Bronze, Red, Black, Chromatic

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:Death("Win", 11583)
end

function mod:OnEngage()
	adds_dead = 0
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:BellowingRoar(args)
	self:CDBar(args.spellId, 32, CL.fear, L["22686_icon"])
	self:Message(args.spellId, "red", CL.incoming:format(CL.fear), L["22686_icon"])
	self:CastBar(args.spellId, 1.5, CL.fear, L["22686_icon"])
	self:PlaySound(args.spellId, "alert")
end

function mod:ShadowFlame(args)
	if self:MobId(args.sourceGUID) == 11583 then -- Shared with Ebonroc/Firemaw/Flamegor
		self:Message(args.spellId, "yellow")
		self:CastBar(args.spellId, 2)
		self:PlaySound(args.spellId, "alarm")
	end
end

function mod:VeilOfShadow(args)
	self:TargetMessage(args.spellId, "yellow", args.destName, CL.curse)
	if self:Dispeller("curse") then
		self:PlaySound(args.spellId, "warning")
	end
end

do
	local prev = 0
	function mod:ClassCall(args)
		if args.time-prev > 2 then
			prev = args.time
			self:CDBar("classcall", 30, L.classcall, "Spell_Shadow_Charm")
			self:Message("classcall", "orange", classCallSpellTable[args.spellId], "Spell_Shadow_Charm")
		end
	end
end

function mod:CHAT_MSG_MONSTER_YELL(_, msg)
	if msg:find(L.engage_yell_trigger, nil, true) then
		self:Engage()
	elseif msg:find(L.landing_soon_trigger, nil, true) then
		self:Message("stages", "cyan", CL.custom_sec:format(CL.stage:format(2), 10), "INV_Misc_Head_Dragon_Black")
		self:Bar("stages", 10, CL.stage:format(2), "INV_Misc_Head_Dragon_Black")
		self:PlaySound("stages", "long")
	elseif msg:find(L.stage2_yell_trigger, nil, true) then
		self:Message("stages", "cyan", CL.stage:format(2), false)
		self:PlaySound("stages", "info")
	elseif msg:find(L.stage3_yell_trigger, nil, true) then
		self:Message("stages", "cyan", CL.percent:format(20, CL.stage:format(3)), false)
		self:PlaySound("stages", "long")
	else
		for yellTrigger, bwMessage in next, classCallYellTable do
			if msg:find(yellTrigger, nil, true) then
				self:CDBar("classcall", 30, L.classcall, "Spell_Shadow_Charm")
				self:Message("classcall", "orange", bwMessage, "Spell_Shadow_Charm")
				return
			end
		end
	end
end

function mod:AddDied()
	adds_dead = adds_dead + 1
	self:Message("add", "green", CL.add_killed:format(adds_dead, 42), "INV_Misc_Head_Dragon_Black")
end
