
--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Ahn'Qiraj Trash", 766)
if not mod then return end
mod.displayName = CL.trash
mod:RegisterEnableMob(
	15277, -- Anubisath Defender
	15240 -- Vekniss Hive Crawler
)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.defender = "Anubisath Defender"
	L.crawler = "Vekniss Hive Crawler"

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
		{26556, "PROXIMITY", "SAY"}, -- Plague
		8269, -- Frenzy
		26554, -- Thunderclap
		26558, -- Meteor
		{25698, "FLASH"}, -- Explode
		"guard",
		"warrior",
		25051, -- Sunder Armor
	}, {
		[26556] = L.defender,
		[25051] = L.crawler,
	}
end

function mod:OnBossEnable()
	self:RegisterMessage("BigWigs_OnBossEngage", "Disable")

	self:Log("SPELL_AURA_APPLIED", "Plague", 26556)
	self:Log("SPELL_AURA_REFRESH", "Plague", 26556)
	self:Log("SPELL_AURA_REMOVED", "PlagueRemoved", 26556)
	self:Log("SPELL_AURA_APPLIED", "Frenzy", 8269)
	self:Log("SPELL_AURA_APPLIED", "Explode", 25698)

	self:Log("SPELL_DAMAGE", "Thunderclap", 26554)
	self:Log("SPELL_MISSED", "Thunderclap", 26554)

	self:Log("SPELL_DAMAGE", "Meteor", 26558)
	self:Log("SPELL_MISSED", "Meteor", 26558)

	-- XXX shadowstorm (aoe shadow bolt) is missing? Guessing 26555

	self:Log("SPELL_SUMMON", "SummonAnubisathSwarmguard", 17430)
	self:Log("SPELL_SUMMON", "SummonAnubisathWarrior", 17431)

	self:Log("SPELL_AURA_APPLIED", "SunderArmor", 25051)
	self:Log("SPELL_AURA_APPLIED_DOSE", "SunderArmor", 25051)
	self:Log("SPELL_AURA_REMOVED", "SunderArmorRemoved", 25051)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

--[[ Anubisath Defender ]]--

function mod:Plague(args)
	self:TargetMessage(args.spellId, args.destName, "Attention")
	if self:Me(args.destGUID) then
		self:Say(args.spellId)
		self:TargetBar(args.spellId, 40, args.destName)
		self:OpenProximity(args.spellId, 5)
	end
end

function mod:PlagueRemoved(args)
	if self:Me(args.destGUID) then
		self:CloseProximity(args.spellId)
		self:StopBar(args.spellId, args.destName)
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

--[[ Vekniss Hive Crawler ]]--

function mod:SunderArmor(args)
	self:StackMessage(args.spellId, args.destName, args.amount, "Attention")
	self:TargetBar(args.spellId, 20, args.destName)
end

function mod:SunderArmorRemoved(args)
	self:StopBar(args.spellName, args.destName)
end

