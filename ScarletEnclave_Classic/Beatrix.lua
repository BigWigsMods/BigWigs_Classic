--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("High Commander Beatrix", 2856)
if not mod then return end
mod:RegisterEnableMob(240812)
mod:SetEncounterID(3187)
mod:SetAllowWin(true)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bossName = "High Commander Beatrix"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{1232390, "ME_ONLY_EMPHASIZE"}, -- Rose's Thorn
		"stages",
		"berserk",
	}
end

function mod:OnRegister()
	self.displayName = L.bossName
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "RosesThorn", 1232390)
	self:Log("SPELL_AURA_APPLIED", "RosesThornApplied", 1232390)
end

function mod:OnEngage()
	self:Message("stages", "cyan", CL.stage:format(1), false)
	self:Bar("stages", 120, CL.stage:format(2), "ability_mount_charger")
	self:Berserk(600, true) -- No engage message
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local playerList = {}
	function mod:RosesThorn()
		playerList = {}
	end

	function mod:RosesThornApplied(args)
		playerList[#playerList + 1] = args.destName
		self:TargetsMessage(args.spellId, "red", playerList)
		if self:Me(args.destGUID) then
			self:PlaySound(args.spellId, "warning", nil, args.destName)
		end
	end
end
