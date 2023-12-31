--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Majordomo Executus", 409, 1527)
if not mod then return end
mod:RegisterEnableMob(12018, 11663, 11664)
mod:SetEncounterID(671)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale()
if L then
	L.disabletrigger = "Impossible! Stay your attack, mortals... I submit! I submit!"
	L.power_next = "Next Power"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		20619, -- Magic Reflection
		21075, -- Damage Shield
		20534, -- Teleport
	}
end

function mod:VerifyEnable(unit)
	return (UnitIsEnemy(unit, "player") and UnitCanAttack(unit, "player")) and true or false
end

function mod:OnBossEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")

	self:Log("SPELL_CAST_SUCCESS", "MagicReflection", 20619)
	self:Log("SPELL_CAST_SUCCESS", "DamageShield", 21075)
	self:Log("SPELL_CAST_SUCCESS", "Teleport", 20534)
end

function mod:OnEngage()
	self:CDBar(20534, 20) -- Teleport
	self:Bar(self:CheckOption(20619, "BAR") and 20619 or 21075, 27, L.power_next, "ability_warlock_improvedsoulleech")
	self:DelayedMessage(self:CheckOption(20619, "MESSAGE") and 20619 or 21075, 22, "orange", CL.custom_sec:format(L.power_next, 5))
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:CHAT_MSG_MONSTER_YELL(_, msg)
	if msg:find(L.disabletrigger, nil, true) then
		self:Win()
	end
end

function mod:MagicReflection(args)
	self:Bar(args.spellId, 10)
	self:Message(args.spellId, "red")
	self:Bar(self:CheckOption(20619, "BAR") and 20619 or 21075, 30, L.power_next, "ability_warlock_improvedsoulleech")
	self:DelayedMessage(self:CheckOption(20619, "MESSAGE") and 20619 or 21075, 25, "orange", CL.custom_sec:format(L.power_next, 5))
	self:PlaySound(args.spellId, "info")
end

function mod:DamageShield(args)
	self:Bar(args.spellId, 10)
	self:Message(args.spellId, "red")
	self:Bar(self:CheckOption(20619, "BAR") and 20619 or 21075, 30, L.power_next, "ability_warlock_improvedsoulleech")
	self:DelayedMessage(self:CheckOption(20619, "MESSAGE") and 20619 or 21075, 25, "orange", CL.custom_sec:format(L.power_next, 5))
	self:PlaySound(args.spellId, "info")
end

function mod:Teleport(args)
	self:TargetMessage(args.spellId, "yellow", args.destName)
	self:CDBar(args.spellId, 25) -- 25-30
end
