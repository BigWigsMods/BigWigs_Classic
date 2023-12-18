--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Ragnaros Classic", 409, 1528)
if not mod then return end
mod:RegisterEnableMob(11502, 12018)
mod:SetEncounterID(672)
mod:SetStage(1)

--------------------------------------------------------------------------------
-- Locals
--

local sonsdead = 0
local timer = nil

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale()
if L then
	L.engage_trigger = "NOW FOR YOU,"
	L.submerge_trigger = "COME FORTH,"

	L.submerge = "Submerge"
	L.submerge_desc = "Warn for Ragnaros' submerge."
	L.submerge_icon = "Achievement_boss_ragnaros"
	L.submerge_message = "Ragnaros down for 90 sec!"
	L.submerge_bar = "Submerge"

	L.emerge = "Emerge"
	L.emerge_desc = "Warn for Ragnaros' emerge."
	L.emerge_icon = "Achievement_boss_ragnaros"
	L.emerge_message = "Ragnaros emerged, 3 mins until submerge!"
	L.emerge_bar = "Emerge"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"warmup",
		"submerge",
		"emerge",
		20566, -- Wrath of Ragnaros
	},nil,{
		[20566] = CL.knockback, -- Wrath of Ragnaros (Knockback)
	}
end

function mod:VerifyEnable(unit, mobId)
	if mobId == 11502 then
		return true
	elseif mobId == 12018 then
		return not UnitCanAttack(unit, "player")
	end
end

function mod:OnBossEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")

	self:Log("SPELL_CAST_SUCCESS", "WrathOfRagnaros", 20566)
	self:Log("SPELL_CAST_SUCCESS", "SummonRagnaros", 19774)

	self:Death("Win", 11502)
	self:Death("SonDeaths", 12143)
	self:Death("MajordomoDeath", 12018)
end

function mod:OnEngage()
	sonsdead = 0
	timer = nil
	self:SetStage(1)
	self:CDBar(20566, 27, CL.knockback) -- Wrath of Ragnaros
	self:Bar("submerge", 180, L.submerge_bar, "Achievement_boss_ragnaros")
	self:Message("submerge", "yellow", CL.custom_min:format(L.submerge, 3), "Achievement_boss_ragnaros")
	self:DelayedMessage("submerge", 60, "yellow", CL.custom_min:format(L.submerge, 2))
	self:DelayedMessage("submerge", 120, "yellow", CL.custom_min:format(L.submerge, 1))
	self:DelayedMessage("submerge", 150, "yellow", CL.custom_sec:format(L.submerge, 30))
	self:DelayedMessage("submerge", 170, "orange", CL.custom_sec:format(L.submerge, 10), false, "alarm")
	self:DelayedMessage("submerge", 175, "orange", CL.custom_sec:format(L.submerge, 5), false, "alarm")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:CHAT_MSG_MONSTER_YELL(_, msg)
	if msg:find(L.engage_trigger, nil, true) then
		self:Engage()
	elseif msg:find(L.submerge_trigger, nil, true) then
		self:Submerge()
	end
end

function mod:WrathOfRagnaros(args)
	self:Message(args.spellId, "red", CL.knockback)
	self:Bar(args.spellId, 28, CL.knockback)
end

function mod:SummonRagnaros()
	self:Bar("warmup", 73, CL.active, "Achievement_boss_ragnaros")
end

function mod:MajordomoDeath()
	-- it takes exactly 10 seconds for combat to start after Majodromo dies, while
	-- the time between starting the RP/summon and killing Majordomo varies
	self:Bar("warmup", {10, 73}, CL.active, "Achievement_boss_ragnaros")
end

function mod:Emerge()
	sonsdead = 10 -- Block this firing again if sons are killed after he emerges
	timer = nil
	self:SetStage(1)
	self:CDBar(20566, 27, CL.knockback)
	self:Bar("submerge", 180, L.submerge_bar, "Achievement_boss_ragnaros")
	self:Message("emerge", "yellow", L.emerge_message, "Achievement_boss_ragnaros")
	self:PlaySound("emerge", "long")
	self:DelayedMessage("submerge", 60, "yellow", CL.custom_min:format(L.submerge, 2))
	self:DelayedMessage("submerge", 120, "yellow", CL.custom_min:format(L.submerge, 1))
	self:DelayedMessage("submerge", 150, "yellow", CL.custom_sec:format(L.submerge, 30))
	self:DelayedMessage("submerge", 170, "orange", CL.custom_sec:format(L.submerge, 10), false, "alarm")
	self:DelayedMessage("submerge", 175, "orange", CL.custom_sec:format(L.submerge, 5), false, "alarm")
end

function mod:Submerge()
	sonsdead = 0 -- reset counter
	self:SetStage(2)
	self:StopBar(CL.knockback)
	self:Message("submerge", "yellow", L.submerge_message, "Achievement_boss_ragnaros")
	self:PlaySound("submerge", "long")
	self:Bar("emerge", 90, L.emerge_bar, "Achievement_boss_ragnaros")
	self:DelayedMessage("emerge", 30, "yellow", CL.custom_sec:format(L.emerge, 60))
	self:DelayedMessage("emerge", 60, "yellow", CL.custom_sec:format(L.emerge, 30))
	self:DelayedMessage("emerge", 80, "orange", CL.custom_sec:format(L.emerge, 10), false, "alarm")
	self:DelayedMessage("emerge", 85, "orange", CL.custom_sec:format(L.emerge, 5), false, "alarm")
	timer = self:ScheduleTimer("Emerge", 90)
end

function mod:SonDeaths()
	sonsdead = sonsdead + 1
	if sonsdead < 9 then
		self:Message("emerge", "green", CL.add_killed:format(sonsdead, 8), "spell_fire_elemental_totem")
	end
	if sonsdead == 8 then
		self:CancelTimer(timer)
		self:StopBar(L.emerge_bar)
		self:CancelDelayedMessage(CL.custom_sec:format(L.emerge, 60))
		self:CancelDelayedMessage(CL.custom_sec:format(L.emerge, 30))
		self:CancelDelayedMessage(CL.custom_sec:format(L.emerge, 10))
		self:CancelDelayedMessage(CL.custom_sec:format(L.emerge, 5))
		self:Emerge()
	end
end
