--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Chromaggus", 469, 1535)
if not mod then return end
mod:RegisterEnableMob(14020)
mod:SetEncounterID(616)

--------------------------------------------------------------------------------
-- Locals
--

local barcount = 2
local debuffCount = 0
local prevWeakness = nil
local buffList = {}

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.breath = "Breaths"
	L.breath_desc = "Warn for Breaths."
	L.breath_icon = "spell_arcane_portalorgrimmar"

	L.debuffs_message = "3/5 debuffs, carefull!"
	L.debuffs_warning = "4/5 debuffs, %s on 5th!"

	L.vulnerability = "Vulnerability Change"
	L.vulnerability_desc = "Warn for Vulnerability changes."
	L.vulnerability_icon = 22277
	L.vulnerability_message = "Vulnerability: %s"
	L.detect_magic_missing = "Detect Magic is missing from Chromaggus"
	L.detect_magic_warning = "A Mage must cast \124cff71d5ff\124Hspell:2855:0\124h[Detect Magic]\124h\124r on Chromaggus for vulnerability warnings to work."
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		23128, -- Enrage / Frenzy (different name on classic era)
		23537, -- Frenzy / Enrage (different name on classic era)
		{"breath", "CASTBAR"},
		23174, -- Chromatic Mutation
		"vulnerability",
	},nil,{
		[23537] = CL.health_percent:format(20), -- Frenzy / Enrage (20% Health)
		[23174] = CL.mind_control, -- Chromatic Mutation (Mind Control)
	}
end

function mod:OnRegister()
	buffList = {
		[22277] = L.vulnerability_message:format(STRING_SCHOOL_FIRE),
		[22278] = L.vulnerability_message:format(STRING_SCHOOL_FROST),
		[22279] = L.vulnerability_message:format(STRING_SCHOOL_SHADOW),
		[22280] = L.vulnerability_message:format(STRING_SCHOOL_NATURE),
		[22281] = L.vulnerability_message:format(STRING_SCHOOL_ARCANE),
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "EnrageFrenzy", 23128)
	self:Log("SPELL_DISPEL", "EnrageFrenzyDispelled", "*")
	self:Log("SPELL_AURA_APPLIED", "FrenzyEnrage", 23537)
	self:Log("SPELL_AURA_APPLIED", "BroodAffliction", 23170, 23154, 23155, 23169, 23153) -- Brood Affliction: Bronze, Black, Red, Green, Blue
	self:Log("SPELL_AURA_REMOVED", "BroodAfflictionRemoved", 23170, 23154, 23155, 23169, 23153) -- Brood Affliction: Bronze, Black, Red, Green, Blue
	self:Log("SPELL_CAST_START", "Breaths",
		23310, 23312, -- Time Lapse
		23313, 23314, -- Corrosive Acid
		23315, 23316, -- Ignite Flesh
		23308, 23309, -- Incinerate
		23187, 23189 -- Frost Burn
	)

	if self:Vanilla() then
		BigWigs:Print(L.detect_magic_warning)
	end
end

do
	local function CheckInitWeakness()
		if not mod:IsEngaged() then return end

		local unit = mod:GetUnitIdByGUID(14020)
		if unit then
			if mod:Vanilla() then
				if mod:UnitDebuff(unit, 2855) then -- Detect Magic
					mod:UNIT_AURA(nil, unit)
				else
					mod:Message("vulnerability", "red", L.detect_magic_missing, 2855)
					mod:PlaySound("vulnerability", "warning")
				end
			else
				mod:UNIT_AURA(nil, unit)
			end
		else
			mod:SimpleTimer(CheckInitWeakness, 1)
		end
	end

	function mod:OnEngage()
		barcount = 2
		debuffCount = 0
		prevWeakness = nil

		self:Bar("breath", 30, CL.count:format(CL.next_ability, 1), "INV_Misc_QuestionMark")
		self:Bar("breath", 60, CL.count:format(CL.next_ability, 2), "INV_Misc_QuestionMark")

		self:RegisterEvent("UNIT_AURA")
		self:SimpleTimer(CheckInitWeakness, 1)
	end
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:EnrageFrenzy(args) -- The dispellable one
	self:Message(args.spellId, "orange", CL.buff_boss:format(args.spellName))
	self:TargetBar(args.spellId, 8, args.destName)
	self:PlaySound(args.spellId, "alarm")
end

function mod:EnrageFrenzyDispelled(args)
	if args.extraSpellName == self:SpellName(23128) then
		self:StopBar(args.extraSpellName, args.destName)
		self:Message(23128, "green", CL.removed_by:format(args.extraSpellName, self:ColorName(args.sourceName)))
	end
end

function mod:FrenzyEnrage(args) -- The 20% one
	self:Message(args.spellId, "red", CL.percent:format(20, args.spellName))
end

function mod:BroodAffliction(args)
	if self:Me(args.destGUID) then
		debuffCount = debuffCount + 1
		if debuffCount == 3 then
			self:Message(23174, "red", L.debuffs_message, args.spellId)
			self:PlaySound(23174, "warning")
		elseif debuffCount == 4 then
			self:Message(23174, "red", L.debuffs_warning:format(CL.mind_control), args.spellId)
			self:PlaySound(23174, "warning")
		elseif debuffCount == 5 then
			self:Message(23174, "red", CL.mind_control, args.spellId)
			self:PlaySound(23174, "warning")
		end
	end
end

function mod:BroodAfflictionRemoved(args)
	if self:Me(args.destGUID) then
		debuffCount = debuffCount - 1
	end
end

function mod:Breaths(args)
	if barcount == 2 then
		barcount = 1
		self:StopBar(CL.count:format(CL.next_ability, 1)) -- Next ability (1)
	elseif barcount == 1 then
		barcount = 0
		self:StopBar(CL.count:format(CL.next_ability, 2)) -- Next ability (2)
	end

	self:CastBar("breath", 2, args.spellName, args.spellId)
	self:Message("breath", "yellow", CL.casting:format(args.spellName), args.spellId)
	self:Bar("breath", 60, args.spellName, args.spellId)
	self:PlaySound("breath", "long")
end

function mod:UNIT_AURA(_, unit)
	if self:MobId(self:UnitGUID(unit)) == 14020 then
		for buffId, message in next, buffList do
			if self:UnitBuff(unit, buffId) then
				if prevWeakness ~= buffId then
					if buffList[prevWeakness] then
						self:StopBar(buffList[prevWeakness])
					end
					prevWeakness = buffId
					self:Message("vulnerability", "green", message, buffId)
					self:CDBar("vulnerability", 0.1, message, buffId)
					self:PlaySound("vulnerability", "info")
				end
				return
			end
		end
	end
end
