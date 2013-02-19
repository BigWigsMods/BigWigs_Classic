--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Lucifron", 696)
if not mod then return end
mod:RegisterEnableMob(12118)
mod.toggleOptions = {19702, 19703, {20604, "ICON"}, "bosskill"}

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
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

function mod:Doom(args)
	self:Bar(args.spellId, 20)
	self:Message(args.spellId, "Important")
	self:DelayedMessage(args.spellId, 15, "Urgent", CL.custom_sec:format(args.spellName, 5))
end

function mod:Curse(args)
	self:Bar(args.spellId, 20)
	self:Message(args.spellId, "Attention")
	self:DelayedMessage(args.spellId, 15, "Positive", CL.custom_sec:format(args.spellName, 5))
end

function mod:MindControl(args)
	self:Bar(args.spellId, 15, L.mc_bar:format(args.destName))
	self:TargetMessage(args.spellId, args.destName, "Attention")
	self:PrimaryIcon(args.spellId, args.destName)
end

