--------------------------------------------------------------------------------
-- Module declaration
--

local mod = BigWigs:NewBoss("Baron Geddon", 696)
if not mod then return end
mod:RegisterEnableMob(12056)
mod.toggleOptions = {{20475, "FLASHSHAKE", "ICON"}, 19695, 20478, "proximity", "bosskill"}

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

function mod:Bomb(player, spellId, _, _, spellName)
	if UnitIsUnit(player, "player") then
		self:LocalMessage(spellId, spellName, "Personal", spellId, "Alarm")
		self:FlashShake(spellId)
		self:OpenProximity(9)
		self:ScheduleTimer(self.CloseProximity, 9, self)
	else
		self:TargetMessage(spellId, spellName, player, "Attention", spellId)
	end
	self:PrimaryIcon(spellId, player)
	self:Bar(spellId, spellName..": "..player, 8, spellId)
end

function mod:Inferno(_, spellId, _, _, spellName)
	self:Message(spellId, spellName, "Important", spellId, "Long")
	self:Bar(spellId, spellName, 8, spellId)
end

function mod:Service(_, spellId, _, _, spellName)
	self:Bar(spellId, spellName, 8, spellId)
	self:Message(spellId, spellName, "Urgent", spellId)
end

