--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Sapphiron", 533, 1614)
if not mod then return end
mod:RegisterEnableMob(15989)
mod:SetEncounterID(1119)
mod:SetStage(1)

--------------------------------------------------------------------------------
-- Locals
--

local targetCheck = nil
local blockCount = 0
local curseCount = 0
local curseTime = 0
local CheckAirPhase
local isHardMode = false

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L["28524_icon"] = "spell_frost_arcticwinds"
	L.stages_icon = "inv_misc_head_dragon_blue"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		28542, -- Life Drain
		{28522, "SAY"}, -- Ice Bolt
		{28524, "EMPHASIZE", "CASTBAR", "CASTBAR_COUNTDOWN"}, -- Frost Breath
		28547, -- Chill
		"stages",
		"berserk",
	},nil,{
		[28542] = CL.curse, -- Life Drain (Curse)
		[28547] = self:SpellName(26607), -- Chill (Blizzard)
	}
end

local glacialCrashMarker = mod:AddMarkerOption(true, "player", 1, 1219728, 1, 2) -- Glacial Crash
if mod:GetSeason() == 2 then
	function mod:GetOptions()
		return {
			28542, -- Life Drain
			{28522, "SAY"}, -- Ice Bolt
			{28524, "EMPHASIZE", "CASTBAR", "CASTBAR_COUNTDOWN"}, -- Frost Breath
			28547, -- Chill
			{1219728, "SAY", "SAY_COUNTDOWN", "ME_ONLY_EMPHASIZE"}, -- Glacial Crash
			glacialCrashMarker,
			"stages",
			"berserk",
		},nil,{
			[28542] = CL.curse, -- Life Drain (Curse)
			[28547] = self:SpellName(26607), -- Chill (Blizzard)
			[1219728] = CL.soak, -- Glacial Crash (Soak)
		}
	end
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "LifeDrain", 28542)
	self:Log("SPELL_AURA_APPLIED", "LifeDrainApplied", 28542)
	self:Log("SPELL_AURA_REMOVED", "LifeDrainRemoved", 28542)
	self:Log("SPELL_AURA_APPLIED", "IceboltApplied", 28522)
	self:Log("SPELL_CAST_START", "FrostBreathStart", 28524)
	self:Log("SPELL_CAST_SUCCESS", "FrostBreathSuccess", 28524)
	self:Log("SPELL_AURA_APPLIED", "ChillDamage", 28547)
	self:Log("SPELL_PERIODIC_DAMAGE", "ChillDamage", 28547)
	self:Log("SPELL_PERIODIC_MISSED", "ChillDamage", 28547)
	if self:GetSeason() == 2 then
		self:Log("SPELL_CAST_SUCCESS", "GlacialCrash", 1219728)
		self:Log("SPELL_AURA_APPLIED", "GlacialCrashApplied", 1219729, 1219732)
		self:Log("SPELL_AURA_REMOVED", "GlacialCrashRemoved", 1219729, 1219732)
	end
end

function mod:OnEngage()
	blockCount = 0
	curseCount = 0
	curseTime = 0
	targetCheck = nil
	isHardMode = false
	self:SetStage(1)
	self:Berserk(900)
	self:CDBar(28542, 12.5, CL.curse) -- Life Drain
	self:CDBar("stages", 32, CL.stage:format(2), L.stages_icon)
	self:ScheduleTimer(CheckAirPhase, 20)
	if self:GetPlayerAura(1218283) then -- Authority of the Frozen Wastes
		isHardMode = true
		self:CDBar(1219728, 30, CL.soak) -- Glacial Crash
	end
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:LifeDrain(args)
	curseCount = 0
	curseTime = args.time
	self:Message(args.spellId, "orange", CL.curse)
	self:CDBar(args.spellId, 23, CL.curse)
	self:PlaySound(args.spellId, "alert")
end

function mod:LifeDrainApplied()
	curseCount = curseCount + 1
end

