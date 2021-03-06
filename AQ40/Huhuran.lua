
--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Princess Huhuran", 531, 1546)
if not mod then return end
mod:RegisterEnableMob(15509)

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		26180, -- Wyvern Sting
		26051, -- Enrage
		"berserk",
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "WyvernSting", 26180)
	self:Log("SPELL_AURA_APPLIED", "WyvernStingApplied", 26180)
	self:Log("SPELL_AURA_APPLIED", "Enrage", 26051)
	self:Log("SPELL_AURA_APPLIED", "BerserkApplied", 26068)

	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterUnitEvent("UNIT_HEALTH", nil, "target", "focus")

	self:Death("Win", 15509)
end

function mod:OnEngage()
	self:StartWipeCheck()
	self:Berserk(300)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:WyvernSting(args)
	self:CDBar(args.spellId, 25) -- Can randomly be way higher than 25
	self:DelayedMessage(args.spellId, 23, "green", CL.soon:format(args.spellName))
end

do
	local stingTbl = mod:NewTargetList()
	function mod:WyvernStingApplied(args)
		stingTbl[#stingTbl+1] = args.destName
		if #stingTbl == 1 then
			self:ScheduleTimer("TargetMessageOld", 1, args.spellId, stingTbl, "red") -- Can take a while to apply to everyone if very spread out (travel time)
		end
	end
end

function mod:Enrage(args)
	self:MessageOld(args.spellId, "yellow", self:Dispeller("enrage", true) and "warning")
	self:CDBar(args.spellId, 14.5)
end

function mod:BerserkApplied(args)
	self:UnregisterUnitEvent("UNIT_HEALTH", "target", "focus")

	-- Cancel Berserk
	local berserk, format = self:SpellName(26662), string.format
	self:StopBar(berserk)
	self:CancelDelayedMessage(format(CL.custom_min, berserk, 2))
	self:CancelDelayedMessage(format(CL.custom_min, berserk, 1))
	self:CancelDelayedMessage(format(CL.custom_sec, berserk, 30))
	self:CancelDelayedMessage(format(CL.custom_sec, berserk, 10))
	self:CancelDelayedMessage(format(CL.custom_sec, berserk, 5))
	self:CancelDelayedMessage(format(CL.custom_end, self.displayName, berserk))

	self:MessageOld("berserk", "orange", nil, "30% - ".. args.spellName)
end

function mod:UNIT_HEALTH(event, unit)
	if self:MobId(self:UnitGUID(unit)) == 15509 then
		local hp = UnitHealth(unit) / UnitHealthMax(unit) * 100
		if hp < 36  then
			self:UnregisterUnitEvent(event, "target", "focus")
			self:MessageOld("berserk", "red", nil, CL.soon:format(self:SpellName(26662)), false)
		end
	end
end
