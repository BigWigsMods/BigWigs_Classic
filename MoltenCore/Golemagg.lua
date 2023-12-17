--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Golemagg the Incinerator", 409, 1526)
if not mod then return end
mod:RegisterEnableMob(11988)
mod:SetEncounterID(670)

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		13880, -- Magma Splash
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED_DOSE", "MagmaSplashApplied", 13880)

	self:Death("Win", 11988)
 end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:MagmaSplashApplied(args)
	if self:Player(args.destFlags) and args.amount >= 3 then -- Players, not pets
		self:StackMessage(args.spellId, "purple", args.destName, args.amount, 3)
		if self:Me(args.destGUID) then
			self:PlaySound(args.spellId, "info")
		end
	end
end
