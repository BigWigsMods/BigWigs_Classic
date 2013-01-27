--------------------------------------------------------------------------------
-- Module declaration
--

local mod = BigWigs:NewBoss("Gehennas", 696)
if not mod then return end
mod:RegisterEnableMob(12259)
mod.toggleOptions = {19716, {19717, "FLASHSHAKE"}, "bosskill"}

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.curse_warning = "Curse in 5sec"
	L.fire_you = "Rain of Fire on YOU!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "Curse", 19716)
	self:Log("SPELL_AURA_APPLIED", "Fire", 19717)

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:Death("Win", 12259)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Curse(_, spellId, _, _, spellName)
	self:Bar(spellId, spellName, 30, spellId)
	self:Message(spellId, spellName, "Urgent", spellId)
	self:DelayedMessage(spellId, 25, L["curse_warning"], "Attention")
end

function mod:Fire(player, spellId)
	if UnitIsUnit(player, "player") then
		self:FlashShake(spellId)
		self:LocalMessage(spellId, L["fire_you"], "Personal", spellId, "Alarm")
	end
end

