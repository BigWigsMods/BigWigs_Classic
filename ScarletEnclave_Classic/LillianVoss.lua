--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Lillian Voss", 2856)
if not mod then return end
mod:RegisterEnableMob(243021)
mod:SetEncounterID(3190)
mod:SetAllowWin(true)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bossName = "Lillian Voss"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		1232192, -- Debilitate
	}
end

function mod:OnRegister()
	self.displayName = L.bossName
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "DebilitateApplied", 1232192)
end

function mod:OnEngage()

end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:DebilitateApplied(args)
	self:TargetMessage(1232192, "yellow", args.destName)
end
