--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Avatar of Hakkar Discovery", 109, -2956)
if not mod then return end
mod:RegisterEnableMob(218537) -- Avatar of Hakkar Discovery
mod:SetEncounterID(2956)
mod:SetStage(1)

--------------------------------------------------------------------------------
-- Locals
--



--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bossName = "Avatar of Hakkar"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		-- General
		"stages",
		437853, -- Summon Bomb
		{438735, "INFOBOX"}, -- High Voltage!
		-- STX-96/FR
		438683, -- Sprocketfire Punch
		438710, -- Sprocketfire
		438713, -- Furnace Surge
		-- STX-97/IC
		438719, -- Supercooled Smash
		438720, -- Freezing
		438723, -- Coolant Discharge
		-- STX-98/PO
		438726, -- Hazardous Hammer
		438727, -- Radiation Sickness
		{438732, "EMPHASIZE"}, -- Toxic Ventilation
	},{
		["stages"] = CL.general,
		[438683] =  CL.stage:format(1),
		[438719] =  CL.stage:format(2),
		[438726] =  CL.stage:format(3),
	},{
		[437853] = CL.bombs, -- Summon Bomb (Bombs)
		[438727] = CL.disease, -- Radiation Sickness (Disease)
	}
end

function mod:OnRegister()
	self.displayName = L.bossName
end

function mod:OnBossEnable()

end

function mod:OnEngage()

end

--------------------------------------------------------------------------------
-- Event Handlers
--
