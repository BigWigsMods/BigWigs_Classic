--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Ruins of Ahn'Qiraj Trash", 509)
if not mod then return end
mod.displayName = CL.trash
mod:RegisterEnableMob(15355) -- Anubisath Guardian

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale()
if L then
	L.guardian = "Anubisath Guardian"

	L.guard = 17430 -- Summon Anubisath Swarmguard
	L.guard_icon = "spell_nature_insectswarm"

	L.warrior = 17431 -- Summon Anubisath Warrior
	L.warrior_icon = "ability_warrior_savageblow"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{26556, "SAY", "ME_ONLY_EMPHASIZE"}, -- Plague (Fake proxy spell as 22997 has no description)
		24340, -- Meteor
		14297, -- Shadow Storm
		8732, -- Thunderclap
		8269, -- Frenzy / Enrage (different name on classic era)
		{25698, "EMPHASIZE", "COUNTDOWN"}, -- Explode
		"guard",
		"warrior",
	},{
		[26556] = L.guardian,
	},{
		[25698] = CL.explosion, -- Explode (Explosion)
	}
end

function mod:OnBossEnable()
	self:RegisterMessage("BigWigs_OnBossEngage", "Disable")

	self:Log("SPELL_AURA_APPLIED", "PlagueApplied", 22997)
	self:Log("SPELL_AURA_REFRESH", "PlagueApplied", 22997)
	self:Log("SPELL_AURA_REMOVED", "PlagueRemoved", 22997)

	self:Log("SPELL_DAMAGE", "Meteor", 24340)
	self:Log("SPELL_MISSED", "Meteor", 24340)

	-- Shadow Storm has no (miss) event?
	self:Log("SPELL_DAMAGE", "ShadowStorm", 14297)
	self:Log("SPELL_MISSED", "ShadowStorm", 14297)

	self:Log("SPELL_DAMAGE", "Thunderclap", 8732)
	self:Log("SPELL_MISSED", "Thunderclap", 8732)

	self:Log("SPELL_AURA_APPLIED", "FrenzyEnrage", 8269)
	self:Log("SPELL_AURA_APPLIED", "ExplodeApplied", 25698)
	self:Log("SPELL_AURA_REMOVED", "ExplodeRemoved", 25698)

	self:Log("SPELL_SUMMON", "SummonAnubisathSwarmguard", 17430)
	self:Log("SPELL_SUMMON", "SummonAnubisathWarrior", 17431)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:PlagueApplied(args)
	self:TargetMessage(26556, "yellow", args.destName)
	if self:Me(args.destGUID) then
		self:Say(26556, nil, nil, "Plague")
		self:TargetBar(26556, 40, args.destName)
		self:PlaySound(26556, "warning", nil, args.destName)
	end
end

function mod:PlagueRemoved(args)
	if self:Me(args.destGUID) then
		self:StopBar(args.spellName, args.destName)
	end
end

do
	local prev = 0
	function mod:Meteor(args)
		if args.time-prev > 12 then
			prev = args.time
			self:Message(args.spellId, "red")
			self:PlaySound(args.spellId, "info")
		end
	end
end

do
	local prev = 0
	function mod:ShadowStorm(args)
		if args.time-prev > 12 then
			prev = args.time
			self:Message(args.spellId, "red")
			self:PlaySound(args.spellId, "alarm")
		end
	end
end

do
	local prev = 0
	function mod:Thunderclap(args)
		if args.time-prev > 12 then
			prev = args.time
			self:Message(args.spellId, "orange")
			self:PlaySound(args.spellId, "alert")
		end
	end
end

function mod:FrenzyEnrage(args)
	self:Message(args.spellId, "red")
	self:PlaySound(args.spellId, "long")
end

function mod:ExplodeApplied(args)
	self:Message(args.spellId, "orange", CL.explosion)
	self:PlaySound(args.spellId, "long")
	self:Bar(args.spellId, 6, CL.explosion) -- Duration is 7s but it expires after 6s
end

function mod:ExplodeRemoved()
	self:StopBar(CL.explosion)
end

function mod:SummonAnubisathSwarmguard(args)
	self:Message("guard", "green", args.spellName, L.guard_icon)
end

function mod:SummonAnubisathWarrior(args)
	self:Message("warrior", "green", args.spellName, L.warrior_icon)
end
