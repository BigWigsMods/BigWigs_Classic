
--------------------------------------------------------------------------------
-- Module declaration
--

local mod = BigWigs:NewBoss("General Rajaxx", 717, 1538)
if not mod then return end
mod:RegisterEnableMob(15341, 15471) -- General Rajaxx, Lieutenant General Andorov

local rajdead

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.wave = "Waves"
	L.wave_desc = "Warn for incoming waves."

	L.trigger1 = "Kill first, ask questions later... Incoming!"
	L.trigger2 = "?????"  -- There is no callout for wave 2 ><
	L.trigger3 = "The time of our retribution is at hand! Let darkness reign in the hearts of our enemies!"
	L.trigger4 = "No longer will we wait behind barred doors and walls of stone! No longer will our vengeance be denied! The dragons themselves will tremble before our wrath!\013\n"
	L.trigger5 = "Fear is for the enemy! Fear and death!"
	L.trigger6 = "Staghelm will whimper and beg for his life, just as his whelp of a son did! One thousand years of injustice will end this day!\013\n"
	L.trigger7 = "Fandral! Your time has come! Go and hide in the Emerald Dream and pray we never find you!\013\n"
	L.trigger8 = "Impudent fool! I will kill you myself!"
	L.trigger9 = "Remember, Rajaxx, when I said I'd kill you last?"

	L.warn1 = "Wave 1/8"
	L.warn2 = "Wave 2/8"
	L.warn3 = "Wave 3/8"
	L.warn4 = "Wave 4/8"
	L.warn5 = "Wave 5/8"
	L.warn6 = "Wave 6/8"
	L.warn7 = "Wave 7/8"
	L.warn8 = "Incoming General Rajaxx"
	L.warn9 = "Wave 1/8" -- trigger for starting the event by pulling the first wave instead of talking to andorov
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"wave",
		25471, -- Attack Order
		8269, -- Frenzy
	}
end

function mod:VerifyEnable()
	return not rajdead
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "AttackOrder", 25471)
	self:Log("SPELL_AURA_APPLIED", "Frenzy", 8269)

	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")

	self:Death("Win", 15341)
end

function mod:OnWin()
	rajdead = true
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:AttackOrder(args)
	self:TargetMessage(args.spellId, args.destName, "Attention")
	self:TargetBar(args.spellId, 10, args.destName)
end

function mod:Frenzy(args)
	self:Message(args.spellId, "Important")
end

function mod:CHAT_MSG_MONSTER_YELL(event, msg)
	for i = 1, 9 do
		if msg == L["trigger"..i] then
			self:Message("wave", "Urgent", nil, L["warn"..i], false)
			break
		end
	end
end

