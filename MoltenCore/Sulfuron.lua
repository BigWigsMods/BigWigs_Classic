
--------------------------------------------------------------------------------
-- Module declaration
--

local mod = BigWigs:NewBoss("Sulfuron Harbinger", 696)
if not mod then return end
mod:RegisterEnableMob(12098)
mod.toggleOptions = {19779, 19775}

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.bossName = "Sulfuron Harbinger"
end
L = mod:GetLocale()
mod.displayName = L.bossName

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT", "CheckBossStatus")

	self:Log("SPELL_CAST_START", "SulfuronHeal", 19775)
	self:Log("SPELL_CAST_SUCCESS", "Inspire", 19779)

	self:Death("Win", 12098)
 end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Inspire(args)
	self:Bar(args.spellId, 10)
	self:Message(args.spellId, "Attention")
end

do
	local prev = 0
	function mod:SulfuronHeal(args)
		local t = GetTime()
		if t - prev > 1 then
			prev = t
			self:Bar(args.spellId, 2)
			self:Message(args.spellId, "Important")
		end
	end
end

