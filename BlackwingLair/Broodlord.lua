--------------------------------------------------------------------------------
-- Module declaration
--

local mod = BigWigs:NewBoss("Broodlord Lashlayer", 755)
if not mod then return end
mod:RegisterEnableMob(12017)
mod.toggleOptions = {{24573, "ICON"}, "bosskill"}

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "MortalStrike", 24573)

	self:Death("Win", 12017)
end

function mod:OnEngage()

end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:MortalStrike(args)
	self:TargetMessage(args.spellId, args.destName, "Attention", "Alarm")
	self:PrimaryIcon(args.spellId, args.destName)
	self:TargetBar(args.spellId, 5, args.destName)
end

