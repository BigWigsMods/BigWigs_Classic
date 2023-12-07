--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Twilight Lord Kelris Discovery", 48, -2825)
if not mod then return end
mod:RegisterEnableMob(209678) -- Twilight Lord Kelris Season of Discovery
mod:SetEncounterID(2825)
mod:SetStage(1)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bossName = "Twilight Lord Kelris"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		423135, -- Sleep
		{425460, "COUNTDOWN", "ME_ONLY_EMPHASIZE"}, -- Dream Eater
		425265, -- Shadowy Chains
		"stages",
		426489, -- Manifesting Dreams
	}
end

function mod:OnRegister()
	self.displayName = L.bossName
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "SleepApplied", 423135)
	self:Log("SPELL_AURA_APPLIED", "DreamEaterApplied", 425460)
	self:Log("SPELL_AURA_REMOVED", "DreamEaterRemoved", 425460)
	self:Log("SPELL_CAST_START", "ShadowyChainsStart", 425265) -- Stage 1
	self:Log("SPELL_INTERRUPT", "ShadowyChainsInterrupted", "*")
	self:Log("SPELL_CAST_SUCCESS", "ShadowyChainsSuccess", 425265, 426494) -- Stage 1, Stage 2
	self:Log("SPELL_AURA_APPLIED", "ShadowyChainsApplied", 425239, 426495) -- Stage 1, Stage 2
	self:Log("SPELL_CAST_START", "MindBlast", 426493) -- Stage 2
	self:Log("SPELL_AURA_APPLIED", "ManifestingDreamsApplied", 426489)
	self:Log("SPELL_AURA_APPLIED_DOSE", "ManifestingDreamsApplied", 426489)

	self:Death("Win", 209678)
end

function mod:OnEngage()
	self:SetStage(1)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local playerList, prev = {}, 0
	function mod:SleepApplied(args)
		if args.time - prev > 5 then
			prev = args.time
			playerList = {}
		end
		playerList[#playerList+1] = args.destName
		self:TargetsMessage(args.spellId, "yellow", playerList, 2)
	end
end

function mod:DreamEaterApplied(args)
	if self:Me(args.destGUID) then
		self:PersonalMessage(args.spellId, false, CL.custom_sec:format(args.spellName, 15))
		self:PlaySound(args.spellId, "warning", nil, args.destName)
		self:Bar(args.spellId, 15)
	end
end

function mod:DreamEaterRemoved(args)
	if self:Me(args.destGUID) then
		self:StopBar(args.spellName)
	end
end

function mod:ShadowyChainsStart(args) -- First stage only
	self:Message(args.spellId, "red", CL.casting:format(args.spellName))
	if self:Interrupter() then
		self:PlaySound(args.spellId, "alert")
	end
end

function mod:ShadowyChainsInterrupted(args)
	if args.extraSpellId == 425265 then
		self:Message(425265, "green", CL.interrupted_by:format(args.extraSpellName, self:ColorName(args.sourceName)))
	end
end

do
	local playerList = {}
	function mod:ShadowyChainsSuccess()
		playerList = {}
	end

	function mod:ShadowyChainsApplied(args)
		local count = #playerList
		if count == 0 then
			self:PlaySound(425265, "info")
		end
		playerList[count+1] = args.destName
		self:TargetsMessage(425265, "orange", playerList)
	end
end

function mod:MindBlast(args) -- For lack of a better stage 2 indicator
	self:RemoveLog("SPELL_CAST_START", args.spellId)
	self:SetStage(2)
	self:Message("stages", "cyan", CL.stage:format(2), false)
	self:PlaySound("stages", "long")
end

function mod:ManifestingDreamsApplied(args)
	self:StackMessage(args.spellId, "cyan", CL.boss, args.amount, 0)
	self:Bar(args.spellId, 15)
end
