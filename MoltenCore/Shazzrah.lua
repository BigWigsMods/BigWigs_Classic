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

function mod:Blink(args)
	self:Bar(args.spellId, args.spellName, 45, args.spellId)
	self:Message(args.spellId, args.spellName, "Important", args.spellId)
end
 
function mod:SelfBuff(args)
	self:Message(args.spellId, args.spellName, "Attention", args.spellId)
end

