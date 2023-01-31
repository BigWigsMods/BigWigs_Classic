
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
	self:RegisterUnitEvent("UNIT_HEALTH", nil, "target", "focus")

	self:Death("Win", 15348)
end

function mod:OnEngage()
	self:StartWipeCheck()
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:MortalWound(args)
	self:StackMessageOld(args.spellId, args.destName, args.amount, "yellow")
end

function mod:SandTrap()
	self:MessageOld(25656, "orange", "alert")
end

function mod:Frenzy(args)
	self:UnregisterUnitEvent("UNIT_HEALTH", "target", "focus")
	self:MessageOld(args.spellId, "red", nil, "30% - ", args.spellName)
end

function mod:UNIT_HEALTH(event, unit)
	if self:MobId(self:UnitGUID(unit)) == 15348 then
		local hp = self:GetHealth(unit)
		if hp < 36 then
			self:UnregisterUnitEvent(event, "target", "focus")
			self:MessageOld(26527, "green", nil, CL.soon:format(self:SpellName(26527)), false)
		end
	end
end

