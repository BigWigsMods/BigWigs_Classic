local L = BigWigs:NewBossLocale("Anub'Rekhan", "ruRU")
if not L then return end
if L then
	L.gainwarn10sec = "~10 до жуков-трупоедов"
	L.gainincbar = "Следующая волна жуков-трупоедов"
end

L = BigWigs:NewBossLocale("Grand Widow Faerlina", "ruRU")
if L then
	L.silencewarn = "Безмолвие! Задержка ярости!"
	L.silencewarn5sec = "Безмолвие закончится через 5 секунд"
end

L = BigWigs:NewBossLocale("Gluth", "ruRU")
if L then
	L.startwarn = "Глут вступает в бой! ~105 cекунд до появления зомби!"

	L.decimate_bar = "Истребление зомби"
end

L = BigWigs:NewBossLocale("Gothik the Harvester", "ruRU")
if L then
	L.room = "Прибытие Готика"
	L.room_desc = "Сообщать о прибытии Готика"

	L.add = "Появление помощников"
	L.add_desc = "Сообщать о появлении помощников"

	L.adddeath = "Оповещать смерть помощников"
	L.adddeath_desc = "Сообщать о смерти помощников."

	L.starttrigger1 = "Глупо было искать свою смерть."
	L.starttrigger2 = "Я очень долго ждал. Положите свою душу в мой комбайн и будем вам дерево с золотыми монетами." -- check this
	L.startwarn = "Готик вступает в бой! 4:30 до входа в комнату."

	L.rider = "Неодолимый всадник"
	L.spectral_rider = "Призрачный всадник"
	L.deathknight = "Безжалостный Рыцарь Смерти"
	L.spectral_deathknight = "Призрачный рыцарь Смерти"
	L.trainee = "Жестокий новобранец"
	L.spectral_trainee = "Призрачный ученик"

	L.riderdiewarn = "Всадник мёртв!"
	L.dkdiewarn = "Рыцарь смерти мёртв!"

	L.warn1 = "В комнате через 3 минуты"
	L.warn2 = "В комнате через 90 секунд"
	L.warn3 = "В комнате через 60 секунд"
	L.warn4 = "В комнате через 30 секунд"
	L.warn5 = "Готик появится через 10 секунд"

	L.wave = "%d/23: %s"

	L.trawarn = "Ученик через 3 секунды"
	L.dkwarn = "Рыцарь Смерти через 3 секунды"
	L.riderwarn = "Всадник через 3 секунды"

	L.trabar = "Ученик - %d"
	L.dkbar = "Рыцарь Смерти - %d"
	L.riderbar = "Всадник - %d"

	L.inroomtrigger = "Я ждал слишком долго. Сейчас вы предстанете пред ликом Жнеца душ."
	L.inroomwarn = "Он в комнате!!"

	L.inroombartext = "В комнате"
end

L = BigWigs:NewBossLocale("Grobbulus", "ruRU")
if L then
	L.bomb_message = "Укол"
end

L = BigWigs:NewBossLocale("Heigan the Unclean", "ruRU")
if L then
	L.starttrigger = "Теперь вы принадлежите мне!"
	L.starttrigger2 = "Пришло ваше время..."
	L.starttrigger3 = "Я вижу вас..."

	L.engage = "Вступление в бой"
	L.engage_desc = "Предупреждать когда Хейган вступает в бой."
	L.engage_message = "Хейган вступает в бой! 90 секунд до телепорта!"

	L.teleport = "Телепорт"
	L.teleport_desc = "Предупреждать о телепорте."
	L.teleport_trigger = "Вам конец."
	L.teleport_1min_message = "Телепорт через 1 минуту"
	L.teleport_30sec_message = "Телепорт через 30 секунд"
	L.teleport_10sec_message = "Телепорт через 10 секунд!"
	L.on_platform_message = "Телепорт! 45 секунд на платформе!"

	L.to_floor_30sec_message = "Возвращение через 30 секунд"
	L.to_floor_10sec_message = "Возвращение через 10 секунд!"
	L.on_floor_message = "Возвращается! 90 секунд до следующего телепорта!"

	L.teleport_bar = "Телепорт!"
	L.back_bar = "Возвращение!"
end

L = BigWigs:NewBossLocale("The Four Horsemen", "ruRU")
if L then
	L.mark = "Знак"
	L.mark_desc = "Предупреждать о знаках."

	L.markbar = "Знак %d"
	L.markwarn1 = "Знак %d!"
	L.markwarn2 = "Знак %d через 5 секунд"

	L.startwarn = "Четверо всадников вступили в бой! Знак через ~17 секунд"
