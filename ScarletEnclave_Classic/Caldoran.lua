--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Grand Crusader Caldoran", 2856)
if not mod then return end
mod:RegisterEnableMob(241006)
mod:SetEncounterID(3189)
mod:SetRespawnTime(12)
mod:SetAllowWin(true)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bossName = "Grand Crusader Caldoran"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"stages",
		{1229714, "EMPHASIZE", "CASTBAR", "CASTBAR_COUNTDOWN"}, -- Blinding Flare
		1229114, -- Devoted Offering
		{1229272, "SAY", "SAY_COUNTDOWN", "ME_ONLY_EMPHASIZE"}, -- Divine Conflagration
		1229503, -- Execution Sentence
		1231027, -- Darkgraven Blade
		"berserk",
	},nil,{
		[1229714] = CL.blind, -- Blinding Flare (Blind)
		[1231027] = CL.you_die, -- Darkgraven Blade (You die)
	}
end

function mod:OnRegister()
	self.displayName = L.bossName
	self:SetSpellRename(1229714, CL.blind) -- Blinding Flare (Blind)
	--self:SetSpellRename(1231027, CL.you_die) -- Darkgraven Blade (You die)
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "BlindingFlare", 1229714)
	self:Log("SPELL_CAST_START", "DevotedOffering", 1229114)
	self:Log("SPELL_AURA_APPLIED", "DivineConflagrationApplied", 1229272)
	self:Log("SPELL_AURA_REMOVED", "DivineConflagrationRemoved", 1229272)
	self:Log("SPELL_AURA_APPLIED", "ExecutionSentenceApplied", 1229503)
	self:Log("SPELL_CAST_SUCCESS", "ConjurePortal", 1230333)
	self:Log("SPELL_CAST_START", "DarkgravenBlade", 1231027)
end

function mod:OnEngage()
	self:Message("stages", "cyan", CL.stage:format(1), false)
	self:CDBar(1229714, 27) -- Blinding Flare
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:BlindingFlare(args)
	self:Message(args.spellId, "red", CL.blind)
	self:CastBar(args.spellId, 3)
	self:CDBar(args.spellId, 29.1)
	self:PlaySound(args.spellId, "warning")
end

do
	local prev = 0
	function mod:DevotedOffering(args)
		if args.time - prev > 2 then
			prev = args.time
			self:Message(args.spellId, "yellow")
			self:PlaySound(args.spellId, "long")
		end
	end
end

function mod:DivineConflagrationApplied(args)
	self:TargetMessage(args.spellId, "orange", args.destName)
	if self:Me(args.destGUID) then
		self:Say(args.spellId, nil, nil, "Divine Conflagration")
		self:SayCountdown(args.spellId, 5)
		self:PlaySound(args.spellId, "alarm", nil, args.destName)
	end
end

function mod:DivineConflagrationRemoved(args)
	if self:Me(args.destGUID) then
		self:CancelSayCountdown(args.spellId)
	end
end

function mod:ExecutionSentenceApplied(args)
	self:TargetMessage(args.spellId, "purple", args.destName)
	self:PlaySound(args.spellId, "info")
end

function mod:ConjurePortal()
	self:StopBar(1229714) -- Blinding Flare
	self:Berserk(330, true) -- XXX FIXME, starts in stage 2 but we need a better event than this
end

function mod:DarkgravenBlade(args)
	self:Message(args.spellId, "yellow", CL.you_die_sec:format(60))
	self:Bar(args.spellId, 60, CL.you_die)
	self:PlaySound(args.spellId, "long")
end
