local L = BigWigs:NewBossLocale("Razorgore the Untamed", "ruRU")
if not L then return end
if L then
	L.start_trigger = "Злоумышленники проломились"

	L.eggs = "Считать яйца"
	L.eggs_desc = "Пересчитывать уничтоженные яйца."
	L.eggs_message = "%d/30 яиц уничтожено!"
end

L = BigWigs:NewBossLocale("Vaelastrasz the Corrupt", "ruRU")
if L then
	--L.warmup_trigger = "Too late, friends!"
	--L.tank_bomb = "Tank Bomb"
end

L = BigWigs:NewBossLocale("Chromaggus", "ruRU")
if L then
	L.breath = "Дыхание"
	L.breath_desc = "Сообщать о дыхании."

	--L.debuffs_message = "3/5 debuffs, carefull!"
	--L.debuffs_warning = "4/5 debuffs, %s on 5th!"
end

L = BigWigs:NewBossLocale("Nefarian Classic", "ruRU")
if L then
	L.landing_soon_trigger = "Отличная работа мои миньёны!"
	L.stage2_yell_trigger = "СЖЕЧЬ! Вы обречены!"
	L.stage3_yell_trigger = "Невозможно!"

	L.shaman_class_call_yell_trigger = "Шаманы! Покажитесь мне!"
	L.warlock_class_call_yell_trigger = "Варлоки, вы должны играть!"
	L.hunter_class_call_yell_trigger = "Охотники и ваше раздражение"
	L.mage_class_call_yell_trigger = "Маги так же"
	L.deathknight_class_call_yell_trigger = "Рыцари смерти! Сюда!"
	--L.monk_class_call_yell_trigger = "Monks"

	L.warnshaman = "Шаманы - ставьте тотемы!"
	L.warndruid = "Друиды - пробудите в себе зверя!"
	L.warnwarlock = "Чернокнижники - вызывайте инферналов!"
	L.warnpriest = "Жрецы - исцеляйте повреждения!"
	L.warnhunter = "Охотники - доставайте свои луки!"
	L.warnwarrior = "Войны - становитесь в атакующие стойки!"
	L.warnrogue = "Разбойники - точите свои клинки!"
	L.warnpaladin = "Паладины - улучшайте защиту!"
	L.warnmage = "Маги - используйте превращение!"
	--L.warndeathknight = "Death Knights - Death Grip"
	--L.warnmonk = "Monks - Stuck Rolling"
	--L.warndemonhunter = "Demon Hunters - Blinded"

	L.classcall = "Классовый вызов"
	L.classcall_desc = "Предупреждать о классовом вызове."

	--L.add = "Drakonid deaths"
	--L.add_desc = "Announce the number of adds killed in Phase 1 before Nefarian lands."
end
