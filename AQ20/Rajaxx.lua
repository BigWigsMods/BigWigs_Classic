--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("General Rajaxx", 509, 1538)
if not mod then return end
mod:RegisterEnableMob(15341, 15471) -- General Rajaxx, Lieutenant General Andorov
mod:SetEncounterID(719)
mod:SetStage(1)

--------------------------------------------------------------------------------
-- Locals
--

local wave_triggers = {}
local rajdead = false

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale()
if L then
	L.wave_trigger1a = "Kill first, ask questions later... Incoming!"
	L.wave_trigger1b = "Remember, Rajaxx, when I said I'd kill you last?" -- when you pull the first wave instead of talking to Andorov
	-- L.wave_trigger2 = "" -- There is no callout for wave 2 ><
	L.wave_trigger3 = "The time of our retribution is at hand! Let darkness reign in the hearts of our enemies!"
	L.wave_trigger4 = "No longer will we wait behind barred doors and walls of stone! No longer will our vengeance be denied! The dragons themselves will tremble before our wrath!"
	L.wave_trigger5 = "Fear is for the enemy! Fear and death!"
	L.wave_trigger6 = "Staghelm will whimper and beg for his life, just as his whelp of a son did! One thousand years of injustice will end this day!"
	L.wave_trigger7 = "Fandral! Your time has come! Go and hide in the Emerald Dream and pray we never find you!"
	L.wave_trigger8 = "Impudent fool! I will kill you myself!"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"stages",
		{25471, "SAY"}, -- Attack Order
		8269, -- Frenzy / Enrage (different name on classic era)
		25599, -- Thundercrash
		25462, -- Enlarge
		26550, -- Lightning Cloud
	},nil,{
		[25599] = CL.knockback, -- Thundercrash (Knockback)
	}
end

function mod:OnRegister()
	wave_triggers = {
		[L.wave_trigger1a] = 1,
		[L.wave_trigger1b] = 1,
		[L.wave_trigger8] = 8,
	}
	for i = 3, 7 do
		wave_triggers[L["wave_trigger"..i]] = i
	end
end

function mod:VerifyEnable(unit)
	return not rajdead
end

function mod:OnBossEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")

	self:Log("SPELL_AURA_APPLIED", "AttackOrderApplied", 25471)
	self:Log("SPELL_AURA_REMOVED", "AttackOrderRemoved", 25471)
	self:Log("SPELL_AURA_APPLIED", "FrenzyEnrage", 8269)
	self:Log("SPELL_CAST_SUCCESS", "Thundercrash", 25599)
	self:Log("SPELL_AURA_APPLIED", "EnlargeApplied", 25462)
	self:Log("SPELL_DISPEL", "EnlargeDispelled", "*")

	self:Log("SPELL_AURA_APPLIED", "LightningCloudDamage", 26550)
	self:Log("SPELL_PERIODIC_DAMAGE", "LightningCloudDamage", 26550)
	self:Log("SPELL_PERIODIC_MISSED", "LightningCloudDamage", 26550)

	self:Death("Win", 15341)
end

function mod:OnWin()
	rajdead = true
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:CHAT_MSG_MONSTER_YELL(_, msg)
	for trigger, stage in next, wave_triggers do
		if msg:find(trigger, nil, true) then
			self:SetStage(stage)
			self:Message("stages", "cyan", CL.stage:format(stage), false)
			self:PlaySound("stages", "info")
			break
		end
	end
end

function mod:AttackOrderApplied(args)
	self:TargetMessage(args.spellId, "yellow", args.destName)
	self:TargetBar(args.spellId, 10, args.destName)
	if self:Me(args.destGUID) then
		self:PlaySound(args.spellId, "warning", nil, args.destName)
		self:Say(args.spellId, nil, nil, "Attack Order")
	end
end

function mod:AttackOrderRemoved(args)
	self:StopBar(args.spellName, args.destName)
end

function mod:FrenzyEnrage(args)
	self:Message(args.spellId, "red", CL.percent:format(30, args.spellName))
end

function mod:Thundercrash(args)
	self:Message(args.spellId, "orange", CL.knockback)
	self:CDBar(args.spellId, 21, CL.knockback)
end

function mod:EnlargeApplied(args)
	self:Message(args.spellId, "orange", CL.buff_other:format(args.destName, args.spellName))
	if self:Dispeller("magic", true) then
		self:PlaySound(args.spellId, "alarm")
	end
end

function mod:EnlargeDispelled(args)
	if args.extraSpellName == self:SpellName(25462) then
		self:Message(25462, "green", CL.removed_by:format(args.extraSpellName, self:ColorName(args.sourceName)))
	end
end

do
	local prev = 0
	function mod:LightningCloudDamage(args)
		if self:Me(args.destGUID) and args.time - prev > 3 then
			prev = args.time
			self:PlaySound(args.spellId, "underyou")
			self:PersonalMessage(args.spellId, "aboveyou")
		end
	end
end
