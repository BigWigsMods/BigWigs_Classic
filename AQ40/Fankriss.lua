
--------------------------------------------------------------------------------
-- Module declaration
--

local mod = BigWigs:NewBoss("Fankriss the Unyielding", 531, 1545)
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
	self:StackMessageOld(args.spellId, args.destName, args.amount, "yellow")
	self:TargetBar(args.spellId, 15, args.destName)
end

function mod:SummonWorm()
	self:MessageOld(25832, "orange", "info")
end

function mod:Entangle(args)
	self:TargetMessageOld(720, args.destName, "red", "alert", nil, nil, true)
end

