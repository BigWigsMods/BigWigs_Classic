-- Ahn'Qiraj 20

local L = BigWigs:NewBossLocale("General Rajaxx", "koKR")
if L then
	L.wave_trigger1a = "그들이 오고 있다. 자신의 몸을 지키도록 하라!"
	L.wave_trigger1b = "내가 너는 꼭 마지막에 해치우겠다고 말했던 걸 기억하나, 라작스?"
end

L = BigWigs:NewBossLocale("Buru the Gorger", "koKR")
if L then
	L.fixate_desc = "대상에게 시선을 고정합니다. 다른 공격자의 위협은 무시합니다."
end

L = BigWigs:NewBossLocale("Ayamiss the Hunter", "koKR")
if L then
	L.sacrifice = "희생"
end

L = BigWigs:NewBossLocale("Ruins of Ahn'Qiraj Trash", "koKR")
if L then
	L.guardian = "아누비사스 감시자"
end

-- Ahn'Qiraj 40

L = BigWigs:NewBossLocale("Viscidus", "koKR")
if L then
	--L.freeze = "Freezing States"
	--L.freeze_desc = "Warn for the different frozen states."

	L.freeze_trigger1 = "%s|1이;가; 느려지기 시작했습니다!"
	L.freeze_trigger2 = "%s|1이;가; 얼어붙고 있습니다!"
	L.freeze_trigger3 = "%s|1이;가; 단단하게 얼었습니다!"
	L.freeze_trigger4 = "%s|1이;가; 분해되기 시작합니다!"
	L.freeze_trigger5 = "%s|1이;가; 부서질 것 같습니다!"

	--L.freeze_warn1 = "First freeze phase!"
	--L.freeze_warn2 = "Second freeze phase!"
	--L.freeze_warn3 = "Viscidus is frozen!"
	--L.freeze_warn4 = "Cracking up - keep going!"
	--L.freeze_warn5 = "Cracking up - almost there!"
	--L.freeze_warn_melee = "%d melee attacks - %d more to go"
	--L.freeze_warn_frost = "%d frost attacks - %d more to go"
end

L = BigWigs:NewBossLocale("Silithid Royalty", "koKR")
if L then
	L[15543] = "야우즈"
	L[15544] = "벰"
	L[15511] = "크리"
end

L = BigWigs:NewBossLocale("Ouro", "koKR")
if L then
	--L.emerge_message = "Ouro has emerged"
	--L.emerge_bar = "Emerge"

	--L.submerge_message = "Ouro has submerged"
	--L.submerge_bar = "Submerge"
	--L.submerge_early_message = "Early Submerge - No one was in range"

	--L.scarab = "Scarab Despawn"
	--L.scarab_desc = "Warn for Scarab Despawn."
	--L.scarab_bar = "Scarabs despawn"
end

L = BigWigs:NewBossLocale("C'Thun", "koKR")
if L then
	--L.claw_tentacle = "Claw Tentacle"
	--L.claw_tentacle_desc = "Timers for the claw tentacle."

	--L.giant_claw_tentacle = "Giant Claw"
	--L.giant_claw_tentacle_desc = "Timers for the giant claw tentacle."

	--L.eye_tentacles = "Eye Tentacles"
	--L.eye_tentacles_desc = "Timers for the 8 eye tentacles."

	--L.giant_eye_tentacle = "Giant Eye"
	--L.giant_eye_tentacle_desc = "Timers for the giant eye tentacle."

	--L.weakened_desc = "Warn for weakened state."

	--L.dark_glare_message = "%s: %s (Group %s)" -- Dark Glare: PLAYER_NAME (Group 1)
	--L.stomach = "Stomach"
end

L = BigWigs:NewBossLocale("Ahn'Qiraj Trash", "koKR")
if L then
	L.sentinel = "아누비사스 파수병" -- NPC 15264
	L.brainwasher = "퀴라지 세뇌관" -- NPC 15247
	L.defender = "아누비사스 문지기" -- NPC 15277
	L.crawler = "집게발 베크니스" -- NPC 15240

	--L.target_buffs = "Target Buff Warnings"
	--L.target_buffs_desc = "When your target is an Anubisath Sentinel, show a warning for what buff it has."
	--L.target_buffs_message = "Target Buffs: %s"
	L.detect_magic_missing_message = "마법 감지 is missing from your target"
	L.detect_magic_warning = "A Mage must cast \124cff71d5ff\124Hspell:2855:0\124h[마법 감지]\124h\124r on your target for buff warnings to work."
