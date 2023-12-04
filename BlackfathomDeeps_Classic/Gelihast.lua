--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Gelihast Discovery", 48, -2704)
if not mod then return end
mod:RegisterEnableMob(204921) -- Gelihast Season of Discovery
mod:SetEncounterID(2704)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bossName = "Gelihast"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		412072, -- Shadow Strike
		411973, -- Curse of Blackfathom
		412456, -- March of the Murlocs
	}
end

function mod:OnRegister()
	self.displayName = L.bossName
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "ShadowStrike", 412072, 412079, 412080)
	self:Log("SPELL_AURA_APPLIED", "ShadowStrikeApplied", 412072, 412079, 412080)
	self:Log("SPELL_AURA_APPLIED_DOSE", "ShadowStrikeApplied", 412072, 412079, 412080)
	self:Log("SPELL_CAST_SUCCESS", "CurseOfBlackfathom", 411973)
	self:Log("SPELL_AURA_APPLIED", "CurseOfBlackfathomApplied", 411973)
	self:Log("SPELL_CAST_SUCCESS", "MarchOfTheMurlocs", 412456)

	self:Death("Win", 204921)
end

function mod:OnEngage()
	self:CDBar(411973, 6) -- Curse of Blackfathom
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:ShadowStrike()
	self:Bar(412072, 11)
end

function mod:ShadowStrikeApplied(args)
	local amount = args.amount or 1
	self:StackMessage(412072, "purple", args.destName, amount, 3)
	if amount >= 3 then
		self:PlaySound(412072, "warning")
	end
end

do
	local playerList = {}
	function mod:CurseOfBlackfathom(args)
		playerList = {}
		self:Bar(args.spellId, 11)
	end

	function mod:CurseOfBlackfathomApplied(args)
		if self:Me(args.destGUID) then
			self:PlaySound(args.spellId, "alert", nil, args.destName)
		end
		playerList[#playerList+1] = args.destName
		self:TargetsMessage(args.spellId, "yellow", playerList, 2)
	end
end

do
	local prev = 0
	function mod:MarchOfTheMurlocs(args)
		if args.time - prev > 30 then
			prev = args.time
			self:Message(args.spellId, "cyan")
			self:PlaySound(args.spellId, "long")
			self:Bar(args.spellId, 30)
			self:StopBar(412072) -- Shadow Strike
			self:StopBar(411973) -- Curse of Blackfathom
		end
	end
end