function mod:LifeDrainRemoved(args)
	curseCount = curseCount - 1
	if curseCount == 0 then
		self:Message(args.spellId, "green", CL.removed_after:format(CL.curse, args.time-curseTime))
	end
end

function mod:IceboltApplied(args)
	blockCount = blockCount + 1
	self:TargetMessage(args.spellId, "yellow", args.destName, CL.count:format(args.spellName, blockCount))
	if self:Me(args.destGUID) then
		self:Yell(args.spellId, nil, nil, "Icebolt")
	end
end

function CheckAirPhase()
	if not mod:IsEngaged() then return end

	-- No air phase emote in Classic, but Sapphiron drops his target
	-- Find someone targeting him to get a unit token
	local unit = mod:GetUnitIdByGUID(15989)

	if not unit or mod:UnitGUID(unit.."target") then
		-- No one is targeting the boss, or boss still has a target, reset
		targetCheck = nil
		mod:SimpleTimer(CheckAirPhase, 0.5)
	elseif mod:GetHealth(unit) > 0 then -- Prevent firing during the small window of opportunity after death
		if targetCheck then
			-- Boss has had no target for two iterations, fire the air phase trigger
			-- (The original module had a 1s delay between scans, not sure if that matters)
			targetCheck = nil
			mod:SetStage(2)

			mod:StopBar(CL.curse) -- Life Drain
			if isHardMode then
				mod:StopBar(CL.soak) -- Glacial Crash
			end
			mod:StopBar(CL.stage:format(2))

			mod:Message("stages", "cyan", CL.stage:format(2), L.stages_icon)
			mod:PlaySound("stages", "long")
		else
			-- Boss has no target, check one more time to make sure
			targetCheck = true
			mod:SimpleTimer(CheckAirPhase, 0.5)
		end
	end
end

function mod:FrostBreathStart(args) -- Deep Breath
	self:Message(args.spellId, "red", args.spellName, L["28524_icon"])
	self:CastBar(args.spellId, 7, args.spellName, L["28524_icon"])
	self:PlaySound(args.spellId, "warning")
end

function mod:FrostBreathSuccess(args) -- Deep Breath
	blockCount = 0
	self:SetStage(1)
	self:Message("stages", "cyan", CL.stage:format(1), L.stages_icon)

	self:CDBar(28542, 8, CL.curse) -- Life Drain
	if isHardMode then
		self:CDBar(1219728, 8, CL.soak) -- Glacial Crash
	end
	self:CDBar("stages", 72, CL.stage:format(2), L.stages_icon)
	self:ScheduleTimer(CheckAirPhase, 50) -- ~74 until next

	self:PlaySound("stages", "long")
end

do
	local prev = 0
	function mod:ChillDamage(args)
		if self:Me(args.destGUID) and args.time - prev > 3 then
			prev = args.time
			self:PersonalMessage(args.spellId, "aboveyou", self:SpellName(26607)) -- Blizzard
			self:PlaySound(args.spellId, "underyou")
		end
	end
end

do
	local playerList = {}
	function mod:GlacialCrash(args)
		playerList = {}
		self:CDBar(args.spellId, 30, CL.soak)
	end

	function mod:GlacialCrashApplied(args)
		local count = #playerList+1
		playerList[count] = args.destName
		playerList[args.destName] = count -- Set raid marker
		self:TargetsMessage(1219728, "yellow", playerList, 2, CL.soak)
		self:CustomIcon(glacialCrashMarker, args.destName, count)
		if self:Me(args.destGUID) then
			self:Yell(1219728, CL.rticon:format(CL.soak, count), nil, ("Soak ({rt%d})"):format(count))
			self:YellCountdown(1219728, 8, count)
		end
		self:PlaySound(1219728, "warning", nil, args.destName)
	end
end

function mod:GlacialCrashRemoved(args)
	self:CustomIcon(glacialCrashMarker, args.destName)
	if self:Me(args.destGUID) then
		self:CancelYellCountdown(1219728)
	end
end
