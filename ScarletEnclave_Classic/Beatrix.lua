--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("High Commander Beatrix", 2856)
if not mod then return end
mod:RegisterEnableMob(240812)
mod:SetEncounterID(3187)
mod:SetAllowWin(true)
mod:SetStage(1)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bossName = "High Commander Beatrix"

	L.meteor = CL.meteor
	L.meteor_desc = 28884
	L.meteor_icon = "spell_fire_meteorstorm"
	L.meteor_yell_trigger = "As you wish" -- As you wish, High Commander!

	L.waves = CL.waves
	L.waves_icon = "spell_holy_prayerofhealing"
	L.waves_footmen_yell_trigger = "Form up" -- Form up and hold the line!
	L.waves_cavalry_yell_trigger = "Ready your lances" -- Understod! Ready your lances!
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"meteor",
		"waves",
		{1232390, "ME_ONLY_EMPHASIZE"}, -- Rose's Thorn
		1232389, -- Unwavering Blade
		"stages",
		"berserk",
	},nil,{
		[1232389] = CL.tank_debuff, -- Unwavering Blade (Tank Debuff)
	}
end

function mod:OnRegister()
	self.displayName = L.bossName
end

function mod:OnBossEnable()
	self:RegisterMessage("BigWigs_UNIT_TARGET")
	self:RegisterEvent("NAME_PLATE_UNIT_ADDED")
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:Log("SPELL_CAST_SUCCESS", "RosesThorn", 1232390)
	self:Log("SPELL_AURA_APPLIED", "RosesThornApplied", 1232390)
	self:Log("SPELL_CAST_SUCCESS", "UnwaveringBlade", 1232389)
	self:Log("SPELL_AURA_APPLIED", "UnwaveringBladeApplied", 1232389)
	self:Log("SPELL_AURA_REFRESH", "UnwaveringBladeApplied", 1232389)
end

function mod:OnEngage()
	self:SetStage(1)
	self:Message("stages", "cyan", CL.stage:format(1), false)
	self:Bar("stages", 120, CL.stage:format(2), "ability_mount_charger")
	self:Berserk(600, true) -- No engage message
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:BigWigs_UNIT_TARGET(_, mobId, unitTarget)
	if mobId == 240812 and self:GetStage() ~= 2 and UnitCanAttack(unitTarget, "player") then -- High Commander Beatrix
		self:SetStage(2)
		local msg = CL.stage:format(2)
		self:StopBar(msg)
		self:CDBar(1232389, 16, CL.tank_debuff) -- Unwavering Blade
		self:Message("stages", "cyan", msg, false)
		self:PlaySound("stages", "long")
	end
end

function mod:NAME_PLATE_UNIT_ADDED(_, unit)
	if self:GetStage() ~= 2 and self:MobId(self:UnitGUID(unit)) == 240812 then -- High Commander Beatrix
		self:SetStage(2)
		local msg = CL.stage:format(2)
		self:StopBar(msg)
		self:CDBar(1232389, 16, CL.tank_debuff) -- Unwavering Blade
		self:Message("stages", "cyan", msg, false)
		self:PlaySound("stages", "long")
	end
end

function mod:CHAT_MSG_MONSTER_YELL(_, msg)
	if msg:find(L.meteor_yell_trigger, nil, true) then
		self:Message("meteor", "orange", L.meteor, L.meteor_icon)
		self:Bar("meteor", 16, L.meteor, L.meteor_icon)
		self:PlaySound("meteor", "alert")
	elseif msg:find(L.waves_footmen_yell_trigger, nil, true) then
		self:Message("waves", "yellow", CL.incoming:format(L.waves), L.waves_icon)
		self:Bar("waves", 30, L.waves, L.waves_icon)
		self:PlaySound("waves", "info")
	elseif msg:find(L.waves_cavalry_yell_trigger, nil, true) then
		self:Message("waves", "yellow", CL.incoming:format(L.waves), L.waves_icon)
		self:Bar("waves", 18, L.waves, L.waves_icon)
		self:PlaySound("waves", "info")
	end
end

do
	local playerList = {}
	function mod:RosesThorn()
		playerList = {}
	end

	function mod:RosesThornApplied(args)
		playerList[#playerList + 1] = args.destName
		self:TargetsMessage(args.spellId, "red", playerList)
		if self:Me(args.destGUID) then
			self:PlaySound(args.spellId, "warning", nil, args.destName)
		end
	end
end

function mod:UnwaveringBlade(args)
	self:CDBar(args.spellId, 16.1, CL.tank_debuff)
end

function mod:UnwaveringBladeApplied(args)
	self:TargetMessage(args.spellId, "purple", args.destName, CL.tank_debuff)
	self:PlaySound(args.spellId, "alarm", nil, args.destName)
end
