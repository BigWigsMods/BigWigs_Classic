--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Alexei the Beastlord", 2856)
if not mod then return end
mod:RegisterEnableMob(240794, 241906) -- Alexei the Beastlord, Sir Dornel
mod:SetEncounterID(3196)
mod:SetRespawnTime(12)
mod:SetAllowWin(true)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bossName = "Alexei the Beastlord"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		1230105, -- Wild Aperture
		1228295, -- Stomp
		1230200, -- Enervate
		1230242, -- Enkindle
		"berserk",
	},nil,{
		[1230105] = CL.frontal_cone, -- Wild Aperture (Frontal Cone)
	}
end

function mod:OnRegister()
	self.displayName = L.bossName
	self:SetSpellRename(1230105, CL.frontal_cone) -- Wild Aperture (Frontal Cone)
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "WildAperture", 1230105)
	self:Log("SPELL_CAST_SUCCESS", "Enervate", 1230200)
	self:Log("SPELL_AURA_APPLIED", "EnervateOrEnkindleApplied", 1230200, 1230242) -- Enervate, Enkindle
	self:Log("SPELL_AURA_APPLIED_DOSE", "EnervateOrEnkindleApplied", 1230200, 1230242)
	self:Log("SPELL_CAST_START", "Stomp", 1228295)
end

function mod:OnEngage()
	self:CDBar(1230105, 6.8, CL.frontal_cone) -- Wild Aperture
	self:CDBar(1230200, 16.1) -- Enervate
	self:CDBar(1228295, 21.4) -- Stomp
	self:Berserk(360)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:WildAperture(args)
	self:CDBar(args.spellId, 17.8, CL.frontal_cone)
	self:Message(args.spellId, "orange", CL.frontal_cone)
	self:PlaySound(args.spellId, "warning")
end

function mod:Enervate(args)
	self:CDBar(args.spellId, 16.1)
end

function mod:EnervateOrEnkindleApplied(args)
	if self:Me(args.destGUID) then
		if args.amount then
			self:StackMessage(args.spellId, "blue", args.destName, args.amount, 1)
			self:PlaySound(args.spellId, "info", nil, args.destName)
		else
			self:PersonalMessage(args.spellId)
		end
	end
end

function mod:Stomp(args)
	self:CDBar(args.spellId, 21)

	local unit = self:GetUnitIdByGUID(args.sourceGUID)
	if not unit or self:UnitWithinRange(unit, 20) then
		self:Message(args.spellId, "red")
		self:PlaySound(args.spellId, "alert")
	end
end
