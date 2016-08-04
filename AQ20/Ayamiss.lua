
--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Ayamiss the Hunter", 717, 1541)
if not mod then return end
mod:RegisterEnableMob(15369)

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{25725, "ICON"}, -- Paralyze
		8269, -- Frenzy
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Paralyze", 25725)
	self:Log("SPELL_AURA_REMOVED", "ParalyzeRemoved", 25725)
	self:Log("SPELL_AURA_APPLIED", "Frenzy", 8269)

	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", nil, "target", "focus")

	self:Death("Win", 15369)
end

function mod:OnEngage()
	self:StartWipeCheck()
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Paralyze(args)
	self:TargetMessage(args.spellId, args.destName, "Attention")
	self:TargetBar(args.spellId, 10, args.destName)
	self:PrimaryIcon(args.spellId, args.destName)
end

function mod:ParalyzeRemoved(args)
	self:PrimaryIcon(args.spellId)
	self:StopBar(args.spellId, args.destName)
end

function mod:Frenzy(args)
	self:UnregisterUnitEvent("UNIT_HEALTH_FREQUENT", "target", "focus")
	self:Message(args.spellId, "Important")
end

function mod:UNIT_HEALTH_FREQUENT(unit)
	if self:MobId(UnitGUID(unit)) == 15369 then
		local hp = UnitHealth(unit) / UnitHealthMax(unit) * 100
		if hp < 26 then
			self:UnregisterUnitEvent("UNIT_HEALTH_FREQUENT", "target", "focus")
			self:Message(8269, "Positive", nil, CL.soon:format(self:SpellName(8269)), false)
		end
	end
end

