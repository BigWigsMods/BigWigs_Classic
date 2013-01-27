--------------------------------------------------------------------------------
-- Module declaration
--

local mod = BigWigs:NewBoss("Ragnaros", 696)
if not mod then return end
mod:RegisterEnableMob(11502)
mod.toggleOptions = {"submerge", "emerge", "knockback", "bosskill"}

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
	L.engage_trigger = "^NOW FOR YOU,"
	L.knockback_trigger = "^TASTE"
	L.submerge_trigger = "^COME FORTH,"

	L.knockback = "Knockback"
	L.knockback_desc = "Warn for Wrath of Ragnaros' knockback."
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
	self:Yell("Knockback", L["knockback_trigger"])
	self:Yell("Submerge", L["submerge_trigger"])
	self:Log("UNIT_DIED", "UNIT_DIED")

 	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:Death("Win", 11502)
end

local function scheduleEmerge()
	sonsdead = 0 -- reset counter
	mod:SendMessage("BigWigs_StopBar", self, L["emerge_bar"])
	mod:Message("emerge", L["emerge_message"], "Attention")
	mod:Bar("submerge", L["submerge_bar"], 180, 20565)
end

function mod:OnEngage()
	sonsdead = 0
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Knockback()
	self:Message("knockback", L["knockback_message"], "Important", 20566)
	self:Bar("knockback", L["knockback_bar"], 28, 20566)
end
 
function mod:Submerge()
	sonsdead = 0 -- reset counter
	self:SendMessage("BigWigs_StopBar", self, L["knockback_bar"])
	self:Message("submerge", L["submerge_message"], "Attention")
	self:Bar("emerge", L["emerge_bar"], 90, 17731)
	handle = self:ScheduleTimer(scheduleEmerge, 90)
end
 
function mod:UNIT_DIED(numericId)
	if numericId == 12143 then
		sonsdead = sonsdead + 1
 	end
	if sonsdead == 8 then
		self:CancelTimer(handle, true)
		self:SendMessage("BigWigs_StopBar", self, L["emerge_bar"])
		scheduleEmerge()
	end
end

