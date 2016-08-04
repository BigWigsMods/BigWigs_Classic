--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Flamegor", 755, 1534)
if not mod then return end
mod:RegisterEnableMob(11981)
mod.toggleOptions = {23339, 22539, 23342}

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "WingBuffet", 23339)
	self:Log("SPELL_CAST_START", "ShadowFlame", 22539)
	self:Log("SPELL_AURA_APPLIED", "Enrage", 23342)
	self:Log("SPELL_DISPEL", "EnrageRemoved", "*")

	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	self:Death("Win", 11981)
end

function mod:OnEngage()
	self:Bar(23339, 29) -- Wing Buffet
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:WingBuffet(args)
	self:Message(args.spellId, "Important")
	self:DelayedMessage(args.spellId, 27, "Urgent", CL.custom_sec:format(args.spellName, 5))
	self:Bar(args.spellId, 32)
end

function mod:ShadowFlame(args)
	self:Message(args.spellId, "Important")
end

function mod:Enrage(args)
	self:Message(args.spellId, "Urgent")
	self:Bar(args.spellId, 10)
end

function mod:EnrageRemoved(args)
	if args.extraSpellId == 23342 then
		self:StopBar(args.extraSpellId)
		self:Message(args.extraSpellId, "Urgent", nil, CL.removed:format(args.extraSpellName))
	end
end

