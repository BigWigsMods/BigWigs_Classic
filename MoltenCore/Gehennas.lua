--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Gehennas", 409, 1521)
if not mod then return end
mod:RegisterEnableMob(12259)
mod:SetEncounterID(665)

--------------------------------------------------------------------------------
-- Locals
--

local curseCount = 0
local curseTime = 0

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		19716, -- Gehennas' Curse
		19717, -- Rain of Fire
	},nil,{
		[19716] = CL.curse, -- Gehennas' Curse (Curse)
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "GehennasCurse", 19716)
	self:Log("SPELL_AURA_APPLIED", "GehennasCurseApplied", 19716)
	self:Log("SPELL_AURA_REMOVED", "GehennasCurseRemoved", 19716)
	self:Log("SPELL_AURA_APPLIED", "RainOfFire", 19717)
end

function mod:OnEngage()
	curseCount = 0
	curseTime = 0
	self:CDBar(19716, 6, CL.curse) -- Gehennas' Curse
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:GehennasCurse(args)
	curseTime = args.time
	self:CDBar(args.spellId, 27, CL.curse) -- 27-37
	self:Message(args.spellId, "orange", CL.curse)
end

function mod:GehennasCurseApplied(args)
	if self:Player(args.destFlags) then -- Players, not pets
		curseCount = curseCount + 1
	end
end

function mod:GehennasCurseRemoved(args)
	if self:Player(args.destFlags) then -- Players, not pets
		curseCount = curseCount - 1
		if curseCount == 0 then
			self:Message(args.spellId, "green", CL.removed_after:format(CL.curse, args.time-curseTime))
		end
	end
end

function mod:RainOfFire(args)
	if self:Me(args.destGUID) then
		self:PersonalMessage(args.spellId, "aboveyou")
		self:PlaySound(args.spellId, "underyou")
	end
end
