--------------------------------------------------------------------------------
-- Module Declaration
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
		{25656, "SAY", "ME_ONLY_EMPHASIZE"}, -- Sand Trap (Fake proxy spell as 25648 has no description or icon)
		26527, -- Frenzy / Enrage (different name on classic era)
	},nil,{
		[26527] = CL.hp:format(30), -- Frenzy / Enrage (30% HP)
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "MortalWound", 25646)
	self:Log("SPELL_AURA_APPLIED_DOSE", "MortalWound", 25646)
	self:Log("SPELL_AURA_REMOVED", "MortalWoundRemoved", 25646)
	self:Log("SPELL_CREATE", "SandTrap", 25648)
	self:Log("SPELL_AURA_APPLIED", "FrenzyEnrage", 26527)

	self:Death("Win", 15348)
end

function mod:OnEngage()
	self:RegisterEvent("UNIT_HEALTH")
	self:CDBar(25656, 8) -- Sand Trap
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:MortalWound(args)
	local amount = args.amount or 1
	self:StackMessage(args.spellId, "purple", args.destName, amount, 5)
	self:TargetBar(args.spellId, 15, args.destName)
	if amount >= 5 and self:Tank() then
		self:PlaySound(args.spellId, "warning")
	end
end

function mod:MortalWoundRemoved(args)
	self:StopBar(args.spellName, args.destName)
end

function mod:SandTrap(args)
	self:TargetMessage(25656, "orange", args.sourceName)
	self:CDBar(25656, 8)
	if self:Me(args.sourceGUID) then
		self:Say(25656, nil, nil, "Sand Trap")
		self:PlaySound(25656, "alert", nil, args.sourceName)
	end
end

function mod:FrenzyEnrage(args)
	self:UnregisterEvent("UNIT_HEALTH")
	self:Message(args.spellId, "red", CL.percent:format(30, args.spellName))
	self:PlaySound(args.spellId, "long")
end

function mod:UNIT_HEALTH(event, unit)
	if self:MobId(self:UnitGUID(unit)) == 15348 then
		local hp = self:GetHealth(unit)
		if hp < 36 then
			self:UnregisterEvent(event)
			self:Message(26527, "green", CL.soon:format(self:SpellName(26527)), false) -- Frenzy / Enrage
		end
	end
end
