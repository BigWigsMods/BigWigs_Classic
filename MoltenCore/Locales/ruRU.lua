
local L = BigWigs:NewBossLocale("Gehennas", "ruRU")
if L then
	L.curse_warning = "5 секунд до проклятия Гееннаса!!"
	L.fire_you = "Дождь Огня на Вас!!"
end

L = BigWigs:NewBossLocale("Lucifron", "ruRU")
if L then
	L.curse_warn = "5 секунд до проклятия Люцифрона!"
	L.doom_warn = "5 секунд до надвигающегося рока!"
	L.mc_bar = "КР: %s"
end

L = BigWigs:NewBossLocale("Majordomo Executus", "ruRU")
if L then
	L.disabletrigger = "Impossible! Stay your attack, mortals... I submit! I submit!"
	L.warn = "Сила Мажордомо увеличится через 5 секунд!"
end

L = BigWigs:NewBossLocale("Ragnaros", "ruRU")
if L then
	L.knockback_trigger = "^ИСПЫТАЙТЕ"
	L.submerge_trigger = "^ПРИБЫВАЙТЕ ЕЩЕ"
	L.engage_trigger = "^Тогда получите ещё!"

	L.knockback = "Сбивание с ног"
	L.knockback_desc = "Предупреждать о сбивании с ног"
	L.knockback_message = "Сбивание с ног!"
	L.knockback_bar = "Массовое cбивание с ног"

	L.submerge = "Погружение Рагнароса"
	L.submerge_desc = "Предупреждать о погружении Рагнароса и появлении сыновей пламени"
	L.submerge_message = "Раграрос погрузился на 90 секунд. Появляются сыновья пламени!"
	L.submerge_bar = "Рагнарос появляется"

	L.emerge = "Всплытие Рагнароса"
	L.emerge_desc = "Предупреждать о всплытии Рагнароса"
	L.emerge_message = "Рагнарос появился, 3 минуты до погружения!"
	L.emerge_bar = "Рагнарос погрузился"
end

