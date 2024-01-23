--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Heigan the Unclean", 533, 1605)
if not mod then return end
mod:RegisterEnableMob(15936)
mod:SetEncounterID(1112)
mod:SetStage(1)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.stages_icon = "Spell_Arcane_Blink"
	L.teleport_yell_trigger = "The end is upon you."
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"stages",
		29998, -- Decrepit Fever
	},nil,{
		["stages"] = CL.teleport, -- Stages (Teleport)
	}
end

function mod:OnBossEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")

	self:Log("SPELL_CAST_SUCCESS", "DecrepitFever", 29998)

	self:Death("Win", 15936)
end

function mod:OnEngage()
	self:SetStage(1)
	self:Message("stages", "cyan", CL.stage:format(1), false)
	self:Bar("stages", 90, CL.teleport, L.stages_icon)
	self:DelayedMessage("stages", 60, "cyan", CL.custom_sec:format(CL.teleport, 30))
	self:DelayedMessage("stages", 80, "cyan", CL.custom_sec:format(CL.teleport, 10))
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local function backToRoom()
		mod:SetStage(1)
		mod:Message("stages", "cyan", CL.stage:format(1), false)
		mod:DelayedMessage("stages", 60, "cyan", CL.custom_sec:format(CL.teleport, 30))
		mod:DelayedMessage("stages", 80, "cyan", CL.custom_sec:format(CL.teleport, 10))
		mod:Bar("stages", 90, CL.teleport, L.stages_icon)
		mod:PlaySound("stages", "info")
	end

	function mod:CHAT_MSG_MONSTER_YELL(_, msg)
		if msg:find(L.teleport_yell_trigger, nil, true) then
			self:SetStage(2)
			self:ScheduleTimer(backToRoom, 45)
			self:Message("stages", "cyan", CL.stage:format(2), false)
			self:DelayedMessage("stages", 35, "cyan", CL.custom_sec:format(CL.stage:format(1), 10))
			self:Bar("stages", 45, CL.stage:format(1), L.stages_icon)
			self:PlaySound("stages", "long")
		end
	end
end

function mod:DecrepitFever(args)
	self:Message(args.spellId, "yellow", CL.on_group:format(args.spellName))
	self:PlaySound(args.spellId, "alert")
end
