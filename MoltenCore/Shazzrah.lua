
--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Shazzrah", 696, 1523)
if not mod then return end
mod:RegisterEnableMob(12264)
mod.toggleOptions = {19714, 23138, 19715}

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT", "CheckBossStatus")

	self:Log("SPELL_CAST_SUCCESS", "Blink", 23138)
	self:Log("SPELL_CAST_SUCCESS", "MagicGrounding", 19714)
	self:Log("SPELL_CAST_SUCCESS", "Counterspell", 19715)

	self:Death("Win", 12264)
end

function mod:OnEngage()
	self:Bar(19715, 10.7) -- Counterspell
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Blink(args)
	self:Bar(args.spellId, 45)
	self:Message(args.spellId, "Important")
end

function mod:MagicGrounding(args)
	-- Self buff
	self:Message(args.spellId, "Urgent", self:Dispeller("magic", true) and "Alarm", CL.onboss:format(args.spellName))
end

function mod:Counterspell(args)
	self:CDBar(args.spellId, 15) -- 15-19
	self:Message(args.spellId, "Attention", "Info")
end

