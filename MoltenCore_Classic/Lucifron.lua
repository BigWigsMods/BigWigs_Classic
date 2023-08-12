
--------------------------------------------------------------------------------
-- Module declaration
--

local mod = BigWigs:NewBoss("Lucifron", 409, 1519)
if not mod then return end
mod:RegisterEnableMob(12118)
mod:SetEncounterID(663)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale()
if L then
	L.mc_bar = "MC: %s"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		19702, -- Impending Doom
		19703, -- Lucifron's Curse
		{20604, "ICON"}, -- Dominate Mind
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "ImpendingDoom", 19702)
	self:Log("SPELL_CAST_SUCCESS", "LucifronsCurse", 19703)
	self:Log("SPELL_AURA_APPLIED", "MindControl", 20604)
end

function mod:OnEngage()
	self:Bar(19703, 11) -- Lucifron's Curse
	self:Bar(19702, 13) -- Impending Doom
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:ImpendingDoom(args)
	self:CDBar(19702, 20)
	self:Message(19702, "red")
end

function mod:LucifronsCurse(args)
	self:Bar(19703, 20)
	self:Message(19703, "yellow")
end

function mod:MindControl(args)
	self:Bar(20604, 15, L.mc_bar:format(args.destName))
	self:TargetMessage(20604, "yellow", args.destName)
	self:PrimaryIcon(20604, args.destName)
end
