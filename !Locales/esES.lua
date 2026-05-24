-- Ahn'Qiraj 20

local L = BigWigs:NewBossLocale("General Rajaxx", "esES")
if L then
	L.wave_trigger1a = "Ahí vienen. Intenta que no te maten,"
	L.wave_trigger1b = "Rajaxx, ¿recuerdas que te dije que serías el último en morir?"
end

L = BigWigs:NewBossLocale("Buru the Gorger", "esES")
if L then
	L.fixate_desc = "Se fija en un objetivo e ignora la amenaza de otros atacantes."
end

L = BigWigs:NewBossLocale("Ayamiss the Hunter", "esES")
if L then
	L.sacrifice = "Sacrificio"
end

L = BigWigs:NewBossLocale("Ruins of Ahn'Qiraj Trash", "esES")
if L then
	L.guardian = "Guardián Anubisath"
end

-- Ahn'Qiraj 40

L = BigWigs:NewBossLocale("Viscidus", "esES")
if L then
	L.freeze = "Estados de congelación"
	L.freeze_desc = "Anuncia los diferentes estados de congelación."

	L.freeze_trigger1 = "¡%s comienza a remitir!"
	L.freeze_trigger2 = "¡%s se queda inmóvil!"
	L.freeze_trigger3 = "¡%s está !"
	L.freeze_trigger4 = "¡%s empieza a desmoronarse!"
	L.freeze_trigger5 = "¡%s parece a punto de hacerse añicos!"

	L.freeze_warn1 = "¡Primera fase de congelación!"
	L.freeze_warn2 = "¡Segunda fase de congelación!"
	L.freeze_warn3 = "¡Viscidus está congelado!"
	L.freeze_warn4 = "¡Desmoronándose - sigue adelante!"
	L.freeze_warn5 = "¡Desmoronándose - casi allí!"
	L.freeze_warn_melee = "%d ataques cuerpo a cuerpo - faltan %d"
	L.freeze_warn_frost = "%d ataques de escarcha - faltan %d"
end

L = BigWigs:NewBossLocale("Silithid Royalty", "esES")
if L then
	L[15543] = "Yauj"
	L[15544] = "Vem"
	L[15511] = "Kri"
end

L = BigWigs:NewBossLocale("Ouro", "esES")
if L then
	L.emerge_message = "Ouro se ha emergido"
	L.emerge_bar = "Emersión"

	L.submerge_message = "Ouro se ha sumergido"
	L.submerge_bar = "Sumersión"
	L.submerge_early_message = "Sumersión temprana - Nadie estaba en rango"

	L.scarab = "Desaparición de escarabajo"
	L.scarab_desc = "Anuncio para desaparición de escarabajo."
	L.scarab_bar = "Escarabajos desaparecen"
end

L = BigWigs:NewBossLocale("C'Thun", "esES")
if L then
	L.claw_tentacle = "Tentáculo Garral"
	L.claw_tentacle_desc = "Temporizadores para Tentáculo Garral."

	L.giant_claw_tentacle = "Tentáculo garral gigante"
	L.giant_claw_tentacle_desc = "Temporizadores para Tentáculo garral gigante."

	L.eye_tentacles = "Tentáculo ocular"
	L.eye_tentacles_desc = "Temporizadores para los 8 Tentáculos oculares."

	L.giant_eye_tentacle = "Tentáculo ocular gigante"
	L.giant_eye_tentacle_desc = "Temporizadores para Tentáculo ocular gigante."

	L.weakened_desc = "Anuncia debilidad."

	L.dark_glare_message = "%s: %s (Grupo %s)" -- Dark Glare: PLAYER_NAME (Group 1)
	L.stomach = "Estómago"
end

L = BigWigs:NewBossLocale("Ahn'Qiraj Trash", "esES")
if L then
	L.sentinel = "Centinela Anubisath" -- NPC 15264
	L.brainwasher = "Lavacerebros Qiraji" -- NPC 15247
	L.defender = "Defensor Anubisath" -- NPC 15277
	L.crawler = "Reptador de la colmena Vekniss" -- NPC 15240

	L.target_buffs = "Anuncios de beneficios de objetivo"
	L.target_buffs_desc = "Cuando tu objetivo es un Centinela Anubisath, muestra un anuncio sobre qué beneficio tiene"
	L.target_buffs_message = "Beneficios de objetivo: %s"
	L.detect_magic_missing_message = "Falta Detectar magia en tu objetivo"
	L.detect_magic_warning = "Un mago debe lanzar \124cff71d5ff\124Hspell:2855:0\124h[Detectar magia]\124h\124r en tu objetivo para que funcionen los anuncios de beneficios."
