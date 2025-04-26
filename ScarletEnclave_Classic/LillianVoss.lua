--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Lillian Voss", 2856)
if not mod then return end
mod:RegisterEnableMob(243021)
mod:SetEncounterID(3190)
mod:SetRespawnTime(15)
mod:SetAllowWin(true)

--------------------------------------------------------------------------------
-- Locals
--

local markerCount = 0
local directions = { -- Clockwise
	CL.top_right,
	CL.bottom_right,
	CL.bottom_left,
	CL.top_left,
}

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bossName = "Lillian Voss"
	L.unstableConcoctionNote = ("%s/%s/%s/%s"):format(directions[1], directions[2], directions[3], directions[4])
end

--------------------------------------------------------------------------------
-- Initialization
--

local unstableConcoctionMarker = mod:AddMarkerOption(true, "player", 1, 1233849, 1, 2, 3, 4) -- Unstable Concoction
function mod:GetOptions()
	return {
		1233847, -- Scarlet Grasp
		1232192, -- Debilitate
		{1233901, "SAY", "SAY_COUNTDOWN", "ME_ONLY_EMPHASIZE"}, -- Noxious Poison
		{1233849, "SAY", "SAY_COUNTDOWN", "ME_ONLY_EMPHASIZE"}, -- Unstable Concoction
		unstableConcoctionMarker,
		{1233883, "EMPHASIZE"}, -- Intoxicating Venom
		{1234540, "EMPHASIZE"}, -- Ignite
		"berserk",
	},nil,{
		[1233847] = CL.pull_in, -- Scarlet Grasp (Pull In)
		[1233901] = CL.poison, -- Noxious Poison (Poison)
		[1233849] = L.unstableConcoctionNote, -- Unstable Concoction (Top Right/Bottom Right/Bottom Left/Top Left)
		[1233883] = CL.keep_moving, -- Intoxicating Venom (Keep moving)
		[1234540] = CL.spread, -- Ignite (Spread)
	}
end

function mod:OnRegister()
	self.displayName = L.bossName
	self:SetSpellRename(1233847, CL.pull_in) -- Scarlet Grasp (Pull In)
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "ScarletGrasp", 1233847)
	self:Log("SPELL_AURA_APPLIED", "DebilitateApplied", 1232192)
	self:Log("SPELL_AURA_APPLIED", "NoxiousPoisonApplied", 1233901)
	self:Log("SPELL_AURA_REMOVED", "NoxiousPoisonRemoved", 1233901)
	self:Log("SPELL_CAST_SUCCESS", "UnstableConcoction", 1233849)
	self:Log("SPELL_AURA_APPLIED", "UnstableConcoctionApplied", 1233849)
	self:Log("SPELL_AURA_REMOVED", "UnstableConcoctionRemoved", 1233849)
	self:Log("SPELL_AURA_APPLIED", "IntoxicatingVenomApplied", 1233883)
	self:Log("SPELL_CAST_SUCCESS", "Ignite", 1234540)
end

function mod:OnEngage()
	markerCount = 0
	self:CDBar(1233847, 34, CL.pull_in) -- Scarlet Grasp
	self:Berserk(240)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:ScarletGrasp(args)
	self:CDBar(args.spellId, 30, CL.pull_in)
	self:Message(args.spellId, "red", CL.extra:format(args.spellName, CL.pull_in))
	self:PlaySound(args.spellId, "long")
end

function mod:DebilitateApplied(args)
	self:TargetMessage(1232192, "orange", args.destName)
end

function mod:NoxiousPoisonApplied(args)
	if self:Me(args.destGUID) then
		self:PersonalMessage(args.spellId, nil, CL.poison)
		self:Say(args.spellId, CL.poison, nil, "Poison")
		self:SayCountdown(args.spellId, 8)
		self:PlaySound(args.spellId, "alarm", nil, args.destName)
	end
end

function mod:NoxiousPoisonRemoved(args)
	if self:Me(args.destGUID) then
		self:CancelSayCountdown(args.spellId)
	end
end

function mod:UnstableConcoction()
	markerCount = 0
end

do
	local englishDirections = { -- Clockwise
		"Top Right",
		"Bottom Right",
		"Bottom Left",
		"Top Left",
	}
	function mod:UnstableConcoctionApplied(args)
		markerCount = markerCount + 1
		self:CustomIcon(unstableConcoctionMarker, args.destName, markerCount)
		if self:Me(args.destGUID) then
			self:PersonalMessage(args.spellId, false, CL.you_icon:format(directions[markerCount], markerCount))
			self:Say(args.spellId, CL.rticon:format(directions[markerCount], markerCount), nil, ("%s ({rt%d})"):format(englishDirections[markerCount], markerCount))
			self:SayCountdown(args.spellId, 7, markerCount)
			self:PlaySound(args.spellId, "alert", nil, args.destName)
		end
	end
end

function mod:UnstableConcoctionRemoved(args)
	if self:Me(args.destGUID) then
		self:CancelSayCountdown(args.spellId)
	end
	self:CustomIcon(unstableConcoctionMarker, args.destName)
end

do
	local prev = 0
	local function KeepMoving()
		if mod:IsEngaged() then
			mod:Message(1233883, "blue", CL.keep_moving)
			mod:PlaySound(1233883, "warning")
		end
	end
	local function StopMoving()
		if mod:IsEngaged() then
			mod:Message(1233883, "green", CL.safe_to_stop, nil, true) -- Disable emphasize
		end
	end
	function mod:IntoxicatingVenomApplied(args)
		if args.time - prev > 17 then
			prev = args.time
			KeepMoving()
			self:SimpleTimer(KeepMoving, 8) -- Midway reminder
			self:SimpleTimer(StopMoving, 15) -- Safe
		end
	end
end

function mod:Ignite(args)
	self:Message(args.spellId, "yellow", CL.spread)
	self:PlaySound(args.spellId, "info")
end
