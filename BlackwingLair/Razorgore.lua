--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Razorgore the Untamed", 469, 1529)
if not mod then return end
mod:RegisterEnableMob(12435, 12557) -- Razorgore, Grethok the Controller
mod:SetEncounterID(610)
mod:SetStage(1)

--------------------------------------------------------------------------------
-- Locals
--

local eggs = 0

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale()
if L then
	L.start_trigger = "Intruders have breached"

	L.eggs = "Count Eggs"
	L.eggs_desc = "Count the destroyed eggs."
	L.eggs_icon = "inv_egg_03"
	L.eggs_message = "%d/30 eggs destroyed!"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		14515, -- Dominate Mind
		{23023, "ICON"}, -- Conflagration
		"eggs",
		"stages",
	}
end

function mod:OnBossEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")

	self:Log("SPELL_AURA_APPLIED", "DominateMind", 14515)
	self:Log("SPELL_CAST_SUCCESS", "DestroyEgg", 19873)
	self:Log("SPELL_CAST_SUCCESS", "WarmingFlames", 23040)
	self:Log("SPELL_AURA_APPLIED", "Conflagration", 23023)
	self:Log("SPELL_AURA_REMOVED", "ConflagrationOver", 23023)
end

function mod:OnEngage()
	eggs = 0
	self:SetStage(1)
	self:Message("stages", "cyan", CL.stage:format(1), false)
	self:Bar("stages", 45, CL.adds, "Spell_Holy_PrayerOfHealing")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:CHAT_MSG_MONSTER_YELL(_, msg)
	if msg:find(L.start_trigger, nil, true) then
		self:Engage()
	end
end

function mod:DominateMind(args)
	self:TargetMessage(args.spellId, "red", args.destName)
	if self:Me(args.destGUID) then
		self:PlaySound(args.spellId, "alert", nil, args.destName)
	elseif self:Dispeller("magic") then
		self:PlaySound(args.spellId, "alert")
	end
end

function mod:DestroyEgg()
	eggs = eggs + 1
	if eggs < 30 then
		self:Message("eggs", "green", L.eggs_message:format(eggs), L.eggs_icon)
	end
end

function mod:WarmingFlames() -- Stage 2
	self:SetStage(2)
	self:Message("stages", "cyan", CL.stage:format(2), false)
	self:Death("Win", 12435) -- Register here as he can die in stage 1 and you lose
	self:PlaySound("stages", "long")
end

function mod:Conflagration(args)
	self:TargetMessage(args.spellId, "orange", args.destName)
	self:TargetBar(args.spellId, 10, args.destName)
	self:PrimaryIcon(args.spellId, args.destName)
	self:PlaySound(args.spellId, "info", nil, args.destName)
end

function mod:ConflagrationOver(args)
	self:StopBar(args.spellName, args.destName)
	self:PrimaryIcon(args.spellId)
end
