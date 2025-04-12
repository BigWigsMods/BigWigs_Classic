--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Lillian Voss", 2856)
if not mod then return end
mod:RegisterEnableMob(243021)
mod:SetEncounterID(3190)
mod:SetRespawnTime(15)
mod:SetAllowWin(true)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bossName = "Lillian Voss"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		1233847, -- Scarlet Grasp
		1232192, -- Debilitate
		{1233901, "SAY", "SAY_COUNTDOWN", "ME_ONLY_EMPHASIZE"}, -- Noxious Poison
		{1233849, "SAY", "SAY_COUNTDOWN", "ME_ONLY_EMPHASIZE"}, -- Unstable Concoction
		1233883, -- Intoxicating Venom
		1234540, -- Ignite
		"berserk",
	},nil,{
		[1233847] = "Pull In", -- Scarlet Grasp (Pull In)
	}
end

function mod:OnRegister()
	self.displayName = L.bossName
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "ScarletGrasp", 1233847)
	self:Log("SPELL_AURA_APPLIED", "DebilitateApplied", 1232192)
	self:Log("SPELL_AURA_APPLIED", "NoxiousPoisonApplied", 1233901)
	self:Log("SPELL_AURA_REMOVED", "NoxiousPoisonRemoved", 1233901)
	self:Log("SPELL_CAST_SUCCESS", "UnstableConcoction", 1233849)
	self:Log("SPELL_AURA_APPLIED", "UnstableConcoctionApplied", 1233849)
	self:Log("SPELL_AURA_REMOVED", "UnstableConcoctionRemoved", 1233849)
	self:Log("SPELL_AURA_APPLIED", "IntoxicatingVenomApplied", 1233883)
	self:Log("SPELL_AURA_REMOVED", "IntoxicatingVenomRemoved", 1233883)
	self:Log("SPELL_CAST_SUCCESS", "Ignite", 1234540)
end

function mod:OnEngage()
	self:CDBar(1233849, 30) -- Unstable Concoction
	self:CDBar(1233847, 34, "Pull In") -- Scarlet Grasp
	self:Berserk(180)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:ScarletGrasp(args)
	self:CDBar(args.spellId, 30, "Pull In")
	self:Message(args.spellId, "red", CL.extra:format(args.spellName, "Pull In"))
	self:PlaySound(args.spellId, "long")
end

function mod:DebilitateApplied(args)
	self:TargetMessage(1232192, "orange", args.destName)
end

function mod:NoxiousPoisonApplied(args)
	if self:Me(args.destGUID) then
		self:PersonalMessage(args.spellId)
		self:Say(args.spellId, nil, nil, "Noxious Poison")
		self:SayCountdown(args.spellId, 8)
		self:PlaySound(args.spellId, "alarm", nil, args.destName)
	end
end

function mod:NoxiousPoisonRemoved(args)
	if self:Me(args.destGUID) then
		self:CancelSayCountdown(args.spellId)
	end
end

function mod:UnstableConcoction(args)
	self:CDBar(args.spellId, 30)
end

function mod:UnstableConcoctionApplied(args)
	if self:Me(args.destGUID) then
		self:PersonalMessage(args.spellId)
		self:Say(args.spellId, nil, nil, "Unstable Concoction")
		self:SayCountdown(args.spellId, 7)
		self:PlaySound(args.spellId, "alert", nil, args.destName)
	end
end

function mod:UnstableConcoctionRemoved(args)
	if self:Me(args.destGUID) then
		self:CancelSayCountdown(args.spellId)
	end
end

function mod:IntoxicatingVenomApplied(args)
	if self:Me(args.destGUID) then
		self:PersonalMessage(args.spellId, false, "Keep Running")
		self:PlaySound(args.spellId, "warning", nil, args.destName)
	end
end

function mod:IntoxicatingVenomRemoved(args)
	if self:Me(args.destGUID) then
		self:PersonalMessage(args.spellId, "removed", "Keep Running")
	end
end

function mod:Ignite(args)
	self:Message(args.spellId, "yellow", CL.extra:format(args.spellName, "Spread"))
	self:PlaySound(args.spellId, "info")
end
