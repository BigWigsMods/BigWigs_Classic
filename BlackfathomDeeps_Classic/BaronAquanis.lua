--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Baron Aquanis Discovery", 48, -2694)
if not mod then return end
mod:RegisterEnableMob(202699) -- Baron Aquanis Season of Discovery
mod:SetEncounterID(2694)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bossName = "Baron Aquanis"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{404806, "ICON", "SAY", "SAY_COUNTDOWN", "ME_ONLY_EMPHASIZE"}, -- Depth Charge
		405953, -- Torrential Downpour
	},nil,{
		[404806] = CL.bomb, -- Depth Charge (Bomb)
	}
end

function mod:OnRegister()
	self.displayName = L.bossName
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "DepthChargeApplied", 404806)
	self:Log("SPELL_AURA_REMOVED", "DepthChargeRemoved", 404806)

	self:Log("SPELL_AURA_APPLIED", "TorrentialDownpourDamage", 405953)
	self:Log("SPELL_PERIODIC_DAMAGE", "TorrentialDownpourDamage", 405953)
	self:Log("SPELL_PERIODIC_MISSED", "TorrentialDownpourDamage", 405953)

	self:Death("Win", 202699)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:DepthChargeApplied(args)
	if self:Me(args.destGUID) then
		self:PlaySound(args.spellId, "warning", nil, args.destName)
		self:Say(args.spellId, CL.bomb)
		self:SayCountdown(args.spellId, 8)
	end
	self:PrimaryIcon(args.spellId, args.destName)
	self:TargetMessage(args.spellId, "yellow", args.destName, CL.bomb)
end

function mod:DepthChargeRemoved(args)
	if self:Me(args.destGUID) then
		self:CancelSayCountdown(args.spellId)
	end
	self:PrimaryIcon(args.spellId)
end

do
	local prev = 0
	function mod:TorrentialDownpourDamage(args)
		if self:Me(args.destGUID) and args.time - prev > 3 then
			prev = args.time
			self:PlaySound(args.spellId, "underyou")
			self:PersonalMessage(args.spellId, "aboveyou")
		end
	end
end
