--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Reborn Council", 2856)
if not mod then return end
mod:RegisterEnableMob(240795, 240809, 240810) -- Herod, Vishas, Doan
mod:SetEncounterID(3188)
mod:SetAllowWin(true)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bossName = "Reborn Council"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		1231010, -- Tortuous Rebuke
	}
end

function mod:OnRegister()
	self.displayName = L.bossName
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "TortuousRebukeApplied", 1231010)
end

function mod:OnEngage()

end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:TortuousRebukeApplied(args)
	if self:Me(args.destGUID) then
		self:Message(1231010, "blue", args.spellName.. " on YOU - Try avoid casting!")
		self:PlaySound(1231010, "warning", nil, args.destName)
	end
end
