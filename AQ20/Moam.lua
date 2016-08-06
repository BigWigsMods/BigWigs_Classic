
--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Moam", 717, 1539)
if not mod then return end
mod:RegisterEnableMob(15340)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.starttrigger = "%s senses your fear."
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		25685, -- Energize
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Energize", 25685)
	self:Log("SPELL_AURA_REMOVED", "EnergizeRemoved", 25685)

	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")

	self:Death("Win", 15340)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

-- The Energize functionality appears to have been rewritten, or just broken.
-- If you kill the 3 adds early during the Energize phase, he will come back with whatever mana he gained.
-- E.g. If he gained 30% mana, he will keep that, then the next time he goes into the Energize phase
-- he will start from 30%, making that Energize phase much, much shorter.
-- On top of that the time to go from 0% to 100% mana appears to have changed to be about 51 seconds.
-- The time he takes out of Energize phase remains at 90 seconds no matter what.
-- To bother changing this or to leave it for nostalgia? It would require mana increase calculations
-- or just warnings at certain mana levels.

function mod:Energize(args)
	self:Message(args.spellId, "Attention")
	self:DelayedMessage(args.spellId, 30, "Attention", CL.custom_sec:format(L.bossName, 60))
	self:DelayedMessage(args.spellId, 60, "Attention", CL.custom_sec:format(L.bossName, 30))
	self:DelayedMessage(args.spellId, 75, "Urgent", CL.custom_sec:format(L.bossName, 15))
	self:DelayedMessage(args.spellId, 85, "Important", CL.custom_sec:format(L.bossName, 5))
	self:Bar(args.spellId, 90, L.bossName)
end

function mod:EnergizeRemoved(args)
	self:CancelDelayedMessage(CL.custom_sec:format(L.bossName, 60))
	self:CancelDelayedMessage(CL.custom_sec:format(L.bossName, 30))
	self:CancelDelayedMessage(CL.custom_sec:format(L.bossName, 15))
	self:CancelDelayedMessage(CL.custom_sec:format(L.bossName, 5))
	self:StopBar(L.bossName)

	self:Message(args.spellId, "Attention", nil, L.bossName)
	self:DelayedMessage(args.spellId, 30, "Attention", CL.custom_sec:format(args.spellName, 60))
	self:DelayedMessage(args.spellId, 60, "Attention", CL.custom_sec:format(args.spellName, 30))
	self:DelayedMessage(args.spellId, 75, "Urgent", CL.custom_sec:format(args.spellName, 15))
	self:DelayedMessage(args.spellId, 85, "Important", CL.custom_sec:format(args.spellName, 5))
	self:Bar(args.spellId, 90)
end

function mod:CHAT_MSG_MONSTER_EMOTE(event, msg)
	if msg == L.starttrigger then
		self:StartWipeCheck()

		local spell = self:SpellName(25685)
		self:Message(25685, "Attention", nil, CL.custom_sec:format(spell, 90), false)
		self:DelayedMessage(25685, 30, "Attention", CL.custom_sec:format(spell, 60))
		self:DelayedMessage(25685, 60, "Attention", CL.custom_sec:format(spell, 30))
		self:DelayedMessage(25685, 75, "Urgent", CL.custom_sec:format(spell, 15))
		self:DelayedMessage(25685, 85, "Important", CL.custom_sec:format(spell, 5))
		self:Bar(25685, 90)
	end
end

