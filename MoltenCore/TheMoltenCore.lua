--------------------------------------------------------------------------------
-- Module Declaration
--

if not BigWigsLoader.isSeasonOfDiscovery then return end
local mod, CL = BigWigs:NewBoss("The Molten Core", 409)
if not mod then return end
mod:RegisterEnableMob(227939, 228820) -- The Molten Core, Hydraxian Firefighter
mod:SetEncounterID(3018)
mod:SetAllowWin(true)

--------------------------------------------------------------------------------
-- Locals
--

local heartOfAshTarget = nil
local heartOfAshOnMe = false
local heartOfCinderOnMe = false
local mySaySpamTarget = nil

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bossName = "The Molten Core"

	L.custom_on_linked_spam = "Repeating 'Linked' say messages"
	L.custom_on_linked_spam_icon = "Interface\\AddOns\\BigWigs\\Media\\Icons\\Menus\\Say"
	L.custom_on_linked_spam_desc = "Repeating say messages in chat stating who you are linked with."
end

--------------------------------------------------------------------------------
-- Initialization
--

local heartOfAshMarker = mod:AddMarkerOption(true, "player", 3, 460898, 3) -- Heart of Ash
local heartOfCinderMarker = mod:AddMarkerOption(true, "player", 6, 460895, 6) -- Heart of Cinder
function mod:GetOptions()
	return {
		{460898, "SAY", "ME_ONLY", "ME_ONLY_EMPHASIZE"}, -- Heart of Ash
		heartOfAshMarker,
		{460895, "SAY", "ME_ONLY", "ME_ONLY_EMPHASIZE"}, -- Heart of Cinder
		heartOfCinderMarker,
		"custom_on_linked_spam",
	},nil,{
		[460898] = CL.count:format(CL.link, 1), -- Heart of Ash (Link 1)
		[460895] = CL.count:format(CL.link, 2), -- Heart of Cinder (Link 2)
	}
end

function mod:OnRegister()
	self.displayName = L.bossName
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "HeartOfAshApplied", 460898)
	self:Log("SPELL_AURA_REMOVED", "HeartOfAshRemoved", 460898)
	self:Log("SPELL_AURA_APPLIED", "HeartOfCinderApplied", 460895)
	self:Log("SPELL_AURA_REMOVED", "HeartOfCinderRemoved", 460895)
end

function mod:OnEngage()
	heartOfAshTarget = nil
	heartOfAshOnMe = false
	heartOfCinderOnMe = false
	mySaySpamTarget = nil
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local function RepeatLinkSay()
		if not mod:IsEngaged() or not mySaySpamTarget then return end
		mod:SimpleTimer(RepeatLinkSay, 1.5)
		mod:Say(false, CL.link_with_rticon:format(mySaySpamTarget[1], mySaySpamTarget[2]), true, ("Linked with {rt%d}%s"):format(mySaySpamTarget[1], mySaySpamTarget[2]))
	end
	function mod:HeartOfAshApplied(args)
		heartOfAshTarget = args.destName
		self:TargetMessage(args.spellId, "yellow", args.destName, CL.count_icon:format(CL.link, 1, 3))
		self:CustomIcon(heartOfAshMarker, args.destName, 3)
		if self:Me(args.destGUID) then
			heartOfAshOnMe = true
			self:Say(args.spellId, CL.count_rticon:format(CL.link, 1, 3), nil, "Link (1{rt3})")
			self:PlaySound(args.spellId, "warning", nil, args.destName)
		end
	end

	function mod:HeartOfAshRemoved(args)
		if self:Me(args.destGUID) then
			heartOfAshOnMe = false
			mySaySpamTarget = nil
			self:Say(args.spellId, CL.link_removed, nil, "Link removed")
		end
		self:CustomIcon(heartOfAshMarker, args.destName)
	end

	function mod:HeartOfCinderApplied(args)
		self:StopBar(CL.count:format(CL.link, 2))
		self:TargetMessage(args.spellId, "yellow", args.destName, CL.count_icon:format(CL.link, 2, 6))
		self:CustomIcon(heartOfCinderMarker, args.destName, 6)
		if self:Me(args.destGUID) then
			heartOfCinderOnMe = true
			if heartOfAshTarget and self:GetOption("custom_on_linked_spam") then
				mySaySpamTarget = {3, self:Ambiguate(heartOfAshTarget, "short")}
				self:SimpleTimer(RepeatLinkSay, 1.5)
			end
			self:Say(args.spellId, CL.count_rticon:format(CL.link, 2, 6), nil, "Link (2{rt6})")
			self:PlaySound(args.spellId, "warning", nil, args.destName)
		else
			if heartOfAshTarget then
				self:Message(args.spellId, "yellow", CL.link_both_icon:format(3, self:ColorName(heartOfAshTarget), 6, self:ColorName(args.destName)))
			end
			if heartOfAshOnMe and self:GetOption("custom_on_linked_spam") then
				mySaySpamTarget = {6, self:Ambiguate(args.destName, "short")}
				self:SimpleTimer(RepeatLinkSay, 1.5)
			end
		end
	end

	function mod:HeartOfCinderRemoved(args)
		if self:Me(args.destGUID) then
			heartOfCinderOnMe = false
			mySaySpamTarget = nil
			self:Say(args.spellId, CL.link_removed, nil, "Link removed")
		end
		self:CustomIcon(heartOfCinderMarker, args.destName)
	end
end
