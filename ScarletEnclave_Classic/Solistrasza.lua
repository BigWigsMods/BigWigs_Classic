--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Solistrasza", 2856)
if not mod then return end
mod:RegisterEnableMob(238954)
mod:SetEncounterID(3186)
mod:SetAllowWin(true)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bossName = "Solistrasza"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		1232009, -- Solistrasza's Gaze
	}
end

function mod:OnRegister()
	self.displayName = L.bossName
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "SolistraszasGazeApplied", 1232009)
end

function mod:OnEngage()

end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:SolistraszasGazeApplied(args)
	self:TargetMessage(1232009, "yellow", args.destName)
end
