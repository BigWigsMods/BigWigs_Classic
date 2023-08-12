--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Anub'Rekhan", 533, 1601)
if not mod then return end
mod:RegisterEnableMob(15956)
mod:SetEncounterID(1107)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale()
if L then
	L.gainwarn10sec = "~10 sec until Locust Swarm"
	L.gainincbar = "~Next Locust Swarm"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		28783, -- Impale
		28785, -- Locus Swarm
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "Impale", 28783)
	self:Log("SPELL_AURA_APPLIED", "GainSwarm", 28785)
	self:Log("SPELL_CAST_START", "Swarm", 28785)
end

function mod:OnEngage()
	self:Message(28785, "yellow", CL.custom_start_s:format(self.displayName, self:SpellName(28785), 90), false)
	self:DelayedMessage(28785, 80, "red", L.gainwarn10sec)
	self:CDBar(28785, 90, L.gainincbar, 28785)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Impale(args)
	self:Message(28783, "orange")
end

function mod:GainSwarm(args)
	self:Bar(28785, 20)
	self:DelayedMessage(28785, 20, "red", CL.over:format(args.spellName))
	self:Bar(28785, 85, L.gainincbar)
	self:DelayedMessage(28785, 75, "red", L.gainwarn10sec)
end

function mod:Swarm(args)
	self:Message(28785, "yellow", CL.incoming:format(args.spellName))
	self:Bar(28785, 3.25, CL.incoming:format(args.spellName))
end
