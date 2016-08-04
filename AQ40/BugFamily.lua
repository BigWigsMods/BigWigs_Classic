
--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("The Bug Trio", 766, 1547)
if not mod then return end
mod:RegisterEnableMob(15543, 15544, 15511) -- Princess Yauj, Vem, Lord Kri

local deaths = 0

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		25807, -- Great Heal
		26580, -- Fear
		25812, -- Toxic Volley
		25786, -- Toxic Vapors
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "GreatHeal", 25807)
	self:Log("SPELL_CAST_SUCCESS", "Fear", 26580)
	self:Log("SPELL_CAST_SUCCESS", "ToxicVolley", 25812)

	self:Log("SPELL_PERIODIC_DAMAGE", "ToxicVaporsDamage", 25786)
	self:Log("SPELL_PERIODIC_MISSED", "ToxicVaporsDamage", 25786)
	self:Log("SPELL_AURA_APPLIED", "ToxicVaporsDamage", 25786)

	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")

	self:Death("Deaths", 15543, 15544, 15511)
end

function mod:OnEngage()
	deaths = 0
	self:StartWipeCheck()
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:GreatHeal(args)
	self:Message(args.spellId, "Urgent", nil, CL.casting:format(args.spellName))
	self:Bar(args.spellId, 2, CL.cast:format(args.spellName))
end

function mod:Fear(args)
	self:Bar(args.spellId, 20)
	self:Message(args.spellId, "Important")
	self:DelayedMessage(args.spellId, 15, "Urgent", CL.custom_sec:format(args.spellName, 5))
end

function mod:ToxicVolley(args)
	self:Message(args.spellId, "Attention")
end

do
	local prev = 0
	function mod:ToxicVaporsDamage(args)
		local t = GetTime()
		if t-prev > 2 and self:Me(args.destGUID) then
			prev = t
			self:Message(args.spellId, "Personal", "Alarm", CL.underyou:format(args.spellName))
		end
	end
end

function mod:Deaths()
	deaths = deaths + 1
	if deaths > 2 then
		self:Win()
	end
end

