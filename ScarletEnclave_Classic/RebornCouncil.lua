--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Reborn Council", 2856)
if not mod then return end
mod:RegisterEnableMob(240795, 240809, 240810) -- Herod, Vishas, Doan
mod:SetEncounterID(3188)
mod:SetRespawnTime(12)
mod:SetAllowWin(true)

--------------------------------------------------------------------------------
-- Locals
--

local peeledSecretsCount = 1
local killedBosses = {}
local UpdateInfoBoxList
local bossList = {
	[240795] = 1, -- Herod
	[240809] = 3, -- Vishas
	[240810] = 5, -- Doan
}

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bossName = "Reborn Council"
	L[240795] = "Herod"
	L[240809] = "Vishas"
	L[240810] = "Doan"

	L.custom_select_interrupt_counter = "Interrupt Counter"
	L.custom_select_interrupt_counter_desc = "Choose when the interrupt counter should reset back to 1."
	L.custom_select_interrupt_counter_icon = "ability_kick"
	L.custom_select_interrupt_counter_value1 = "Count to 2. 1,2,1,2, etc."
	L.custom_select_interrupt_counter_value2 = "Count to 3. 1,2,3,1,2,3, etc."
	L.custom_select_interrupt_counter_value3 = "Count to 4. 1,2,3,4,1,2,3,4, etc."
	L.custom_select_interrupt_counter_value4 = "Count to 5. 1,2,3,4,5,1,2,3,4,5, etc."
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{1231095, "NAMEPLATE"}, -- Peeled Secrets
		"custom_select_interrupt_counter",
		"stages",
		{"health", "INFOBOX"},
		"berserk",
	}
end

function mod:OnRegister()
	self.displayName = L.bossName
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "UpdateMarks", 1231227, 1231200, 1236220) -- Reborn Inspiration, Fireball, Slow
	self:Log("SPELL_CAST_START", "PeeledSecrets", 1231095)
	self:Log("SPELL_CAST_SUCCESS", "PeeledSecretsSuccess", 1231095)
	self:Log("SPELL_INTERRUPT", "PeeledSecretsInterrupted", "*")
	self:Death("Deaths", 240795, 240809, 240810)
end

do
	local function UpdateNameplate()
		UpdateInfoBoxList() -- Just re-using this function as we want both UpdateNameplate and UpdateInfoBoxList on a 1sec delay from engage

		local guid = mod:GetUnitIdByGUID(240809)
		if guid then
			mod:Nameplate(1231095, 20, guid, (">%d<"):format(peeledSecretsCount))
		end
	end

	function mod:OnEngage()
		peeledSecretsCount = 1
		killedBosses = {}

		self:OpenInfo("health", CL.other:format("BigWigs", CL.health))
		for npcId, line in next, bossList do
			self:SetInfo("health", line, L[npcId])
			self:SetInfoBar("health", line, 1)
			self:SetInfo("health", line + 1, "100%")
		end
		self:SimpleTimer(UpdateNameplate, 1)

		self:Berserk(330)
	end
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:UpdateMarks(args)
	self:RemoveLog("SPELL_CAST_SUCCESS", args.spellId)

	local icon = self:GetIconTexture(self:GetIcon(args.sourceRaidFlags))
	if icon then
		local npcId = self:MobId(args.sourceGUID)
		local line = bossList[npcId]
		self:SetInfo("health", line, icon.. L[npcId]) -- Add raid icons to the boss names
	end
end

do
	local inRange = false
	function mod:PeeledSecrets(args)
		local icon = self:GetIconTexture(self:GetIcon(args.sourceRaidFlags))
		if icon then
			self:SetInfo("health", 3, icon.. L[240809]) -- Add raid icons to the boss names
		end

		local unit = self:GetUnitIdByGUID(args.sourceGUID)
		if not unit or self:UnitWithinRange(unit, 10) or args.sourceGUID == self:UnitGUID("target") then
			inRange = true
			self:Message(args.spellId, "orange", CL.count:format(args.spellName, peeledSecretsCount))
			self:PlaySound(args.spellId, "info")
		else
			inRange = false
		end
		self:Nameplate(args.spellId, 20, args.sourceGUID, (">%d<"):format(peeledSecretsCount))
	end

	function mod:PeeledSecretsSuccess(args)
		peeledSecretsCount = peeledSecretsCount + 1
		local option = self:GetOption("custom_select_interrupt_counter") + 2
		if peeledSecretsCount == option then peeledSecretsCount = 1 end
		self:Nameplate(args.spellId, 20, args.sourceGUID, (">%d<"):format(peeledSecretsCount))
	end

	function mod:PeeledSecretsInterrupted(args)
		if args.extraSpellName == self:SpellName(1231095) then
			if inRange then
				self:Message(1231095, "green", CL.interrupted_by:format(CL.count:format(args.extraSpellName, peeledSecretsCount), self:ColorName(args.sourceName)))
			end
			peeledSecretsCount = peeledSecretsCount + 1
			local option = self:GetOption("custom_select_interrupt_counter") + 2
			if peeledSecretsCount == option then peeledSecretsCount = 1 end
			self:Nameplate(1231095, 20, args.destGUID, (">%d<"):format(peeledSecretsCount))
		end
	end
end

do
	local unitTracker = {}
	local currentHealth = {}
	function mod:Deaths(args)
		unitTracker[args.mobId] = nil
		killedBosses[args.mobId] = true
		local count = #killedBosses + 1
		killedBosses[count] = true

		local line = bossList[args.mobId]
		self:SetInfoBar("health", line, 0)
		self:SetInfo("health", line + 1, CL.dead)

		if count < 3 then
			self:Message("stages", "cyan", CL.mob_killed:format(args.destName, count, 3), false)
		else
			unitTracker, currentHealth = {}, {}
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
			if currentHealthPercent ~= currentHealth[npcId] then
				currentHealth[npcId] = currentHealthPercent
				mod:SetInfoBar("health", line, currentHealthPercent/100)
				mod:SetInfo("health", line + 1, ("%d%%"):format(currentHealthPercent))
			end
		end
	end
end
