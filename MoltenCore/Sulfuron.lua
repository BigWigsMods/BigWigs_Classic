--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Sulfuron Harbinger", 409, 1525)
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
		19778, -- Demoralizing Shout
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "Inspire", 19779)
	self:Log("SPELL_CAST_SUCCESS", "DemoralizingShout", 19778)
	self:Log("SPELL_CAST_START", "DarkMending", 19775)
 end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Inspire(args)
	local icon = self:GetIconTexture(self:GetIcon(args.destRaidFlags))
	if icon then
		self:Bar(args.spellId, 10, CL.other:format(args.spellName, icon))
		self:Message(args.spellId, "yellow", CL.other:format(args.spellName, icon..args.destName))
	else
		self:Bar(args.spellId, 10)
		self:Message(args.spellId, "yellow", CL.other:format(args.spellName, args.destName))
	end
	self:PlaySound(args.spellId, "info")
end

function mod:DemoralizingShout(args)
	self:Message(args.spellId, "orange")
	self:PlaySound(args.spellId, "alarm")
end

function mod:DarkMending(args)
	local isPossible, isReady = self:Interrupter(args.sourceGUID)
	if isPossible then
		self:Message(args.spellId, "red")
		if isReady then
			self:PlaySound(args.spellId, "alert")
		end
	end
end
