--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Majordomo Executus", 696)
if not mod then return end
mod:RegisterEnableMob(12018, 11663, 11664)
mod.toggleOptions = {20619, 21075, "bosskill"}

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.disabletrigger = "Impossible! Stay your attack, mortals... I submit! I submit!"
	L.power_next = "Next Power"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "MagicReflection", 20619)
	self:Log("SPELL_CAST_SUCCESS", "DamageShield", 21075)

	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:Yell("Win", L["disabletrigger"])
end

function mod:VerifyEnable(unit)
	return (UnitIsEnemy(unit, "player") and UnitCanAttack(unit, "player")) and true or false
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:MagicReflection(args)
	self:Bar(args.spellId, args.spellName, 10, args.spellId)
	self:Message(args.spellId, args.spellName, "Important", args.spellId)
	self:Bar(args.spellId, L["power_next"], 30, "ability_warlock_improvedsoulleech")
	self:DelayedMessage(args.spellId, 25, CL["custom_sec"]:format(L["power_next"], 5), "Urgent")
end

function mod:DamageShield(args)
	self:Bar(args.spellId, args.spellName, 10, args.spellId)
	self:Message(args.spellId, args.spellName, "Important", args.spellId)
	self:Bar(args.spellId, L["power_next"], 30, "ability_warlock_improvedsoulleech")
	self:DelayedMessage(args.spellId, 25, CL["custom_sec"]:format(L["power_next"], 5), "Urgent")
end

