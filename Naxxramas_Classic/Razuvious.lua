--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Instructor Razuvious", 533, 1607)
if not mod then return end
mod:RegisterEnableMob(16061, 16803) -- Instructor Razuvious, Deathknight Understudy
mod:SetEncounterID(1113)

--------------------------------------------------------------------------------
-- Locals
--

local understudyIcons = {}
local prevTaunt = nil

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.understudy = "Deathknight Understudy"

	L["29107_icon"] = "ability_warrior_battleshout"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		29107, -- Disrupting Shout
		29060, -- Taunt
		29061, -- Shield Wall
		29051, -- Mind Exhaustion
	}, {
		[29060] = L.understudy,
	}
end

function mod:VerifyEnable(unit, mobId)
	if mobId == 16061 then
		return true
	elseif mobId == 16803 then
		return self:GetHealth(unit) == 100
	end
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "DisruptingShout", 29107)
	self:Log("SPELL_CAST_SUCCESS", "Taunt", 29060)
	self:Log("SPELL_AURA_APPLIED", "TauntApplied", 29060)
	self:Log("SPELL_AURA_REMOVED", "TauntRemoved", 29060)
	self:Log("SPELL_CAST_SUCCESS", "ShieldWall", 29061)
	--self:Log("SPELL_AURA_APPLIED", "MindExhaustion", 29051) -- Hidden

	self:Log("SPELL_AURA_APPLIED", "MindControl", 10912)
	self:Death("Deaths", 16803) -- Deathknight Understudy
	self:Death("Win", 16061)
end

function mod:OnEngage()
	understudyIcons = {}
	prevTaunt = nil
	self:CDBar(29107, 25, self:SpellName(29107), L["29107_icon"]) -- Disrupting Shout
	self:DelayedMessage(29107, 20, "red", CL.soon:format(self:SpellName(29107)))
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:DisruptingShout(args)
	self:Message(args.spellId, "red", args.spellName, L["29107_icon"])
	self:CDBar(args.spellId, 25, args.spellName, L["29107_icon"])
	self:DelayedMessage(args.spellId, 20, "red", CL.soon:format(args.spellName))
	self:PlaySound(args.spellId, "warning")
end

function mod:Taunt(args)
	local icon = understudyIcons[args.sourceGUID]
	if icon then
		local msg = icon .. args.spellName
		self:Message(args.spellId, "orange", msg)
		self:Bar(args.spellId, 60, msg)
	else
		self:Message(args.spellId, "orange")
		self:Bar(args.spellId, 60)
	end
	self:PlaySound(args.spellId, "info")
end

function mod:TauntApplied(args)
	prevTaunt = args.sourceGUID
	self:Bar(args.spellId, 20, CL.on:format(args.spellName, CL.boss))
end

function mod:TauntRemoved(args)
	if prevTaunt == args.sourceGUID then
		self:StopBar(CL.on:format(args.spellName, CL.boss))
		self:Message(args.spellId, "orange", CL.over:format(args.spellName))
	end
end

function mod:ShieldWall(args)
	if self:MobId(args.sourceGUID) == 16803 then -- Shared with 4 horsemen
		local icon = understudyIcons[args.sourceGUID]
		if icon then
			local msg = icon .. args.spellName
			self:Message(args.spellId, "yellow", msg)
			self:Bar(args.spellId, 20, msg)
		else
			self:Message(args.spellId, "yellow")
			self:Bar(args.spellId, 20)
		end
		self:PlaySound(args.spellId, "long")
	end
end

--function mod:MindExhaustion(args)
--	local icon = understudyIcons[args.destGUID]
--	if icon then
--		-- Not much of a point if they aren't marked
--		self:Bar(args.spellId, 60, icon .. args.spellName)
--	end
--end

function mod:MindControl(args)
	local icon = self:GetIconTexture(self:GetIcon(args.destRaidFlags))
	if icon then
		understudyIcons[args.destGUID] = icon
		-- Not much of a point if they aren't marked
		self:Bar(29051, 60, icon .. self:SpellName(29107)) -- Mind Exhaustion is hidden but we can just do it here
	end
end

function mod:Deaths(args)
	local icon = understudyIcons[args.destGUID]
	if icon then
		self:StopBar(icon .. self:SpellName(29051)) -- Mind Exhaustion
		self:StopBar(icon .. self:SpellName(29060)) -- Taunt
		self:StopBar(icon .. self:SpellName(29061)) -- Shield Wall
	else
		self:StopBar(29060) -- Taunt
		self:StopBar(29061) -- Shield Wall
	end
end
