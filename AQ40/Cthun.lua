
--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("C'Thun", 766)
if not mod then return end
mod:RegisterEnableMob(15727, 15589) -- C'Thun, Eye of C'Thun

local timeP1Tentacle = 45      -- tentacle timers for phase 1
local timeP1TentacleStart = 45 -- delay for first tentacles from engage onwards
local timeP1GlareStart = 48    -- delay for first dark glare from engage onwards
local timeP1Glare = 86         -- interval for dark glare
local timeP1GlareDuration = 40 -- duration of dark glare
local timeP2Offset = 12        -- delay for all timers to restart after the Eye dies
local timeP2Tentacle = 30      -- tentacle timers for phase 2
local timeReschedule = 60      -- delay from the moment of weakening for timers to restart
local timeTarget = 0.2         -- delay for target change checking on Eye of C'Thun
local timeWeakened = 45        -- duration of a weaken

local gianteye = nil
local cthunstarted = nil
local phase2started = nil
local firstGlare = nil
local firstWarning = nil
local target = nil
local tentacletime = timeP1TentacleStart

local timerTentacles = nil
local timerDarkGlare = nil
local timerGroupWarning = nil
local timerCheckTarget = nil

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.bossName = "C'Thun"

	L.tentacle = 61619
	L.tentacle_desc = "Warn for Tentacles"
	L.tentacle_icon = 61619 -- inv_misc_monstertail_06 / Tentacles

	L.giant = "Giant Eye Alert"
	L.giant_desc = "Warn for Giant Eyes"

	L.weakened = "Weakened Alert"
	L.weakened_desc = "Warn for Weakened State"
	L.weakened_icon = 160149 -- ability_rogue_findweakness / Weak

	L.weakenedtrigger = "%s is weakened!"

	L.weakened_msg = "C'Thun is weakened for 45 sec"
	L.invulnerable2 = "Party ends in 5 seconds"
	L.invulnerable1 = "Party over - C'Thun invulnerable"

	L.giant3 = "Giant Eye - 10 sec"
	L.giant2 = "Giant Eye - 5 sec"
	L.giant1 = "Giant Eye - Poke it!"

	L.startwarn = "C'Thun engaged! - 45 sec until Dark Glare and Eyes"

	L.tentacleParty = "Tentacle party!"
	L.barWeakened = "C'Thun is weakened!"
	L.barGiant = "Giant Eye!"

	L.groupwarning = "Dark Glare on group %s (%s)"
	L.phase2starting = "The Eye is dead! Body incoming!"
end
L = mod:GetLocale()
mod.displayName = L.bossName

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"tentacle",
		26029,
		"giant",
		"weakened",
		"stages",
		"proximity",
	}
end

function mod:OnBossEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")

	self:Death("EyeKilled", 15589)
	self:Death("Win", 15727)

	self:AddSyncListener("CThunP2Start", 10)
	self:AddSyncListener("CThunWeakened", 10)
end

function mod:OnEngage()
	target = nil
	gianteye = nil
	cthunstarted = nil
	firstGlare = true
	firstWarning = true
	phase2started = nil
	tentacletime = timeP1Tentacle

	self:StartWipeCheck()

	self:Message("stages", "Attention", nil, L.startwarn, false)

	self:Bar("tentacle", timeP1TentacleStart, L.tentacleParty, L.tentacle_icon) -- Tentacle party
	self:DelayedMessage("tentacle", timeP1TentacleStart - 5, "Urgent", CL.custom_sec:format(self:SpellName(61619), 5)) -- Tentacles in 5 sec
	self:DelayedMessage("tentacle", timeP1TentacleStart, "Important", L.tentacleParty, L.tentacle_icon) -- Tentacle party

	self:Bar(26029, timeP1GlareStart) -- Dark Glare
	self:DelayedMessage(26029, timeP1GlareStart - 5, "Urgent", CL.custom_sec:format(self:SpellName(26029), 5)) -- Dark Glare in 5 sec
	self:DelayedMessage(26029, timeP1GlareStart, "Important", 26029, 26029) -- Dark Glare

	timerTentacles = self:ScheduleTimer("StartTentacles", timeP1TentacleStart)
	timerDarkGlare = self:ScheduleTimer("DarkGlare", timeP1GlareStart)
	timerGroupWarning = self:ScheduleTimer("GroupWarning", timeP1GlareStart - 3)
	timerCheckTarget = self:ScheduleRepeatingTimer("CheckTarget", timeTarget)

	self:OpenProximity("proximity", 10)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:CHAT_MSG_MONSTER_EMOTE(event, msg)
	if msg == L["weakenedtrigger"] then
		self:Sync("CThunWeakened")
	end
