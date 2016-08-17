
--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Ouro", 766, 1550)
if not mod then return end
mod:RegisterEnableMob(15517)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_message = "Ouro engaged! Possible Submerge in 90sec!"
	L.possible_submerge_bar = "Possible submerge"

	L.emergeannounce = "Ouro has emerged!"
	L.emergewarn = "15 sec to possible submerge!"
	L.emergewarn2 = "15 sec to Ouro sumberge!"
	L.emergebartext = "Ouro submerge"

	L.submergeannounce = "Ouro has submerged!"
	L.submergewarn = "5 seconds until Ouro Emerges!"
	L.submergebartext = "Ouro Emerge"

	L.scarab = "Scarab Despawn"
	L.scarab_desc = "Warn for Scarab Despawn."
	L.scarab_icon = 138036 -- inv_misc_ahnqirajtrinket_01 / Scarab Swarm
	L.scarabdespawn = "Scarabs despawn in 10 Seconds"
	L.scarabbar = "Scarabs despawn"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		26103, -- Sweep
		26102, -- Sand Blast
		26615, -- Berserk
		"scarab",
		"stages",
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "Sweep", 26103)
	self:Log("SPELL_CAST_START", "SandBlast", 26102)
	self:Log("SPELL_AURA_APPLIED", "BerserkApplied", 26615)
	self:Log("SPELL_CAST_SUCCESS", "SummonOuroMounds", 26058) -- Submerge
	self:Log("SPELL_SUMMON", "SummonOuroScarabs", 26060) -- Emerge

	if IsEncounterInProgress() then
		self:CheckForEngage() -- Enabled after engage
	else
		self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	end

	self:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", nil, "target", "focus")

	self:Death("Win", 15517)
end

function mod:OnEngage()
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:PossibleSubmerge()
	self:Message("stages", "Attention", nil, L["engage_message"], false)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:PossibleSubmerge()
	self:DelayedMessage("stages", 75, "Important", L["emergewarn"])
	self:DelayedMessage("stages", 165, "Important", L["emergewarn2"])
	self:Bar("stages", 90, L["possible_submerge_bar"], "misc_arrowdown")
	self:Bar("stages", 180, L["emergebartext"], "misc_arrowdown")
end

function mod:Sweep(args)
	self:Message(args.spellId, "Important")
	self:DelayedMessage(args.spellId, 16, "Important", CL.custom_sec:format(args.spellName, 5))
	self:Bar(args.spellId, 21)
end

function mod:SandBlast(args)
	self:Message(args.spellId, "Attention")
	self:DelayedMessage(args.spellId, 17, "Important", CL.custom_sec:format(args.spellName, 5))
	self:Bar(args.spellId, 22)
end

function mod:BerserkApplied(args)
	self:Message(args.spellId, "Urgent", "Long", "20% - ".. args.spellName)
	self:UnregisterUnitEvent("UNIT_HEALTH_FREQUENT", "target", "focus")
	self:CancelDelayedMessage(L["emergewarn"])
	self:CancelDelayedMessage(L["emergewarn2"])
	self:StopBar(L["possible_submerge_bar"])
	self:StopBar(L["emergebartext"])
end

function mod:SummonOuroMounds(args) -- Submerge
	self:CancelDelayedMessage(L["emergewarn"])
	self:CancelDelayedMessage(L["emergewarn2"])
	self:CancelDelayedMessage(CL.custom_sec:format(self:SpellName(26103), 5)) -- Sweep
	self:CancelDelayedMessage(CL.custom_sec:format(self:SpellName(26102), 5)) -- Sand Blast
	self:StopBar(L["possible_submerge_bar"])
	self:StopBar(L["emergebartext"])
	self:StopBar(26103) -- Sweep
	self:StopBar(26102) -- Sand Blast

	self:Message("stages", "Important", nil, 179624, "misc_arrowdown") -- 179624 = "Submerge"
	self:DelayedMessage("stages", 25, "Important", CL.custom_sec:format(self:SpellName(54850), 5))
	self:Bar("stages", 30, 54850, "misc_arrowlup") -- 54850 = "Emerge"
end

do
	local prev = 0
	function mod:SummonOuroScarabs() -- Emerge
		local t = GetTime()
		if t-prev > 5 then
			prev = t

			self:Message("stages", "Important", nil, 54850, "misc_arrowlup") -- 54850 = "Emerge"
			self:PossibleSubmerge()

			-- Sweep
			self:DelayedMessage(26103, 16, "Important", CL.custom_sec:format(self:SpellName(26103), 5))
			self:Bar(26103, 21)

			-- Sand Blast
			self:DelayedMessage(26102, 17, "Important", CL.custom_sec:format(self:SpellName(26102), 5))
			self:Bar(26102, 22)

			-- Scarab Despawn
			self:DelayedMessage("scarab", 50, "Important", L["scarabdespawn"])
			self:Bar("scarab", 60, L["scarabbar"], L.scarab_icon)
		end
	end
end

function mod:UNIT_HEALTH_FREQUENT(unit)
	if self:MobId(UnitGUID(unit)) == 15517 then
		local hp = UnitHealth(unit) / UnitHealthMax(unit) * 100
		if hp < 25 then
			self:UnregisterUnitEvent("UNIT_HEALTH_FREQUENT", "target", "focus")
			self:Message(26615, "Positive", nil, CL.soon:format(self:SpellName(26615)), false)
		end
	end
end

