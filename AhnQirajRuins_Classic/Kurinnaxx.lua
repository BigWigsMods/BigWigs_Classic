--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Kurinnaxx", 509, 1537)
if not mod then return end
mod:RegisterEnableMob(15348)
mod:SetEncounterID(718)

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		25646, -- Mortal Wound
		{25656, "SAY"}, -- Sand Trap
		26527, -- Frenzy
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "MortalWound", 25646)
	self:Log("SPELL_AURA_APPLIED_DOSE", "MortalWound", 25646)
	self:Log("SPELL_AURA_REMOVED", "MortalWoundRemoved", 25646)
	self:Log("SPELL_CREATE", "SandTrap", 25648)
	self:Log("SPELL_AURA_APPLIED", "Frenzy", 26527)

	self:RegisterEvent("UNIT_HEALTH_FREQUENT")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:MortalWound(args)
	local amount = args.amount or 1
	self:StackMessage(args.spellId, "purple", args.destName, amount, 5)
	if amount >= 5 and self:Tank() then
		self:PlaySound(args.spellId, "warning")
	end
	self:TargetBar(args.spellId, 15, args.destName)
end

function mod:MortalWoundRemoved(args)
	self:StopBar(args.spellName, args.destName)
end

function mod:SandTrap(args)
	self:TargetMessage(25656, "orange", args.sourceName)
	if self:Me(args.sourceGUID) then
		self:PlaySound(25656, "alert", nil, args.sourceName)
		self:Say(25656)
	end
end

function mod:Frenzy(args)
	self:UnregisterEvent("UNIT_HEALTH_FREQUENT")
	self:Message(args.spellId, "red", CL.percent:format(30, args.spellName))
end

function mod:UNIT_HEALTH_FREQUENT(event, unit)
	if self:MobId(self:UnitGUID(unit)) == 15348 then
		local hp = self:GetHealth(unit)
		if hp < 36 then
			self:UnregisterEvent(event)
			self:Message(26527, "green", CL.soon:format(self:SpellName(26527)), false)
		end
	end
end
