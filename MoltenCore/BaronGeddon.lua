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
end

function mod:OnEngage()
	self:CDBar(19659, 6) -- Ignite Mana
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:LivingBomb(args)
	if self:Me(args.destGUID) then
		self:Say(args.spellId, CL.bomb, nil, "Bomb")
		self:SayCountdown(args.spellId, 8)
	end
	self:TargetMessage(args.spellId, "red", args.destName, CL.bomb)
	self:TargetBar(args.spellId, 8, args.destName, CL.bomb)
	self:PrimaryIcon(args.spellId, args.destName)
	self:PlaySound(args.spellId, "warning")
end

function mod:LivingBombRemoved(args)
	if self:Me(args.destGUID) then
		self:CancelSayCountdown(args.spellId)
	end
	self:StopBar(CL.bomb, args.destName)
	self:PrimaryIcon(args.spellId)
end

function mod:Inferno(args)
	self:Message(args.spellId, "red")
	self:CastBar(args.spellId, 8)
	self:CDBar(args.spellId, 21) -- 21-29
	self:PlaySound(args.spellId, "long")
end

function mod:Armageddon(args)
	self:Bar(args.spellId, 8)
	self:Message(args.spellId, "orange")
end

function mod:IgniteMana(args)
	self:CDBar(args.spellId, 27)
	self:Message(args.spellId, "yellow", CL.on_group:format(args.spellName))
	self:PlaySound(args.spellId, "info")
end
