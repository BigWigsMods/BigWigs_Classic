local L = BigWigs:NewBossLocale("Viscidus", "koKR")
if not L then return end
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
