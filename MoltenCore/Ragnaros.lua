--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Ragnaros", 696)
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
	self:Yell("Engage", L["engage_trigger"])
	self:Yell("Submerge", L["submerge_trigger"])

	self:Log("SPELL_CAST_SUCCESS", "Knockback", 20566)

 	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:Death("Deaths", 11502, 12143)
end

function mod:OnEngage()
	sonsdead = 0
	handle = nil
	self:Bar("submerge", L["submerge_bar"], 185, "misc_arrowdown")
	self:Message("submerge", CL["custom_min"]:format(L["submerge"], 3), "Attention")
	self:DelayedMessage("submerge", 65, CL["custom_min"]:format(L["submerge"], 2), "Attention")
	self:DelayedMessage("submerge", 125, CL["custom_min"]:format(L["submerge"], 1), "Attention")
	self:DelayedMessage("submerge", 155, CL["custom_sec"]:format(L["submerge"], 30), "Attention")
	self:DelayedMessage("submerge", 175, CL["custom_sec"]:format(L["submerge"], 10), "Urgent")
	self:DelayedMessage("submerge", 180, CL["custom_sec"]:format(L["submerge"], 5), "Urgent")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Knockback(args)
	self:Message(args.spellId, L["knockback_message"], "Important", args.spellId)
	self:Bar(args.spellId, L["knockback_bar"], 28, args.spellId)
end

local function scheduleEmerge()
	sonsdead = 10 -- Block this firing again if sons are killed after he emerges
	mod:Message("emerge", L["emerge_message"], "Attention", "misc_arrowlup", "Long")
	mod:Bar("submerge", L["submerge_bar"], 180, "misc_arrowdown")
	mod:DelayedMessage("submerge", 60, CL["custom_min"]:format(L["submerge"], 2), "Attention")
	mod:DelayedMessage("submerge", 120, CL["custom_min"]:format(L["submerge"], 1), "Attention")
	mod:DelayedMessage("submerge", 150, CL["custom_sec"]:format(L["submerge"], 30), "Attention")
	mod:DelayedMessage("submerge", 170, CL["custom_sec"]:format(L["submerge"], 10), "Urgent", "Alarm")
	mod:DelayedMessage("submerge", 175, CL["custom_sec"]:format(L["submerge"], 5), "Urgent", "Alarm")
end

function mod:Submerge()
	sonsdead = 0 -- reset counter
	self:StopBar(L["knockback_bar"])
	self:Message("submerge", L["submerge_message"], "Attention", "misc_arrowdown", "Long")
	self:Bar("emerge", L["emerge_bar"], 90, "misc_arrowlup")
	self:DelayedMessage("emerge", 30, CL["custom_sec"]:format(L["emerge"], 60), "Attention")
	self:DelayedMessage("emerge", 60, CL["custom_sec"]:format(L["emerge"], 30), "Attention")
	self:DelayedMessage("emerge", 80, CL["custom_sec"]:format(L["emerge"], 10), "Urgent", "Alarm")
	self:DelayedMessage("emerge", 85, CL["custom_sec"]:format(L["emerge"], 5), "Urgent", "Alarm")
	handle = self:ScheduleTimer(scheduleEmerge, 90)
end

function mod:Deaths(args)
	if args.mobId == 12143 then
		sonsdead = sonsdead + 1
		if sonsdead < 9 then
			self:Message("emerge", CL["add_killed"]:format(sonsdead, 8), "Positive")
		end
		if sonsdead == 8 then
			self:CancelTimer(handle)
			self:StopBar(L["emerge_bar"])
			self:CancelDelayedMessage(CL["custom_sec"]:format(L["emerge"], 60))
			self:CancelDelayedMessage(CL["custom_sec"]:format(L["emerge"], 30))
			self:CancelDelayedMessage(CL["custom_sec"]:format(L["emerge"], 10))
			self:CancelDelayedMessage(CL["custom_sec"]:format(L["emerge"], 5))
			scheduleEmerge()
		end
	else
		self:Win()
 	end
end

