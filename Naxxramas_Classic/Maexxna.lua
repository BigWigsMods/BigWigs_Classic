--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Maexxna", 533, 1603)
if not mod then return end
mod:RegisterEnableMob(15952)
mod:SetEncounterID(1116)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.cocoons = "Cocoons"
	L.adds_icon = "inv_misc_monsterspidercarapace_01"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{28622, "SAY"}, -- Web Wrap
		"adds",
		{29484, "EMPHASIZE", "COUNTDOWN"}, -- Web Spray
		28776, -- Necrotic Poison
		28747, -- Frenzy / Enrage (different name on classic era)
	},nil,{
		[28622] = L.cocoons, -- Web Wrap (Cocoons)
		[28747] = CL.hp:format(30), -- Frenzy / Enrage (30% HP)
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "WebWrapApplied", 28622)
	self:Log("SPELL_CAST_SUCCESS", "WebSpray", 29484)
	self:Log("SPELL_AURA_APPLIED", "NecroticPoison", 28776)
	self:Log("SPELL_DISPEL", "NecroticPoisonDispelled", "*")
	self:Log("SPELL_AURA_APPLIED", "FrenzyEnrage", 28747)

	self:Death("Win", 15952)
end

function mod:OnEngage()
	self:RegisterEvent("UNIT_HEALTH")

	self:DelayedMessage("adds", 30, "yellow", CL.adds, L.adds_icon) -- Spiders

	self:Bar(28622, 18, L.cocoons) -- Web Wrap
	self:Bar("adds", 30, CL.adds, L.adds_icon) -- Spiders
	self:Bar(29484, 40) -- Web Spray
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local playerList, prev = {}, 0
	function mod:WebWrapApplied(args)
		if self:Me(args.destGUID) then
			self:Say(args.spellId, nil, nil, "Web Wrap")
		end
		if args.time - prev > 5 then
			prev = args.time
			playerList = {}
			self:StopBar(L.cocoons)
			self:PlaySound(args.spellId, "alert")
		end
		playerList[#playerList+1] = args.destName
		self:TargetsMessage(args.spellId, "yellow", playerList, 3, L.cocoons, nil, 1)
	end
end

function mod:WebSpray(args)
	self:Message(args.spellId, "red")
	self:Bar(args.spellId, 40)
	self:DelayedMessage("adds", 30, "yellow", CL.adds, L.adds_icon) -- Spiders

	self:Bar(28622, 18, L.cocoons) -- Web Wrap
	self:Bar("adds", 30, CL.adds, L.adds_icon) -- Spiders
	self:PlaySound(args.spellId, "long")
end

function mod:NecroticPoison(args)
	self:TargetMessage(args.spellId, "purple", args.destName)
	if self:Me(args.destGUID) or self:Healer() or self:Dispeller("poison") then
		self:PlaySound(args.spellId, "info")
	end
end

function mod:NecroticPoisonDispelled(args)
	if args.extraSpellName == self:SpellName(28776) then
		self:Message(28776, "green", CL.removed_by:format(args.extraSpellName, self:ColorName(args.sourceName)))
	end
end

function mod:FrenzyEnrage(args)
	self:Message(args.spellId, "orange", CL.percent:format(30, args.spellName))
	self:PlaySound(args.spellId, "warning")
end

function mod:UNIT_HEALTH(event, unit)
	if self:MobId(self:UnitGUID(unit)) == 15952 then
		local hp = self:GetHealth(unit)
		if hp > 30 and hp < 36 then
			self:Message(28747, "orange", CL.soon:format(self:SpellName(28747)))
			self:UnregisterEvent(event)
		elseif hp < 30 then -- too fast!
			self:UnregisterEvent(event)
		end
	end
end
