--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Atal'ai Defenders Discovery", 109, -2954)
if not mod then return end
mod:RegisterEnableMob(217969) -- Atal'ai Defenders Discovery
mod:SetEncounterID(2954)
mod:SetStage(1)

--------------------------------------------------------------------------------
-- Locals
--

local quakeCount = 0
local addsCount = 0

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bossName = "Atal'ai Defenders"
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
	quakeCount = 0
	addsCount = 0
end

--------------------------------------------------------------------------------
-- Event Handlers
--
