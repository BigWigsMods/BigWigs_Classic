-- Ahn'Qiraj 20

local L = BigWigs:NewBossLocale("General Rajaxx", "ptBR")
if L then
	L.wave_trigger1a = "Eles estão vindo. Tenta não morrer, sangue-bom."
	L.wave_trigger1b = "Você se lembra, Rajaxx, quando eu disse que ia te matar por último?"
end

L = BigWigs:NewBossLocale("Buru the Gorger", "ptBR")
if L then
	L.fixate_desc = "Fixa-se em um alvo, ignorando a ameaça de outros agressores."
end

L = BigWigs:NewBossLocale("Ayamiss the Hunter", "ptBR")
if L then
	L.sacrifice = "Sacrificar"
end

L = BigWigs:NewBossLocale("Ruins of Ahn'Qiraj Trash", "ptBR")
if L then
	L.guardian = "Guardião Anubisath"
end

-- Ahn'Qiraj 40

L = BigWigs:NewBossLocale("Viscidus", "ptBR")
if L then
	L.freeze = "Estados de congelamento"
	L.freeze_desc = "Aviso para os diferentes estados de congelamento."

	L.freeze_trigger1 = "%s começa a ficar lento!"
	L.freeze_trigger2 = "%s está congelando!"
	L.freeze_trigger3 = "%s está totalmente congelado!"
	L.freeze_trigger4 = "%s começa a rachar!"
	L.freeze_trigger5 = "%s parece estar a ponto de se estilhaçar!"

	L.freeze_warn1 = "Primeira fase de congelamento!"
	L.freeze_warn2 = "Segunda fase de congelamento!"
	L.freeze_warn3 = "Viscidus está congelado!"
	L.freeze_warn4 = "Rachando - continue!"
	L.freeze_warn5 = "Rachando - quase lá!"
	L.freeze_warn_melee = "%d ataques corpo a corpo - mais %d para ir"
	L.freeze_warn_frost = "%d ataques de gelo - mais %d para ir"
end

L = BigWigs:NewBossLocale("Silithid Royalty", "ptBR")
if L then
	L[15543] = "Yauj"
	L[15544] = "Veim"
	L[15511] = "Kri"
end

L = BigWigs:NewBossLocale("Ouro", "ptBR")
if L then
	L.emerge_message = "Ouro emergiu"
	L.emerge_bar = "Emersão"

	L.submerge_message = "Ouro submergiu"
	L.submerge_bar = "Submersão"
	L.submerge_early_message = "Submersão precoce - Ninguém estava no alcance"

	L.scarab = "Desaparecimento de escaravelho"
	L.scarab_desc = "Aviso para desaparecimento de escaravelho."
	L.scarab_bar = "Escaravelhos desaparecem"
end

L = BigWigs:NewBossLocale("C'Thun", "ptBR")
if L then
	L.claw_tentacle = "Tentáculo de Garra"
	L.claw_tentacle_desc = "Cronômetros para o tentáculo de garra."

	L.giant_claw_tentacle = "Tentáculo de Garra Gigante"
	L.giant_claw_tentacle_desc = "Cronômetros para o tentáculo de garra gigante."

	L.eye_tentacles = "Tentóculo"
	L.eye_tentacles_desc = "Cronômetros para os 8 tentóculos."

	L.giant_eye_tentacle = "Tentóculo Gigante"
	L.giant_eye_tentacle_desc = "Cronômetros para o tentóculo gigante."

	L.weakened_desc = "Aviso para estado enfraquecido."

	L.dark_glare_message = "%s: %s (Grupo %s)" -- Dark Glare: PLAYER_NAME (Group 1)
	L.stomach = "Estômago"
end

L = BigWigs:NewBossLocale("Ahn'Qiraj Trash", "ptBR")
if L then
	L.sentinel = "Sentinela Anubisath" -- NPC 15264
	L.brainwasher = "Lavamentes Qiraji" -- NPC 15247
	L.defender = "Defensor Anubisath" -- NPC 15277
	L.crawler = "Rastejante de Colmeia Vekniss" -- NPC 15240

	L.target_buffs = "Avisos de bônus do alvo"
	L.target_buffs_desc = "Quando o seu alvo é um Sentinela Anubisath, mostra um aviso sobre qual bônus ele possui."
	L.target_buffs_message = "Bônus do alvo: %s"
	L.detect_magic_missing_message = "Detectar Magia está ausente do seu alvo"
	L.detect_magic_warning = "Um mago deve lançar \124cff71d5ff\124Hspell:2855:0\124h[Detectar Magia]\124h\124r no seu alvo para que os avisos de bônus funcionem."
