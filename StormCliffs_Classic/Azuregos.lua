--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Azuregos Season of Discovery", 2791)
if not mod then return end
mod:RegisterEnableMob(6109)
mod:SetEncounterID(3027)
mod:SetAllowWin(true)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bossName = "Azuregos"

	L.teleport_trigger = "Come, little ones"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		22067, -- Reflection
		21147, -- Arcane Vacuum
		"stages",
	},nil,{
		[21147] = CL.teleport, -- Arcane Vacuum (Teleport)
	}
end

function mod:OnRegister()
	self.displayName = L.bossName
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Reflection", 22067)
	self:Log("SPELL_AURA_REMOVED", "ReflectionRemoved", 22067)

	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
end

function mod:OnEngage()
	self:Message("stages", "cyan", CL.stage:format(1), false)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Reflection(args)
	self:Message(args.spellId, "yellow", CL.duration:format(args.spellName, 10))
	self:Bar(args.spellId, 10)
	self:PlaySound(args.spellId, "warning")
end

function mod:ReflectionRemoved(args)
	self:Message(args.spellId, "green", CL.over:format(args.spellName))
	self:PlaySound(args.spellId, "info")
end

function mod:CHAT_MSG_MONSTER_YELL(_, msg)
	if msg:find(L.teleport_trigger, nil, true) then
		self:Message(21147, "red", CL.teleport)
	end
end
