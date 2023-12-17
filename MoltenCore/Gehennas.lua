--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Gehennas", 409, 1521)
if not mod then return end
mod:RegisterEnableMob(12259)
mod:SetEncounterID(665)

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		19716, -- Gehennas' Curse
		19717, -- Rain of Fire
	},nil,{
		[19716] = CL.curse, -- Gehennas' Curse (Curse)
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "GehennasCurse", 19716)
	self:Log("SPELL_AURA_APPLIED", "RainOfFire", 19717)

	self:Death("Win", 12259)
end

function mod:OnEngage()
	self:CDBar(19716, 6, CL.curse) -- Gehennas' Curse
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:GehennasCurse(args)
	self:CDBar(args.spellId, 27, CL.curse) -- 27-37
	self:Message(args.spellId, "orange", CL.curse)
end

function mod:RainOfFire(args)
	if self:Me(args.destGUID) then
		self:PersonalMessage(args.spellId, "aboveyou")
		self:PlaySound(args.spellId, "underyou")
	end
end
