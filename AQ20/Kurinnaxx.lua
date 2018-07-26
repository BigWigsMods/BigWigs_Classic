
--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Kurinnaxx", 509, 1537)
if not mod then return end
mod:RegisterEnableMob(15348)

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		25646, -- Mortal Wound
		25656, -- Sand Trap
		26527, -- Frenzy
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "MortalWound", 25646)
	self:Log("SPELL_AURA_APPLIED_DOSE", "MortalWound", 25646)
	self:Log("SPELL_CREATE", "SandTrap", 25648)
	self:Log("SPELL_AURA_APPLIED", "Frenzy", 26527)

	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", nil, "target", "focus")

	self:Death("Win", 15348)
end

function mod:OnEngage()
	self:StartWipeCheck()
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:MortalWound(args)
	self:StackMessage(args.spellId, args.destName, args.amount, "yellow")
end

function mod:SandTrap()
	self:Message(25656, "orange", "Alert")
end

function mod:Frenzy(args)
	self:UnregisterUnitEvent("UNIT_HEALTH_FREQUENT", "target", "focus")
	self:Message(args.spellId, "red", nil, "30% - ", args.spellName)
end

function mod:UNIT_HEALTH_FREQUENT(event, unit)
	if self:MobId(UnitGUID(unit)) == 15348 then
		local hp = UnitHealth(unit) / UnitHealthMax(unit) * 100
		if hp < 36 then
			self:UnregisterUnitEvent(event, "target", "focus")
			self:Message(26527, "green", nil, CL.soon:format(self:SpellName(26527)), false)
		end
	end
end

