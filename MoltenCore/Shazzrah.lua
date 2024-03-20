--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Shazzrah", 409, 1523)
if not mod then return end
mod:RegisterEnableMob(12264)
mod:SetEncounterID(667)

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		19714, -- Magic Grounding / Deaden Magic (different name on classic era)
		23138, -- Gate of Shazzrah
		19715, -- Counterspell
		19713, -- Shazzrah's Curse
	},nil,{
		[23138] = CL.teleport, -- Gate of Shazzrah (Teleport)
		[19713] = CL.curse, -- Shazzrah's Curse (Curse)
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "GateOfShazzrah", 23138)
	self:Log("SPELL_AURA_APPLIED", "MagicGroundingDeadenMagicApplied", 19714)
	self:Log("SPELL_DISPEL", "MagicGroundingDeadenMagicDispelled", "*")
	self:Log("SPELL_CAST_SUCCESS", "Counterspell", 19715)
	self:Log("SPELL_CAST_SUCCESS", "ShazzrahsCurse", 19713)
end

function mod:OnEngage()
	self:CDBar(19713, 6.4, CL.curse) -- Shazzrah's Curse
	self:CDBar(19715, 9.7) -- Counterspell
	self:CDBar(23138, 30, CL.teleport) -- Gate of Shazzrah
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:GateOfShazzrah(args)
	self:CDBar(args.spellId, 41, CL.teleport) -- 41-50
	self:Message(args.spellId, "red", CL.teleport)
	self:PlaySound(args.spellId, "long")
end

function mod:MagicGroundingDeadenMagicApplied(args)
	self:Message(args.spellId, "orange", CL.magic_buff_boss:format(args.spellName))
	if self:Dispeller("magic", true) then
		self:PlaySound(args.spellId, "warning")
	end
end

function mod:MagicGroundingDeadenMagicDispelled(args)
	if args.extraSpellName == self:SpellName(19714) then
		self:Message(19714, "green", CL.removed_by:format(args.extraSpellName, self:ColorName(args.sourceName)))
	end
end

function mod:Counterspell(args)
	self:CDBar(args.spellId, 15) -- 15-19
	self:Message(args.spellId, "yellow")
	self:PlaySound(args.spellId, "info")
end

function mod:ShazzrahsCurse(args)
	self:CDBar(args.spellId, 22.6, CL.curse) -- 22.6-25
	self:Message(args.spellId, "yellow", CL.curse)
	if self:Dispeller("curse") then
		self:PlaySound(args.spellId, "warning")
	end
end
