
--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("The Twin Emperors", 766, 1549)
if not mod then return end
mod:RegisterEnableMob(15275, 15276) -- Emperor Vek'nilash, Emperor Vek'lor

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		7393, -- Heal Brother
		800, -- Twin Teleport
		802, -- Mutate Bug
		26607, -- Blizzard
		"berserk",
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "TwinTeleport", 800)
	self:Log("SPELL_HEAL", "HealBrother", 7393)
	self:Log("SPELL_CAST_SUCCESS", "MutateBug", 802)

	self:Log("SPELL_PERIODIC_DAMAGE", "BlizzardDamage", 26607)
	self:Log("SPELL_PERIODIC_MISSED", "BlizzardDamage", 26607)
	self:Log("SPELL_AURA_APPLIED", "BlizzardDamage", 26607)

	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")

	self:Death("Win", 15275, 15276)
end

function mod:OnEngage()
	self:StartWipeCheck()
	self:Berserk(900)
	self:DelayedMessage(800, 20, "Urgent", CL.custom_sec:format(self:SpellName(800), 10))
	self:DelayedMessage(800, 25, "Important", CL.custom_sec:format(self:SpellName(800), 5))
	self:Bar(800, 30)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local prev = 0
	function mod:TwinTeleport(args)
		local t = GetTime()
		if t-prev > 2 then
			prev = t
			self:Message(args.spellId, "Attention", "Info")
			self:DelayedMessage(args.spellId, 20, "Urgent", CL.custom_sec:format(args.spellName, 10))
			self:DelayedMessage(args.spellId, 25, "Important", CL.custom_sec:format(args.spellName, 5))
			self:Bar(args.spellId, 30)
		end
	end
end

do
	local prev = 0
	function mod:HealBrother(args)
		local t = GetTime()
		if t-prev > 10 then
			prev = t
			self:Message(args.spellId, "Important", "Warning", CL.casting:format(args.spellName))
		end
	end
end

function mod:MutateBug(args)
	self:Message(args.spellId, "Neutral")
end

do
	local prev = 0
	function mod:BlizzardDamage(args)
		local t = GetTime()
		if t-prev > 2 and self:Me(args.destGUID) then
			prev = t
			self:Message(args.spellId, "Personal", "Alarm", CL.you:format(args.spellName))
		end
	end
end

