--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Lord Kazzak Season of Discovery", 2789)
if not mod then return end
mod:RegisterEnableMob(12397)
mod:SetEncounterID(3026)
mod:SetAllowWin(true)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bossName = "Lord Kazzak"

	L.engage_trigger = "For the Legion! For Kil'Jaeden!"

	L.supreme_mode = "Supreme Mode"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		21056, -- Mark of Kazzak
		21063, -- Twisted Reflection
		"berserk",
		"stages",
	},nil,{
		[21056] = CL.curse, -- Mark of Kazzak (Curse)
	}
end

function mod:OnRegister()
	self.displayName = L.bossName
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "MarkOfKazzak", 21056)
	self:Log("SPELL_AURA_APPLIED", "TwistedReflection", 21063)
end

function mod:OnEngage()
	self:Berserk(180, nil, nil, L.supreme_mode, L.supreme_mode)
	self:Message("stages", "cyan", CL.stage:format(1), false)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:MarkOfKazzak(args)
	self:TargetMessage(args.spellId, "yellow", args.destName, CL.curse)
	if self:Me(args.destGUID) then
		self:PlaySound(args.spellId, "warning", nil, args.destName)
	elseif self:Dispeller("curse") then
		self:PlaySound(args.spellId, "warning")
	end
end

function mod:TwistedReflection(args)
	self:TargetMessage(args.spellId, "orange", args.destName)
	if self:Dispeller("magic") then
		self:PlaySound(args.spellId, "alarm")
	end
end
