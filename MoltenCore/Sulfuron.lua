--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Sulfuron Harbinger", 409, 1525)
if not mod then return end
mod:RegisterEnableMob(12098, 228436) -- Sulfuron Harbinger, Sulfuron Harbinger (Season of Discovery)
mod:SetEncounterID(669)

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		19779, -- Inspire
		19775, -- Dark Mending
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "DarkMending", 19775)
	self:Log("SPELL_CAST_SUCCESS", "Inspire", 19779)
 end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Inspire(args)
	self:Bar(args.spellId, 10)
	self:Message(args.spellId, "yellow")
end

do
	local prev = 0
	function mod:DarkMending(args)
		local t = GetTime()
		if t - prev > 1 then
			prev = t
			self:Bar(args.spellId, 2)
			self:Message(args.spellId, "red")
		end
	end
end
