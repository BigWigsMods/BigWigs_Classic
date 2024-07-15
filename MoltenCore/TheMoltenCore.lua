--------------------------------------------------------------------------------
-- Module Declaration
--

if not BigWigsLoader.isSeasonOfDiscovery then return end
local mod, CL = BigWigs:NewBoss("The Molten Core", 409)
if not mod then return end
mod:RegisterEnableMob(227939)
mod:SetEncounterID(3018)
mod:SetAllowWin(true)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bossName = "The Molten Core"
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


