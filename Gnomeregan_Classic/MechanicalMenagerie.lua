--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Mechanical Menagerie Discovery", 90, -2935)
if not mod then return end
mod:RegisterEnableMob(218242, 218243, 218244, 218245) -- STX-04/BD (Dragon), STX-13/LL (Sheep), STX-25/NB (Squirrel), STX-37/CN (Chicken)
mod:SetEncounterID(2935)

--------------------------------------------------------------------------------
-- Locals
--

local shieldTimers = {}
local dragonHP = 100
local sheepHP = 100
local squirrelHP = 100
local chickenHP = 100
local UpdateInfoBoxList

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bossName = "Mechanical Menagerie"
	L.attack_buff = "+50% attack speed"
	L.boss_at_hp = "%s at %d%%" -- BOSS_NAME at 50%

	L[218242] = "|T134153:0:0:0:0:64:64:4:60:4:60|tDragon"
	L[218243] = "|T136071:0:0:0:0:64:64:4:60:4:60|tSheep"
	L[218244] = "|T133944:0:0:0:0:64:64:4:60:4:60|tSquirrel"
	L[218245] = "|T135996:0:0:0:0:64:64:4:60:4:60|tChicken"
end

--------------------------------------------------------------------------------
-- Initialization
--

local explosiveEggMarker = mod:AddMarkerOption(true, "npc", 8, 436692, 8) -- Explosive Egg
function mod:GetOptions()
	return {
		438735, -- High Voltage!
		436692, -- Explosive Egg
		explosiveEggMarker,
		436570, -- Cluck!
		436833, -- Widget Volley
		436836, -- Widget Fortress
		436816, -- Sprocketfire Breath
		436741, -- Overheat
		436825, -- Frayed Wiring
		440073, -- Self Repair
		{"health", "INFOBOX"},
	},nil,{
		[436570] = L.attack_buff, -- Cluck! (+50% attack speed)
		[436836] = CL.shield, -- Widget Fortress (Shield)
		[436816] = CL.breath, -- Sprocketfire Breath (Breath)
		[436741] = CL.weakened, -- Overheat (Weakened)
		[436825] = CL.spell_reflection, -- Frayed Wiring (Spell Reflection)
	}
end

function mod:OnRegister()
	self.displayName = L.bossName
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "HighVoltageApplied", 438735)
	self:Log("SPELL_AURA_REMOVED", "HighVoltageRemoved", 438735)
	self:Log("SPELL_SUMMON", "ExplosiveEggSummon", 436692)
	self:Log("SPELL_CAST_SUCCESS", "Cluck", 436570)
	self:Log("SPELL_CAST_START", "WidgetVolley", 436833)
	self:Log("SPELL_INTERRUPT", "WidgetVolleyInterrupted", "*")
	self:Log("SPELL_CAST_START", "WidgetFortress", 436836)
	self:Log("SPELL_AURA_APPLIED", "WidgetFortressApplied", 436837)
	self:Log("SPELL_AURA_REMOVED", "WidgetFortressRemoved", 436837)
	self:Log("SPELL_CAST_START", "SprocketfireBreath", 436816)
	self:Log("SPELL_AURA_APPLIED", "SprocketfireBreathApplied", 440014)
	self:Log("SPELL_AURA_APPLIED_DOSE", "SprocketfireBreathAppliedDose", 440014)
	self:Log("SPELL_AURA_APPLIED", "FrayedWiringApplied", 436825)
	self:Log("SPELL_AURA_REMOVED", "FrayedWiringRemoved", 436825)
	self:Log("SPELL_AURA_APPLIED", "OverheatApplied", 436741)
	self:Log("SPELL_AURA_REMOVED", "OverheatRemoved", 436741)
	self:Log("SPELL_CAST_START", "SelfRepair", 440073)
end

function mod:OnEngage()
	shieldTimers = {}
	dragonHP = 100
	sheepHP = 100
	squirrelHP = 100
	chickenHP = 100

	self:OpenInfo("health", "BigWigs: ".. CL.health)
	local npcId = 218241
	for i = 1, 7, 2 do
		npcId = npcId + 1
		self:SetInfo("health", i, L[npcId])
		self:SetInfoBar("health", i, 1)
		self:SetInfo("health", i + 1, "100%")
	end
	self:SimpleTimer(UpdateInfoBoxList, 1)

	self:CDBar(436816, 11.6, CL.breath) -- Sprocketfire Breath
	self:CDBar(436692, 12.2) -- Explosive Egg
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:HighVoltageApplied(args)
	if self:Me(args.destGUID) then
		self:PersonalMessage(args.spellId)
		self:TargetBar(args.spellId, 30, args.destName)
	end
end

function mod:HighVoltageRemoved(args)
	if self:Me(args.destGUID) then
		self:StopBar(args.spellName, args.destName)
		self:PersonalMessage(args.spellId, "removed")
		self:PlaySound(args.spellId, "long")
	end
end

