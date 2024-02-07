--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Azuregos", -1447)
if not mod then return end
mod:RegisterEnableMob(6109)
mod.otherMenu = -947
mod.worldBoss = 6109

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
	},nil,{
		[21147] = CL.teleport, -- Arcane Vacuum (Teleport)
	}
end

function mod:OnRegister()
	self.displayName = L.bossName
end

function mod:OnBossEnable()
	--self:ScheduleTimer("CheckForEngage", 1)
	--self:RegisterEvent("BOSS_KILL")

	self:Log("SPELL_AURA_APPLIED", "Reflection", 22067)
	self:Log("SPELL_AURA_REMOVED", "ReflectionRemoved", 22067)

	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")

	self:Death("Win", 6109)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

--function mod:BOSS_KILL(_, id)
--	if id == 0000 then
--		self:Win()
--	end
--end

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