end

-- Blackwing Lair

L = BigWigs:NewBossLocale("Razorgore the Untamed", "koKR")
if L then
	L.start_trigger = "침입자들이 들어왔다! 어떤 희생이 있더라도 알을 반드시 수호하라!"

	L.eggs = "알 개수 알림 미사용"
	L.eggs_desc = "남은 알 개수 알림 미사용."
	L.eggs_message = "%d/30 알을 파괴하였습니다"
end

L = BigWigs:NewBossLocale("Vaelastrasz the Corrupt", "koKR")
if L then
	--L.warmup_trigger = "Too late, friends!"
end

L = BigWigs:NewBossLocale("Chromaggus", "koKR")
if L then
	L.breath = "브레스 경고"
	L.breath_desc = "브레스에 대한 경고"

	--L.debuffs_message = "3/5 debuffs, carefull!"
	--L.debuffs_warning = "4/5 debuffs, %s on 5th!"
	L.bronze = "청동"

	L.vulnerability = "약화 속성 경고"
	L.vulnerability_desc = "약화 속성 변경에 대한 경고."
	L.vulnerability_message = "새로운 취약 속성: %s"
	L.detect_magic_missing = "마법 감지 is missing from Chromaggus"
	L.detect_magic_warning = "A Mage must cast \124cff71d5ff\124Hspell:2855:0\124h[마법 감지]\124h\124r on Chromaggus for vulnerability warnings to work."
end

L = BigWigs:NewBossLocale("Nefarian Classic", "koKR")
if L then
	L.engage_yell_trigger = "게임을 시작하자"
	L.stage3_yell_trigger = "말도 안 돼! 일어나라!"

	L.shaman_class_call_yell_trigger = "주술사"
	--L.deathknight_class_call_yell_trigger = "Death Knights"
	--L.monk_class_call_yell_trigger = "Monks"
	L.hunter_class_call_yell_trigger = "그 장난감"

	L.warnshaman = "주술사 - 토템 파괴!"
	L.warndruid = "드루이드 - 강제 표범 변신!"
	L.warnwarlock = "흑마법사 - 지옥불정령 등장!"
	L.warnpriest = "사제 - 치유 주문 금지!"
	L.warnhunter = "사냥꾼 - 원거리 무기 파손!"
	L.warnwarrior = "전사 - 광태 강제 전환!"
	L.warnrogue = "도적 - 강제 소환!"
	L.warnpaladin = "성기사 - 강제 보축 사용!"
	L.warnmage = "마법사 - 변이!"
	--L.warndeathknight = "Death Knights - Death Grip"
	--L.warnmonk = "Monks - Stuck Rolling"
	--L.warndemonhunter = "Demon Hunters - Blinded"

	L.classcall = "직업 지목"
	L.classcall_desc = "직업 지목에 대한 경고"

	--L.add = "Drakonid deaths"
	--L.add_desc = "Announce the number of adds killed in stage 1 before Nefarian lands."
end

L = BigWigs:NewBossLocale("Blackwing Lair Trash", "koKR")
if L then
	L.wyrmguard_overseer = "죽음의발톱 고룡수호병 / 죽음의발톱 감독관" -- NPC 12460 / 12461
	L.sandstorm = "모래폭풍"

	--L.target_vulnerability = "Target Vulnerability Warnings"
	--L.target_vulnerability_desc = "When your target is a Death Talon Wyrmguard or a Death Talon Overseer, show a warning for what vulnerability it has."
	--L.target_vulnerability_message = "Target Vulnerability: %s"
	L.detect_magic_missing_message = "마법 감지 is missing from your target"
	L.detect_magic_warning = "A Mage must cast \124cff71d5ff\124Hspell:2855:0\124h[마법 감지]\124h\124r on your target for vulnerability warnings to work."

	L.warlock = "검은날개 흑마법사" -- NPC 12459
end

-- Molten Core

L = BigWigs:NewBossLocale("Ragnaros Classic", "koKR")
if L then
	L.submerge_trigger = "나의 종들아"
	L.son = "화염의 피조물" -- NPC ID 12143
end

L = BigWigs:NewBossLocale("The Molten Core", "koKR")
if L then
	--L.bossName = "The Molten Core"
end
