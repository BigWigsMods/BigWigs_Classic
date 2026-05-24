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
	L.freeze = "결빙 단계"
	L.freeze_desc = "다양한 결빙 단계를 경고합니다."

	L.freeze_trigger1 = "%s|1이;가; 느려지기 시작했습니다!"
	L.freeze_trigger2 = "%s|1이;가; 얼어붙고 있습니다!"
	L.freeze_trigger3 = "%s|1이;가; 단단하게 얼었습니다!"
	L.freeze_trigger4 = "%s|1이;가; 분해되기 시작합니다!"
	L.freeze_trigger5 = "%s|1이;가; 부서질 것 같습니다!"

	L.freeze_warn1 = "1단계 결빙!"
	L.freeze_warn2 = "2단계 결빙!"
	L.freeze_warn3 = "비스키더스 결빙!"
	L.freeze_warn4 = "균열 발생 - 계속 공격!"
	L.freeze_warn5 = "균열 발생 - 거의 다 됐습니다!"
	L.freeze_warn_melee = "근접 공격 %d회 - %d회 남음"
	L.freeze_warn_frost = "냉기 공격 %d회 - %d회 남음"
end

L = BigWigs:NewBossLocale("Silithid Royalty", "koKR")
if L then
	L[15543] = "야우즈"
	L[15544] = "벰"
	L[15511] = "크리"
end

L = BigWigs:NewBossLocale("Ouro", "koKR")
if L then
	L.emerge_message = "아우로가 모습을 드러냈습니다"
	L.emerge_bar = "출현"

	L.submerge_message = "아우로가 땅속으로 들어갔습니다"
	L.submerge_bar = "잠수"
	L.submerge_early_message = "조기 잠수 - 사정거리에 아무도 없음"

	L.scarab = "스카라베 소멸"
	L.scarab_desc = "스카라베 소멸을 경고합니다."
	L.scarab_bar = "스카라베 소멸"
end

L = BigWigs:NewBossLocale("C'Thun", "koKR")
if L then
	L.claw_tentacle = "발톱촉수"
	L.claw_tentacle_desc = "발톱촉수의 타이머를 표시합니다."

	L.giant_claw_tentacle = "거대 발톱"
	L.giant_claw_tentacle_desc = "거대 발톱촉수의 타이머를 표시합니다."

	L.eye_tentacles = "눈 달린 촉수"
	L.eye_tentacles_desc = "8개의 눈 달린 촉수 타이머를 표시합니다."

	L.giant_eye_tentacle = "눈 달린 거대한 촉수"
	L.giant_eye_tentacle_desc = "눈 달린 거대한 촉수의 타이머를 표시합니다."

	L.weakened_desc = "약화 상태를 경고합니다."

	L.dark_glare_message = "%s: %s (%s파티)" -- Dark Glare: PLAYER_NAME (Group 1)
	L.stomach = "위장"
end

L = BigWigs:NewBossLocale("Ahn'Qiraj Trash", "koKR")
if L then
	L.sentinel = "아누비사스 파수병" -- NPC 15264
	L.brainwasher = "퀴라지 세뇌관" -- NPC 15247
	L.defender = "아누비사스 문지기" -- NPC 15277
	L.crawler = "집게발 베크니스" -- NPC 15240

	L.target_buffs = "대상 버프 경고"
	L.target_buffs_desc = "대상이 아누비사스 파수병일 때 가지고 있는 버프를 경고합니다."
	L.target_buffs_message = "대상 버프: %s"
	L.detect_magic_missing_message = "대상에게 마법 감지 없음"
	L.detect_magic_warning = "버프 경고가 작동하려면 마법사가 대상에게 \124cff71d5ff\124Hspell:2855:0\124h[마법 감지]\124h\124r|1을;를; 시전해야 합니다."
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
	L.warmup_trigger = "너무 늦었어"
end

L = BigWigs:NewBossLocale("Chromaggus", "koKR")
if L then
	L.breath = "브레스 경고"
	L.breath_desc = "브레스에 대한 경고"

	L.debuffs_message = "디버프 3/5, 주의!"
	L.debuffs_warning = "디버프 4/5, %s|1이;가; 5번째!"
	L.bronze = "청동"

	L.vulnerability = "약화 속성 경고"
	L.vulnerability_desc = "약화 속성 변경에 대한 경고."
	L.vulnerability_message = "새로운 취약 속성: %s"
	L.detect_magic_missing = "크로마구스에게 마법 감지 없음"
	L.detect_magic_warning = "약화 속성 경고가 작동하려면 마법사가 크로마구스에게 \124cff71d5ff\124Hspell:2855:0\124h[마법 감지]\124h\124r|1을;를; 시전해야 합니다."
end

L = BigWigs:NewBossLocale("Nefarian Classic", "koKR")
if L then
	L.engage_yell_trigger = "게임을 시작하자"
	L.stage3_yell_trigger = "말도 안 돼! 일어나라!"

	L.shaman_class_call_yell_trigger = "주술사"
	L.deathknight_class_call_yell_trigger = "죽음의 기사"
	L.monk_class_call_yell_trigger = "수도사"
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
	L.warndeathknight = "죽음의 기사 - 죽음의 손아귀!"
	L.warnmonk = "수도사 - 강제 구르기!"
	L.warndemonhunter = "악마사냥꾼 - 실명!"

	L.classcall = "직업 지목"
	L.classcall_desc = "직업 지목에 대한 경고"

	L.add = "용족 처치"
	L.add_desc = "네파리안이 착륙하기 전 1단계에서 처치된 추가 몹의 수를 알립니다."
end

L = BigWigs:NewBossLocale("Blackwing Lair Trash", "koKR")
if L then
	L.wyrmguard_overseer = "죽음의발톱 고룡수호병 / 죽음의발톱 감독관" -- NPC 12460 / 12461
	L.sandstorm = "모래폭풍"

	L.target_vulnerability = "대상 약화 속성 경고"
	L.target_vulnerability_desc = "대상이 죽음의발톱 고룡수호병 또는 죽음의발톱 감독관일 때 가지고 있는 약화 속성을 경고합니다."
	L.target_vulnerability_message = "대상 약화 속성: %s"
	L.detect_magic_missing_message = "대상에게 마법 감지 없음"
	L.detect_magic_warning = "약화 속성 경고가 작동하려면 마법사가 대상에게 \124cff71d5ff\124Hspell:2855:0\124h[마법 감지]\124h\124r|1을;를; 시전해야 합니다."

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
	L.bossName = "화산 심장부"
end
