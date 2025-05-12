--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("High Priestess Jeklik", 309)
if not mod then return end
mod:RegisterEnableMob(14517)
mod:SetEncounterID(785)
mod:SetAllowWin(true)
mod:SetStage(1)

--------------------------------------------------------------------------------
-- Locals
--

local castCollector = {}

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bossName = "High Priestess Jeklik"

	L.swarm = 6605 -- Terrifying Screech
	L.swarm_desc = "Warn for the Bat swarms"
	L.swarm_icon = 24423
	-- L.swarm_trigger = "emits a deafening shriek"
	L.swarm_message = "Incoming bat swarm!"

	L.bomb = 23970 -- Throw Liquid Fire
	L.bomb_desc = "Warn for Bomb Bats"
	L.bomb_icon = 23970
	L.bomb_trigger = "I command you to rain fire down upon these invaders!"
	L.bomb_message = "Incoming bomb bats!"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"swarm",
		12097, -- Pierce Armor
		{23954, "CASTBAR"}, -- Great Heal
		23953, -- Mind Flay
		16098, -- Curse of Blood
		23970, -- Throw Liquid Fire
		"stages",
	},nil,{
		[23954] = CL.interruptible, -- Great Heal (Interruptible)
		[23953] = CL.interruptible, -- Mind Flay (Interruptible)
		[16098] = CL.interruptible, -- Curse of Blood (Interruptible)
		[23970] = CL.underyou:format(CL.fire), -- Throw Liquid Fire (Fire under YOU)
	}
end

function mod:OnRegister()
	self.displayName = L.bossName
end

function mod:OnBossEnable()
	self:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
	self:RegisterMessage("BigWigs_BossComm")

	self:Log("SPELL_CAST_SUCCESS", "Screech", 22884) -- Haven't actually seen Terrifying Screech or Psychic Scream in logs
	self:Log("SPELL_CAST_START", "GreatHeal", 23954)
	self:Log("SPELL_INTERRUPT", "Interrupted", "*")
	self:Log("SPELL_AURA_APPLIED", "PierceArmorApplied", 12097)
	self:Log("SPELL_CAST_SUCCESS", "MindFlay", 23953)
	self:Log("SPELL_CAST_START", "CurseOfBlood", 16098)
	self:Log("SPELL_DAMAGE", "BlazeDamage", 23972) -- Different ID to Throw Liquid Fire
	self:Log("SPELL_MISSED", "BlazeDamage", 23972)
end

function mod:OnEngage()
	castCollector = {}
	self:SetStage(1)
	self:Message("stages", "cyan", CL.stage:format(1), false)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:UNIT_SPELLCAST_SUCCEEDED(_, _, castGUID, spellId)
	if spellId == 24085 and not castCollector[castGUID] then -- Transform Visual
		castCollector[castGUID] = true
		self:Sync("s2")
	end
end

do
	local times = {
		["s2"] = 0,
	}
	function mod:BigWigs_BossComm(_, msg)
		if times[msg] then
			local t = GetTime()
			if t-times[msg] > 5 then
				times[msg] = t
				self:SetStage(2)
				self:CDBar(23954, 22) -- Great Heal
				self:Message("stages", "cyan", CL.stage:format(2), false)
				self:PlaySound("stages", "info")
			end
		end
	end
end

function mod:Screech(args)
	self:Message("swarm", "orange", L.swarm_message, L.swarm_icon)
	self:PlaySound("swarm", "alarm")
end

function mod:GreatHeal(args)
	self:Message(args.spellId, "red", CL.extra:format(args.spellName, CL.interruptible))
	self:CastBar(args.spellId, 4)
	self:CDBar(args.spellId, 20.5)
	self:PlaySound(args.spellId, "warning")
end

function mod:Interrupted(args)
	if self:MobId(args.destGUID) == 14517 then
		if args.extraSpellName == self:SpellName(23954) then -- Great Heal
			self:StopCastBar(args.extraSpellName)
			self:Message(23954, "green", CL.interrupted_by:format(args.extraSpellName, self:ColorName(args.sourceName)))
		elseif args.extraSpellName == self:SpellName(23953) then -- Mind Flay
			self:Message(23953, "green", CL.interrupted_by:format(args.extraSpellName, self:ColorName(args.sourceName)))
		elseif args.extraSpellName == self:SpellName(16098) then -- Curse of Blood
			self:Message(16098, "green", CL.interrupted_by:format(args.extraSpellName, self:ColorName(args.sourceName)))
		end
	end
end

function mod:PierceArmorApplied(args)
	self:TargetMessage(args.spellId, "purple", args.destName)
end

function mod:MindFlay(args)
	self:Message(args.spellId, "yellow", CL.extra:format(args.spellName, CL.interruptible))
	self:PlaySound(args.spellId, "alert")
end

function mod:CurseOfBlood(args)
	self:Message(args.spellId, "red", CL.extra:format(args.spellName, CL.interruptible))
	self:CDBar(args.spellId, 21)
	self:PlaySound(args.spellId, "warning")
end

do
	local prev = 0
	function mod:BlazeDamage(args)
		if self:Me(args.destGUID) and args.time - prev > 3 then
			prev = args.time
			self:PersonalMessage(23970, "underyou", CL.fire)
			self:PlaySound(23970, "underyou")
		end
	end
end
