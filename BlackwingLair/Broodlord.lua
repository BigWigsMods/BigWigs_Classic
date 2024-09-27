--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Broodlord Lashlayer", 469, 1531)
if not mod then return end
mod:RegisterEnableMob(12017)
mod:SetEncounterID(612)

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{24573, "ICON"}, -- Mortal Strike
		23331, -- Blast Wave
	}
end

if mod:GetSeason() == 2 then
	function mod:GetOptions()
		return {
			{24573, "ICON"}, -- Mortal Strike
			23331, -- Blast Wave
			"stages",
		}
	end
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "MortalStrike", 24573)
	self:Log("SPELL_AURA_REMOVED", "MortalStrikeOver", 24573)
	self:Log("SPELL_CAST_SUCCESS", "BlastWave", 23331)
	if self:GetSeason() == 2 then
		self:Log("SPELL_CAST_SUCCESS", "Teleport", 468495)
	end
end

function mod:OnEngage()
	if self:GetPlayerAura(467047) then -- Black Essence
		self:RegisterEvent("UNIT_HEALTH")
	end
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:MortalStrike(args)
	self:TargetMessage(args.spellId, "yellow", args.destName)
	self:PrimaryIcon(args.spellId, args.destName)
	self:TargetBar(args.spellId, 5, args.destName)
	self:PlaySound(args.spellId, "alarm")
end

function mod:MortalStrikeOver(args)
	self:StopBar(args.spellName, args.destName)
	self:PrimaryIcon(args.spellId)
end

function mod:BlastWave(args)
	self:Message(args.spellId, "orange")
	self:PlaySound(args.spellId, "info")
end

function mod:UNIT_HEALTH(event, unit)
	if self:MobId(self:UnitGUID(unit)) == 12017 then -- Broodlord Lashlayer
		local hp = self:GetHealth(unit)
		if hp < 56 then
			self:UnregisterEvent(event)
			if hp > 50 then
				self:Message("stages", "cyan", CL.soon:format(CL.teleport), false)
			end
		end
	end
end

function mod:Teleport()
	self:Message("stages", "cyan", CL.percent:format(50, CL.teleport), false)
	self:PlaySound("stages", "long")
end
