
--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Garr", 409, 1522)
if not mod then return end
mod:RegisterEnableMob(12057)
mod:SetEncounterID(666)

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		19492, -- Antimagic Pulse
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "Pulse", 19492)

	self:Death("Win", 12057)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Pulse(args)
	self:Message(args.spellId, "yellow")
	self:Bar(args.spellId, 18)
end
