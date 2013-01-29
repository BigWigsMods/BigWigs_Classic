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

function mod:Inspire(args)
	self:Bar(args.spellId, args.spellName, 10, args.spellId)
	self:Message(args.spellId, args.spellName, "Attention", args.spellId)
end
 
function mod:SulfuronHeal(args)
	self:Bar(args.spellId, args.spellName, 2, args.spellId)
	self:Message(args.spellId, args.spellName, "Important", args.spellId)
end

