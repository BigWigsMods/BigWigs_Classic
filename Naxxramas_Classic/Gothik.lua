--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Gothik the Harvester", 533, 1608)
if not mod then return end
mod:RegisterEnableMob(16060)
mod:SetEncounterID(1109)
mod:SetRespawnTime(13)
mod:SetStage(1)

--------------------------------------------------------------------------------
-- Locals
--

local waveCount = 0
local traineeCount = 1
local deathKnightCount = 1
local riderCount = 1

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.add_death = "Add Death Alert"
	L.add_death_desc = "Alerts when an add dies."

	L.wave = "%d/23: %s"

	L.trainee = "Trainee" -- Unrelenting Trainee NPC 16124
	-- Technically "Deathknight" in classic era but we are using the modern 2 word term
	L.deathKnight = "Death Knight" -- Unrelenting Death Knight NPC 16125
	L.rider = "Rider" -- Unrelenting Rider NPC 16126

	L.stages_icon = "Spell_Magic_LesserInvisibilty"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"stages",
		"adds",
		"add_death",
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "HarvestSoul", 28679)
	self:Death("UnrelentingDeathKnightDies", 16125) -- Unrelenting Death Knight
	self:Death("UnrelentingRiderDies", 16126) -- Unrelenting Rider

	self:Death("Win", 16060)
end

function mod:OnEngage()
	waveCount = 0
	traineeCount = 1
	deathKnightCount = 1
	riderCount = 1
	self:SetStage(1)

	self:Message("stages", "cyan", CL.stage:format(1), false)
	local stage2Msg = CL.stage:format(2)
	self:Bar("stages", 270, stage2Msg, L.stages_icon)
	self:DelayedMessage("stages", 210, "cyan", CL.custom_sec:format(stage2Msg, 60))
	self:DelayedMessage("stages", 240, "cyan", CL.custom_sec:format(stage2Msg, 30))
	self:DelayedMessage("stages", 260, "cyan", CL.custom_sec:format(stage2Msg, 10))

	self:NewTrainee(27)
	self:NewDeathKnight(77)
	self:NewRider(137)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local function Teleport(noMsg) -- 28025 and 28026 are hidden
		mod:ScheduleTimer(Teleport, 20)
		mod:Bar("stages", 20, CL.teleport, L.stages_icon)
		if not noMsg then
			mod:Message("stages", "cyan", CL.teleport, false)
			mod:PlaySound("stages", "info")
		end
	end
	function mod:HarvestSoul(args)
		Teleport(true)
		self:RemoveLog("SPELL_CAST_SUCCESS", args.spellId)
		self:SetStage(2)
		self:RegisterEvent("UNIT_HEALTH")
		self:Message("stages", "cyan", CL.stage:format(2), false)
		self:PlaySound("stages", "long")
	end
end

function mod:UNIT_HEALTH(event, unit)
	if self:MobId(self:UnitGUID(unit)) == 16060 then
		local hp = self:GetHealth(unit)
		if hp > 30 and hp < 35 then
			self:UnregisterEvent(event)
			self:Message("stages", "cyan", CL.soon:format(CL.gate_open), false)
			self:PlaySound("stages", "long")
		elseif hp < 30 then -- too fast!
			self:UnregisterEvent(event)
		end
	end
end

function mod:UnrelentingDeathKnightDies()
	self:Message("add_death", "green", CL.killed:format(L.deathKnight), false)
end

function mod:UnrelentingRiderDies()
	self:Message("add_death", "green", CL.killed:format(L.rider), false)
end

do
	local function waveWarn(color, message, icon)
		waveCount = waveCount + 1
		if waveCount < 24 then
			mod:Message("adds", color, L.wave:format(waveCount, message), icon) -- SetOption::yellow,orange,red::
		end
		if waveCount == 23 then
			mod:StopBar(CL.count:format(L.trainee, traineeCount - 1))
			mod:StopBar(CL.count:format(L.deathKnight, deathKnightCount - 1))
			mod:StopBar(CL.count:format(L.rider, riderCount - 1))
			mod:CancelAllTimers()
		end
	end

	function mod:NewTrainee(timeTrainee)
		self:Bar("adds", timeTrainee, CL.count:format(L.trainee, traineeCount), "Achievement_character_human_male")
		self:ScheduleTimer(waveWarn, timeTrainee - 3, "yellow", CL.custom_sec:format(L.trainee, 3), "Achievement_character_human_male")
		self:ScheduleTimer("NewTrainee", timeTrainee, 20)
		traineeCount = traineeCount + 1
	end

	function mod:NewDeathKnight(timeDK)
		self:Bar("adds", timeDK, CL.count:format(L.deathKnight, deathKnightCount), "Spell_deathknight_frostpresence")
		self:ScheduleTimer(waveWarn, timeDK - 3, "orange", CL.custom_sec:format(L.deathKnight, 3), "Spell_deathknight_frostpresence")
		self:ScheduleTimer("NewDeathKnight", timeDK, 25)
		deathKnightCount = deathKnightCount + 1
	end

	function mod:NewRider(timeRider)
		self:Bar("adds", timeRider, CL.count:format(L.rider, riderCount), "ability_mount_undeadhorse")
		self:ScheduleTimer(waveWarn, timeRider - 3, "red", CL.custom_sec:format(L.rider, 3), "ability_mount_undeadhorse")
		self:ScheduleTimer("NewRider", timeRider, 30)
		riderCount = riderCount + 1
	end
end
