--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Ragnaros Classic", 409, 1528)
if not mod then return end
mod:RegisterEnableMob(11502, 12018, 54404) -- Ragnaros, Majordomo Executus, Majordomo Executus (Retail)
mod:SetEncounterID(672)
mod:SetStage(1)

--------------------------------------------------------------------------------
-- Locals
--

local sonsDead = 0
local timer = nil
local warmupTimer = mod:Retail() and 74 or 84

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	--Impudent whelps! You've rushed headlong to your own deaths! See now, the master stirs!\r\n
	L.submerge_trigger = "COME FORTH,"

	L.warmup_icon = "Achievement_boss_ragnaros"

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
	if mobId == 11502 then -- Ragnaros
		return true
	else -- Majordomo Executus, Majordomo Executus (Retail)
		return not UnitCanAttack(unit, "player")
	end
end

function mod:OnBossEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterMessage("BigWigs_BossComm")

	self:Log("SPELL_CAST_SUCCESS", "WrathOfRagnaros", 20566)
	self:Log("SPELL_CAST_START", "SummonRagnarosStart", 19774)
	self:Log("SPELL_CAST_SUCCESS", "SummonRagnaros", 19774)
	self:Log("SPELL_CAST_SUCCESS", "ElementalFire", 19773)

	self:Death("SonDeaths", 12143)
end

function mod:OnEngage()
	sonsDead = 0
	timer = nil
	self:SetStage(1)
	self:CDBar(20566, 26, CL.knockback) -- Wrath of Ragnaros
	self:Bar("submerge", 180, L.submerge_bar, L.submerge_icon)
	self:Message("submerge", "yellow", CL.custom_min:format(L.submerge, 3), L.submerge_icon)
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
	if msg:find(L.submerge_trigger, nil, true) then
		self:Submerge()
	end
end

function mod:WrathOfRagnaros(args)
	self:Message(args.spellId, "red", CL.knockback)
	self:CDBar(args.spellId, 27, CL.knockback)
end

function mod:SummonRagnarosStart()
	self:Sync("RagWarmup") -- Speedrunners like to have someone start it as soon as the Executus encounter ends
end

do
	local prev = 0
	function mod:BigWigs_BossComm(_, msg)
		local t = GetTime()
		if msg == "RagWarmup" and t - prev > 20 and not self:IsEngaged() then
			prev = t
			self:Bar("warmup", warmupTimer, CL.active, L.warmup_icon)
		end
	end

	function mod:SummonRagnaros()
		prev = GetTime()+100 -- No more sync allowed
		self:Bar("warmup", {warmupTimer-10, warmupTimer}, CL.active, L.warmup_icon)
	end
end

function mod:ElementalFire()
	-- it takes exactly 10 seconds for combat to start after Majodromo dies, while
	-- the time between starting the RP/summon and killing Majordomo varies
	self:Bar("warmup", {10, warmupTimer}, CL.active, L.warmup_icon)
end

function mod:Emerge()
	sonsDead = 10 -- Block this firing again if sons are killed after he emerges
	timer = nil
	self:SetStage(1)
	self:CDBar(20566, 27, CL.knockback)
	self:Bar("submerge", 180, L.submerge_bar, L.submerge_icon)
	self:Message("emerge", "yellow", L.emerge_message, L.emerge_icon)
	self:DelayedMessage("submerge", 60, "yellow", CL.custom_min:format(L.submerge, 2))
	self:DelayedMessage("submerge", 120, "yellow", CL.custom_min:format(L.submerge, 1))
	self:DelayedMessage("submerge", 150, "yellow", CL.custom_sec:format(L.submerge, 30))
	self:DelayedMessage("submerge", 170, "orange", CL.custom_sec:format(L.submerge, 10), false, "alarm")
	self:DelayedMessage("submerge", 175, "orange", CL.custom_sec:format(L.submerge, 5), false, "alarm")
	self:PlaySound("emerge", "long")
end

function mod:Submerge()
	sonsDead = 0 -- reset counter
	self:SetStage(2)
	timer = self:ScheduleTimer("Emerge", 90)
	self:StopBar(CL.knockback)
	self:Message("submerge", "yellow", L.submerge_message, L.submerge_icon)
	self:Bar("emerge", 90, L.emerge_bar, L.emerge_icon)
	self:DelayedMessage("emerge", 30, "yellow", CL.custom_sec:format(L.emerge, 60))
	self:DelayedMessage("emerge", 60, "yellow", CL.custom_sec:format(L.emerge, 30))
	self:DelayedMessage("emerge", 80, "orange", CL.custom_sec:format(L.emerge, 10), false, "alarm")
	self:DelayedMessage("emerge", 85, "orange", CL.custom_sec:format(L.emerge, 5), false, "alarm")
	self:PlaySound("submerge", "long")
end

function mod:SonDeaths()
	sonsDead = sonsDead + 1
	if sonsDead < 9 then
		self:Message("emerge", "green", CL.add_killed:format(sonsDead, 8), "spell_fire_elemental_totem")
	end
	if sonsDead == 8 then
		self:CancelTimer(timer)
		self:StopBar(L.emerge_bar)
		self:CancelDelayedMessage(CL.custom_sec:format(L.emerge, 60))
		self:CancelDelayedMessage(CL.custom_sec:format(L.emerge, 30))
		self:CancelDelayedMessage(CL.custom_sec:format(L.emerge, 10))
		self:CancelDelayedMessage(CL.custom_sec:format(L.emerge, 5))
		self:Emerge()
	end
end
