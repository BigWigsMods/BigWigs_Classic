
--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Ossirian the Unscarred", 717, 1542)
if not mod then return end
mod:RegisterEnableMob(15339)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.debuff = "Weakness"
	L.debuff_desc = "Warn for various weakness types."
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"debuff",
		25176, -- Strength of Ossirian
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Weakness", 25181, 25177, 25178, 25180, 25183)
	self:Log("SPELL_AURA_REMOVED", "WeaknessRemoved", 25181, 25177, 25178, 25180, 25183)
	self:Log("SPELL_AURA_APPLIED", "StrengthOfOssirian", 25176)

	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")

	self:Death("Win", 15339)
end

function mod:OnEngage()
	self:StartWipeCheck()
	self:Message(25176, "Important") -- Strength of Ossirian
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Weakness(args)
	self:Message("debuff", "Attention", "Info", args.spellId)
	self:Bar("debuff", 45, args.spellId)

	self:DelayedMessage(25176, 30, "Attention", CL.custom_sec:format(self:SpellName(25176), 15))
	self:DelayedMessage(25176, 35, "Urgent", CL.custom_sec:format(self:SpellName(25176), 10))
	self:DelayedMessage(25176, 40, "Important", CL.custom_sec:format(self:SpellName(25176), 5))
	self:Bar(25176, 45)
end

function mod:WeaknessRemoved(args)
	self:Message("debuff", "Attention", nil, CL.over:format(args.spellName), args.spellId)
end

function mod:StrengthOfOssirian(args)
	self:Message(args.spellId, "Important")
end

