--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("The Four Horsemen", 533, 1609)
if not mod then return end
mod:RegisterEnableMob(16062, 16063, 16064, 16065) -- Highlord Mograine, Sir Zeliek, Thane Korth'azz, Lady Blaumeux
mod:SetEncounterID(1121)

--------------------------------------------------------------------------------
-- Locals
--

local deaths = 0
local markCounter = 1

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.mark = CL.marks
	L.mark_desc = "Warn for marks."
	L.mark_icon = 28835 -- Mark of Zeliek
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"mark",
		28884, -- Meteor (Thane Korth'azz)
		{28863, "SAY", "ME_ONLY_EMPHASIZE"}, -- Void Zone (Lady Blaumeux)
		28883, -- Holy Wrath (Sir Zeliek)
		29061, -- Shield Wall
		"stages",
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "Mark", 28832, 28833, 28834, 28835) -- Mark of Korth'azz, Mark of Blaumeux, Mark of Mograine, Mark of Zeliek
	self:Log("SPELL_AURA_APPLIED_DOSE", "MarkApplied", 28832, 28833, 28834, 28835)
	self:Log("SPELL_CAST_SUCCESS", "Meteor", 28884)
	self:Log("SPELL_CAST_SUCCESS", "VoidZone", 28863)
	self:Log("SPELL_CAST_SUCCESS", "HolyWrath", 28883)
	self:Log("SPELL_AURA_APPLIED", "ShieldWall", 29061)
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	self:Death("Deaths", 16062, 16063, 16064, 16065)
end

function mod:OnEngage()
	markCounter = 1
	deaths = 0

	self:CDBar(28863, 12) -- Void Zone
	self:CDBar(28884, 21) -- Meteor
	self:CDBar(28883, 21) -- Holy Wrath

	-- berserk is at 100 marks, so 1297s or ~21.5 min? lol
	self:Message("mark", "yellow", CL.custom_sec:format(CL.mark, 21), false)
	self:CDBar("mark", 21, CL.count:format(CL.mark, markCounter), L.mark_icon)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local prev = 0
	function mod:Mark(args)
		if args.time - prev > 5 then
			prev = args.time
			local markMsg = CL.count:format(CL.mark, markCounter)
			if markCounter % 2 == 0 then -- Try reduce the amount of overall messages
				self:Message("mark", "red", markMsg, L.mark_icon)
			end
			self:StopBar(markMsg)
			markCounter = markCounter + 1
			self:CDBar("mark", 12.9, CL.count:format(CL.mark, markCounter), L.mark_icon)
		end
	end
end

function mod:MarkApplied(args)
	if self:Me(args.destGUID) and args.amount >= 3 then
		self:StackMessage("mark", "blue", args.destName, args.amount, 4, CL.mark, args.spellId)
		if args.amount >= 4 then
			self:PlaySound("mark", "warning", nil, args.destName)
		end
	end
end

function mod:Meteor(args)
	self:CDBar(args.spellId, 12) -- 11~14
	self:Message(args.spellId, "red")
	local unit = self:GetUnitIdByGUID(args.sourceGUID)
	if not unit or self:UnitWithinRange(unit, 35) then
		self:PlaySound(args.spellId, "info")
	end
end

function mod:VoidZone(args)
	self:CDBar(args.spellId, 12) -- 11~14
	if self:Me(args.destGUID) then
		self:Say(args.spellId, nil, nil, "Void Zone")
		self:PersonalMessage(args.spellId, "underyou")
		self:PlaySound(args.spellId, "underyou")
	else
		self:TargetMessage(args.spellId, "orange", args.destName)
		local unit = self:GetUnitIdByGUID(args.sourceGUID)
		if not unit or self:UnitWithinRange(unit, 35) then
			self:PlaySound(args.spellId, "alarm", nil, args.destName)
		end
	end
end

function mod:HolyWrath(args)
	self:CDBar(args.spellId, 12) -- 11~14
	self:Message(args.spellId, "yellow")
	local unit = self:GetUnitIdByGUID(args.sourceGUID)
	if not unit or self:UnitWithinRange(unit, 35) then
		self:PlaySound(args.spellId, "alert")
	end
end

function mod:ShieldWall(args)
	self:Message(args.spellId, "yellow", CL.other:format(args.destName, args.spellName))
	self:Bar(args.spellId, 20, args.destName)
end

function mod:Deaths(args)
	self:StopBar(args.destName)
	if args.mobId == 16063 then -- Sir Zeliek
		self:StopBar(28883) -- Holy Wrath
	elseif args.mobId == 16065 then -- Lady Blaumeux
		self:StopBar(28863) -- Void Zone
	elseif args.mobId == 16064 then -- Thane Korth'azz
		self:StopBar(28884) -- Meteor
	end
	deaths = deaths + 1
	if deaths < 4 then
		self:Message("stages", "cyan", CL.mob_killed:format(args.destName, deaths, 4), false)
	end
end