end

L = BigWigs:NewBossLocale("Kel'Thuzad", "ruRU")
if L then
	L.KELTHUZADCHAMBERLOCALIZEDLOLHAX = "Зал Кел'Тузада"

	L.start_trigger = "Соратники слуги солдаты холодной тьмы! Повинуйтесь зову Кел'Тузада!"
	L.start_warning = "Бой с Кел'Тузадом начинается! ~3 мин 30 сек до выхода босса!"

	L.phase2_trigger1 = "Молите о пощаде!"
	L.phase2_trigger2 = "Кричите! Кричите изо всех сил!"
	L.phase2_trigger3 = "Вы уже мертвы!"
	L.phase2_warning = "Фаза 2 Кел'Тузад просыпается!"
	L.phase2_bar = "Кел'Тузад активен!"

	L.phase3_trigger = "Господин мне нужна помощь!"
	L.phase3_soon_warning = "Скоро Фаза 3!"
	L.phase3_warning = "Фаза 3 защитники через ~15 секунд!"

	L.guardians = "Появление стражей"
	L.guardians_desc = "Сообщать о появлении стражей ледяной короны в третьей фазе."
	L.guardians_trigger = "Хорошо. Воины ледяных пустошей восстаньте! Повелеваю вам сражаться убивать и умирать во имя своего повелителя! Не щадить никого!"
	L.guardians_warning = "Стражи появятся через 15 секунд!"
	L.guardians_bar = "Появляются стражи!"
end

L = BigWigs:NewBossLocale("Loatheb", "ruRU")
if L then
	L.startwarn = "Лотхиб вступает в бой, 2 минуты до неотвратимого рока!"

	L.doom_5sec_warn = "Неотвратимый рок %d через 5 секунд!"
	L.doomtime_bar = "Рок каждые 15 секунд"
	L.doomtime_warn = "Рок теперь каждые %s секунд!"
	L.doomtime_now = "Рок теперь накладывается каждые 15 секунд!"

	--L.remove_curse = "Curses removed on Loatheb"

	L.spore_warn = "Появляется %d спора"
end

L = BigWigs:NewBossLocale("Noth the Plaguebringer", "ruRU")
if L then
	L.starttrigger1 = "Смерть чужакам!"
	L.starttrigger2 = "Слава господину!"
	L.starttrigger3 = "Прощайся с жизнью!"
	L.startwarn = "Нот Чумной вступает в бой! 90 секунд до телепорта"
	L.add_trigger = "Встаньте мои воины! Встаньте и сражайтесь вновь!"

	L.blink = "Опасность скачка"
	L.blink_desc = "Предупреждать когда Нот использует скачок"
	L.blink_trigger = "%s перескакивает на другое место!"
	L.blink_bar = "Скачок"

	L.teleport = "Телепорт"
	L.teleport_desc = "Предупреждать о телепорте."
	L.teleport_bar = "Телепорт!"
	L.teleportwarn = "Телепорт! Он на балконе!"
	L.teleportwarn2 = "Телепорт через 10 секунд!"
	L.back_bar = "Назад в Команту!"
	L.back_warn = "Он вернулся в комнату на %d секунд!"
	L.back_warn2 = "10 секунд до возвращения в комнату!"

	L.curse_explosion = "Проклятый взрыв!"
	L.curse_warn = "Проклятие через ~55 секунд"
	L.curse_10sec_warn = "Проклятие через ~10 секунд"
	L.curse_bar = "Следующее проклятие"

	L.wave = "Волны"
	L.wave_desc = "Сообщать о волнах"
	L.wave1_bar = "1-я волна"
	L.wave2_bar = "2-я волна"
	L.wave2_message = "2-я волна через 10 сек"
end

L = BigWigs:NewBossLocale("Maexxna", "ruRU")
if L then
	L.webspraywarn30sec = "Паутина через 10 секунд"
	L.webspraywarn20sec = "Паутина! 10 секунд до появления пауков!"
	L.webspraywarn10sec = "Пауки! 10 секунд до паутины!"
	L.webspraywarn5sec = "Паутина через 5 секунд!"
	L.enragewarn = "Бешенство - ХЛЮП ХЛЮП ХЛЮП!"
	L.enragesoonwarn = "Скоро бешенство"

	L.cocoonbar = "Коконы"
	L.spiderbar = "Пауки"
