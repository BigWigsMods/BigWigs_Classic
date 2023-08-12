--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Firemaw", 469, 1532)
if not mod then return end
mod:RegisterEnableMob(11983)
mod:SetEncounterID(613)

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		23339, -- Wing Buffet
		22539, -- Shadow Flame
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "WingBuffet", 23339)
	self:Log("SPELL_CAST_START", "ShadowFlame", 22539)
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

