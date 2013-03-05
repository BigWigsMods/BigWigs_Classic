--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Ragnaros ", 696)
if not mod then return end
mod:RegisterEnableMob(11502)
mod.toggleOptions = {"submerge", "emerge", 20566, "bosskill"}

--------------------------------------------------------------------------------
-- Locals
--

local sonsdead = 0
local handle = nil

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_trigger = "NOW FOR YOU,"
	L.submerge_trigger = "COME FORTH,"

	L.knockback_message = "Knockback!"
	L.knockback_bar = "Knockback"

	L.submerge = "Submerge"
	L.submerge_desc = "Warn for Ragnaros' submerge."
	L.submerge_message = "Ragnaros down for 90 sec!"
	L.submerge_bar = "Submerge"

	L.emerge = "Emerge"
	L.emerge_desc = "Warn for Ragnaros' emerge."
	L.emerge_message = "Ragnaros emerged, 3 mins until submerge!"
	L.emerge_bar = "Emerge"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Yell("Engage", L.engage_trigger)
	self:Yell("Submerge", L.submerge_trigger)

	self:Log("SPELL_CAST_SUCCESS", "Knockback", 20566)

 	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:Death("Win", 11502)
	self:Death("SonDeaths", 12143)
end

function mod:OnEngage()
	sonsdead = 0
	handle = nil
	self:Bar("submerge", 185, L.submerge_bar, "misc_arrowdown")
	self:Message("submerge", "Attention", nil, CL.custom_min:format(L.submerge, 3))
	self:DelayedMessage("submerge", 65, "Attention", CL.custom_min:format(L.submerge, 2))
	self:DelayedMessage("submerge", 125, "Attention", CL.custom_min:format(L.submerge, 1))
	self:DelayedMessage("submerge", 155, "Attention", CL.custom_sec:format(L.submerge, 30))
	self:DelayedMessage("submerge", 175, "Urgent", CL.custom_sec:format(L.submerge, 10), false, "Alarm")
	self:DelayedMessage("submerge", 180, "Urgent", CL.custom_sec:format(L.submerge, 5), false, "Alarm")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Knockback(args)
	self:Message(args.spellId, "Important", nil, L.knockback_message)
	self:Bar(args.spellId, 28, L.knockback_bar)
end

local function scheduleEmerge()
	sonsdead = 10 -- Block this firing again if sons are killed after he emerges
	mod:Message("emerge", "Attention", "Long", L.emerge_message, "misc_arrowlup")
	mod:Bar("submerge", 180, L.submerge_bar, "misc_arrowdown")
	mod:DelayedMessage("submerge", 60, "Attention", CL.custom_min:format(L.submerge, 2))
	mod:DelayedMessage("submerge", 120, "Attention", CL.custom_min:format(L.submerge, 1))
	mod:DelayedMessage("submerge", 150, "Attention", CL.custom_sec:format(L.submerge, 30))
	mod:DelayedMessage("submerge", 170, "Urgent", CL.custom_sec:format(L.submerge, 10), false, "Alarm")
	mod:DelayedMessage("submerge", 175, "Urgent", CL.custom_sec:format(L.submerge, 5), false, "Alarm")
end

function mod:Submerge()
	sonsdead = 0 -- reset counter
	self:StopBar(L.knockback_bar)
	self:Message("submerge", "Attention", "Long", L.submerge_message, "misc_arrowdown")
	self:Bar("emerge", 90, L.emerge_bar, "misc_arrowlup")
	self:DelayedMessage("emerge", 30, "Attention", CL.custom_sec:format(L.emerge, 60))
	self:DelayedMessage("emerge", 60, "Attention", CL.custom_sec:format(L.emerge, 30))
	self:DelayedMessage("emerge", 80, "Urgent", CL.custom_sec:format(L.emerge, 10), false, "Alarm")
	self:DelayedMessage("emerge", 85, "Urgent", CL.custom_sec:format(L.emerge, 5), false, "Alarm")
	handle = self:ScheduleTimer(scheduleEmerge, 90)
end

function mod:SonDeaths()
	sonsdead = sonsdead + 1
	if sonsdead < 9 then
		self:Message("emerge", "Positive", nil, CL.add_killed:format(sonsdead, 8))
	end
	if sonsdead == 8 then
		self:CancelTimer(handle)
		self:StopBar(L.emerge_bar)
		self:CancelDelayedMessage(CL.custom_sec:format(L.emerge, 60))
		self:CancelDelayedMessage(CL.custom_sec:format(L.emerge, 30))
		self:CancelDelayedMessage(CL.custom_sec:format(L.emerge, 10))
		self:CancelDelayedMessage(CL.custom_sec:format(L.emerge, 5))
		scheduleEmerge()
	end
end

