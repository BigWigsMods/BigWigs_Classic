--------------------------------------------------------------------------------
-- Module declaration
--

local mod = BigWigs:NewBoss("Vaelastrasz the Corrupt", 755)
if not mod then return end
mod:RegisterEnableMob(13020)
mod.toggleOptions = {{18173, "ICON"}, "bosskill"}

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
	self:Log("SPELL_AURA_APPLIED", "Adrenaline", 18173, 23620)
	self:Log("SPELL_AURA_REMOVED", "AdrenalineOver", 18173, 23620)

	self:Death("Win", 13020)
end

function mod:OnEngage()

end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Adrenaline(args)
	self:TargetMessage(args.spellId, args.destName, "Attention", "Alarm")
	self:PrimaryIcon(args.spellId, args.destName)
	self:TargetBar(args.spellId, 20, args.destName, 67729, args.spellId) -- Explode
end

function mod:AdrenalineOver(args)
	self:PrimaryIcon(args.spellId)
end

