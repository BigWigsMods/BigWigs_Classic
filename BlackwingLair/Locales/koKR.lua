local L = BigWigs:NewBossLocale("Razorgore the Untamed", "koKR")
if not L then return end
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
