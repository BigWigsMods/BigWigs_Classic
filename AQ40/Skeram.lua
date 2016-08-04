
--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("The Prophet Skeram", 766, 1543)
if not mod then return end
mod:RegisterEnableMob(15263)

local splitPhase = 1
local lastMC = nil

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.images = 747 -- Summon Images
	L.images_icon = 127876 -- spell_warlock_demonsoul / Summon Images
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{785, "ICON"}, -- True Fulfillment
		20449, -- Teleport
		26192, -- Arcane Explosion
		"images",
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "TrueFulfillment", 785)
	self:Log("SPELL_AURA_REMOVED", "TrueFulfillmentRemoved", 785)
	self:Log("SPELL_CAST_SUCCESS", "Teleport", 20449, 4801, 8195)
	self:Log("SPELL_CAST_START", "ArcaneExplosion", 26192)
	self:Log("SPELL_CAST_SUCCESS", "SummonImages", 747)

	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", nil, "target", "focus")

	self:Death("Win", 15263)
end

function mod:OnEngage()
	splitPhase = 1
	self:StartWipeCheck()
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:TrueFulfillment(args) -- Mind control
	self:TargetMessage(args.spellId, args.destName, "Attention")
	self:TargetBar(args.spellId, 20, args.destName)
	self:PrimaryIcon(args.spellId, args.destName)
	lastMC = args.destGUID
end

function mod:TrueFulfillmentRemoved(args)
	if args.destGUID == lastMC then
		lastMC = nil
		self:PrimaryIcon(args.spellId)
	end
end

function mod:Teleport(args)
	if self:MobId(args.sourceGUID) == 15263 then -- Filter out his images
		self:Message(20449, "Important")
	end
end

function mod:ArcaneExplosion(args)
	self:Message(args.spellId, "Urgent")
end

function mod:SummonImages(args)
	self:Message("images", "Important", "Long", L.images, L.images_icon)
end

function mod:UNIT_HEALTH_FREQUENT(unit)
	if self:MobId(UnitGUID(unit)) == 15263 then
		local hp = UnitHealth(unit) / UnitHealthMax(unit) * 100
		if (hp < 82 and splitPhase == 1) or (hp < 57 and splitPhase == 2) or (hp < 32 and splitPhase == 3) then
			splitPhase = splitPhase + 1
			self:Message("images", "Positive", nil, CL.soon:format(self:SpellName(L.images)), false)
			if splitPhase > 3 then
				self:UnregisterUnitEvent("UNIT_HEALTH_FREQUENT", "target", "focus")
			end
		end
	end
end

