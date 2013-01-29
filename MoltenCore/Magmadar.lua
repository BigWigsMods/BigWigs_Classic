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

function mod:Fear(args)
	self:Bar(args.spellId, args.spellName, 30, args.spellId)
	self:Message(args.spellId, args.spellName, "Positive", args.spellId)
end

function mod:Frenzy(args)
	self:Bar(args.spellId, args.spellName, 8, args.spellId)
	self:Message(args.spellId, args.spellName, "Attention", args.spellId)
end

