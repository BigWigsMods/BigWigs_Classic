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
		434168, -- Irradiated Cloud
		434724, -- Radiation Sickness
		"adds",
		3019, -- Enrage
		436100, -- Petrify
		{436074, "CASTBAR"}, -- Trogg Rage
		{436027, "CASTBAR"}, -- Grubbis Mad!
		434941, -- Toxic Vigor
		{436059, "CASTBAR"}, -- Radiation?
		{439956, "CASTBAR"}, -- Revive Pet
	},{
		["adds"] = CL.adds,
		[436100] = L.bossName,
	},{
		[434724] = CL.disease, -- Radiation Sickness (Disease)
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
