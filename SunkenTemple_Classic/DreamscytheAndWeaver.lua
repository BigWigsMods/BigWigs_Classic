--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Dreamscythe and Weaver Discovery", 109, -2955)
if not mod then return end
mod:RegisterEnableMob(218242) -- Dreamscythe and Weaver Discovery
mod:SetEncounterID(2955)

--------------------------------------------------------------------------------
-- Locals
--

local shieldTimers = {}
local dragonHP = 100
local sheepHP = 100
local squirrelHP = 100
local chickenHP = 100
local UpdateInfoBoxList
local repairList = {}

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bossName = "Dreamscythe and Weaver"
end

--------------------------------------------------------------------------------
-- Initialization
--

local explosiveEggMarker = mod:AddMarkerOption(true, "npc", 8, 436692, 8) -- Explosive Egg
function mod:GetOptions()
	return {
		438735, -- High Voltage!
		436692, -- Explosive Egg
		explosiveEggMarker,
		436570, -- Cluck!
		436833, -- Widget Volley
		436836, -- Widget Fortress
		{436816, "EMPHASIZE"}, -- Sprocketfire Breath
		436695, -- Overheat
		436825, -- Frayed Wiring
		440073, -- Self Repair
		{"health", "INFOBOX"},
		{"run", "EMPHASIZE"},
	},nil,{
		[436836] = CL.shield, -- Widget Fortress (Shield)
		[436816] = CL.breath, -- Sprocketfire Breath (Breath)
		[436825] = CL.spell_reflection, -- Frayed Wiring (Spell Reflection)
	}
end

function mod:OnRegister()
	self.displayName = L.bossName
end

function mod:OnBossEnable()

end

function mod:OnEngage()

end

function mod:OnWin()

end

--------------------------------------------------------------------------------
-- Event Handlers
--

