--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Mekgineer Thermaplugg Discovery", 90, -2940)
if not mod then return end
mod:RegisterEnableMob(218537) -- Mekgineer Thermaplugg
mod:SetEncounterID(2940)
mod:SetStage(1)

--------------------------------------------------------------------------------
-- Locals
--

local highVoltageList = {}
local highVoltageDebuffTime = {}
local UpdateInfoBoxList

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bossName = "Mekgineer Thermaplugg"
	L.interruptable = "Interruptable"
	L.ready = "|cff20ff20Ready|r"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		-- General
		"stages",
		437853, -- Summon Bomb
		{438735, "INFOBOX"}, -- High Voltage!
		-- STX-96/FR
		438683, -- Sprocketfire Punch
		438710, -- Sprocketfire
		438713, -- Furnace Surge
		-- STX-97/IC
		438719, -- Supercooled Smash
		438720, -- Freezing
		438723, -- Coolant Discharge
		-- STX-98/PO
		438726, -- Hazardous Hammer
		438727, -- Radiation Sickness
		438732, -- Toxic Ventilation
	},{
		["stages"] = CL.general,
		[438683] =  CL.stage:format(1),
		[438719] =  CL.stage:format(2),
		[438726] =  CL.stage:format(3),
	},{
		[437853] = CL.incoming:format(CL.bombs), -- Summon Bomb (Bombs Incoming)
		[438727] = CL.disease, -- Radiation Sickness (Disease)
	}
end

function mod:OnRegister()
	self.displayName = L.bossName
end

function mod:OnBossEnable()
	-- General
	self:Log("SPELL_CAST_SUCCESS", "SummonBomb", 11518, 11521, 11524, 11526, 11527) -- Activate Bombe 01 -> 06 (03 is missing)
	self:Log("SPELL_AURA_APPLIED", "HighVoltageApplied", 438735)
	self:Log("SPELL_AURA_REMOVED", "HighVoltageRemoved", 438735)
	-- STX-96/FR
	self:Log("SPELL_CAST_SUCCESS", "SprocketfirePunch", 438683)
	self:Log("SPELL_AURA_APPLIED_DOSE", "SprocketfireApplied", 438710)
	self:Log("SPELL_CAST_START", "FurnaceSurge", 438713)
	-- STX-97/IC
	self:Log("SPELL_CAST_SUCCESS", "SupercooledSmash", 438719)
	self:Log("SPELL_AURA_APPLIED_DOSE", "FreezingApplied", 438720)
	self:Log("SPELL_CAST_START", "CoolantDischarge", 438723)
	-- STX-98/PO
	self:Log("SPELL_CAST_SUCCESS", "HazardousHammer", 438726)
	self:Log("SPELL_AURA_APPLIED", "RadiationSicknessApplied", 438727)
	self:Log("SPELL_AURA_APPLIED_DOSE", "RadiationSicknessApplied", 438727)
	self:Log("SPELL_CAST_SUCCESS", "ToxicVentilation", 438732)
	self:Log("SPELL_INTERRUPT", "ToxicVentilationInterrupted", "*")
end

