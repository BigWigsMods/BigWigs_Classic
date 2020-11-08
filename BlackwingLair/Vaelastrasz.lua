--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Vaelastrasz the Corrupt", 469, 1530)
if not mod then return end
mod:RegisterEnableMob(13020)

--------------------------------------------------------------------------------
-- Localization
--
local L = mod:NewLocale("enUS", true)
if L then
	L.warmup_trigger = "Too late, friends!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"warmup",
		{18173, "ICON"}, -- Burning Adrenaline
	}
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")

	self:Log("SPELL_AURA_APPLIED", "Adrenaline", 18173)

	self:Death("Win", 13020)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:CHAT_MSG_MONSTER_YELL(_, msg)
	if msg:find(L.warmup_trigger, nil, true) then
		self:Bar("warmup", 43, CL.active, "inv_misc_monsterscales_05")
	end
end

function mod:Adrenaline(args)
	self:TargetMessageOld(args.spellId, args.destName, "yellow", "alarm")
	self:PrimaryIcon(args.spellId, args.destName)
	self:TargetBar(args.spellId, 20, args.destName, 67729, args.spellId) -- Explode
end

