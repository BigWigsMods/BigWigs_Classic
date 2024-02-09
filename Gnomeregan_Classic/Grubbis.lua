--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Grubbis Discovery", 90, -2925)
if not mod then return end
mod:RegisterEnableMob(217969, 217280, 217956) -- Blastmaster Emi Shortfuse, Grubbis, Chomper
mod:SetEncounterID(2925)
mod:SetStage(1)

--------------------------------------------------------------------------------
-- Locals
--

local quakeCount = 0

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bossName = "Grubbis"
	L.aoe = "AoE melee damage"
	L.cloud = "A cloud reached the boss"
	L.cone = "\"Frontal\" cone" -- "Frontal" Cone, it's a rear cone (he's farting)
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"stages",
		"adds",
		3019, -- Enrage
		436100, -- Petrify
		436074, -- Trogg Rage
		436027, -- Grubbis Mad!
		434941, -- Toxic Vigor
		436059, -- Radiation?
	},{
		[3019] = CL.adds,
		[436074] = L.bossName,
	},{
		[436027] = L.aoe, -- Grubbis Mad! (AoE melee damage)
		[434941] = L.cloud, -- Toxic Vigor (A cloud reached the boss)
		[436059] = L.cone, -- Radiation? ("Frontal" Cone)
	}
end

function mod:OnRegister()
	self.displayName = L.bossName
end

function mod:OnBossEnable()
	self:Log("SPELL_DISPEL", "Dispelled", "*")
	self:Log("SPELL_AURA_APPLIED", "EnrageApplied", 3019)
	self:Log("SPELL_CAST_START", "Petrify", 436100)
	self:Log("SPELL_INTERRUPT", "PetrifyInterrupted", "*")
	self:Log("SPELL_AURA_APPLIED", "PetrifyApplied", 436100)
	self:Log("SPELL_AURA_REMOVED", "PetrifyRemoved", 436100)
	self:Log("SPELL_CAST_START", "TroggRage", 436074)
	self:Log("SPELL_AURA_APPLIED", "TroggRageApplied", 436074)
	self:Log("SPELL_AURA_REMOVED", "TroggRageRemoved", 436074)
	self:Log("SPELL_CAST_START", "GrubbisMad", 436027)
	self:Log("SPELL_AURA_APPLIED", "GrubbisMadChannel", 436027)
	self:Log("SPELL_AURA_REMOVED", "GrubbisMadChannelOver", 436027)
	self:Log("SPELL_AURA_APPLIED", "ToxicVigorApplied", 434941)
	self:Log("SPELL_CAST_START", "RadiationStart", 436059)
	self:Log("SPELL_CAST_SUCCESS", "Radiation", 436059)
	self:Log("SPELL_CAST_SUCCESS", "Adds", 435361, 435362, 435363)
	self:Log("SPELL_CAST_SUCCESS", "Troggquake", 436168)
end

function mod:OnEngage()
	quakeCount = 0
	self:SetStage(1)
	self:Message("stages", "cyan", CL.stage:format(1), false)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Dispelled(args)
	if args.extraSpellName == self:SpellName(3019) then
		self:Message(3019, "green", CL.removed_by:format(args.extraSpellName, self:ColorName(args.sourceName)))
	elseif args.extraSpellName == self:SpellName(436074) then
		self:Message(436074, "green", CL.removed_by:format(args.extraSpellName, self:ColorName(args.sourceName)))
	end
end

function mod:EnrageApplied(args)
	self:Message(args.spellId, "red", CL.buff_other:format(args.destName, args.spellName))
end

function mod:Petrify(args)
	self:Message(args.spellId, "orange", CL.casting:format(args.spellName))
	self:CDBar(args.spellId, 21)
	if self:Interrupter() then
		self:PlaySound(args.spellId, "alert")
	end
end

function mod:PetrifyInterrupted(args)
	if args.extraSpellName == self:SpellName(425265) then
		self:Message(436100, "green", CL.interrupted_by:format(args.extraSpellName, self:ColorName(args.sourceName)))
	end
end

function mod:PetrifyApplied(args)
	self:TargetMessage(args.spellId, "yellow", args.destName)
	self:TargetBar(args.spellId, 8, args.destName, CL.bomb)
	self:PlaySound(args.spellId, "alert")
end

function mod:PetrifyRemoved(args)
	self:StopBar(args.spellName, args.destName)
end

function mod:TroggRage(args)
	self:Message(args.spellId, "red", CL.incoming:format(args.spellName))
end

function mod:TroggRageApplied(args)
	self:Message(args.spellId, "red", CL.buff_other:format(args.destName, args.spellName))
	self:TargetBar(args.spellId, 10, args.destName)
	self:CDBar(args.spellId, 22)
	self:PlaySound(args.spellId, "alarm")
end

function mod:TroggRageRemoved(args)
	self:StopBar(args.spellName, args.destName)
end

function mod:GrubbisMad(args)
	self:StopBar(L.aoe)
	self:Message(args.spellId, "yellow", CL.incoming:format(L.aoe))
	self:PlaySound(args.spellId, "long")
end

function mod:GrubbisMadChannel(args)
	self:CastBar(args.spellId, 5, L.aoe)
end

function mod:GrubbisMadChannelOver(args)
	self:CDBar(args.spellId, 19.5, L.aoe)
end

function mod:ToxicVigorApplied(args)
	self:Message(args.spellId, "orange", CL.other:format(args.spellName, L.cloud))
	self:Bar(args.spellId, 30)
	self:PlaySound(args.spellId, "info")
end

function mod:RadiationStart(args)
	self:Message(args.spellId, "yellow", CL.incoming:format(L.cone))
	self:PlaySound(args.spellId, "long")
end

function mod:Radiation(args)
	self:CastBar(args.spellId, 3, L.cone)
end

function mod:Adds(args)
	self:Message("adds", "cyan", CL.adds_spawned, false)
	self:PlaySound("adds", "info")
end

function mod:Troggquake(args)
	quakeCount = quakeCount + 1
	if quakeCount == 2 then
		self:SetStage(2)
		self:Message("stages", "cyan", CL.stage:format(2), false)
		self:PlaySound("stages", "info")
	end
end
