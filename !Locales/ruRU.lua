-- Ahn'Qiraj 20

local L = BigWigs:NewBossLocale("General Rajaxx", "ruRU")
if L then
	L.wave_trigger1a = "Сначала убей, потом задавай вопросы... На подходе!"
	L.wave_trigger1b = "Раджакс, напомни, когда я в последний раз обещал тебя убить?"
end

L = BigWigs:NewBossLocale("Buru the Gorger", "ruRU")
if L then
	L.fixate_desc = "Сосредотачивается на цели, игнорируя угрозу от других атакующих."
end

L = BigWigs:NewBossLocale("Ayamiss the Hunter", "ruRU")
if L then
	L.sacrifice = "Жертвоприношение"
end

L = BigWigs:NewBossLocale("Ruins of Ahn'Qiraj Trash", "ruRU")
if L then
	L.guardian = "Анубисат-страж"
end

-- Ahn'Qiraj 40

L = BigWigs:NewBossLocale("Viscidus", "ruRU")
if L then
	L.freeze = "Замораживающие состояния"
	L.freeze_desc = "Предупреждать о различных замороженных состояниях."

	L.freeze_trigger1 = "%s начинает замедляться!"
	L.freeze_trigger2 = "%s замораживается!"
	L.freeze_trigger3 = "%s застывает!"
	L.freeze_trigger4 = "%s начинает раскалываться!"
	L.freeze_trigger5 = "%s едва держится!"

	L.freeze_warn1 = "Первая фаза заморозки!"
	L.freeze_warn2 = "Вторая фаза заморозки!"
	L.freeze_warn3 = "Нечистотон заморожен!"
	L.freeze_warn4 = "Ломается - продолжайте!"
	L.freeze_warn5 = "Ломается - почти готово!"
	L.freeze_warn_melee = "%d атак в ближнем бою - осталось %d"
	L.freeze_warn_frost = "%d морозных атак - осталось еще %d"
end

L = BigWigs:NewBossLocale("Silithid Royalty", "ruRU")
if L then
	L[15543] = "Яудж"
	L[15544] = "Вем"
	L[15511] = "Кри"
end

L = BigWigs:NewBossLocale("Ouro", "ruRU")
if L then
	L.emerge_message = "Оуро появился"
	L.emerge_bar = "Появление"

	L.submerge_message = "Оуро погрузился"
	L.submerge_bar = "Погружение"
	--L.submerge_early_message = "Early Submerge - No one was in range"

	L.scarab = "Скарабей исчез"
	L.scarab_desc = "Предупреждать об исчезновении скарабея."
	L.scarab_bar = "Скарабеи исчезли"
end

L = BigWigs:NewBossLocale("C'Thun", "ruRU")
if L then
	L.claw_tentacle = "Когтещупальце"
	L.claw_tentacle_desc = "Таймеры для Когтещупальца."

	L.giant_claw_tentacle = "Гигантское Когтещцпальце"
	L.giant_claw_tentacle_desc = "Таймеры для Гигантского Когтещупальца."

	L.eye_tentacles = "Глазастое щупальце"
	L.eye_tentacles_desc = "Таймеры для 8 Глазастых щупалец."

	L.giant_eye_tentacle = "Огромный глаз"
	L.giant_eye_tentacle_desc = "Таймеры для Огромного глазастого щупальца."

	L.weakened_desc = "Предупреждение об ослаблении."

	--L.dark_glare_message = "%s: %s (Group %s)" -- Dark Glare: PLAYER_NAME (Group 1)
	L.stomach = "Желудок"
end

