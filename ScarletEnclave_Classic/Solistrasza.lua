--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Solistrasza", 2856)
if not mod then return end
mod:RegisterEnableMob(238954)
mod:SetEncounterID(3186)
mod:SetRespawnTime(10)
mod:SetAllowWin(true)
mod:SetStage(1)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bossName = "Solistrasza"
	L.whelps = CL.whelps
end

--------------------------------------------------------------------------------
-- Initialization
--

local whelpMarker = mod:AddMarkerOption(true, "npc", 8, "whelps", 8, 7, 6) -- Whelp
function mod:GetOptions()
	return {
		"stages",
		"adds",
		1231993, -- Tarnished Breath
		1227696, -- Hallowed Dive
		1228063, -- Cremation
		whelpMarker,
		"berserk",
	},nil,{
		[1231993] = CL.breath, -- Tarnished Breath (Breath)
	}
end

function mod:OnRegister()
	self.displayName = L.bossName
	self:SetSpellRename(1231993, CL.breath) -- Tarnished Breath (Breath)
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "TarnishedBreath", 1231993)
	self:Log("SPELL_AURA_APPLIED", "TarnishedBreathApplied", 1231993)
	self:Log("SPELL_AURA_APPLIED_DOSE", "TarnishedBreathApplied", 1231993)
	self:Log("SPELL_CAST_START", "Lightforge", 1227520)
	self:Log("SPELL_CAST_START", "HallowedDive", 1227696)
	self:Log("SPELL_CAST_SUCCESS", "AberrantBloat", 1232333)
	self:Log("SPELL_CAST_START", "Cremation", 1228044)
	self:Log("SPELL_AURA_APPLIED", "CremationDamage", 1228063)
	self:Log("SPELL_PERIODIC_DAMAGE", "CremationDamage", 1228063)
	self:Log("SPELL_PERIODIC_MISSED", "CremationDamage", 1228063)
end

function mod:OnEngage()
	self:SetStage(1)
	self:Message("stages", "cyan", CL.stage:format(1), false)
	self:Berserk(480, true) -- No engage message
	self:CDBar(1231993, 11.2, CL.breath) -- Tarnished Breath
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:TarnishedBreath(args)
	self:CDBar(args.spellId, 13, CL.breath)
end

function mod:TarnishedBreathApplied(args)
	if self:Me(args.destGUID) then
		local amount = args.amount or 1
		self:StackMessage(args.spellId, "blue", args.destName, amount, 2, CL.breath)
		if amount >= 2 then
			self:PlaySound(args.spellId, "alert")
		end
	elseif self:Player(args.destFlags) then -- Players, not pets
		local bossUnit, targetUnit = self:GetUnitIdByGUID(args.sourceGUID), self:UnitTokenFromGUID(args.destGUID)
		if bossUnit and targetUnit and self:Tanking(bossUnit, targetUnit) then
			self:StackMessage(args.spellId, "purple", args.destName, args.amount, 2, CL.breath)
		end
	end
end

function mod:Lightforge(args)
	local stage = self:GetStage() + 1
	self:SetStage(stage)
	self:Message("stages", "cyan", CL.percent:format(20, CL.stage:format(stage)), false)
	self:PlaySound("stages", "long")
end

function mod:HallowedDive(args)
	self:Message(args.spellId, "red", CL.incoming:format(args.spellName))
	self:PlaySound(args.spellId, "alarm")
end

do
	local guidCollector = {}
	function mod:WhelpMarking(_, unit, guid)
		if guidCollector[guid] then
			self:CustomIcon(whelpMarker, unit, guidCollector[guid])
			guidCollector[guid] = nil
			if not next(guidCollector) then
				self:UnregisterTargetEvents()
			end
		end
	end

	local prev, iconToUse = 0, 8
	function mod:AberrantBloat(args)
		if self:IsEngaged() then -- Cast by trash
			if args.time - prev > 10 then
				prev = args.time
				guidCollector = {}
				iconToUse = 8
			end
			if self:GetOption(whelpMarker) then
				guidCollector[args.sourceGUID] = iconToUse
				self:RegisterTargetEvents("WhelpMarking")
			end
			iconToUse = iconToUse - 1
			if iconToUse == 7 then
				self:Message("adds", "cyan", CL.adds_spawned, false)
				self:PlaySound("adds", "info")
			end
		end
	end
end

function mod:Cremation(args)
	self:Message(1228063, "yellow", CL.incoming:format(args.spellName))
	self:PlaySound(1228063, "warning")
end

do
	local prev = 0
	function mod:CremationDamage(args)
		if self:Me(args.destGUID) and args.time - prev > 2 then
			prev = args.time
			self:PersonalMessage(args.spellId, "underyou")
			self:PlaySound(args.spellId, "underyou")
		end
	end
end
