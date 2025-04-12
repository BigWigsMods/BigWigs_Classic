--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Alexei the Beastlord", 2856)
if not mod then return end
mod:RegisterEnableMob(240794, 241906) -- Alexei the Beastlord, Sir Dornel
mod:SetEncounterID(3196)
mod:SetAllowWin(true)

--------------------------------------------------------------------------------
-- Locals
--

local killedBosses = {}
local UpdateInfoBoxList
local bossList = {
	[240794] = 1, -- Alexei the Beastlord
	[241906] = 3, -- Sir Dornel
}

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bossName = "Alexei the Beastlord"
	L[240794] = "Alexei"
	L[241906] = "Sir Dornel"
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
		{"health", "INFOBOX"},
		"stages",
		"berserk",
	}
end

function mod:OnRegister()
	self.displayName = L.bossName
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "WildAperture", 1230105)
	self:Log("SPELL_CAST_SUCCESS", "Enervate", 1230200)
	self:Log("SPELL_AURA_APPLIED", "EnervateOrEnkindleApplied", 1230200, 1230242) -- Enervate, Enkindle
	self:Log("SPELL_AURA_APPLIED_DOSE", "EnervateOrEnkindleApplied", 1230200, 1230242)
	self:Log("SPELL_CAST_START", "Stomp", 1228295)
	self:Death("Deaths", 240794, 241906)
end

function mod:OnEngage()
	killedBosses = {}

	self:OpenInfo("health", CL.other:format("BigWigs", CL.health))
	for npcId, line in next, bossList do
		self:SetInfo("health", line, L[npcId])
		self:SetInfoBar("health", line, 1)
		self:SetInfo("health", line + 1, "100%")
	end
	self:SimpleTimer(UpdateInfoBoxList, 1)

	self:CDBar(1230105, 6.8) -- Wild Aperture
	self:CDBar(1230200, 16.1) -- Enervate
	self:CDBar(1228295, 21.4) -- Stomp
	self:Berserk(360)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:WildAperture(args)
	self:CDBar(args.spellId, 17.8)
	self:Message(args.spellId, "orange")
	self:PlaySound(args.spellId, "alarm")
end

function mod:Enervate(args)
	self:CDBar(args.spellId, 16.1)
end

function mod:EnervateOrEnkindleApplied(args)
	if self:Me(args.destGUID) then
		if args.amount then
			self:StackMessage(args.spellId, "blue", args.destName, args.amount, 1)
		else
			self:PersonalMessage(args.spellId)
		end
		self:PlaySound(args.spellId, "info", nil, args.destName)
	end
end

function mod:Stomp(args)
	self:CDBar(args.spellId, 21)
	self:Message(args.spellId, "red")
	self:PlaySound(args.spellId, "alert")
end

do
	local unitTracker = {}
	function mod:Deaths(args)
		unitTracker[args.mobId] = nil
		killedBosses[args.mobId] = true
		local count = #killedBosses + 1
		killedBosses[count] = true

		local line = bossList[args.mobId]
		self:SetInfoBar("health", line, 0)
		self:SetInfo("health", line + 1, CL.dead)

		if count < 2 then
			self:Message("stages", "cyan", CL.mob_killed:format(args.destName, count, 2), false)
		end
	end

	function UpdateInfoBoxList()
		if not mod:IsEngaged() then return end
		mod:SimpleTimer(UpdateInfoBoxList, 0.5)

		for npcId in next, bossList do
			if not killedBosses[npcId] and (not unitTracker[npcId] or mod:MobId(mod:UnitGUID(unitTracker[npcId])) ~= npcId) then
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
