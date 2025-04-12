--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Grand Crusader Caldoran", 2856)
if not mod then return end
mod:RegisterEnableMob(241006)
mod:SetEncounterID(3189)
mod:SetAllowWin(true)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bossName = "Grand Crusader Caldoran"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		--"stages",
		"berserk",
	}
end

function mod:OnRegister()
	self.displayName = L.bossName
end

function mod:OnBossEnable()

end

function mod:OnEngage()
	--self:Message("stages", "cyan", CL.stage:format(1), false)
	self:Berserk(720)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

