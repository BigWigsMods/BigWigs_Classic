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