do
	local eggGUID = nil

	function mod:ExplosiveEggSummon(args)
		self:Message(args.spellId, "cyan", CL.spawned:format(args.spellName))
		self:CDBar(args.spellId, 21)
		self:PlaySound(args.spellId, "info")
		-- register events to auto-mark egg
		if self:GetOption(explosiveEggMarker) then
			eggGUID = args.destGUID
			self:RegisterTargetEvents("MarkExplosiveEgg")
		end
	end

	function mod:MarkExplosiveEgg(_, unit, guid)
		if eggGUID == guid then
			eggGUID = nil
			self:CustomIcon(explosiveEggMarker, unit, 8)
			self:UnregisterTargetEvents()
		end
	end
end

function mod:Cluck(args)
	chickenHP = chickenHP - 25
	self:Message(args.spellId, "orange", CL.other:format(L.attack_buff, L.boss_at_hp:format(L[218245], chickenHP)))
	self:Bar(args.spellId, 15, L.attack_buff)
end

function mod:WidgetVolley(args)
	self:Message(args.spellId, "orange", CL.casting:format(args.spellName))
	if self:Interrupter() then
		self:PlaySound(args.spellId, "alert")
	end
end

function mod:WidgetVolleyInterrupted(args)
	if args.extraSpellName == self:SpellName(436833) then
		self:Message(436833, "green", CL.interrupted_by:format(args.extraSpellName, self:ColorName(args.sourceName)))
	end
end

function mod:WidgetFortress(args)
	squirrelHP = squirrelHP - 25
	self:Message(args.spellId, "yellow", CL.other:format(CL.shield, L.boss_at_hp:format(L[218244], squirrelHP)))
	self:PlaySound(args.spellId, "long")
end

function mod:WidgetFortressApplied(args)
	local npcId = self:MobId(args.destGUID)
	local name = L[npcId]
	if name and not shieldTimers[npcId] then -- Delay so we don't warn for bosses just running through it
		shieldTimers[npcId] = self:ScheduleTimer(function()
			self:Message(436836, "yellow", CL.on:format(CL.shield, name))
			self:PlaySound(436836, "info")
		end, 2)
	end
end

function mod:WidgetFortressRemoved(args)
	local npcId = self:MobId(args.destGUID)
	if shieldTimers[npcId] then
		self:CancelTimer(shieldTimers[npcId])
		shieldTimers[npcId] = nil
	end
end

function mod:SprocketfireBreath(args)
	self:Message(args.spellId, "yellow", CL.breath)
	self:CDBar(args.spellId, 20.5, CL.breath)
	self:PlaySound(args.spellId, "alarm")
end

function mod:SprocketfireBreathApplied(args)
	if self:Me(args.destGUID) then
		self:PersonalMessage(436816, nil, CL.breath)
	end
end

function mod:SprocketfireBreathAppliedDose(args)
	if self:Me(args.destGUID) then
		self:StackMessage(436816, "blue", args.destName, args.amount, 1, CL.breath)
	end
end

function mod:FrayedWiringApplied(args)
	local npcId = self:MobId(args.destGUID)
	if npcId == 218243 then -- Acts as a group aura, applying to nearby bosses
		sheepHP = sheepHP - 25
		self:Message(args.spellId, "red", CL.other:format(CL.spell_reflection, L.boss_at_hp:format(L[npcId], sheepHP)))
		self:Bar(args.spellId, 15, CL.spell_reflection)
	end
end

function mod:FrayedWiringRemoved(args)
	if self:MobId(args.destGUID) == 218243 then
		self:StopBar(CL.spell_reflection)
		self:Message(args.spellId, "green", CL.over:format(CL.spell_reflection))
	end
end

function mod:OverheatApplied(args)
	local npcId = self:MobId(args.destGUID)
	if npcId == 218242 then -- Acts as a group aura, applying to nearby bosses
		dragonHP = dragonHP - 25
		self:Message(args.spellId, "red", CL.other:format(CL.weakened, L.boss_at_hp:format(L[npcId], dragonHP)))
		self:Bar(args.spellId, 15, CL.weakened)
		self:PlaySound(args.spellId, "warning")
	end
end

function mod:OverheatRemoved(args)
	if self:MobId(args.destGUID) == 218242 then
		self:StopBar(CL.weakened)
	end
end

function mod:SelfRepair(args)
	local msg = L[self:MobId(args.sourceGUID)] or args.sourceName
	self:TargetMessage(args.spellId, "cyan", msg)
	self:TargetBar(args.spellId, 20, msg)
	self:PlaySound(args.spellId, "long")
end

do
	local bossList = {
		[218242] = 1, -- Dragon
		[218243] = 3, -- Sheep
		[218244] = 5, -- Squirrel
		[218245] = 7, -- Chicken
	}
	local unitTracker = {}
	function UpdateInfoBoxList()
		if not mod:IsEngaged() then return end
		mod:SimpleTimer(UpdateInfoBoxList, 1)

		for npcId in next, bossList do
			if not unitTracker[npcId] or mod:MobId(mod:UnitGUID(unitTracker[npcId])) ~= npcId then
				unitTracker[npcId] = mod:GetUnitIdByGUID(npcId)
			end
		end

		for npcId, unitToken in next, unitTracker do
			local line = bossList[npcId]
			local currentHealthPercent = math.floor(mod:GetHealth(unitToken))
			mod:SetInfoBar("health", line, currentHealthPercent/100)
			mod:SetInfo("health", line + 1, ("%d%%"):format(currentHealthPercent))
		end
	end
end
