
--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Ayamiss the Hunter", 509, 1541)
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
	self:RegisterUnitEvent("UNIT_HEALTH", nil, "target", "focus")

	self:Death("Win", 15369)
end

function mod:OnEngage()
	self:StartWipeCheck()
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Paralyze(args)
	self:TargetMessageOld(args.spellId, args.destName, "yellow")
	self:TargetBar(args.spellId, 10, args.destName)
	self:PrimaryIcon(args.spellId, args.destName)
end

function mod:ParalyzeRemoved(args)
	self:PrimaryIcon(args.spellId)
	self:StopBar(args.spellId, args.destName)
end

function mod:Frenzy(args)
	self:UnregisterUnitEvent("UNIT_HEALTH", "target", "focus")
	self:MessageOld(args.spellId, "red")
end

function mod:UNIT_HEALTH(event, unit)
	if self:MobId(self:UnitGUID(unit)) == 15369 then
		local hp = self:GetHealth(unit)
		if hp < 26 then
			self:UnregisterUnitEvent(event, "target", "focus")
			self:MessageOld(8269, "green", nil, CL.soon:format(self:SpellName(8269)), false)
		end
	end
end