L = BigWigs:NewBossLocale("Ahn'Qiraj Trash", "ruRU")
if L then
	L.sentinel = "Анубисат-часовой" -- NPC 15264
	L.brainwasher = "Киражский опустошитель разума" -- NPC 15247
	L.defender = "Анубисат-защитник" -- NPC 15277
	L.crawler = "Векнисский ядохвост" -- NPC 15240

	L.target_buffs = "Предупреждения о баффах цели"
	L.target_buffs_desc = "Когда ваша цель - Анубисат-часовой, показывать предупреждение о том, какой у него бафф."
	L.target_buffs_message = "Бафф цели: %s"
	L.detect_magic_missing_message = "Распознавание магии у вашей цели отсутствует"
	L.detect_magic_warning = "Маг должен наложить \124cff71d5ff\124Hspell:2855:0\124h[Распознавание магии]\124h\124r на вашу цель, чтобы предупреждения о баффах работали."
end

-- Blackwing Lair

L = BigWigs:NewBossLocale("Razorgore the Untamed", "ruRU")
if L then
	L.start_trigger = "Злоумышленники проломились"

	L.eggs = "Считать яйца"
	L.eggs_desc = "Пересчитывать уничтоженные яйца."
	L.eggs_message = "%d/30 яиц уничтожено"
end

L = BigWigs:NewBossLocale("Vaelastrasz the Corrupt", "ruRU")
if L then
	--L.warmup_trigger = "Too late, friends!"
end

L = BigWigs:NewBossLocale("Chromaggus", "ruRU")
if L then
	L.breath = "Дыхание"
	L.breath_desc = "Сообщать о дыхании."

	--L.debuffs_message = "3/5 debuffs, carefull!"
	--L.debuffs_warning = "4/5 debuffs, %s on 5th!"
	L.bronze = "Бронзовое"

	L.vulnerability = "Изменение уязвимости"
	L.vulnerability_desc = "Сообщать когда уязвимость изменяется."
	L.vulnerability_message = "Уязвимость: %s"
	L.detect_magic_missing = "Распознавание магии is missing from Chromaggus"
	L.detect_magic_warning = "A Mage must cast \124cff71d5ff\124Hspell:2855:0\124h[Распознавание магии]\124h\124r on Chromaggus for vulnerability warnings to work."
end

L = BigWigs:NewBossLocale("Nefarian Classic", "ruRU")
if L then
	L.engage_yell_trigger = "Ну что ж, поиграем!"
	L.stage3_yell_trigger = "Невозможно!"

	L.shaman_class_call_yell_trigger = "Шаманы! Покажитесь мне!"
	L.deathknight_class_call_yell_trigger = "Рыцари смерти! Сюда!"
	--L.monk_class_call_yell_trigger = "Monks"
	L.hunter_class_call_yell_trigger = "Охотники и ваше раздражение"

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
	--L.add_desc = "Announce the number of adds killed in stage 1 before Nefarian lands."
end

L = BigWigs:NewBossLocale("Blackwing Lair Trash", "ruRU")
if L then
	L.wyrmguard_overseer = "Змеестраж Когтя Смерти / Надзиратель Когтя Смерти" -- NPC 12460 / 12461
	L.sandstorm = "Песчаная буря"

	--L.target_vulnerability = "Target Vulnerability Warnings"
	--L.target_vulnerability_desc = "When your target is a Death Talon Wyrmguard or a Death Talon Overseer, show a warning for what vulnerability it has."
	--L.target_vulnerability_message = "Target Vulnerability: %s"
	L.detect_magic_missing_message = "Распознавание магии is missing from your target"
	L.detect_magic_warning = "A Mage must cast \124cff71d5ff\124Hspell:2855:0\124h[Распознавание магии]\124h\124r on your target for vulnerability warnings to work."

	L.warlock = "Чернокнижник Крыла Тьмы" -- NPC 12459
end

-- Molten Core

L = BigWigs:NewBossLocale("Ragnaros Classic", "ruRU")
if L then
	L.submerge_trigger = "ПРИБЫВАЙТЕ ЕЩЕ"
	L.son = "Сын пламени" -- NPC ID 12143
end

L = BigWigs:NewBossLocale("The Molten Core", "ruRU")
if L then
	--L.bossName = "The Molten Core"
end
