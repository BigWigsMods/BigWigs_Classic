--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Morphaz and Hazzas Discovery", 109, -2958)
if not mod then return end
mod:RegisterEnableMob(220007) -- Morphaz and Hazzas
mod:SetEncounterID(2958)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bossName = "Morphaz and Hazzas"
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

