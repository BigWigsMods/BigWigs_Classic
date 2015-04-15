
--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Battleguard Sartura", 766)
if not mod then return end
mod:RegisterEnableMob(15516, 15984) -- Battleguard Sartura, Sartura's Royal Guard

local addsLeft = 3

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.bossName = "Battleguard Sartura"
	L.engage_trigger = "sacred grounds" -- You will be judged for defiling these sacred grounds!  The laws of the Ancients will not be challenged!  Trespassers will be annihilated!\r\n
end
L = mod:GetLocale()
mod.displayName = L.bossName

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		26083, -- Whirlwind
		8269, -- Frenzy
		"stages",
		"berserk",
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Whirlwind", 26083)
	self:Log("SPELL_AURA_REMOVED", "WhirlwindOver", 26083)
	self:Log("SPELL_AURA_APPLIED", "Frenzy", 8269)

	self:Yell("Engage", L.engage_trigger)
	self:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", nil, "target", "focus")

	self:Death("Win", 15516)
	self:Death("AddDies", 15984)
end

function mod:OnEngage()
	self:Berserk(600)
	addsLeft = 3
	self:StartWipeCheck()
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Frenzy(args)
	self:UnregisterUnitEvent("UNIT_HEALTH_FREQUENT", "target", "focus")
	self:Message(args.spellId, "Urgent", "Long", "25% - ".. args.spellName)
end

function mod:Whirlwind(args)
	self:Message(args.spellId, "Important", "Alert")
	self:Bar(args.spellId, 15)
end

function mod:WhirlwindOver(args)
	self:Message(args.spellId, "Positive", nil, CL.over:format(args.spellName))
end

function mod:UNIT_HEALTH_FREQUENT(unit)
	if self:MobId(UnitGUID(unit)) == 15516 then
		local hp = UnitHealth(unit) / UnitHealthMax(unit) * 100
		if hp < 31 then
			self:UnregisterUnitEvent("UNIT_HEALTH_FREQUENT", "target", "focus")
			self:Message(8269, "Attention", nil, CL.soon:format(self:SpellName(8269)), false)
		end
	end
end

function mod:AddDies()
	addsLeft = addsLeft - 1
	self:Message("stages", "Positive", nil, CL.add_remaining:format(addsLeft), false)
end

--[[
L:RegisterTranslations("enUS", function() return {
	start_trigger = "defiling these sacred grounds",
} end )

L:RegisterTranslations("frFR", function() return {
	start_trigger = "Vous serez jugés pour avoir profané ces lieux sacrés ! On ne défie pas les lois des Anciens ! Les intrus seront anéantis !",
} end )

L:RegisterTranslations("deDE", function() return {
	start_trigger = "Ihr habt heiligen Boden entweiht",
} end )


L:RegisterTranslations("zhCN", function() return {
	start_trigger = "你们玷污了这片神圣的土地，会因此受到惩罚的！上古之神的律法不容藐视！入侵者要付出生命的代价！",--我宣判你死刑
} end )

L:RegisterTranslations("zhTW", function() return {
	start_trigger = "玷汙這些神聖之地",
} end )

L:RegisterTranslations("koKR", function() return {
	start_trigger = "성스러운 땅을 더럽힌 죗값을 받게 되리라. 고대의 법률은 거스를 수 없다! 침입자들을 처단하라!",
} end )

L:RegisterTranslations("ruRU", function() return {
	start_trigger = "Загрязняются эти священные земли",
} end )
]]

