--------------------------------------------------------------------------------
-- Module declaration
--

local mod = BigWigs:NewBoss("Shazzrah", 696)
if not mod then return end
mod:RegisterEnableMob(12264)
mod.toggleOptions = {19714, 23138, "bosskill"}

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "Blink", 23138)
	self:Log("SPELL_CAST_SUCCESS", "SelfBuff", 19714)

	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:Death("Win", 12264)
end
 
--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Blink(_, spellId, _, _, spellName)
	self:Bar(23138, spellName, 45, spellId)
	self:Message(23138, spellName, "Important", spellId)
end
 
function mod:SelfBuff(_, spellId, _, _, spellName)
	self:Message(19714, spellName, "Attention", spellId)
end