end

-- Blackwing Lair

L = BigWigs:NewBossLocale("Razorgore the Untamed", "esES")
if L then
	L.start_trigger = "¡Los invasores han penetrado en El Criadero!"

	L.eggs = "Contar huevos"
	L.eggs_desc = "Cuenta los huevos destruídos."
	L.eggs_message = "%d/30 huevos destruídos"
end

L = BigWigs:NewBossLocale("Vaelastrasz the Corrupt", "esES")
if L then
	L.warmup_trigger = "¡Demasiado tarde, amigos!"
end

L = BigWigs:NewBossLocale("Chromaggus", "esES")
if L then
	L.breath = "Alientos"
	L.breath_desc = "Anuncia los alientos."

	L.debuffs_message = "¡3/5 perjuicios, ten cuidado!"
	L.debuffs_warning = "¡4/5 perjuicios, %s al 5to!"
	L.bronze = "Bronce"

	L.vulnerability = "Cambio de vulnerabilidad"
	L.vulnerability_desc = "Anuncia cambios de vulnerabilidad."
	L.vulnerability_message = "Vulnerabilidad: %s"
	L.detect_magic_missing = "Falta Detectar magia en Chromaggus"
	L.detect_magic_warning = "Un mago debe lanzar \124cff71d5ff\124Hspell:2855:0\124h[Detectar magia]\124h\124r en Chromaggus para que funcionen los anuncios de vulnerabilidad."
end

L = BigWigs:NewBossLocale("Nefarian Classic", "esES")
if L then
	L.engage_yell_trigger = "¡Que comiencen los juegos!"
	L.stage3_yell_trigger = "¡Imposible! ¡Levantaos, esbirros!"

	L.shaman_class_call_yell_trigger = "Chamanes"
	L.deathknight_class_call_yell_trigger = "Caballeros de la Muerte"
	L.monk_class_call_yell_trigger = "Monjes"
	L.hunter_class_call_yell_trigger = "Cazadores"

	L.warnshaman = "¡Chamanes - aparecen tótems!"
	L.warndruid = "¡Druidas - atrapados en forma felina!"
	L.warnwarlock = "¡Brujos - infernales entrantes!"
	L.warnpriest = "¡Sacerdotes - las sanaciones hacen daño!"
	L.warnhunter = "¡Cazadores - armas rotas!"
	L.warnwarrior = "¡Guerreros - atrapados en actitud rabiosa!"
	L.warnrogue = "¡Pícaros - teletransportados y enredados!"
	L.warnpaladin = "¡Paladines - bendición de protección!"
	L.warnmage = "¡Magos - polimorfias entrantes!"
	--L.warndeathknight = "Death Knights - Death Grip"
	--L.warnmonk = "Monks - Stuck Rolling"
	--L.warndemonhunter = "Demon Hunters - Blinded"

	L.classcall = "Llamada de clase"
	L.classcall_desc = "Anucia las llamadas de clase."

	L.add = "Muertes de dracónidos"
	L.add_desc = "Anuncia el número de dracónidos muertos en fase 1 antes del aterrizaje de Nefarian."
end

L = BigWigs:NewBossLocale("Blackwing Lair Trash", "esES")
if L then
	L.wyrmguard_overseer = "Vermiguardia Garramortal / Sobrestante Garramortal" -- NPC 12460 / 12461
	L.sandstorm = "Tormenta de arena"

	L.target_vulnerability = "Anuncios de vulnerabilidad de objetivo"
	L.target_vulnerability_desc = "Cuando tu objetivo es un Vermiguardia Garramortal o un Sobrestante Garramortal, muestra un anuncio sobre qué vulnerabilidad tiene."
	L.target_vulnerability_message = "Vulnerabilidad de objetivo: %s"
	L.detect_magic_missing_message = "Falta Detectar magia en tu objetivo"
	L.detect_magic_warning = "Un mago debe lanzar \124cff71d5ff\124Hspell:2855:0\124h[Detectar magia]\124h\124r en tu objetivo para que funcionen los anuncios de vulnerabilidad."

	L.warlock = "Brujo Alanegra" -- NPC 12459
end

-- Molten Core

L = BigWigs:NewBossLocale("Ragnaros Classic", "esES")
if L then
	L.submerge_trigger = "¡SIERVOS, A MÍ!"
	L.son = "Hijo de la llama" -- NPC ID 12143
end

L = BigWigs:NewBossLocale("The Molten Core", "esES")
if L then
	L.bossName = "El Núcleo de Magma"
end
