--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Grand Crusader Caldoran", 2856)
if not mod then return end
mod:RegisterEnableMob(241006)
mod:SetEncounterID(3189)
mod:SetRespawnTime(12)
mod:SetAllowWin(true)
mod:SetStage(1)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bossName = "Grand Crusader Caldoran"
	L.run = "Run to the door"
	L.run_desc = "Show a message after stage 2 ends reminding you to run to the door."
	L.run_icon = "ability_rogue_sprint"
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
		{1229503, "CASTBAR"}, -- Execution Sentence
		1231027, -- Darkgraven Blade
		{"run", "EMPHASIZE", "COUNTDOWN"},
		"berserk",
	},nil,{
		[1229714] = CL.blind, -- Blinding Flare (Blind)
		[1229503] = CL.tank_debuff, -- Execution Sentence (Tank Debuff)
		[1231027] = CL.you_die, -- Darkgraven Blade (You die)
	}
end

function mod:OnRegister()
	self.displayName = L.bossName
	self:SetSpellRename(1229714, CL.blind) -- Blinding Flare (Blind)
	self:SetSpellRename(1231027, CL.you_die) -- Darkgraven Blade (You die)
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "BlindingFlare", 1229714)
	self:Log("SPELL_CAST_START", "DevotedOffering", 1229114)
	self:Log("SPELL_AURA_APPLIED", "DivineConflagrationApplied", 1229272)
	self:Log("SPELL_AURA_REMOVED", "DivineConflagrationRemoved", 1229272)
	self:Log("SPELL_AURA_APPLIED", "ExecutionSentenceApplied", 1229503)
	self:Log("SPELL_CAST_SUCCESS", "WrathOfTheCrusade", 1230125)
	self:Log("SPELL_CAST_START", "DyingLight", 1230271)
	self:Log("SPELL_CAST_SUCCESS", "DyingLightSuccess", 1230271)
	self:Log("SPELL_CAST_SUCCESS", "ConjurePortal", 1230333)
	self:Log("SPELL_CAST_START", "DarkgravenBlade", 1231027)
end

function mod:OnEngage()
	self:SetStage(1)
	self:Message("stages", "cyan", CL.stage:format(1), false)
	self:CDBar(1229714, 27, CL.blind) -- Blinding Flare
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:BlindingFlare(args)
	if self:GetStage() == 1 or self:GetStage() == 3 then -- He casts it in Stage 2.5 after he takes the portal, when you are still stunned
		self:Message(args.spellId, "red", CL.blind)
		self:CastBar(args.spellId, 3, CL.blind)
		self:CDBar(args.spellId, 29.1, CL.blind)
		self:PlaySound(args.spellId, "warning")
	end
end

do
	local prev = 0
	function mod:DevotedOffering(args)
		if args.time - prev > 2 then
			prev = args.time
			self:Message(args.spellId, "yellow")
			self:PlaySound(args.spellId, "alert")
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
	self:TargetMessage(args.spellId, "purple", args.destName, CL.tank_debuff)
	self:CastBar(args.spellId, 8, CL.tank_debuff)
	self:PlaySound(args.spellId, "info")
end

function mod:WrathOfTheCrusade()
	self:SetStage(2)
	self:StopBar(CL.blind) -- Blinding Flare
	self:Message("stages", "cyan", CL.percent:format(55, CL.stage:format(2)), false)
	self:PlaySound("stages", "long")
end

function mod:DyingLight()
	self:SetStage(2.5)
	self:Message("run", "blue", L.run, L.run_icon, nil, 3) -- Stay onscreen for 3s
	self:Bar("run", 20, L.run, L.run_icon)
end

do
	local function SetStage3()
		mod:SetStage(3)
		mod:Message("stages", "cyan", CL.stage:format(3), false)
		mod:PlaySound("stages", "long")
	end

	function mod:DyingLightSuccess(args)
		self:Bar("stages", 20, CL.intermission, args.spellId)
		self:ScheduleTimer(SetStage3, 20)
	end
end

function mod:ConjurePortal()
	self:Berserk(430, true) -- XXX FIXME, starts in stage 2 but we need a better event than this
end

do
	local function RegisterYell()
		mod:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	end

	function mod:DarkgravenBlade(args)
		self:SetStage(4)
		self:StopBar(CL.blind) -- Blinding Flare
		self:Message(args.spellId, "yellow", CL.you_die_sec:format(60))
		self:Bar(args.spellId, 60, CL.you_die)
		self:ScheduleTimer(RegisterYell, 2)
		self:PlaySound(args.spellId, "long")
	end
end

function mod:CHAT_MSG_MONSTER_YELL(event)
	self:UnregisterEvent(event)
	self:SetStage(5)
	self:StopBar(CL.you_die)
	self:Message("stages", "cyan", CL.stage:format(5), false)
	self:PlaySound("stages", "long")
end
