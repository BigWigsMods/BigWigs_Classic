--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Lucifron", 409, 1519)
if not mod then return end
mod:RegisterEnableMob(12118)
mod:SetEncounterID(663)

--------------------------------------------------------------------------------
-- Locals
--

local assignMarks = {}
local curseCount = 0
local curseTime = 0

--------------------------------------------------------------------------------
-- Initialization
--

local dominateMindMarker = mod:AddMarkerOption(true, "player", 1, 20604, 1, 2) -- Dominate Mind
function mod:GetOptions()
	return {
		19702, -- Impending Doom
		19703, -- Lucifron's Curse
		20604, -- Dominate Mind
		dominateMindMarker,
	},nil,{
		[19703] = CL.curse, -- Lucifron's Curse (Curse)
		[20604] = CL.mind_control, -- Dominate Mind (Mind Control)
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "ImpendingDoom", 19702)
	self:Log("SPELL_CAST_SUCCESS", "LucifronsCurse", 19703)
	self:Log("SPELL_AURA_APPLIED", "LucifronsCurseApplied", 19703)
	self:Log("SPELL_AURA_REMOVED", "LucifronsCurseRemoved", 19703)
	self:Log("SPELL_CAST_START", "DominateMind", 20604)
	self:Log("SPELL_AURA_APPLIED", "DominateMindApplied", 20604)
	self:Log("SPELL_AURA_REMOVED", "DominateMindRemoved", 20604)
end

function mod:OnEngage()
	assignMarks = {}
	curseCount = 0
	curseTime = 0
	self:CDBar(19702, 7) -- Impending Doom
	self:CDBar(19703, 11, CL.curse) -- Lucifron's Curse
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:ImpendingDoom(args)
	self:CDBar(args.spellId, 20)
	self:Message(args.spellId, "red")
	self:PlaySound(args.spellId, "long")
end

function mod:LucifronsCurse(args)
	curseTime = args.time
	self:CDBar(args.spellId, 20, CL.curse)
	self:Message(args.spellId, "yellow", CL.curse)
	self:PlaySound(args.spellId, "info")
end

function mod:LucifronsCurseApplied(args)
	if self:Player(args.destFlags) then -- Players, not pets
		curseCount = curseCount + 1
	end
end

function mod:LucifronsCurseRemoved(args)
	if self:Player(args.destFlags) then -- Players, not pets
		curseCount = curseCount - 1
		if curseCount == 0 then
			self:Message(args.spellId, "green", CL.removed_after:format(CL.curse, args.time-curseTime))
		end
	end
end

function mod:DominateMind(args)
	if not assignMarks[args.sourceGUID] then -- Each add gets its own marker it applies to players
		assignMarks[args.sourceGUID] = next(assignMarks) and 2 or 1
	end
end

function mod:DominateMindApplied(args)
	self:TargetBar(args.spellId, 15, args.destName, CL.mind_control_short)
	self:TargetMessage(args.spellId, "orange", args.destName, CL.mind_control)
	self:CustomIcon(dominateMindMarker, args.destName, assignMarks[args.sourceGUID])
	self:PlaySound(args.spellId, "warning")
end

function mod:DominateMindRemoved(args)
	self:CustomIcon(dominateMindMarker, args.destName)
	self:StopBar(CL.mind_control_short, args.destName)
end
