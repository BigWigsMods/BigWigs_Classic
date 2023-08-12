
--------------------------------------------------------------------------------
-- Module declaration
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
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{26556, "PROXIMITY", "SAY"}, -- Plague
		24340, -- Meteor
		26555, -- Shadow Storm
		8732, -- Thunderclap
		8269, -- Frenzy
		{25698, "FLASH"}, -- Explode
		"guard",
		"warrior",
	}, {
		[26556] = L.guardian,
	}
end

function mod:OnBossEnable()
	self:RegisterMessage("BigWigs_OnBossEngage", "Disable")

	self:Log("SPELL_AURA_APPLIED", "Plague", 26556)
	self:Log("SPELL_AURA_REFRESH", "Plague", 26556)
	self:Log("SPELL_AURA_REMOVED", "PlagueRemoved", 26556)

	self:Log("SPELL_DAMAGE", "Meteor", 24340)
	self:Log("SPELL_MISSED", "Meteor", 24340)

	-- XXX Shadow Storm has no (miss) event?
	self:Log("SPELL_DAMAGE", "ShadowStorm", 26555)
	self:Log("SPELL_MISSED", "ShadowStorm", 26555)

	self:Log("SPELL_DAMAGE", "Thunderclap", 8732)
	self:Log("SPELL_MISSED", "Thunderclap", 8732)

	self:Log("SPELL_AURA_APPLIED", "Frenzy", 8269)
	self:Log("SPELL_AURA_APPLIED", "Explode", 25698)

	self:Log("SPELL_SUMMON", "SummonAnubisathSwarmguard", 17430)
	self:Log("SPELL_SUMMON", "SummonAnubisathWarrior", 17431)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Plague(args)
	self:TargetMessage(26556, "yellow", args.destName)
	if self:Me(args.destGUID) then
		self:Say(26556)
		self:TargetBar(26556, 40, args.destName)
		self:OpenProximity(26556, 5)
	end
end

function mod:PlagueRemoved(args)
	if self:Me(args.destGUID) then
		self:CloseProximity(26556)
		self:StopBar(args.spellName, args.destName)
	end
end

do
	local prev = 0
	function mod:Meteor(args)
		local t = GetTime()
		if t-prev > 12 then
			prev = t
			self:Message(24340, "cyan")
		end
	end
end

do
	local prev = 0
	function mod:ShadowStorm(args)
		local t = GetTime()
		if t-prev > 5 then
			prev = t
			self:Message(26555, "yellow")
		end
	end
end

do
	local prev = 0
	function mod:Thunderclap(args)
		local t = GetTime()
		if t-prev > 10 then
			prev = t
			self:Message(8732, "cyan")
		end
	end
end

function mod:Frenzy(args)
	self:Message(8269, "red")
	self:PlaySound(8269, "long")
end

function mod:Explode(args)
	self:Message(25698, "orange", CL.casting:format(args.spellName))
	self:PlaySound(25698, "long")
	self:Bar(25698, 6) -- Duration is 7s but it expires after 6s
	self:Flash(25698)
end

function mod:SummonAnubisathSwarmguard(args)
	self:Message("guard", "green", args.spellName, L.guard_icon)
end

function mod:SummonAnubisathWarrior(args)
	self:Message("warrior", "green", args.spellName, L.warrior_icon)
end
