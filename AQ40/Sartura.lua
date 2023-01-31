
--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Battleguard Sartura", 531, 1544)
if not mod then return end
mod:RegisterEnableMob(15516, 15984) -- Battleguard Sartura, Sartura's Royal Guard

local addsLeft = 3

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_trigger = "sacred grounds" -- You will be judged for defiling these sacred grounds!  The laws of the Ancients will not be challenged!  Trespassers will be annihilated!\r\n
end
L = mod:GetLocale()

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

	self:BossYell("Engage", L.engage_trigger)
	self:RegisterUnitEvent("UNIT_HEALTH", nil, "target", "focus")

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
	self:UnregisterUnitEvent("UNIT_HEALTH", "target", "focus")
	self:MessageOld(args.spellId, "orange", "long", "25% - ".. args.spellName)
end

function mod:Whirlwind(args)
	self:MessageOld(args.spellId, "red", "alert")
	self:Bar(args.spellId, 15)
end

function mod:WhirlwindOver(args)
	self:MessageOld(args.spellId, "green", nil, CL.over:format(args.spellName))
end

function mod:UNIT_HEALTH(event, unit)
	if self:MobId(self:UnitGUID(unit)) == 15516 then
		local hp = self:GetHealth(unit)
		if hp < 31 then
			self:UnregisterUnitEvent(event, "target", "focus")
			self:MessageOld(8269, "yellow", nil, CL.soon:format(self:SpellName(8269)), false)
		end
	end
end

function mod:AddDies()
	addsLeft = addsLeft - 1
	self:MessageOld("stages", "green", nil, CL.add_remaining:format(addsLeft), false)
end

