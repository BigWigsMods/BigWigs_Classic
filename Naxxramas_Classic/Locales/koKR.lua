local L = BigWigs:NewBossLocale("Gothik the Harvester", "koKR")
if not L then return end
if L then
	L.add_death = "추가 몹 죽음 알림"
	L.add_death_desc = "추가된 몹 죽음을 알립니다."

	L.trainee = "수련생" -- Unrelenting Trainee NPC 16124
	L.deathKnight = "죽음의 기사" -- Unrelenting Death Knight NPC 16125
	L.rider = "기병" -- Unrelenting Rider NPC 16126
end

L = BigWigs:NewBossLocale("Grobbulus", "koKR")
if L then
	L.injection = "돌연변이 유발"
end

L = BigWigs:NewBossLocale("Heigan the Unclean", "koKR")
if L then
	L.teleport_yell_trigger = "여기가 너희 무덤이 되리라."
end

L = BigWigs:NewBossLocale("The Four Horsemen", "koKR")
if L then
	L.mark_desc = "징표를 알립니다."

	L[16062] = "모그레인" -- Surname of Highlord Mograine
	L[16063] = "젤리에크" -- Surname of Sir Zeliek
	L[16064] = "코스아즈" -- Surname of Thane Korth'azz
	L[16065] = "블라미우스" -- Surname of Lady Blaumeux
end

L = BigWigs:NewBossLocale("Kel'Thuzad", "koKR")
if L then
	L.KELTHUZADCHAMBERLOCALIZEDLOLHAX = "켈투자드의 방"

	L.engage_yell_trigger = "어둠의 문지기와 하수인, 그리고 병사들이여! 나 켈투자드가 부르니 명을 받들라!"
	L.stage2_yell_trigger1 = "자비를 구하라!" -- CHECK
	L.stage2_yell_trigger2 = "마지막 숨이나 쉬어라!"
	L.stage2_yell_trigger3 = "최후를 맞이하라!"
	L.stage3_yell_trigger = "주인님, 도와주소서!"
	L.adds_yell_trigger = "좋다. 얼어붙은 땅의 전사들이여, 일어나라! 너희에게 싸울 것을 명하노라. 날 위해 죽고, 날 위해 죽여라! 한 놈도 살려두지 마라!"
end

L = BigWigs:NewBossLocale("Noth the Plaguebringer", "koKR")
if L then
	L.adds_yell_trigger = "일어나라,병사들이여" -- 일어나라,병사들이여! 다시 일어나 싸워라!
end

L = BigWigs:NewBossLocale("Instructor Razuvious", "koKR")
if L then
	L.understudy = "죽음의 기사 수습생"
end

L = BigWigs:NewBossLocale("Thaddius", "koKR")
if L then
	L[15929] = "스탈라그"
	L[15930] = "퓨진"

	L.stage2_yell_trigger1 = "잡아... 먹어주마..."
	L.stage2_yell_trigger2 = "박살을 내주겠다!"
	L.stage2_yell_trigger3 = "죽여주마..."

	L.add_death_emote_trigger = "%s|1이;가; 죽습니다."
	L.overload_emote_trigger = "%s|1이;가; 과부하 상태가 됩니다."
	L.add_revive_emote_trigger = "%s|1이;가; 다시 살아납니다!"

	L.polarity_extras = "극성 변환 위치 잡기 추가 경고"

	L.custom_select_charge_position = "첫 이동 위치"
	L.custom_select_charge_position_desc = "첫 극성 변환 후 이동할 위치입니다."
	L.custom_select_charge_position_value1 = "|cffff2020음극(-)|r 왼쪽, |cff2020ff양극(+)|r 오른쪽"
	L.custom_select_charge_position_value2 = "|cff2020ff양극(+)|r 왼쪽, |cffff2020음극(-)|r 오른쪽"

	L.custom_select_charge_movement = "이동 방식"
	L.custom_select_charge_movement_desc = "공격대가 사용하는 이동 전략입니다."
	L.custom_select_charge_movement_value1 = "보스를 |cff20ff20관통|r하여 이동"
	L.custom_select_charge_movement_value2 = "보스 주위를 |cff20ff20시계방향|r으로 이동"
	L.custom_select_charge_movement_value3 = "보스 주위를 |cff20ff20반시계방향|r으로 이동"
	L.custom_select_charge_movement_value4 = "4지점 1: 극성 변경 시 |cff20ff20오른쪽|r, 동일 극성 시 |cff20ff20왼쪽|r"
	L.custom_select_charge_movement_value5 = "4지점 2: 극성 변경 시 |cff20ff20왼쪽|r, 동일 극성 시 |cff20ff20오른쪽|r"

	L.custom_off_charge_graphic = "화살표 그래픽"
	L.custom_off_charge_graphic_desc = "화살표 그래픽을 표시합니다."
	L.custom_off_charge_text = "텍스트 화살표"
	L.custom_off_charge_text_desc = "추가 메시지를 표시합니다."
	L.custom_off_charge_voice = "음성 경고"
	L.custom_off_charge_voice_desc = "음성 경고를 재생합니다."

	L.left = "<--- 왼쪽으로 <--- 왼쪽으로 <---"
	L.right = "---> 오른쪽으로 ---> 오른쪽으로 --->"
	L.swap = "^^^^ 방향 전환 ^^^^ 방향 전환 ^^^^"
	L.stay = "==== 움직 이지마 ==== 움직 이지마 ===="

	L.chat_message = "타디우스 모듈은 방향 화살표와 음성 알림을 지원합니다. 옵션에서 설정하세요."
end
