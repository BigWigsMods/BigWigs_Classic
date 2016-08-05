
--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Ruins of Ahn'Qiraj Trash", 717)
if not mod then return end
mod.displayName = CL.trash
mod:RegisterEnableMob(15355) -- Anubisath Guardian

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.guardian = "Anubisath Guardian"

	L.guard = 17430 -- Summon Anubisath Swarmguard
	L.guard_icon = 36034 -- ability_hunter_pet_wasp / Firefly

	L.warrior = 17431 -- Summon Anubisath Warrior
	L.warrior_icon = 12294 -- ability_warrior_savageblow / Mortal Strike
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{26556, "PROXIMITY", "SAY"}, -- Plague. Use this id as it has a description unlike 22997
		8269, -- Frenzy
		8732, -- Thunderclap
		24340, -- Meteor
		{25698, "FLASH"}, -- Explode
		"guard",
		"warrior",
	}, {
		[26556] = L.guardian,
	}
end

function mod:OnBossEnable()
	self:RegisterMessage("BigWigs_OnBossEngage", "Disable")

	self:Log("SPELL_AURA_APPLIED", "Plague", 22997)
	self:Log("SPELL_AURA_REFRESH", "Plague", 22997)
	self:Log("SPELL_AURA_REMOVED", "PlagueRemoved", 22997)
	self:Log("SPELL_AURA_APPLIED", "Frenzy", 8269)
	self:Log("SPELL_AURA_APPLIED", "Explode", 25698)

	self:Log("SPELL_DAMAGE", "Thunderclap", 8732)
	self:Log("SPELL_MISSED", "Thunderclap", 8732)

	self:Log("SPELL_DAMAGE", "Meteor", 24340)
	self:Log("SPELL_MISSED", "Meteor", 24340)

	-- XXX shadowstorm (aoe shadow bolt) is missing?

	self:Log("SPELL_SUMMON", "SummonAnubisathSwarmguard", 17430)
	self:Log("SPELL_SUMMON", "SummonAnubisathWarrior", 17431)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Plague(args)
	self:TargetMessage(26556, args.destName, "Attention")
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

function mod:Frenzy(args)
	self:Message(args.spellId, "Important", "Long")
end

function mod:Explode(args)
	self:Message(args.spellId, "Urgent", "Alert", CL.casting:format(args.spellName))
	self:Bar(args.spellId, 6) -- Duration is 7s but it expires after 6s
	self:Flash(args.spellId)
end

do
	local prev = 0
	function mod:Thunderclap(args)
		local t = GetTime()
		if t-prev > 12 then
			prev = t
			self:Message(args.spellId, "Neutral")
		end
	end
end

do
	local prev = 0
	function mod:Meteor(args)
		local t = GetTime()
		if t-prev > 12 then
			prev = t
			self:Message(args.spellId, "Neutral")
		end
	end
end

function mod:SummonAnubisathSwarmguard(args)
	self:Message("guard", "Positive", nil, args.spellName, L.guard_icon)
end

function mod:SummonAnubisathWarrior(args)
	self:Message("warrior", "Positive", nil, args.spellName, L.warrior_icon)
end

