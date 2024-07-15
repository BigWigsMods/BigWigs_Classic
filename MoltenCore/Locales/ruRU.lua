local L = BigWigs:NewBossLocale("Ragnaros Classic", "ruRU")
if not L then return end
if L then
	L.submerge_trigger = "ПРИБЫВАЙТЕ ЕЩЕ"

	L.submerge = "Погружение Рагнароса"
	L.submerge_desc = "Предупреждать о погружении Рагнароса и появлении сыновей пламени"
	L.submerge_message = "Раграрос погрузился на 90 секунд. Появляются сыновья пламени!"
	L.submerge_bar = "Рагнарос появляется"

	L.emerge = "Всплытие Рагнароса"
	L.emerge_desc = "Предупреждать о всплытии Рагнароса"
	L.emerge_message = "Рагнарос появился, 3 минуты до погружения!"
	L.emerge_bar = "Рагнарос погрузился"
end

L = BigWigs:NewBossLocale("The Molten Core", "ruRU")
if L then
	--L.bossName = "The Molten Core"
end
