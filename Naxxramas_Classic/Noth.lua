--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Noth the Plaguebringer", 533, 1604)
if not mod then return end
mod:RegisterEnableMob(15954)
mod:SetEncounterID(1117)
mod:SetStage(1)

--------------------------------------------------------------------------------
-- Locals
--

local timeroom = 90
local timebalcony = 70
local wave1time = 10
local wave2time = 41
local waveCount = 1
local curseCount = 0

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale()
if L then
	L.adds_yell_trigger = "Rise, my soldiers" -- Rise, my soldiers! Rise and fight once more!
	L.adds_icon = "inv_misc_bone_dwarfskull_01"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"stages",
		"adds",
		29212, -- Cripple
		29213, -- Curse of the Plaguebringer
		29214, -- Wrath of the Plaguebringer
		29208, -- Blink
	},nil,{
		[29213] = CL.curse, -- Curse of the Plaguebringer (Curse)
		[29214] = CL.explosion, -- Wrath of the Plaguebringer (Explosion)
	}
end

function mod:OnBossEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")

	self:Log("SPELL_AURA_APPLIED", "Cripple", 29212)
	self:Log("SPELL_CAST_SUCCESS", "CurseOfThePlaguebringer", 29213)
	self:Log("SPELL_AURA_APPLIED", "CurseOfThePlaguebringerApplied", 29213)
	self:Log("SPELL_DISPEL", "CurseOfThePlaguebringerDispelled", "*")
	self:Log("SPELL_AURA_APPLIED", "WrathOfThePlaguebringerApplied", 29214)
	self:Log("SPELL_CAST_SUCCESS", "Blink", 29208, 29209, 29210, 29211)

	self:Death("Win", 15954)
end

function mod:OnEngage()
	timeroom = 90
	timebalcony = 70
	waveCount = 1
	curseCount = 0
	self:SetStage(1)

	self:CDBar(29213, 9, CL.curse) -- Curse of the Plaguebringer
	self:CDBar("adds", 14, CL.count:format(CL.adds, waveCount), L.adds_icon) -- Adds

	self:Message("stages", "cyan", CL.stage:format(1), false)
	self:DelayedMessage("stages", timeroom - 10, "cyan", CL.custom_sec:format(CL.stage:format(2), 10))
	self:Bar("stages", timeroom, CL.stage:format(2), "Spell_Magic_LesserInvisibilty")
	self:ScheduleTimer("TeleportToBalcony", timeroom)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local function NextAdds()
		mod:Message("adds", "orange", CL.count:format(CL.adds, waveCount), L.adds_icon)
		mod:PlaySound("adds", "info")
		waveCount = waveCount + 1
		if mod:GetStage() == 1 then
			mod:CDBar("adds", 32, CL.count:format(CL.adds, waveCount), L.adds_icon) -- 30~42
		end
	end
	function mod:CHAT_MSG_MONSTER_YELL(_, msg)
		if msg:find(L.adds_yell_trigger, nil, true) then
			self:Bar("adds", {5, waveCount == 1 and 15 or 33}, CL.count:format(CL.adds, waveCount), L.adds_icon)
			self:ScheduleTimer(NextAdds, 5)
		end
	end
end

function mod:Cripple(args)
	if self:Me(args.destGUID) then
		self:PersonalMessage(args.spellId)
	end
end

function mod:CurseOfThePlaguebringer(args)
	curseCount = 0
	self:Message(args.spellId, "red", CL.curse)
	self:CDBar(args.spellId, 51.7, CL.curse)
	self:Bar(29214, 10, CL.explosion) -- Wrath of the Plaguebringer
	self:PlaySound(args.spellId, "alarm")
end

function mod:CurseOfThePlaguebringerApplied(args)
	curseCount = curseCount + 1
end

function mod:CurseOfThePlaguebringerDispelled(args)
	if args.extraSpellName == self:SpellName(29213) then
		curseCount = curseCount - 1
		if curseCount == 0 then
			self:StopBar(CL.explosion)
			self:Message(29213, "green", CL.removed:format(CL.curse))
		end
	end
end

do
	local prev = 0
	function mod:WrathOfThePlaguebringerApplied(args)
		if args.time - prev > 10 then
			prev = args.time
			self:Message(args.spellId, "red", CL.explosion)
			self:PlaySound(args.spellId, "warning")
		end
	end
end

function mod:Blink(args)
	if self:MobId(args.sourceGUID) == 15954 then
		self:Message(29208, "yellow")
		self:PlaySound(29208, "alert")
	end
end

function mod:TeleportToBalcony()
	if timeroom == 90 then
		timeroom = 110
	elseif timeroom == 110 then
		timeroom = 180
	end
	self:StopBar(CL.count:format(CL.adds, waveCount)) -- Adds
	waveCount = 1
	self:SetStage(2)

	self:StopBar(29208) -- Blink
	self:StopBar(CL.curse) -- Curse of the Plaguebringer

	self:Message("stages", "cyan", CL.stage:format(2), false)
	self:Bar("stages", timebalcony, CL.stage:format(1), "Spell_Magic_LesserInvisibilty")
	self:DelayedMessage("stages", timebalcony - 10, "cyan", CL.custom_sec:format(CL.stage:format(1), 10))

	self:Bar("adds", wave1time, CL.count:format(CL.adds, 1), L.adds_icon)
	self:Bar("adds", wave2time, CL.count:format(CL.adds, 2), L.adds_icon)

	self:ScheduleTimer("TeleportToRoom", timebalcony)
	wave2time = wave2time + 15
	self:PlaySound("stages", "long")
end

function mod:TeleportToRoom()
	if timebalcony == 70 then
		timebalcony = 95
	elseif timebalcony == 95 then
		timebalcony = 120
	end
	waveCount = 1
	self:SetStage(1)

	self:CDBar(29213, 11, CL.curse) -- Curse of the Plaguebringer
	self:CDBar("adds", 15, CL.count:format(CL.adds, 1), L.adds_icon)
	self:Message("stages", "cyan", CL.stage:format(1), false)
	self:Bar("stages", timeroom, CL.stage:format(2), "Spell_Magic_LesserInvisibilty")
	self:DelayedMessage("stages", timeroom - 10, "cyan", CL.custom_sec:format(CL.stage:format(2), 10))
	self:ScheduleTimer("TeleportToBalcony", timeroom)
	self:PlaySound("stages", "long")
end