end

function mod:EyeKilled()
	self:Sync("CThunP2Start")
end

function mod:OnSync(sync, rest, nick)
	if sync == "CThunP2Start" then
		self:CThunP2Start()
	elseif sync == "CThunWeakened" then
		self:CThunWeakened()
	end
end

function mod:CThunP2Start()
	if not phase2started then
		phase2started = true
		self:StopWipeCheck()
		self:ScheduleTimer("StartWipeCheck", 10)
		tentacletime = timeP2Tentacle

		self:Message("stages", "Neutral", nil, L["phase2starting"], false)

		self:StopBar(L.tentacleParty)

		local darkGlare = self:SpellName(26029)
		self:StopBar(darkGlare) -- Dark Glare
		self:StopBar(CL.cast:format(darkGlare)) -- Cast: Dark Glare
		self:CancelDelayedMessage(darkGlare) -- Dark Glare
		self:CancelDelayedMessage(CL.custom_sec:format(darkGlare, 5)) -- Dark Glare in 5 sec
		self:CancelDelayedMessage(CL.over:format(darkGlare)) -- Dark Glare Over

		-- cancel the repeaters
		self:CancelTimer(timerTentacles)
		self:CancelTimer(timerDarkGlare)
		self:CancelTimer(timerGroupWarning)
		self:CancelTimer(timerCheckTarget)

		self:DelayedMessage("tentacle", timeP2Tentacle + timeP2Offset -.1, "Important", L.tentacleParty, L.tentacle_icon) -- Tentacle party
		self:DelayedMessage("tentacle", timeP2Tentacle + timeP2Offset - 5, "Urgent", CL.custom_sec:format(self:SpellName(61619), 5)) -- Tentacles in 5 sec
		self:Bar("tentacle", timeP2Tentacle + timeP2Offset, L.tentacleParty, L.tentacle_icon) -- Tentacle party

		-- Giant eye warnings seem off now, possibly changed or broken by Blizz
		--self:DelayedMessage("giant", timeP2Tentacle + timeP2Offset -.1, "Important", L["giant1"], "Ability_EyeOfTheOwl")
		--self:DelayedMessage("giant", timeP2Tentacle + timeP2Offset - 5, "Urgent", L["giant2"])
		--self:DelayedMessage("giant", timeP2Tentacle + timeP2Offset - 10, "Attention", L["giant3"])
		--self:Bar("giant", timeP2Tentacle + timeP2Offset, L["barGiant"], "Ability_EyeOfTheOwl")

		timerTentacles = self:ScheduleTimer("StartTentacles", timeP2Tentacle + timeP2Offset)
	end
end

function mod:CThunWeakened()
	self:Message("weakened", "Positive", nil, L.weakened_msg, L.weakened_icon)
	self:Bar("weakened", timeWeakened, L["barWeakened"], L.weakened_icon)
	self:DelayedMessage("weakened", timeWeakened - 5, "Urgent", L["invulnerable2"])
	self:DelayedMessage("weakened", timeWeakened, "Important", L["invulnerable1"])

	-- cancel tentacle timers
	self:CancelDelayedMessage(L.tentacleParty) -- Tentacle party
	self:CancelDelayedMessage(CL.custom_sec:format(self:SpellName(61619), 5)) -- Tentacles in 5 sec
	self:StopBar(L.tentacleParty)

	--self:CancelDelayedMessage(L["giant1"])
	--self:CancelDelayedMessage(L["giant2"])
	--self:CancelDelayedMessage(L["giant3"])
	--self:StopBar(L["barGiant"])
	-- flipflop the giant eye flag
	--gianteye = not gianteye

	self:CancelTimer(timerTentacles)
	self:ScheduleTimer("OutOfWeaken", timeReschedule)