end

-- Blackwing Lair

L = BigWigs:NewBossLocale("Razorgore the Untamed", "ptBR")
if L then
	L.start_trigger = "Invasores violaram a incubadora!"

	L.eggs = "Contar ovos"
	L.eggs_desc = "Conta os ovos destruídos."
	L.eggs_message = "%d/30 ovos destruídos"
end

L = BigWigs:NewBossLocale("Vaelastrasz the Corrupt", "ptBR")
if L then
	L.warmup_trigger = "É tarde demais, meus amigos!"
end

L = BigWigs:NewBossLocale("Chromaggus", "ptBR")
if L then
	L.breath = "Respirações"
	L.breath_desc = "Aviso para as respirações."

	L.debuffs_message = "3/5 penalidades, cuidado!"
	L.debuffs_warning = "4/5 penalidades, %s na 5ª!"
	L.bronze = "Bronze"

	L.vulnerability = "Mudanças de vulnerabilidade"
	L.vulnerability_desc = "Aviso para mudanças de vulnerabilidade."
	L.vulnerability_message = "Vulnerabilidade: %s"
	L.detect_magic_missing = "Detectar Magia está ausente de Chromaggus"
	L.detect_magic_warning = "Um mago precisa lançar \124cff71d5ff\124Hspell:2855:0\124h[Detectar Magia]\124h\124r em Chromaggus para que os avisos de vulnerabilidade funcionem."
end

L = BigWigs:NewBossLocale("Nefarian Classic", "ptBR")
if L then
	L.engage_yell_trigger = "Que comecem os jogos!"
	L.stage3_yell_trigger = "Impossível! Ergam-se, meus lacaios!"

	L.shaman_class_call_yell_trigger = "Xamãs"
	--L.deathknight_class_call_yell_trigger = "Death Knights"
	--L.monk_class_call_yell_trigger = "Monks"
	L.hunter_class_call_yell_trigger = "Caçadores"

	L.warnshaman = "Xamãs - Totens aparecendo!"
	L.warndruid = "Druidas - Presos na forma de felino!"
	L.warnwarlock = "Bruxos - Infernais chegando!"
	L.warnpriest = "Sacerdotes - Curas causando dano!"
	L.warnhunter = "Caçadores - Arcos/Armas de fogo quebrados!"
	L.warnwarrior = "Guerreiros - Presos na Postura de Berserker!"
	L.warnrogue = "Ladinos - Teleportados e enraizados!"
	L.warnpaladin = "Paladinos - Bênção de Proteção!"
	L.warnmage = "Magos - Polimorfias chegando!"
	--L.warndeathknight = "Death Knights - Death Grip"
	--L.warnmonk = "Monks - Stuck Rolling"
	--L.warndemonhunter = "Demon Hunters - Blinded"

	L.classcall = "Chamada de classe"
	L.classcall_desc = "Aviso para chamadas de classe."

	L.add = "Mortes de draconídeo"
	L.add_desc = "Anuncia o número de draconídeos mortos na fase 1 antes de Nefarian aterrissar."
end

L = BigWigs:NewBossLocale("Blackwing Lair Trash", "ptBR")
if L then
	L.wyrmguard_overseer = "Serpeguarda Garra da Morte / Feitor Garra da Morte" -- NPC 12460 / 12461
	L.sandstorm = "Tempestade de Areia"

	L.target_vulnerability = "Avisos de vulnerabilidade do alvo"
	L.target_vulnerability_desc = "Quando o seu alvo é um Serpeguarda Garra da Morte ou um Feitor Garra da Morte, mostra um aviso sobre qual vulnerabilidade ele possui."
	L.target_vulnerability_message = "Vulnerabilidade do alvo: %s"
	L.detect_magic_missing_message = "Detectar Magia está ausente do seu alvo"
	L.detect_magic_warning = "Um mago precisa lançar \124cff71d5ff\124Hspell:2855:0\124h[Detectar Magia]\124h\124r no seu alvo para que os avisos de vulnerabilidade funcionem."

	L.warlock = "Bruxo Asa Negra" -- NPC 12459
end

-- Molten Core

L = BigWigs:NewBossLocale("Ragnaros Classic", "ptBR")
if L then
	L.submerge_trigger = "VENHAM, MEUS SERVOS"
	L.son = "Filho das Chamas" -- NPC ID 12143
end

L = BigWigs:NewBossLocale("The Molten Core", "ptBR")
if L then
	--L.bossName = "The Molten Core"
end
