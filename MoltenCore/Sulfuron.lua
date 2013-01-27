--------------------------------------------------------------------------------
-- Module declaration
--

local mod = BigWigs:NewBoss("Sulfuron Harbinger", 696)
if not mod then return end
mod:RegisterEnableMob(12098)
mod.toggleOptions = {19779, 19775, "bosskill"}

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "SulfuronHeal", 19775)
	self:Log("SPELL_CAST_SUCCESS", "Inspire", 19779)

	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:Death("Win", 12098)
 end
 
--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Inspire(_, spellId, _, _, spellName)
	self:Bar(19779, spellName, 10, spellId)
	self:Message(19779, spellName, "Attention", spellId)
end
 
function mod:SulfuronHeal(_, spellId, _, _, spellName)
	self:Bar(19775, spellName, 2, spellId)
	self:Message(19775, spellName, "Important", spellId)
end

