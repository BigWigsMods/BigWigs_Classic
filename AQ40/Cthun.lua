--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("C'Thun", 531, 1551)
if not mod then return end
mod:RegisterEnableMob(15727, 15589) -- C'Thun, Eye of C'Thun
mod:SetEncounterID(717)
mod:SetStage(1)

--------------------------------------------------------------------------------
-- Locals
--

local digestiveAcidList = {}
local isInfoOpen = false

local timeP1GlareStart = 48 -- delay for first dark glare from engage onwards
local timeP1Glare = 86 -- interval for dark glare
local timeP1GlareDuration = 40 -- duration of dark glare

local firstGlare = nil
local firstWarning = nil
local lastKnownCThunTarget = nil

local timerDarkGlare = nil
local timerGroupWarning = nil

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.claw_tentacle = "Claw Tentacle"
	L.claw_tentacle_desc = "Timers for the claw tentacle."
	L.claw_tentacle_icon = "inv_misc_monstertail_06"

	L.giant_claw_tentacle = "Giant Claw"
	L.giant_claw_tentacle_desc = "Timers for the giant claw tentacle."
	L.giant_claw_tentacle_icon = "inv_misc_monstertail_06"

	L.eye_tentacles = "Eye Tentacles"
	L.eye_tentacles_desc = "Timers for the 8 eye tentacles."
	L.eye_tentacles_icon = "spell_shadow_siphonmana"

	L.giant_eye_tentacle = "Giant Eye"
	L.giant_eye_tentacle_desc = "Timers for the giant eye tentacle."
	L.giant_eye_tentacle_icon = "spell_shadow_evileye"

	L.weakened = CL.weakened
	L.weakened_desc = "Warn for Weakened state."
	L.weakened_icon = "ability_rogue_findweakness"
	L.weakenedtrigger = "%s is weakened"

	L.dark_glare_message = "%s: %s (Group %s)" -- Dark Glare: PLAYERNAME (Group 1)
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"stages",
		"eye_tentacles",
		{26029, "CASTBAR"}, -- Dark Glare
		"claw_tentacle",
		{26134, "ICON", "SAY", "ME_ONLY_EMPHASIZE"}, -- Eye Beam
		{26476, "INFOBOX"}, -- Digestive Acid
		"giant_claw_tentacle",
		"giant_eye_tentacle",
		{"weakened", "COUNTDOWN", "EMPHASIZE"},
	},{
		[26029] = CL.stage:format(1),
		[26476] = CL.stage:format(2),
	}
end

function mod:OnBossEnable()
	self:RegisterEvent("UNIT_TARGET")
	self:Log("SPELL_CAST_SUCCESS", "Birth", 26586)
	self:Log("SPELL_CAST_START", "EyeBeam", 26134, self:Vanilla() and 341722 or 32950)
	self:Log("SPELL_AURA_APPLIED", "DigestiveAcidApplied", 26476)
	self:Log("SPELL_AURA_APPLIED_DOSE", "DigestiveAcidAppliedDose", 26476)
	self:Log("SPELL_AURA_REMOVED", "DigestiveAcidRemoved", 26476)
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
	self:RegisterMessage("BigWigs_BossComm")

	self:Death("EyeOfCThunKilled", 15589)
	self:Death("Win", 15727)
end

