--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Balnazzar", 2856)
if not mod then return end
mod:RegisterEnableMob(240811)
mod:SetEncounterID(3185)
mod:SetAllowWin(true)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bossName = "Balnazzar"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		437621, -- Prey on the Weak
		437834, -- Summon Infernal
		437472, -- Carrion Swarm
		{437984, "SAY", "SAY_COUNTDOWN", "ME_ONLY_EMPHASIZE"}, -- Circle of Domination
		"stages",
	}
end

function mod:OnRegister()
	self.displayName = L.bossName
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "PreyOnTheWeak", 437621, 1231636)
	self:Log("SPELL_CAST_SUCCESS", "SummonInfernal", 437834, 1231899)
	self:Log("SPELL_CAST_START", "CarrionSwarm", 437472, 1231840)
	self:Log("SPELL_AURA_APPLIED", "CircleOfDominationApplied", 437984, 1231844)
end

function mod:OnEngage()
	self:Message("stages", "cyan", CL.stage:format(1), false)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:PreyOnTheWeak(args)
	if args.destGUID and self:Me(args.destGUID) then
		self:Message(437621, "yellow", args.spellName.. " on YOU - Too far from other players")
		--self:CDBar(args.spellId, 17)
		--self:PlaySound(args.spellId, "info")
	end
end

function mod:SummonInfernal(args)
	self:Message(437834, "orange")
	--self:CDBar(args.spellId, 17)
	--self:PlaySound(args.spellId, "info")
end

function mod:CarrionSwarm(args)
	self:Message(437472, "red", CL.incoming:format(args.spellName))
	--self:CDBar(args.spellId, 17)
	--self:PlaySound(args.spellId, "info")
end

function mod:CircleOfDominationApplied(args)
	self:TargetMessage(437984, "red", args.destName)
	if self:Me(args.destGUID) then
		self:Say(437984, nil, nil, "Circle of Domination")
		self:SayCountdown(437984, 6)
		self:PlaySound(437984, "warning", nil, args.destName)
	end
end
