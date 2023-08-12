
--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Baron Geddon", 409, 1524)
if not mod then return end
mod:RegisterEnableMob(12056)
mod:SetEncounterID(668)

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{20475, "FLASH", "ICON", "PROXIMITY", "SAY"}, -- Living Bomb
		19695, -- Inferno
		20478, -- Armageddon
		19659, -- Ignite Mana
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "LivingBomb", 20475)
	self:Log("SPELL_AURA_REMOVED", "LivingBombRemoved", 20475)
	self:Log("SPELL_CAST_SUCCESS", "Inferno", 19695)
	self:Log("SPELL_CAST_SUCCESS", "Armageddon", 20478)
	self:Log("SPELL_CAST_SUCCESS", "IgniteMana", 19659)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:LivingBomb(args)
	if self:Me(args.destGUID) then
		self:Flash(20475)
		self:OpenProximity(20475, 9)
		self:Say(20475)
	else
		self:OpenProximity(20475, 9, args.destName)
	end
	self:TargetMessage(20475, "blue", args.destName)
	if self:Me(args.destGUID) then
		self:PlaySound(20475, "alarm")
	end
	self:PrimaryIcon(20475, args.destName)
	self:TargetBar(20475, 8, args.destName)
end

function mod:LivingBombRemoved(args)
	self:CloseProximity(20475)
end

function mod:Inferno(args)
	self:Message(19695, "red")
	self:PlaySound(19695, "long")
	self:Bar(19695, 8)
end

function mod:Armageddon(args)
	self:Bar(20478, 8)
	self:Message(20478, "orange")
end

function mod:IgniteMana(args)
	-- first cast takes 7-19s, so we skip that
	self:Bar(19659, 27)
	self:Message(19659, "orange")
	self:DelayedMessage(19659, 22, "red", CL.custom_sec:format(self:SpellName(19659), 5), false, "alert")
end
