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
	if self:Me(args.destGUID) then
		self:Flash(args.spellId)
		self:OpenProximity(args.spellId, 9)
		self:ScheduleTimer("CloseProximity", 8.5, args.spellId)
	else
		self:TargetMessage(args.spellId, args.destName, "Personal", "Alarm")
	end
	self:PrimaryIcon(args.spellId, args.destName)
	self:TargetBar(args.spellId, 8, args.destName)
end

function mod:Inferno(args)
	self:Message(args.spellId, "Important", "Long")
	self:Bar(args.spellId, 8)
end

function mod:Service(args)
	self:Bar(args.spellId, 8)
	self:Message(args.spellId, "Urgent")
end