end

--------------------------------------------------------------------------------
-- Utility Functions
--

function mod:OutOfWeaken()
	self:StartTentacles()
	-- Also fires up a big claw here, but we don't warn for them?
end

function mod:StartTentacles()
	self:Tentacles()
	timerTentacles = self:ScheduleRepeatingTimer("Tentacles", tentacletime)
end

function mod:CheckTarget()
	local newtarget = nil
	local unit = self:GetUnitIdByGUID(15589) -- Eye of C'Thun
	if unit then
		local unitTarget = unit.."target"
		local guid = UnitGUID(unitTarget)
		if guid then
			target = guid
		end
	end
end

function mod:GroupWarning()
	if target then
		for unit in self:IterateGroup() do
			local guid = UnitGUID(unit)
			if target == guid then
				local name = self:UnitName(unit)
				if not IsInRaid() then
					self:Message(26029, "Important", nil, L["groupwarning"]:format(1, name), 26029)
				else
					for i = 1, GetNumGroupMembers() do
						local n, _, group = GetRaidRosterInfo(i)
						if name == n then
							self:Message(26029, "Important", nil, L["groupwarning"]:format(group, name), 26029)
							break
						end
					end
				end
				break
			end
		end
	end
	if firstWarning then
		firstWarning = nil
		self:CancelTimer(timerGroupWarning)
		timerGroupWarning = self:ScheduleRepeatingTimer("GroupWarning", timeP1Glare)
	end
end

function mod:Tentacles()
	if phase2started then
		--if gianteye then
		--	gianteye = nil
		--	self:Bar("giant", tentacletime, L["barGiant"], "Ability_EyeOfTheOwl")
		--	self:DelayedMessage("giant", tentacletime -.1, "Important", L["giant1"])
		--	self:DelayedMessage("giant", tentacletime - 5, "Urgent", L["giant2"])
		--	self:DelayedMessage("giant", tentacletime - 10, "Attention", L["giant3"])
		--else
		--	gianteye = true
		--end
	end
	self:Bar("tentacle", tentacletime, L.tentacleParty, L.tentacle_icon) -- Tentacle party
	self:DelayedMessage("tentacle", tentacletime -.1, "Important", L.tentacleParty, L.tentacle_icon) -- Tentacle party
	self:DelayedMessage("tentacle", tentacletime -5, "Urgent", CL.custom_sec:format(self:SpellName(61619), 5)) -- Tentacles in 5 sec
end

function mod:DarkGlare()
	local glareId = 26029
	local darkGlare = self:SpellName(glareId)
	self:Bar(glareId, timeP1GlareDuration, CL.cast:format(darkGlare)) -- Cast: Dark Glare
	self:Bar(glareId, timeP1Glare) -- Dark Glare
	self:DelayedMessage(glareId, timeP1Glare - .1, "Important", darkGlare, glareId) -- Dark Glare
	self:DelayedMessage(glareId, timeP1Glare - 5, "Urgent", CL.custom_sec:format(darkGlare, 5)) -- Dark Glare in 5 sec
	self:DelayedMessage(glareId, timeP1GlareDuration, "Important", CL.over:format(darkGlare)) -- Dark Glare Over
	if firstGlare then
		firstGlare = nil
		self:CancelTimer(timerDarkGlare)
		timerDarkGlare = self:ScheduleRepeatingTimer("DarkGlare", timeP1Glare)
	end
end

