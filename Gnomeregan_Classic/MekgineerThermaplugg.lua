--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Mekgineer Thermaplugg Discovery", 90, -2940)
if not mod then return end
mod:RegisterEnableMob(218537) -- Mekgineer Thermaplugg
mod:SetEncounterID(2940)
mod:SetStage(1)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bossName = "Mekgineer Thermaplugg"
	L.nextAbility = "Next Ability" -- Any of Furnace Surge, Coolant Discharge or Toxic Ventilation
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		-- General
		"stages",
		437853, -- Summon Bomb
		-- STX-96/FR
		438683, -- Sprocketfire Punch
		438713, -- Furnace Surge
		-- STX-97/IC
		438719, -- Supercooled Smash
		438723, -- Coolant Discharge
		-- STX-98/PO
		438726, -- Hazardous Hammer
		438732, -- Toxic Ventilation
	}
end

function mod:OnRegister()
	self.displayName = L.bossName
end

function mod:OnBossEnable()
	-- General
	self:Log("SPELL_CAST_SUCCESS", "SummonBomb", 11518, 11521, 11524, 11526, 11527) -- Activate Bombe 01 -> 06 (03 is missing)
	-- STX-96/FR
	self:Log("SPELL_CAST_SUCCESS", "SprocketfirePunch", 438683)
	self:Log("SPELL_CAST_START", "FurnaceSurge", 438713)
	-- STX-97/IC
	self:Log("SPELL_CAST_SUCCESS", "SupercooledSmash", 438719)
	self:Log("SPELL_CAST_START", "CoolantDischarge", 438723)
	-- STX-98/PO
	self:Log("SPELL_CAST_SUCCESS", "HazardousHammer", 438726)
	self:Log("SPELL_CAST_SUCCESS", "ToxicVentilation", 438732)
end

function mod:OnEngage()
	self:SetStage(1)
	self:Message("stages", "cyan", CL.stage:format(1), false)
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
	self:Message(437853, "cyan", CL.incoming:format(CL.bomb)) -- Bomb Incoming
	self:PlaySound(437853, "info")
	-- cooldown is sometimes delayed to 23~ seconds, unsure why.
	self:CDBar(437853, 11) -- Summon Bomb
end

-- STX-96/FR
function mod:SprocketfirePunch(args)
	self:Message(args.spellId, "purple")
	self:PlaySound(args.spellId, "alarm")
	if self:GetStage() < 4 then -- no timers in stage 4
		self:CDBar(args.spellId, 8.2)
		stageCheck(self, args.sourceGUID)
	end
end

function mod:FurnaceSurge(args)
	self:Message(args.spellId, "yellow")
	self:PlaySound(args.spellId, "alert")
	if self:GetStage() < 4 then
		self:CDBar(args.spellId, 34)
	else
		self:CDBar(args.spellId, 20, L.nextAbility) -- Random which cast is next in stage 4
	end
end

-- STX-97/IC
function mod:SupercooledSmash(args)
	self:Message(args.spellId, "purple")
	self:PlaySound(args.spellId, "alarm")
	if self:GetStage() < 4 then -- no timers in stage 4
		self:CDBar(args.spellId, 6.5)
		stageCheck(self, args.sourceGUID)
	end
end

function mod:CoolantDischarge(args)
	self:Message(args.spellId, "yellow")
	self:PlaySound(args.spellId, "alert")
	if self:GetStage() < 4 then
		self:CDBar(args.spellId, 24)
	else
		self:CDBar(args.spellId, 20, L.nextAbility) -- Random which cast is next in stage 4
	end
end

-- STX-98/PO
function mod:HazardousHammer(args)
	self:Message(args.spellId, "purple")
	self:PlaySound(args.spellId, "alarm")
	if self:GetStage() < 4 then -- no timers in stage 4
		self:CDBar(args.spellId, 6)
		stageCheck(self, args.sourceGUID)
	end
end

function mod:ToxicVentilation(args)
	self:Message(args.spellId, "yellow")
	self:PlaySound(args.spellId, "alert")
	if self:GetStage() < 4 then
		self:CDBar(args.spellId, 21)
	else
		self:CDBar(args.spellId, 20, L.nextAbility) -- Random which cast is next in stage 4
	end
end
