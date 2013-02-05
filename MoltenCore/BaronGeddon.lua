--------------------------------------------------------------------------------
-- Module declaration
--

local mod = BigWigs:NewBoss("Baron Geddon", 696)
if not mod then return end
mod:RegisterEnableMob(12056)
mod.toggleOptions = {{20475, "FLASH", "ICON", "PROXIMITY"}, 19695, 20478, "bosskill"}

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Bomb", 20475)
	self:Log("SPELL_CAST_SUCCESS", "Inferno", 19695)
	self:Log("SPELL_CAST_SUCCESS", "Service", 20478)

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:Death("Win", 12056)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Bomb(args)
	if UnitIsUnit(args.destName, "player") then
		self:LocalMessage(args.spellId, args.spellName, "Personal", args.spellId, "Alarm")
		self:Flash(args.spellId)
		self:OpenProximity(9, args.spellId)
		self:ScheduleTimer(self.CloseProximity, 9, self, args.spellId)
	else
		self:TargetMessage(args.spellId, args.spellName, args.destName, "Attention", args.spellId)
	end
	self:PrimaryIcon(args.spellId, args.destName)
	self:TargetBar(args.spellId, args.spellName, args.destName, 8, args.spellId)
end

function mod:Inferno(args)
	self:Message(args.spellId, args.spellName, "Important", args.spellId, "Long")
	self:Bar(args.spellId, args.spellName, 8, args.spellId)
end

function mod:Service(args)
	self:Bar(args.spellId, args.spellName, 8, args.spellId)
	self:Message(args.spellId, args.spellName, "Urgent", args.spellId)
end

