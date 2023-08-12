--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Ebonroc", 469, 1533)
if not mod then return end
mod:RegisterEnableMob(14601)
mod:SetEncounterID(614)

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		23339, -- Wing Buffet
		22539, -- Shadow Flame
		{23340, "ICON"}, -- Shadow of Ebonroc
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "WingBuffet", 23339)
	self:Log("SPELL_CAST_START", "ShadowFlame", 22539)
	self:Log("SPELL_AURA_APPLIED", "Curse", 23340)
	self:Log("SPELL_AURA_REMOVED", "CurseRemoved", 23340)
end

function mod:OnEngage()
	self:Bar(23339, 29) -- Wing Buffet
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:WingBuffet(args)
	self:Message(23339, "red")
	self:DelayedMessage(23339, 27, "orange", CL.custom_sec:format(args.spellName, 5))
	self:Bar(23339, 32)
end

function mod:ShadowFlame(args)
	self:Message(22539, "red")
end

function mod:Curse(args)
	self:TargetMessage(23340, "yellow", args.destName)
	self:TargetBar(23340, 8, args.destName)
	self:PrimaryIcon(23340, args.destName)
end

function mod:CurseRemoved(args)
	self:StopBar(23340, args.destName) -- Shadow
	self:PrimaryIcon(23340)
end

