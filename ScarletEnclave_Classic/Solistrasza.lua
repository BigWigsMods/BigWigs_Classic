--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Solistrasza", 2856)
if not mod then return end
mod:RegisterEnableMob(238954)
mod:SetEncounterID(3186)
mod:SetAllowWin(true)
mod:SetStage(1)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bossName = "Solistrasza"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"stages",
		"adds",
		1227696, -- Hallowed Dive
		1228063, -- Cremation
		"berserk",
	},nil,{
		[1228063] = CL.underyou:format(mod:SpellName(1228063)), -- Cremation (Cremation under YOU)
	}
end

function mod:OnRegister()
	self.displayName = L.bossName
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "Lightforge", 1227520)
	self:Log("SPELL_CAST_START", "HallowedDive", 1227696)
	self:Log("SPELL_CAST_SUCCESS", "AberrantBloat", 1232333)
	self:Log("SPELL_AURA_APPLIED", "CremationDamage", 1228063)
	self:Log("SPELL_PERIODIC_DAMAGE", "CremationDamage", 1228063)
	self:Log("SPELL_PERIODIC_MISSED", "CremationDamage", 1228063)
end

function mod:OnEngage()
	self:SetStage(1)
	self:Message("stages", "cyan", CL.stage:format(1), false)
	self:Berserk(480, true) -- No engage message
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Lightforge(args)
	local stage = self:GetStage() + 1
	self:SetStage(stage)
	self:Message("stages", "cyan", CL.stage:format(stage), false)
	self:PlaySound("stages", "long")
end

function mod:HallowedDive(args)
	self:Message(args.spellId, "cyan", CL.incoming:format(args.spellName))
	self:PlaySound(args.spellId, "alarm")
end

function mod:AberrantBloat()
	self:Message("adds", "cyan", CL.adds_spawned, false)
	self:PlaySound("adds", "info")
end

do
	local prev = 0
	function mod:CremationDamage(args)
		if self:Me(args.destGUID) and args.time - prev > 2 then
			prev = args.time
			self:PersonalMessage(args.spellId, "underyou")
			self:PlaySound(args.spellId, "underyou")
		end
	end
end
