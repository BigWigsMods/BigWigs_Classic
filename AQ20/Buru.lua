
--------------------------------------------------------------------------------
-- Module declaration
--

local mod = BigWigs:NewBoss("Buru the Gorger", 717, 1540)
if not mod then return end
mod:RegisterEnableMob(15370)

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{157168, "ICON"}, -- Fixate. Totally fake randomly chosen spell with appropriate description and icon to avoid localization.
	}
end

function mod:OnBossEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")

	self:Death("Win", 15370)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:CHAT_MSG_MONSTER_EMOTE(_, _, unit, _, _, player)
	if unit == L.bossName then
		self:TargetMessage(157168, player, "Attention")
		self:PrimaryIcon(157168, player)
	end
end

