--------------------------------------------------------------------------------
-- Module declaration
--

local mod = BigWigs:NewBoss("Magmadar", 696)
if not mod then return end
mod:RegisterEnableMob(11982)
mod.toggleOptions = {19408, 19451, "bosskill"}

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "Fear", 19408)
	self:Log("SPELL_CAST_SUCCESS", "Frenzy", 19451)

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:Death("Win", 11982)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Fear(_, spellId, _, _, spellName)
	self:Bar(spellId, spellName, 30, spellId)
	self:Message(spellId, spellName, "Positive", spellId)
end

function mod:Frenzy(_, spellId, _, _, spellName)
	self:Bar(spellId, spellName, 8, spellId)
	self:Message(spellId, spellName, "Attention", spellId)
end

