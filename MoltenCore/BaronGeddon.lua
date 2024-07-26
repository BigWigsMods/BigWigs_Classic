--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Baron Geddon", 409, 1524)
if not mod then return end
mod:RegisterEnableMob(12056, 228433) -- Baron Geddon, Baron Geddon (Season of Discovery)
mod:SetEncounterID(668)

--------------------------------------------------------------------------------
-- Initialization
--

local livingBombMarker = mod:AddMarkerOption(true, "player", 8, 20475, 8, 7, 6) -- Living Bomb
function mod:GetOptions()
	return {
		{20475, "SAY", "SAY_COUNTDOWN", "ME_ONLY_EMPHASIZE"}, -- Living Bomb
		livingBombMarker,
		{19695, "CASTBAR"}, -- Inferno
		{20478, "EMPHASIZE"}, -- Armageddon
		19659, -- Ignite Mana
	},nil,{
		[20475] = CL.bomb, -- Living Bomb (Bomb)
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "LivingBombApplied", 20475)
	self:Log("SPELL_AURA_REMOVED", "LivingBombRemoved", 20475)
	self:Log("SPELL_CAST_SUCCESS", "Inferno", 19695)
	self:Log("SPELL_CAST_SUCCESS", "Armageddon", 20478)
	self:Log("SPELL_CAST_SUCCESS", "IgniteMana", 19659)
	if self:Vanilla() then
		self:Log("SPELL_CAST_SUCCESS", "LivingBomb", 461090, 461105) -- Level 1, Level 2 & 3
		self:Log("SPELL_AURA_APPLIED", "LivingBombAppliedSoD", 461090, 461105) -- Level 1, Level 2 & 3
		self:Log("SPELL_AURA_REMOVED", "LivingBombRemoved", 461090, 461105) -- Level 1, Level 2 & 3
		self:Log("SPELL_CAST_SUCCESS", "Inferno", 461087, 461110) -- Level 1, Level 2 & 3
		self:Log("SPELL_CAST_SUCCESS", "Armageddon", 461121)
	end
end

function mod:OnEngage()
	self:CDBar(19659, 6) -- Ignite Mana
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	do
		local playerList = {}
		local icon = 8
		function mod:LivingBomb()
			playerList = {}
			icon = 8
			self:PlaySound(20475, "warning")
		end

		function mod:LivingBombAppliedSoD(args)
			playerList[#playerList+1] = args.destName
			self:TargetsMessage(20475, "orange", playerList, args.spellId == 461090 and 2 or 3, CL.bomb)
			self:TargetBar(20475, 8, args.destName, CL.bomb)
			self:CustomIcon(livingBombMarker, args.destName, icon)
			icon = icon - 1
			if self:Me(args.destGUID) then
				self:Say(20475, CL.bomb, nil, "Bomb")
				self:SayCountdown(20475, 8)
			end
		end
	end
end

function mod:LivingBombApplied(args)
	if self:Me(args.destGUID) then
		self:Say(20475, CL.bomb, nil, "Bomb")
		self:SayCountdown(20475, 8)
	end
	self:TargetMessage(20475, "red", args.destName, CL.bomb)
	self:TargetBar(20475, 8, args.destName, CL.bomb)
	self:CustomIcon(livingBombMarker, args.destName, 8)
	self:PlaySound(20475, "warning")
end

function mod:LivingBombRemoved(args)
	if self:Me(args.destGUID) then
		self:CancelSayCountdown(20475)
	end
	self:StopBar(CL.bomb, args.destName)
	self:CustomIcon(livingBombMarker, args.destName)
end

function mod:Inferno()
	self:Message(19695, "red")
	self:CastBar(19695, 8)
	self:CDBar(19695, 21) -- 21-29
	self:PlaySound(19695, "long")
end

function mod:Armageddon(args)
	self:Bar(20478, args.spellId == 20478 and 8 or 15)
	self:Message(20478, "orange")
end

function mod:IgniteMana(args)
	self:CDBar(args.spellId, 27)
	self:Message(args.spellId, "yellow", CL.on_group:format(args.spellName))
	self:PlaySound(args.spellId, "info")
end
