--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Baron Geddon", 409, 1524)
if not mod then return end
mod:RegisterEnableMob(12056)
mod:SetEncounterID(668)

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{20475, "ICON", "SAY", "SAY_COUNTDOWN", "ME_ONLY_EMPHASIZE"}, -- Living Bomb
		{19695, "CASTBAR"}, -- Inferno
		20478, -- Armageddon
		19659, -- Ignite Mana
	},nil,{
		[20475] = CL.bomb, -- Living Bomb (Bomb)
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "LivingBomb", 20475)
	self:Log("SPELL_AURA_REMOVED", "LivingBombRemoved", 20475)
	self:Log("SPELL_CAST_SUCCESS", "Inferno", 19695)
	self:Log("SPELL_CAST_SUCCESS", "Armageddon", 20478)
	self:Log("SPELL_CAST_SUCCESS", "IgniteMana", 19659)
	if self:Vanilla() then
		self:Log("SPELL_AURA_APPLIED", "LivingBomb", 461090, 461105, 462402) -- XXX verify
		self:Log("SPELL_AURA_REMOVED", "LivingBombRemoved", 461090, 461105, 462402) -- XXX verify
		self:Log("SPELL_CAST_SUCCESS", "Inferno", 461087, 461110) -- XXX verify
		self:Log("SPELL_CAST_SUCCESS", "Armageddon", 461862)
	end
end

function mod:OnEngage()
	self:CDBar(19659, 6) -- Ignite Mana
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:LivingBomb(args)
	if self:Me(args.destGUID) then
		self:Say(20475, CL.bomb, nil, "Bomb")
		self:SayCountdown(20475, 8)
	end
	self:TargetMessage(20475, "red", args.destName, CL.bomb)
	self:TargetBar(20475, 8, args.destName, CL.bomb)
	self:PrimaryIcon(20475, args.destName)
	self:PlaySound(20475, "warning")
end

function mod:LivingBombRemoved(args)
	if self:Me(args.destGUID) then
		self:CancelSayCountdown(20475)
	end
	self:StopBar(CL.bomb, args.destName)
	self:PrimaryIcon(20475)
end

function mod:Inferno()
	self:Message(19695, "red")
	self:CastBar(19695, 8)
	self:CDBar(19695, 21) -- 21-29
	self:PlaySound(19695, "long")
end

function mod:Armageddon()
	self:Bar(20478, 8)
	self:Message(20478, "orange")
end

function mod:IgniteMana(args)
	self:CDBar(args.spellId, 27)
	self:Message(args.spellId, "yellow", CL.on_group:format(args.spellName))
	self:PlaySound(args.spellId, "info")
end
