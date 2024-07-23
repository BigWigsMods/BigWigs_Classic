--------------------------------------------------------------------------------
-- Module Declaration
--

if not BigWigsLoader.isSeasonOfDiscovery then return end
local mod, CL = BigWigs:NewBoss("The Molten Core", 409)
if not mod then return end
mod:RegisterEnableMob(227939)
mod:SetEncounterID(3018)
mod:SetAllowWin(true)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bossName = "The Molten Core"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"stages",
		{460895, "SAY", "ME_ONLY_EMPHASIZE"}, -- Heart of Cinder
		{460898, "SAY", "ME_ONLY_EMPHASIZE"}, -- Heart of Ash
	}
end

function mod:OnRegister()
	self.displayName = L.bossName
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "HeartOfCinderApplied", 460895)
	--self:Log("SPELL_AURA_REMOVED", "HeartOfCinderRemoved", 460895)
	self:Log("SPELL_AURA_APPLIED", "HeartOfAshApplied", 460898)
	--self:Log("SPELL_AURA_REMOVED", "HeartOfAshRemoved", 460898)
end

function mod:OnEngage()
	self:Message("stages", "cyan", CL.stage:format(1), false)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:HeartOfCinderApplied(args)
	self:TargetMessage(args.spellId, "yellow", args.destName)
	if self:Me(args.destGUID) then
		self:Say(args.spellId, nil, nil, "Heart of Cinder")
	end
end

function mod:HeartOfAshApplied(args)
	self:TargetMessage(args.spellId, "yellow", args.destName)
	if self:Me(args.destGUID) then
		self:Say(args.spellId, nil, nil, "Heart of Ash")
	end
end
