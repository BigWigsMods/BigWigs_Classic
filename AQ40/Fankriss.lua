
--------------------------------------------------------------------------------
-- Module declaration
--

local mod = BigWigs:NewBoss("Fankriss the Unyielding", 766, 1545)
if not mod then return end
mod:RegisterEnableMob(15510)

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		25646, -- Mortal Wound
		25832, -- Summon Worm
		720, -- Entangle
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED_DOSE", "MortalWound", 25646)
	self:Log("SPELL_CAST_SUCCESS", "SummonWorm", 518, 25831, 25832)
	self:Log("SPELL_AURA_APPLIED", "Entangle", 720, 731, 1121)

	self:Death("Win", 15510)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:MortalWound(args)
	self:StackMessage(args.spellId, args.destName, args.amount, "Attention")
	self:TargetBar(args.spellId, 15, args.destName)
end

function mod:SummonWorm(args)
	self:Message(25832, "Urgent", "Info")
end

function mod:Entangle(args)
	self:TargetMessage(720, args.destName, "Important", "Alert", nil, nil, true)
end