function mod:OnEngage()
	lastKnownCThunTarget = nil
	firstGlare = true
	firstWarning = true
	digestiveAcidList = {}
	isInfoOpen = false
	self:SetStage(1)

	self:Message("stages", "cyan", CL.stage:format(1), false)

	self:Bar(26029, timeP1GlareStart) -- Dark Glare
	self:DelayedMessage(26029, timeP1GlareStart - 5, "orange", CL.custom_sec:format(self:SpellName(26029), 5)) -- Dark Glare in 5 sec
	self:DelayedMessage(26029, timeP1GlareStart, "red", 26029, 26029) -- Dark Glare

	timerDarkGlare = self:ScheduleTimer("DarkGlare", timeP1GlareStart)
	timerGroupWarning = self:ScheduleTimer("GroupWarning", timeP1GlareStart - 3)

	self:Bar("claw_tentacle", 8, L.claw_tentacle, L.claw_tentacle_icon)
	self:Bar("eye_tentacles", 45, L.eye_tentacles, L.eye_tentacles_icon)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:UNIT_TARGET(_, unit)
	local guid = self:UnitGUID(unit)
	local npcId = self:MobId(guid)
	if npcId == 15589 then
		local unitTarget = unit.."target"
		local guid = self:UnitGUID(unitTarget)
		if guid then
			lastKnownCThunTarget = guid
		end
	else
		guid = self:UnitGUID(unit.."target")
		npcId = self:MobId(guid)
		if npcId == 15589 then
			local unitTarget = unit.."targettarget"
			local guid = self:UnitGUID(unitTarget)
			if guid then
				lastKnownCThunTarget = guid
			end
		end
	end
end

do
	local prev = 0
	function mod:Birth(args)
		local npcId = self:MobId(args.sourceGUID)
		if npcId == 15725 then -- Claw Tentacle
			self:Bar("claw_tentacle", 8, L.claw_tentacle, L.claw_tentacle_icon)
		elseif npcId == 15726 and args.time-prev > 5 then -- Eye Tentacles
			prev = args.time
			self:Bar("eye_tentacles", self:GetStage() == 2 and 30 or 45, L.eye_tentacles, L.eye_tentacles_icon)
			self:Message("eye_tentacles", "red", L.eye_tentacles, L.eye_tentacles_icon)
			self:PlaySound("eye_tentacles", "alarm")
		elseif npcId == 15728 then -- Giant Claw Tentacle
			self:Bar("giant_claw_tentacle", 60, L.giant_claw_tentacle, L.giant_claw_tentacle_icon)
			self:Message("giant_claw_tentacle", "red", L.giant_claw_tentacle, L.giant_claw_tentacle_icon)
			self:PlaySound("giant_claw_tentacle", "alert")
		elseif npcId == 15334 then -- Giant Eye Tentacle
			self:Bar("giant_eye_tentacle", 60, L.giant_eye_tentacle, L.giant_eye_tentacle_icon)
			self:Message("giant_eye_tentacle", "red", L.giant_eye_tentacle, L.giant_eye_tentacle_icon)
			self:PlaySound("giant_eye_tentacle", "warning")
		end
	end
end

do
	local function printTarget(self, name, guid)
		self:PrimaryIcon(26134, name)
		if self:Me(guid) then
			self:PersonalMessage(26134)
			self:Say(26134, nil, nil, "Eye Beam")
			self:PlaySound(26134, "warning", nil, name)
		end
	end

	function mod:EyeBeam(args)
		self:GetUnitTarget(printTarget, 0.1, args.sourceGUID)
	end
end

function mod:CHAT_MSG_MONSTER_EMOTE(_, msg)
	if msg:find(L.weakenedtrigger, nil, true) then
		self:Sync("CThunWeakened")
	end
end

function mod:EyeOfCThunKilled()
	self:SetStage(2)

	self:StopBar(L.claw_tentacle)

	self:Message("stages", "cyan", CL.stage:format(2), false)
	self:Bar("giant_claw_tentacle", 12.3, L.giant_claw_tentacle, L.giant_claw_tentacle_icon)
	self:Bar("eye_tentacles", 41.3, L.eye_tentacles, L.eye_tentacles_icon)
	self:Bar("giant_eye_tentacle", 43.1, L.giant_eye_tentacle, L.giant_eye_tentacle_icon)

	local darkGlare = self:SpellName(26029)
	self:StopBar(darkGlare) -- Dark Glare
	self:StopBar(CL.cast:format(darkGlare)) -- Cast: Dark Glare
	self:CancelDelayedMessage(darkGlare) -- Dark Glare
	self:CancelDelayedMessage(CL.custom_sec:format(darkGlare, 5)) -- Dark Glare in 5 sec
	self:CancelDelayedMessage(CL.over:format(darkGlare)) -- Dark Glare Over

	-- cancel the repeaters
	self:CancelTimer(timerDarkGlare)
	self:CancelTimer(timerGroupWarning)

	self:PlaySound("stages", "long")
