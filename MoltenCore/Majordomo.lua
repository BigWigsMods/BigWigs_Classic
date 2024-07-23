--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Majordomo Executus", 409, 1527)
if not mod then return end
mod:RegisterEnableMob(12018, 11663, 11664) -- Majordomo Executus, Flamewaker Healer, Flamewaker Elite
mod:SetEncounterID(671)

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		20619, -- Magic Reflection
		21075, -- Damage Shield
		20534, -- Teleport
	},nil,{
		[20619] = CL.spell_reflection, -- Magic Reflection (Spell Reflection)
	}
end

function mod:VerifyEnable(_, npcId)
	if npcId ~= 12018 then -- Majordomo Executus
		return true -- Only enable on his adds since he doesn't die, we keep him in enable mobs for his boss frame to trigger engage
	end
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "MagicReflection", 20619)
	self:Log("SPELL_CAST_SUCCESS", "DamageShield", 21075)
	self:Log("SPELL_CAST_SUCCESS", "Teleport", 20534)
end

function mod:OnEngage()
	self:CDBar(20534, 20) -- Teleport
	self:Bar(self:CheckOption(20619, "BAR") and 20619 or 21075, 27, CL.next_ability, "INV_Misc_QuestionMark")
	self:DelayedMessage(self:CheckOption(20619, "MESSAGE") and 20619 or 21075, 22, "orange", CL.custom_sec:format(CL.next_ability, 5))
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:MagicReflection(args)
	self:Bar(args.spellId, 10, CL.spell_reflection)
	self:Message(args.spellId, "red", CL.spell_reflection)
	self:Bar(self:CheckOption(20619, "BAR") and 20619 or 21075, 30, CL.next_ability, "INV_Misc_QuestionMark")
	self:DelayedMessage(self:CheckOption(20619, "MESSAGE") and 20619 or 21075, 25, "orange", CL.custom_sec:format(CL.next_ability, 5))
	self:PlaySound(args.spellId, "info")
end

function mod:DamageShield(args)
	self:Bar(args.spellId, 10)
	self:Message(args.spellId, "red")
	self:Bar(self:CheckOption(20619, "BAR") and 20619 or 21075, 30, CL.next_ability, "INV_Misc_QuestionMark")
	self:DelayedMessage(self:CheckOption(20619, "MESSAGE") and 20619 or 21075, 25, "orange", CL.custom_sec:format(CL.next_ability, 5))
	self:PlaySound(args.spellId, "info")
end

function mod:Teleport(args)
	self:TargetMessage(args.spellId, "yellow", args.destName)
	self:CDBar(args.spellId, 25) -- 25-30
end
