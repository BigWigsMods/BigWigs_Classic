--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Mason the Echo", 2856)
if not mod then return end
mod:RegisterEnableMob(241021)
mod:SetEncounterID(3197)
mod:SetAllowWin(true)

--------------------------------------------------------------------------------
-- Locals
--

local nextTidal = 75

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bossName = "Mason the Echo"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		1231592, -- Drowning Shallows
		1231585, -- Tidal Force
		"berserk",
	}
end

function mod:OnRegister()
	self.displayName = L.bossName
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "DrowningShallows", 1231592)
	self:Log("SPELL_AURA_APPLIED", "TidalForceApplied", 1231585)
	self:Log("SPELL_AURA_REMOVED", "TidalForceRemoved", 1231585)
end

function mod:OnEngage()
	nextTidal = 75
	self:Berserk(360)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:DrowningShallows(args)
	self:Message(args.spellId, "orange")
	self:PlaySound(args.spellId, "alert")
end

do
	local appliedTime = 0
	function mod:TidalForceApplied(args)
		appliedTime = args.time
		self:Message(args.spellId, "red", CL.percent:format(nextTidal, args.spellName))
		nextTidal = nextTidal - 25
		self:Bar(args.spellId, 60)
		self:PlaySound(args.spellId, "long")
	end

	function mod:TidalForceRemoved(args)
		self:StopBar(args.spellName)
		self:Message(args.spellId, "cyan", CL.removed_after:format(args.spellName, args.time-appliedTime))
	end
end
