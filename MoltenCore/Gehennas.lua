--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Gehennas", 696)
if not mod then return end
mod:RegisterEnableMob(12259)
mod.toggleOptions = {19716, {19717, "FLASHSHAKE"}, "bosskill"}

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "Curse", 19716)
	self:Log("SPELL_AURA_APPLIED", "Fire", 19717)

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:Death("Win", 12259)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Curse(args)
	self:Bar(args.spellId, args.spellName, 30, args.spellId)
	self:Message(args.spellId, args.spellName, "Urgent", args.spellId)
	self:DelayedMessage(args.spellId, 25, CL["custom_sec"]:format(args.spellName, 5), "Attention")
end

function mod:Fire(args)
	if UnitIsUnit(args.destName, "player") then
		self:FlashShake(args.spellId)
		self:LocalMessage(args.spellId, CL["you"]:format(args.spellName), "Personal", args.spellId, "Alarm")
	end
end

