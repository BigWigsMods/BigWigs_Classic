local L = BigWigs:NewBossLocale("Battleguard Sartura", "koKR")
if not L then return end
if L then
	L.engage_trigger = "성스러운 땅을 더럽힌 죗값을 받게 되리라. 고대의 법률은 거스를 수 없다! 침입자들을 처단하라!" -- You will be judged for defiling these sacred grounds!  The laws of the Ancients will not be challenged!  Trespassers will be annihilated!\r\n
end

L = BigWigs:NewBossLocale("Viscidus", "koKR")
if L then
	--L.freeze = "Freezing States"
	--L.freeze_desc = "Warn for the different frozen states."
	L.freeze_trigger1 = "%s|1이;가; 느려지기 시작했습니다!"	-- CHECK
	L.freeze_trigger2 = "%s|1이;가; 얼어붙고 있습니다!"	-- CHECK
	L.freeze_trigger3 = "%s|1이;가; 단단하게 얼었습니다!"	-- CHECK
	L.freeze_trigger4 = "%s|1이;가; 분해되기 시작합니다!"	-- CHECK
	L.freeze_trigger5 = "%s|1이;가; 부서질 것 같습니다!"	-- CHECK
	--L.freeze_warn1 = "First freeze phase!"
	--L.freeze_warn2 = "Second freeze phase!"
	--L.freeze_warn3 = "Viscidus is frozen!"
	--L.freeze_warn4 = "Cracking up - keep going!"
	--L.freeze_warn5 = "Cracking up - almost there!"
	--L.freeze_warn_melee = "%d melee attacks - %d more to go"
	--L.freeze_warn_frost = "%d frost attacks - %d more to go"
end

L = BigWigs:NewBossLocale("Ouro", "koKR")
if L then
	--L.engage_message = "Ouro engaged! Possible Submerge in 90sec!"
	--L.possible_submerge_bar = "Possible submerge"

	--L.emergeannounce = "Ouro has emerged!"
	--L.emergewarn = "15 sec to possible submerge!"
	--L.emergewarn2 = "15 sec to Ouro sumberge!"
	--L.emergebartext = "Ouro submerge"

	--L.submergeannounce = "Ouro has submerged!"
	--L.submergewarn = "5 seconds until Ouro Emerges!"
	--L.submergebartext = "Ouro Emerge"

	--L.scarab = "Scarab Despawn"
	--L.scarab_desc = "Warn for Scarab Despawn."
	--L.scarabdespawn = "Scarabs despawn in 10 Seconds"
	--L.scarabbar = "Scarabs despawn"
end

L = BigWigs:NewBossLocale("Ahn'Qiraj Trash", "koKR")
if L then
	L.defender = "아누비사스 문지기"
	L.crawler = "집게발 베크니스"
end

L = BigWigs:NewBossLocale("C'Thun", "koKR")
if L then
	--L.tentacle_desc = "Warn for Tentacles"

	--L.giant = "Giant Eye Alert"
	--L.giant_desc = "Warn for Giant Eyes"

	--L.weakened = "Weakened Alert"
	--L.weakened_desc = "Warn for Weakened State"
	L.weakenedtrigger = "%s|1이;가; 약해집니다!"

	--L.weakened_msg = "C'Thun is weakened for 45 sec"
	--L.invulnerable2 = "Party ends in 5 seconds"
	--L.invulnerable1 = "Party over - C'Thun invulnerable"

	--L.giant3 = "Giant Eye - 10 sec"
	--L.giant2 = "Giant Eye - 5 sec"
	--L.giant1 = "Giant Eye - Poke it!"

	--L.startwarn = "C'Thun engaged! - 45 sec until Dark Glare and Eyes"

	--L.tentacleParty = "Tentacle party!"
	--L.barWeakened = "C'Thun is weakened!"
	--L.barGiant = "Giant Eye!"

	--L.groupwarning = "Dark Glare on group %s (%s)"
	--L.phase2starting = "The Eye is dead! Body incoming!"
end