end

do
	local times = {
		["CThunWeakened"] = 0,
	}
	function mod:BigWigs_BossComm(_, msg)
		if times[msg] then
			local t = GetTime()
			if t-times[msg] > 5 then
				times[msg] = t
				self[msg](self)
			end
		end
	end
end

function mod:CThunWeakened()
	self:StopBar(L.eye_tentacles)
	self:StopBar(L.giant_claw_tentacle)
	self:StopBar(L.giant_eye_tentacle)

	self:Message("weakened", "green", CL.duration:format(CL.weakened, 45), L.weakened_icon)
	self:Bar("weakened", 45, L.weakened, L.weakened_icon)

	--self:Bar("giant_claw_tentacle", 12.3, L.giant_claw_tentacle, L.giant_claw_tentacle_icon)
	self:Bar("eye_tentacles", 70, L.eye_tentacles, L.eye_tentacles_icon)
	--self:Bar("giant_eye_tentacle", 43.1, L.giant_eye_tentacle, L.giant_eye_tentacle_icon)

	self:PlaySound("weakened", "long")
end

function mod:GroupWarning()
	if lastKnownCThunTarget then
		for unit in self:IterateGroup() do
			local guid = self:UnitGUID(unit)
			if lastKnownCThunTarget == guid then
				local name = self:UnitName(unit)
				if not IsInRaid() then
					self:Message(26029, "red", L.dark_glare_message:format(self:SpellName(26029), self:ColorName(name), 1), 26029)
					self:PlaySound("stages", "alert")
				else
					for i = 1, 40 do
						local n, _, group = GetRaidRosterInfo(i)
						if name == n then
							self:Message(26029, "red", L.dark_glare_message:format(self:SpellName(26029), self:ColorName(name), group), 26029)
							self:PlaySound("stages", "alert")
							break
						end
					end
				end
				break
			end
		end
	end
	if firstWarning then
		firstWarning = nil
		self:CancelTimer(timerGroupWarning)
		timerGroupWarning = self:ScheduleRepeatingTimer("GroupWarning", timeP1Glare)
	end
end

function mod:DarkGlare()
	self:CastBar(26029, timeP1GlareDuration)
	self:Bar(26029, timeP1Glare) -- Dark Glare
	local darkGlare = self:SpellName(26029)
	self:DelayedMessage(26029, timeP1Glare - .1, "red", CL.incoming:format(darkGlare), 26029) -- Dark Glare
	self:DelayedMessage(26029, timeP1Glare - 5, "orange", CL.custom_sec:format(darkGlare, 5)) -- Dark Glare in 5 sec
	self:DelayedMessage(26029, timeP1GlareDuration, "red", CL.over:format(darkGlare)) -- Dark Glare Over
	if firstGlare then
		firstGlare = nil
		self:CancelTimer(timerDarkGlare)
		timerDarkGlare = self:ScheduleRepeatingTimer("DarkGlare", timeP1Glare)
	end
end

function mod:DigestiveAcidApplied(args)
	if not isInfoOpen then
		isInfoOpen = true
		self:OpenInfo(args.spellId, args.spellName)
	end
	digestiveAcidList[args.destName] = 1
	self:SetInfoByTable(args.spellId, digestiveAcidList)
end

function mod:DigestiveAcidAppliedDose(args)
	if self:Me(args.destGUID) and args.amount % 2 == 0 then
		self:StackMessage(args.spellId, "blue", args.destName, args.amount, 6)
		if args.amount >= 6 then
			self:PlaySound(args.spellId, "warning", nil, args.destName)
		end
	end
	digestiveAcidList[args.destName] = args.amount
	self:SetInfoByTable(args.spellId, digestiveAcidList)
end

function mod:DigestiveAcidRemoved(args)
	digestiveAcidList[args.destName] = nil
	if next(digestiveAcidList) then
		self:SetInfoByTable(args.spellId, digestiveAcidList)
	elseif isInfoOpen then
		isInfoOpen = false
		self:CloseInfo(args.spellId)
	end
end
