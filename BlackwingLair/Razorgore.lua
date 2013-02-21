--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Razorgore the Untamed", 755)
if not mod then return end
mod:RegisterEnableMob(12435, 12557) -- Razorgore, Grethok the Controller
mod.toggleOptions = {14515, "eggs", "stages", "bosskill"}

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

	L.eggs = "Count Eggs"
	L.eggs_desc = "Count the destroyed eggs."
	L.eggs_icon = 19873
	L.eggs_message = "%d/30 eggs destroyed!"

	L.phase2_message = "All eggs destroyed, Razorgore loose!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:RegisterUnitEvent("UNIT_SPELLCAST_SUCCEEDED", "EggKill", "pet", "target", "focus")
	self:Log("SPELL_AURA_APPLIED", "DominateMind", 14515)
	self:Yell("Engage", L["start_trigger"])
	self:AddSyncListener("EggKill")
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

function mod:DominateMind(args)
	self:TargetMessage(args.spellId, args.destName, "Important", "Alert")
end

do
	function mod:OnSync(sync)
		if sync == "EggKill" then
			eggs = eggs + 1
			self:Message("eggs", "Positive", nil, L["eggs_message"]:format(eggs), 19873)
			if eggs == 30 then
				self:Message("stages", "Important", nil, L["phase2_message"], false)
				self:Death("Win", 12435) -- Register after p2 to prevent false positives
			end
		end
	end

	function mod:EggKill(_, _, _, _, spellId)
		if spellId == 19873 then
			self:Sync("EggKill")
		end
	end
end

