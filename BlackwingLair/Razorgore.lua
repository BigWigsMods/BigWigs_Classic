--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Razorgore the Untamed", 755)
if not mod then return end
mod:RegisterEnableMob(12435, 12557) -- Razorgore, Grethok the Controller
mod.toggleOptions = {"mc", "eggs", "stages", "bosskill"}

local eggs = 0

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.start_trigger = "Intruders have breached"
	L.start_message = "Razorgore engaged! Mobs in 45sec!"
	L.start_soon = "Mob Spawn in 5sec!"
	L.start_mob = "Mob Spawn"

	L.mc = "Mind Control"
	L.mc_desc = "Warn when players are mind controlled."
	L.mindcontrol_trigger = "Foolish ([^%s]+)."
	L.mindcontrol_message = "%s has been mind controlled!"

	L.eggs = "Count Eggs"
	L.eggs_desc = "Count the destroyed eggs."
	L.egg_message = "%d/30 eggs destroyed!"

	L.phase2_message = "All eggs destroyed, Razorgore loose!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "Eggs", 19873)
	self:Yell("Engage", L["start_trigger"])
	self:Yell("MC", L["mindcontrol_trigger"])

	self:Death("Win", 12435)
end

function mod:OnEngage()
	self:Message("stages", "Urgent", nil, L["start_message"], false)
	self:Bar("stages", 45, L["start_mob"], "Spell_Holy_PrayerOfHealing")
	self:DelayedMessage("stages", 40, "Important", L["start_soon"])
	eggs = 0
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Eggs(args)
	eggs = eggs + 1
	self:Message("eggs", "Positive", nil, L["egg_message"]:format(eggs), 19873)
	if eggs == 30 then
		self:Message("stages", "Important", nil, L["phase2_message"], false)
	end
end

function mod:MC(msg)
	local _, _, player = msg:find(L["mindcontrol_trigger"])
	if player then
		self:TargetMessage("mc", player, "Important", "Alert", L["mindcontrol_message"], 32974)
	end
end