end

L = BigWigs:NewBossLocale("Sapphiron", "ruRU")
if L then
	L.deepbreath_trigger = "%s глубоко вздыхает."

	--L.air_phase = "Air Phase"
	--L.ground_phase = "Ground Phase"

	L.deepbreath = "Ледяная бомба"
	L.deepbreath_warning = "Появляется ледяная бомба!"
	L.deepbreath_bar = "Приземляется ледяная бомба!"

	L.icebolt_say = "Я в глыбе!"
end

L = BigWigs:NewBossLocale("Instructor Razuvious", "ruRU")
if L then
	L.understudy = "Ученик рыцаря смерти"

	L.taunt_warning = "Провокация закончится через 5сек!"
	L.shieldwall_warning = "Преграда из костей закончится через 5сек!"
end

L = BigWigs:NewBossLocale("Thaddius", "ruRU")
if L then
	L.trigger_phase1_1 = "Сталагг тебя раздавит!"
	L.trigger_phase1_2 = "На корм хозяину!"
	L.trigger_phase2_1 = "Отведайте... своих... костей..."
	L.trigger_phase2_2 = "Растерзаю!!!"
	L.trigger_phase2_3 = "Убей..."

	L.add_death_trigger = "%s умирает."
	L.overload_trigger = "%s перезагружается!"
	L.polarity_trigger = "Теперь тебе больно..."

	L.polarity_warning = "3 секунды до сдвига полярности!"
	L.polarity_changed = "Полярность сменилась!"
	L.polarity_nochange = "Полярность НЕ сменилась!"
	L.polarity_first_positive = "Вы (+) ПОЛОЖИТЕЛЬНЫЙ!"
	L.polarity_first_negative = "Вы (-) ОТРИЦАТЕЛЬНЫЙ!"

	L.phase1_message = "Таддиус фаза 1"
	L.phase2_message = "Таддиус фаза 2 - Берсерк через 5 минут!"

	L.throw = "Бросока"
	L.throw_desc = "Предупреждать о смене танков на платформах."
	L.throw_warning = "Бросок через 5 секунд!"

	--L.polarity_extras = "Additional alerts for Polarity Shift positioning"

	--L.custom_off_select_charge_position = "First position"
	--L.custom_off_select_charge_position_desc = "Where to move to after the first Polarity Shift."
	--L.custom_off_select_charge_position_value1 = "|cffff2020Negative (-)|r are LEFT, |cff2020ffPositive (+)|r are RIGHT"
	--L.custom_off_select_charge_position_value2 = "|cff2020ffPositive (+)|r are LEFT, |cffff2020Negative (-)|r are RIGHT"

	--L.custom_off_select_charge_movement = "Movement"
	--L.custom_off_select_charge_movement_desc = "The movement strategy your group uses."
	--L.custom_off_select_charge_movement_value1 = "Run |cff20ff20THROUGH|r the boss"
	--L.custom_off_select_charge_movement_value2 = "Run |cff20ff20CLOCKWISE|r around the boss"
	--L.custom_off_select_charge_movement_value3 = "Run |cff20ff20COUNTER-CLOCKWISE|r around the boss"
	--L.custom_off_select_charge_movement_value4 = "Four camps 1: Polarity changed moves |cff20ff20RIGHT|r, same polarity moves |cff20ff20LEFT|r"
	--L.custom_off_select_charge_movement_value5 = "Four camps 2: Polarity changed moves |cff20ff20LEFT|r, same polarity moves |cff20ff20RIGHT|r"

	--L.custom_off_charge_graphic = "Graphical arrow"
	--L.custom_off_charge_graphic_desc = "Show an arrow graphic."
	--L.custom_off_charge_text = "Text arrows"
	--L.custom_off_charge_text_desc = "Show an additional message."
	--L.custom_off_charge_voice = "Voice alert"
	--L.custom_off_charge_voice_desc = "Play a voice alert."

	--Translate these to get locale sound files!
	--L.left = "<--- GO LEFT <--- GO LEFT <---"
	--L.right = "---> GO RIGHT ---> GO RIGHT --->"
	--L.swap = "^^^^ SWITCH SIDES ^^^^ SWITCH SIDES ^^^^"
	--L.stay = "==== DON'T MOVE ==== DON'T MOVE ===="
end
