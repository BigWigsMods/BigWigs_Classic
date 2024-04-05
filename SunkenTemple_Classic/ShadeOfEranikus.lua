--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Shade of Eranikus Discovery", 109, -2959)
if not mod then return end
mod:RegisterEnableMob(218571) -- Shade of Eranikus
mod:SetEncounterID(2959)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bossName = "Shade of Eranikus"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"stages",
	}
end

function mod:OnRegister()
	self.displayName = L.bossName
end

function mod:OnBossEnable()

end

function mod:OnEngage()
	self:Message("stages", "cyan", CL.stage:format(1), false)
end

--------------------------------------------------------------------------------
-- Event Handlers
--
