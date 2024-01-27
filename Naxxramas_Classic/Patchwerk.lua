--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Patchwerk", 533, 1610)
if not mod then return end
mod:RegisterEnableMob(16028)
mod:SetEncounterID(1118)

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		28131, -- Frenzy / Enrage (different name on classic era)
		"berserk",
	},nil,{
		[28131] = CL.hp:format(5), -- Frenzy / Enrage (5% HP)
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "FrenzyEnrage", 28131)
end

function mod:OnEngage()
	self:Berserk(420)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:FrenzyEnrage(args)
	self:Message(args.spellId, "orange", CL.percent:format(5, args.spellName))
	self:PlaySound(args.spellId, "long")
end
