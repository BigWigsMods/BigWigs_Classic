local L = BigWigs:NewBossLocale("Razorgore the Untamed", "koKR")
if not L then return end
if L then
	L.start_trigger = "침입자들이 들어왔다! 어떤 희생이 있더라도 알을 반드시 수호하라!"
	L.start_message = "폭군 서슬송곳니 전투 시작"
	L.start_soon = "몹 소환 5초전!"
	L.start_mob = "몹 소환"

	L.eggs = "알 개수 알림 미사용"
	L.eggs_desc = "남은 알 개수 알림 미사용"
	L.eggs_message = "%d/30 알을 파괴하였습니다."

	L.phase2_message = "모든 알이 파괴되었습니다, 서슬송곳니가 풀려납니다." -- CHECK
end

L = BigWigs:NewBossLocale("Nefarian", "koKR")
if L then
	L.landing_soon_trigger = "적들의 사기가 떨어지고 있다"
	L.landing_trigger = "불타라! 활활!"
	L.zerg_trigger = "말도 안 돼! 일어나라!"

	L.triggershamans = "주술사"
	L.triggerdruid = "드루이드 녀석, 그 바보"
	L.triggerwarlock = "흑마법사여, 네가 이해하지도 못하는"
	L.triggerpriest = "사제야, 그렇게 치유를"
	L.triggerhunter = "그 장난감"
	L.triggerwarrior = "전사들이로군, 네가 그보다 더 강하게 내려 칠 수"
	L.triggerrogue = "도적들인가?"
	L.triggerpaladin = "성기사여"
	L.triggermage = "네가 마법사냐?"
	--L.triggerdeathknight = "Deathknight "
	--L.triggermonk = "Monks,"

	L.landing_soon_warning = "네파리안이 10초 후 착지합니다!"
	L.landing_warning = "네파리안이 착지했습니다!"
	L.zerg_warning = "해골 등장!"
	L.fear_warning = "2초 후 공포!"
	L.fear_soon_warning = "약 5초내 공포!"
	L.shadowflame_warning = "암흑의 불길 주의!"
	L.classcall_warning = "곧 직업이 지목됩니다!"

	L.warnshaman = "주술사 - 토템 파괴!"
	L.warndruid = "드루이드 - 강제 표범 변신!"
	L.warnwarlock = "흑마법사 - 지옥불정령 등장!"
	L.warnpriest = "사제 - 치유 주문 금지!"
	L.warnhunter = "사냥꾼 - 원거리 무기 파손!"
	L.warnwarrior = "전사 - 광태 강제 전환!"
	L.warnrogue = "도적 - 강제 소환!"
	L.warnpaladin = "성기사 - 강제 보축 사용!"
	L.warnmage = "마법사 - 변이!"

	L.classcall_bar = "직업 지목"
	L.fear_bar = "공포 가능"

	L.shadowflame = "암흑의 불길 경고"
	L.shadowflame_desc = "암흑의 불길에 대한 경고"

	L.fear = "공포 경고"
	L.fear_desc = "네파리안이 공포 시전시 경고"

	L.classcall = "직업 지목 경고"
	L.classcall_desc = "직업 지목에 대한 경고"

	L.otherwarn = "기타 경고"
	L.otherwarn_desc = "착지와 소환에 대한 경고"
end

L = BigWigs:NewBossLocale("Chromaggus", "koKR")
if L then
	
end

