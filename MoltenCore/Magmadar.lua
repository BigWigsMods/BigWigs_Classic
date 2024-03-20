--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Magmadar", 409, 1520)
if not mod then return end
mod:RegisterEnableMob(11982)
mod:SetEncounterID(664)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L["19408_icon"] = "spell_shadow_psychicscream"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		19408, -- Panic
		19451, -- Enrage / Frenzy (different name on classic era)
		19428, -- Conflagration
	},nil,{
		[19408] = CL.fear, -- Panic (Fear)
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "Panic", 19408)
	self:Log("SPELL_AURA_APPLIED", "EnrageFrenzy", 19451)
	self:Log("SPELL_DISPEL", "EnrageFrenzyDispelled", "*")
	self:Log("SPELL_AURA_APPLIED", "Conflagration", 19428)
end

function mod:OnEngage()
	self:CDBar(19451, 8.1) -- Enrage / Frenzy
	self:CDBar(19408, 9.7, CL.fear, L["19408_icon"]) -- Panic
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Panic(args)
	self:CDBar(args.spellId, 31, CL.fear, L["19408_icon"]) -- 31-50, sometimes even higher
	self:Message(args.spellId, "orange", CL.fear, L["19408_icon"])
	self:PlaySound(args.spellId, "long")
end

function mod:EnrageFrenzy(args)
	self:TargetBar(args.spellId, 8, args.destName)
	self:CDBar(args.spellId, 18) -- 18-21
	self:Message(args.spellId, "yellow", CL.buff_boss:format(args.spellName))
	self:PlaySound(args.spellId, "info")
end

function mod:EnrageFrenzyDispelled(args)
	if args.extraSpellName == self:SpellName(19451) then
		self:StopBar(args.extraSpellName, args.destName)
		self:Message(19451, "green", CL.removed_by:format(args.extraSpellName, self:ColorName(args.sourceName)))
	end
end

function mod:Conflagration(args)
	if self:Me(args.destGUID) then
		self:PersonalMessage(args.spellId, "underyou")
		self:PlaySound(args.spellId, "underyou")
	end
end