function mod:OnEngage()
	highVoltageList = {}
	highVoltageDebuffTime = {}
	for unit in self:IterateGroup() do
		local name = self:UnitName(unit)
		highVoltageList[#highVoltageList + 1] = name
	end

	self:SetStage(1)
	self:Message("stages", "cyan", CL.stage:format(1), false)

	self:OpenInfo(438735, "BigWigs: |T237290:0:0:0:0:64:64:4:60:4:60|t".. self:SpellName(438735), 10)
	self:SimpleTimer(UpdateInfoBoxList, 0.1)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

local function stageCheck(self, sourceGUID)
	local curStage = self:GetStage()
	local sourceMobId = self:MobId(sourceGUID)
	local nextStage
	if curStage ~= 2 and sourceMobId == 218970 then -- STX-97/IC = Stage 2
		nextStage = 2
	elseif curStage ~= 3 and sourceMobId == 218972 then -- STX-98/PO = Stage 3
		nextStage = 3
	elseif curStage ~= 4 and sourceMobId == 218974 then -- STX-99/XD = Stage 4
		nextStage = 4
	end
	if not nextStage then return end -- No stage change
	self:SetStage(nextStage)
	self:Message("stages", "cyan", CL.stage:format(nextStage), false)
	self:StopBar(437853) -- Summon Bomb
	self:StopBar(438726) -- Hazardous Hammer
	self:StopBar(438732) -- Toxic Ventilation
	self:StopBar(438683) -- Sprocketfire Punch
	self:StopBar(438713) -- Furnace Surge
	self:StopBar(438719) -- Supercooled Smash
	self:StopBar(438723) -- Coolant Discharge
end

function mod:SummonBomb(args)
	self:Message(437853, "cyan", CL.incoming:format(CL.bombs)) -- Bombs Incoming
	-- cooldown is sometimes delayed to 23~ seconds, unsure why.
	self:CDBar(437853, 11) -- Summon Bomb
	self:PlaySound(437853, "info")
end

function mod:HighVoltageApplied(args)
	self:DeleteFromTable(highVoltageList, args.destName)
	highVoltageList[#highVoltageList + 1] = args.destName
	highVoltageDebuffTime[args.destName] = GetTime() + 30
	if self:Me(args.destGUID) then
		self:PersonalMessage(args.spellId)
		self:TargetBar(args.spellId, 30, args.destName)
	end
end

function mod:HighVoltageRemoved(args)
	highVoltageDebuffTime[args.destName] = nil
	if self:Me(args.destGUID) then
		self:StopBar(args.spellName, args.destName)
		self:PersonalMessage(args.spellId, "removed")
		self:PlaySound(args.spellId, "long")
	end
end

-- STX-96/FR
function mod:SprocketfirePunch(args)
	self:Message(args.spellId, "purple")
	if self:GetStage() < 4 then -- no timers in stage 4
		self:CDBar(args.spellId, 8.2)
		stageCheck(self, args.sourceGUID)
	end
	self:PlaySound(args.spellId, "alarm")
end

function mod:SprocketfireApplied(args)
	if args.amount >= 3 then
		if self:Me(args.destGUID) then
			self:StackMessage(args.spellId, "blue", args.destName, args.amount, 4)
		else
			local bossUnit = self:GetUnitIdByGUID(args.sourceGUID)
			if bossUnit and self:Tanking(bossUnit, args.destName) then
				self:StackMessage(args.spellId, "purple", args.destName, args.amount, 4)
			end
		end
	end
end

function mod:FurnaceSurge(args)
	self:Message(args.spellId, "yellow")
	if self:GetStage() < 4 then
		self:CDBar(args.spellId, 34)
	else
		self:CDBar(args.spellId, 20, CL.next_ability) -- Random which cast is next in stage 4
	end
	self:PlaySound(args.spellId, "alert")
end

-- STX-97/IC
function mod:SupercooledSmash(args)
	self:Message(args.spellId, "purple")
	if self:GetStage() < 4 then -- no timers in stage 4
		self:CDBar(args.spellId, 6.5)
		stageCheck(self, args.sourceGUID)
	end
	self:PlaySound(args.spellId, "alarm")
end

function mod:FreezingApplied(args)
	if args.amount >= 5 then
		if self:Me(args.destGUID) then
			self:StackMessage(args.spellId, "blue", args.destName, args.amount, 5)
		else
			local bossUnit = self:GetUnitIdByGUID(args.sourceGUID)
			if bossUnit and self:Tanking(bossUnit, args.destName) then
				self:StackMessage(args.spellId, "purple", args.destName, args.amount, 5)
			end
		end
	end
end

function mod:CoolantDischarge(args)
	self:Message(args.spellId, "yellow")
	if self:GetStage() < 4 then
		self:CDBar(args.spellId, 24)
	else
		self:CDBar(args.spellId, 20, CL.next_ability) -- Random which cast is next in stage 4
	end
	self:PlaySound(args.spellId, "alert")
end

-- STX-98/PO
function mod:HazardousHammer(args)
	self:Message(args.spellId, "purple")
	if self:GetStage() < 4 then -- no timers in stage 4
		self:CDBar(args.spellId, 6)
		stageCheck(self, args.sourceGUID)
	end
	self:PlaySound(args.spellId, "alarm")
end

function mod:RadiationSicknessApplied(args)
	self:StackMessage(args.spellId, "purple", args.destName, args.amount, 2, CL.disease)
end

function mod:ToxicVentilation(args)
	self:Message(args.spellId, "yellow", CL.other:format(args.spellName, L.interruptable))
	if self:GetStage() < 4 then
		self:CDBar(args.spellId, 21)
	else
		self:CDBar(args.spellId, 20, CL.next_ability) -- Random which cast is next in stage 4
	end
	self:PlaySound(args.spellId, "alert")
end

function mod:ToxicVentilationInterrupted(args)
	if args.extraSpellName == self:SpellName(438732) then
		self:Message(438732, "green", CL.interrupted_by:format(args.extraSpellName, self:ColorName(args.sourceName)))
	end
end

function UpdateInfoBoxList()
	if not mod:IsEngaged() then return end
	mod:SimpleTimer(UpdateInfoBoxList, 0.1)

	local t = GetTime()
	local line = 1
	for i = 1, 10 do
		local player = highVoltageList[i]
		if player then
			local remaining = (highVoltageDebuffTime[player] or 0) - t
			mod:SetInfo(438735, line, mod:ColorName(player))
			if remaining > 0 then
				mod:SetInfo(438735, line + 1, CL.seconds:format(remaining))
				mod:SetInfoBar(438735, line, remaining / 30)
			else
				mod:SetInfo(438735, line + 1, L.ready)
				mod:SetInfoBar(438735, line, 0)
			end
		else
			mod:SetInfo(438735, line, "")
			mod:SetInfo(438735, line + 1, "")
			mod:SetInfoBar(438735, line, 0)
		end
		line = line + 2
	end
end
