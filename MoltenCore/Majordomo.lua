--------------------------------------------------------------------------------
-- Module declaration
--

local mod = BigWigs:NewBoss("Majordomo Executus", 696)
if not mod then return end
mod:RegisterEnableMob(12018, 11663, 11664)
mod.toggleOptions = {20619, 21075, "bosskill"}

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.disabletrigger = "Impossible! Stay your attack, mortals... I submit! I submit!"
	L.warn = "5 seconds until powers!"
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

function mod:MagicReflection(_, spellId, _, _, spellName)
	self:Bar(20619, spellName, 10, spellId)
	self:Message(20619, spellName, "Important", spellId)
	self:DelayedMessage(20619, 25, L["warn"], "Urgent")
end

function mod:DamageShield(_, spellId, _, _, spellName)
	self:Bar(21075, spellName, 10, spellId)
	self:Message(21075, spellName, "Important", spellId)
	self:DelayedMessage(21075, 25, L["warn"], "Urgent")
end