--[[

L:RegisterTranslations("enUS", function() return {
	cmd = "Cthun",

	tentacle = "Tentacle Alert",
	tentacle_desc = "Warn for Tentacles",

	glare = "Dark Glare Alert",
	glare_desc = "Warn for Dark Glare",

	group = "Dark Glare Group Warning",
	group_desc = "Warn for Dark Glare on Group X",

	giant = "Giant Eye Alert",
	giant_desc = "Warn for Giant Eyes",

	weakened = "Weakened Alert",
	weakened_desc = "Warn for Weakened State",

	rape = "Rape jokes are funny",
	rape_desc = "Some people like hentai jokes.",

	weakenedtrigger = "%s is weakened!",

	tentacle1	= "Tentacle Rape Party - Pleasure!",
	tentacle2	= "Tentacle Rape Party - 5 sec",

	norape1		= "Tentacles Spawned!",
	norape2		= "Tentacles in 5sec!",


	weakened_msg		= "C'Thun is weakened for 45 sec",
	invulnerable2	= "Party ends in 5 seconds",
	invulnerable1	= "Party over - C'Thun invulnerable",

	giant3		= "Giant Eye - 10 sec",
	giant2		= "Giant Eye - 5 sec",
	giant1		= "Giant Eye - Poke it!",

	startwarn	= "C'Thun engaged! - 45 sec until Dark Glare and Eyes",

	glare2		= "Dark glare - 5 sec",
	glare1		= "Dark glare!",

	barTentacle	= "Tentacle rape party!",
	tentacleParty	= "Tentacle party!",
	barWeakened	= "C'Thun is weakened!",
	barGlare	= "Dark glare!",
	barGiant	= "Giant Eye!",
	barGreenBeam	= "Green Beam!",

	eyebeam		= "Eye Beam",
	glarewarning	= "DARK GLARE ON YOU!",
	groupwarning	= "Dark Glare on group %s (%s)",
	positions1	= "Green Beam coming",
	positions2	= "Dark Glare ends in 5 sec",
	phase2starting	= "The Eye is dead! Body incoming!",
} end )

L:RegisterTranslations("deDE", function() return {
	tentacle = "Tentakel",
	tentacle_desc = "Warnung vor Tentakeln.",

	glare = "Dunkles Starren",
	glare_desc = "Warnung vor Dunklem Starren.",

	group = "Dunkles Starren Gruppe",
	group_desc = "Warnung vor Dunklem Starren auf Gruppe X.",

	giant = "Riesiges Auge",
	giant_desc = "Riesiges Auge", -- ?

	weakened = "Geschw\195\164cht",
	weakened_desc = "Warnung, wenn C'Thun geschw\195\164cht ist.",

	weakenedtrigger = "%s ist geschw\195\164cht!",

	tentacle1	= "Tentacle Rape Party - Pleasure!", -- ?
	tentacle2	= "Tentacle Rape Party - 5 sec", -- ?

	norape1		= "Tentacle Party! - What's that in your pants?", -- ?
	norape2		= "Tentacle Party! - 5 sec", -- ?

	weakened_msg		= "C'Thun ist geschw\195\164cht f\195\188r 45 Sekunden",
	invulnerable2	= "C'Thun unverwundbar in 5 Sekunden",
	invulnerable1	= "C'Thun ist unverwundbar!",

	giant3		= "Riesiges Auge - 10 Sekunden",
	giant2		= "Riesiges Auge - 5 Sekunden",
	giant1		= "Riesiges Auge - Angriff!",

	startwarn	= "C'Thun angegriffen! - 45 Sekunden bis Dunkles Starren und Augen!",

	glare2		= "Dunkles Starren - 5 Sekunden",
	glare1		= "Dunkles Starren - BEWEGUNG!",

	barTentacle	= "Tentacle rape party!", -- ?
	tentacleParty	= "Tentacle party!", -- ?
	barWeakened	= "C'Thun ist geschw\195\164cht!",
	barGlare	= "Dunkles Starren",
	barGiant	= "Riesiges Auge", -- ?
	barGreenBeam	= "Green Beam!", -- ?

	eyebeam		= "Augenstrahl", 
	glarewarning	= "Dunkles Starren auf Dir! BEWEGUNG!",
	groupwarning	= "Dunkles Starren auf Gruppe %s (%s)",
	positions1	= "Green Beam coming", -- ?
	positions2	= "Dunkles Starren endet in 5 Sekunden",
	phase2starting	= "Das Auge ist tot! - Phase 2 beginnt!",
} end )

L:RegisterTranslations("koKR", function() return {
	tentacle = "촉수 경고",
	tentacle_desc = "촉수에 대한 경고",

	glare = "암흑의 주시 경고",
	glare_desc = "암흑의 주시에 대한 경고",

	group = "암흑의 주시 파티 경고",
	group_desc = "파티 X 에 암흑의 주시에 대한 경고",

	giant = "거대한 눈 경고",
	giant_desc = "거대한 눈에 대한 경고",

	weakened = "약화 경고",
	weakened_desc = "약화 상태에 대한 경고",

	weakenedtrigger 	= "%s|1이;가; 약해집니다!",

	tentacle1	= "눈달린 촉수 등장 - 촉수 처리~~!",
	tentacle2	= "눈달린 촉수 등장 - 5초전!",

	norape1		= "작은 눈달린 촉수 등장 - 처리~~(마반,스턴)!",
	norape2		= "작은 눈달린 촉수 - 5초전!",

	weakened_msg		= "쑨이 약화되었습니다 - 45초간 최대 공격!",
	invulnerable2	= "쑨 약화 종료 5초전!",
	invulnerable1	= "쑨 공격 불가 상태로 전환!",

	giant3		= "거대한 발톱 촉수 - 10 초전",
	giant2		= "거대한 발톱 촉수 - 5초전!",
	giant1		= "거대한 발톱 촉수 등장 - 눈촉수 처리후 처리!!!",

	startwarn	= "쑨 시작 - 45초후 암흑의 주시",

	glare2		= "암흑의 주시 - 5초전!",
	glare1		= "암흑의 주시 - 눈촉수 처리하면서 이동!",

	barTentacle	= "눈달린 촉수!",
	tentacleParty	= "작은 눈달린 촉수!",
	barWeakened	= "쑨 약화!",
	barGlare	= "암흑의 주시!",
	barGiant	= "거대한 눈!",
	barGreenBeam	= "녹색 안광!",

	eyebeam		= "안광",
	glarewarning	= "암흑의 주시를 당하고 있습니다! 이동!",
	groupwarning	= "암흑의 주시 %s파티 (%s님 바로 이동!!!!!!)",
	positions1	= "빠른 진형 재정비 - 녹색 안광이 시작됩니다!",
	positions2	= "암흑의 주시 종료 5초전!",
	phase2starting	= "쑨의 눈 처치, 본체가 등장합니다. 준비!",
} end )

L:RegisterTranslations("zhCN", function() return {
	tentacle = "触须警报",
	tentacle_desc = "触须出现时发出警报。",

	glare = "黑暗闪耀警报",
	glare_desc = "黑暗闪耀发动时发出警报。",

	group = "红光小队警报",
	group_desc = "红光在X小队发动时发出警报",

	giant = "巨眼警报",
	giant_desc = "巨眼出现时发出警报",

	weakened = "削弱警报",
	weakened_desc = "克苏恩被削弱时发出警报",

--Rape部分  不能理解。。。。
	rape = "吞人警报",--需要资料 
	rape_desc = "巨嘴触须把玩家吃到克苏恩肚子里了。",

	weakenedtrigger = "%s的力量被削弱了！",

	tentacle1	= "眼球触须 - 出现！",
	tentacle2	= "眼球触须 - 5秒后出现",

	norape1		= "巨眼、巨爪触须出现！",
	norape2		= "5秒后眼球巨眼、巨爪触须！",

	weakened_msg		= "克苏恩被削弱45秒！DPS全力输出伤害！",
	invulnerable2	= "削弱状态还有5秒结束",
	invulnerable1	= "削弱状态结束 - 停止攻击克苏恩！",

	giant3		= "巨眼出现 - 10 秒",
	giant2		= "巨眼出现 - 5 秒",
	giant1		= "出现！ - 击杀！",

	startwarn	= "克苏恩被激活！ - 45 秒后黑暗闪耀发动，巨眼出现",

	glare2		= "红光 - 5秒后发动！",
	glare1		= "红光发动！",

	barTentacle	= "眼球触须！",
	tentacleParty	= "巨眼、巨爪触须！",
	barWeakened	= "克苏恩被削弱了！",
	barGlare	= "黑暗闪耀！",
	barGiant	= "巨眼！",
	barGreenBeam	= "绿光！",

	eyebeam		= "眼棱",
	glarewarning	= "黑暗闪耀在你身上发动了！",
	groupwarning	= "黑暗闪耀在%s小队发动了！（%s小队移动！！）",
	positions1	= "黑暗闪耀结束，绿光发动，请注意保持距离",--?Green Beam coming
	positions2	= "黑暗闪耀还有5秒结束",
	phase2starting	= "克苏恩之眼死了！第二阶段进入！",
} end )

L:RegisterTranslations("zhTW", function() return {
	tentacle = "觸鬚警報",
	tentacle_desc = "觸鬚出現時發出警報",

	glare = "黑暗閃耀警報",
	glare_desc = "黑暗閃耀發動時發出警報",

	group = "黑暗閃耀小隊警報",
	group_desc = "黑暗閃耀發動時對小隊X發出警報",

	giant = "巨眼警報",
	giant_desc = "巨眼出現時發出警報",

	weakened = "虛弱警報",
	weakened_desc = "克蘇恩虛弱時發出警報",

	weakenedtrigger 	= "%s變弱了！",

	tentacle1	= "眼球觸鬚出現！",
	tentacle2	= "5秒後眼球觸鬚出現！",

	norape1		= "巨眼、巨爪觸鬚出現！",
	norape2		= "5秒後巨眼、巨爪觸鬚出現！",

	weakened_msg		= "克蘇恩被削弱了 - 45秒內全力輸出傷害！",
	invulnerable2	= "削弱狀態還有5秒結束",
	invulnerable1	= "削弱狀態結束 - 停止攻擊克蘇恩！",

	giant3		= "巨眼 10 秒後出現",
	giant2		= "巨眼 5 秒後出現",
	giant1		= "巨眼出現！",

	startwarn	= "克蘇恩已進入戰鬥 - 45秒後發動黑暗閃耀, 出現巨眼",

	glare2		= "黑暗閃耀 5 秒後發動！",
	glare1		= "黑暗閃耀發動 - 跑位！",

	barTentacle	= "眼球觸鬚！",
	tentacleParty	= "巨眼、巨爪觸鬚！",
	barWeakened	= "克蘇恩虛弱！",
	barGlare	= "黑暗閃耀！",
	barGiant	= "巨眼！",
	barGreenBeam	= "綠光！",

	eyebeam		= "眼棱",
	glarewarning	= "黑暗閃耀在你身上發動了！",
	groupwarning	= "黑暗閃耀在%s小隊發動了！ %s 小隊移動！",
	positions1	= "綠光發動",
	positions2	= "5 秒後黑暗閃耀結束",
	phase2starting	= "克蘇恩之眼已死亡 - 進入第二階段！",
} end )

L:RegisterTranslations("frFR", function() return {
	tentacle = "Tentacules",
	tentacle_desc = "Préviens de l'arrivée des tentacules.",

	glare = "Sombre regard",
	glare_desc = "Préviens quand C'Thun utilise son Sombre regard.",

	group = "Sombre regard (Groupe)",
	group_desc = "Préviens sur quel groupe le Sombre regard est posé.",

	giant = "Oeil géant",
	giant_desc = "Préviens de l'arrivée des Yeux géants.",

	weakened = "Affaiblissement",
	weakened_desc = "Préviens quand C'Thun est vulnérable.",

	rape = "Les blagues sur les viols sont drôles",
	rape_desc = "Certains personnes aiment les blagues hentaï.",

	weakenedtrigger = "%s est affaibli !",

	tentacle1	= "Viol des tentacules - Plaisir !",
	tentacle2	= "Viol des tentacules - 5 sec.",

	norape1		= "Tentacules apparues !",
	norape2		= "Tentacules dans 5 sec. !",


	weakened_msg		= "C'Thun est affaibli pendant 45 sec.",
	invulnerable2	= "Fin de l'affaiblissement dans 5 sec.",
	invulnerable1	= "Fin de l'affaiblissement - C'Thun invulnérable",

	giant3		= "Oeil géant - 10 sec.",
	giant2		= "Oeil géant - 5 sec.",
	giant1		= "Oeil géant - Démontez-le !",

	startwarn	= "C'Thun engagé ! - 45 sec. avant le Sombre regard et les Yeux",

	glare2		= "Sombre regard - 5 sec.",
	glare1		= "Sombre regard !",

	barTentacle = "Viol des tentacules",
	tentacleParty = "Fête des tentacules",
	barWeakened = "C'Thun affaibli",
	barGlare = "Sombre regard",
	barGiant = "Oeil géant",
	barGreenBeam = "Rayon vert",

	eyebeam = "Rayon de l'Oeil",
	glarewarning = "Sombre regard sur vous !",
	groupwarning = "Sombre regard sur le groupe %s (%s)",
	positions1 = "Rayon vert imminent",
	positions2 = "Fin du Sombre regard dans 5 sec.",
	phase2starting = "L'Oeil est mort ! Le corps arrive !",
} end )

L:RegisterTranslations("ruRU", function() return {
	tentacle = "Щупальца",
	tentacle_desc = "Предупреждать о щупальцах",

	glare = "Свирепый взгляд",
	glare_desc = "Предупреждать о свирепом взгляде",

	group = "Свирепый взгляд на группу",
	group_desc = "Предупреждать о свирепом взгляде на группе X",

	giant = "Гигантский Глаз",
	giant_desc = "Предупреждать о гигантском глазе",

	weakened = "Слабость",
	weakened_desc = "Предупреждать о наложении слабости",

	rape = "Забавные шутки связывания ",
	rape_desc = "Некоторые игроки похожи на комиксы хентай.",

	weakenedtrigger = "%s ослаблен!!",

	tentacle1	= "Щупальца связывают группу - удовольствие!",
	tentacle2	= "Щупальца связывают группу - 5 сек",

	norape1		= "Появляются щупальца!",
	norape2		= "Щупальца появятся через 5 секунд!",


	weakened_msg		= "К'Тун ослаблен на 45 секунд",
	invulnerable2	= "Вечеринка кончится через 5 секунд",
	invulnerable1	= "Вечеринка закончена - К'Тун неуязвим",

	giant3		= "Гигантский глаз - 10 секунд",
	giant2		= "Гигантский глаз - 5 секунд",
	giant1		= "Гигантский глаз - толкните это!",

	startwarn	= "К'Тун занят! - 45 секунд до свирепого сияния и гигантского глаза",

	glare2		= "Свирепый взгляд - 5 секунд",
	glare1		= "Свирепый взгляд!",

	barTentacle	= "Щупальца связывают группу!",
	tentacleParty	= "Связали группУ!",
	barWeakened	= "К'Тун ослаблен!",
	barGlare	= "Свирепый взгляд!",
	barGiant	= "Гигантский глаз!",
	barGreenBeam	= "Зелёный луч!",

	eyebeam		= "Луч глаза",
	glarewarning	= "СВИРЕПЫЙ ГЛАЗ НА ВАС!",
	groupwarning	= "Свирепый взгляд на группе %s (%s)",
	positions1	= "Зелёный луч наступает",
	positions2	= "Свирепый взгляд кончится через 5 секунд",
	phase2starting	= "Глаз повержен! Появляется тело!",
} end )
]]

