--------------------------------------------------------------------------------
-- Module declaration
--

local mod = BigWigs:NewBoss("Lucifron", 696)
if not mod then return end
mod:RegisterEnableMob(12118)
mod.toggleOptions = {19702, 19703, {20604, "ICON"}, "bosskill"}

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.curse_warn = "Lucifron's Curse in 5sec!"
	L.doom_warn = "Impending Doom in 5sec"
	L.mc_bar = "MC: %s"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "Doom", 19702)
	self:Log("SPELL_CAST_SUCCESS", "Curse", 19703)
	self:Log("SPELL_AURA_APPLIED", "MindControl", 20604)

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:Death("Win", 12118)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Doom(_, spellId, _, _, spellName)
	self:Bar(spellId, spellName, 20, spellId)
	self:Message(spellId, spellName, "Important", spellId)
	self:DelayedMessage(spellId, 15, L["doom_warn"], "Urgent")
end

function mod:Curse(_, spellId, _, _, spellName)
	self:Bar(spellId, spellName, 20, spellId)
	self:Message(spellId, spellName, "Attention", spellId)
	self:DelayedMessage(spellId, 15, L["curse_warn"], "Positive")
end

function mod:MindControl(player, spellId, _, _, spellName)
	self:Bar(spellId, L["mc_bar"]:format(player), 15, spellId)
	self:TargetMessage(spellId, spellName, player, "Attention", spellId)
	self:PrimaryIcon(spellId, player)
end

