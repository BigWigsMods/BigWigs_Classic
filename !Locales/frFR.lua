-- Ahn'Qiraj 20

local L = BigWigs:NewBossLocale("General Rajaxx", "frFR")
if L then
	L.wave_trigger1a = "Ils arrivent. Essayez de ne pas vous faire tuer, bleusaille."
	L.wave_trigger1b = "Alors, Rajaxx, tu te souviens que j\226\128\153avais dit que je te tuerais le dernier ?"
end

L = BigWigs:NewBossLocale("Buru the Gorger", "frFR")
if L then
	L.fixate_desc = "Se concentre sur une cible et ignore la menace des autres attaquants."
end

L = BigWigs:NewBossLocale("Ayamiss the Hunter", "frFR")
if L then
	L.sacrifice = "Sacrifice"
end

L = BigWigs:NewBossLocale("Ruins of Ahn'Qiraj Trash", "frFR")
if L then
	L.guardian = "Gardien anubisath"
end

-- Ahn'Qiraj 40

L = BigWigs:NewBossLocale("Viscidus", "frFR")
if L then
	L.freeze = "États de Gel"
	L.freeze_desc = "Annonce des différents états de gel"

	L.freeze_trigger1 = "%s commence à ralentir !"
	L.freeze_trigger2 = "%s est gelé !"
	L.freeze_trigger3 = "%s est congelé !"
	L.freeze_trigger4 = "%s commence à se briser !"
	L.freeze_trigger5 = "%s semble prêt à se briser !"

	L.freeze_warn1 = "Première phase de gel !"
	L.freeze_warn2 = "Deuxième phase de gel !"
	L.freeze_warn3 = "Viscidus est gelé !"
	L.freeze_warn4 = "Brisement - continuez !"
	L.freeze_warn5 = "Brisement - presque là !"
	L.freeze_warn_melee = "%d attaques en mêlée - %d de plus"
	L.freeze_warn_frost = "%d attaques de givre - %d de plus"
end

L = BigWigs:NewBossLocale("Silithid Royalty", "frFR")
if L then
	L[15543] = "Yauj"
	L[15544] = "Vem"
	L[15511] = "Kri"
end

L = BigWigs:NewBossLocale("Ouro", "frFR")
if L then
	L.emerge_message = "Ouro a émergé"
	L.emerge_bar = "Émergence"

	L.submerge_message = "Ouro a submergé"
	L.submerge_bar = "Submersion"
	L.submerge_early_message = "Submersion précoce - Personne n'était à portée"

	L.scarab = "Disparition des scarabées"
	L.scarab_desc = "Avertissement pour la disparition des scarabées."
	L.scarab_bar = "Scarabées disparaissent"
end

L = BigWigs:NewBossLocale("C'Thun", "frFR")
if L then
	L.claw_tentacle = "Tentacule griffu"
	L.claw_tentacle_desc = "Chronomètres pour le tentacule griffu."

	L.giant_claw_tentacle = "Tentacule griffu géant"
	L.giant_claw_tentacle_desc = "Chronomètres pour le tentacule griffu géant."

	L.eye_tentacles = "Tentacule oculaire"
	L.eye_tentacles_desc = "Chronomètres pour les 8 tentacules oculaires."

	L.giant_eye_tentacle = "Tentacule oculaire géant"
	L.giant_eye_tentacle_desc = "Chronomètres pour le tentacule oculaire géant."

	L.weakened_desc = "Annonce le affaiblissement."

	L.dark_glare_message = "%s: %s (Groupe %s)" -- Dark Glare: PLAYER_NAME (Group 1)
	L.stomach = "Estomac"
end

L = BigWigs:NewBossLocale("Ahn'Qiraj Trash", "frFR")
if L then
	L.sentinel = "Sentinelle Anubisath" -- NPC 15264
	L.brainwasher = "Lave-cerveaux qiraji" -- NPC 15247
	L.defender = "Défenseur Anubisath" -- NPC 15277
	L.crawler = "Rampant de la ruche vekniss" -- NPC 15240

	L.target_buffs = "Avertissement d'améliorations de la cible"
	L.target_buffs_desc = "Lorsque votre cible est un Sentinelle Anubisath, affiche un avertissement pour indiquer quelle amélioration il possède."
	L.target_buffs_message = "Améliorations de la cible : %s"
	L.detect_magic_missing_message = "La Détection de la magie est manquante sur votre cible"
	L.detect_magic_warning = "Un mage doit incanter \124cff71d5ff\124Hspell:2855:0\124h[Détection de la magie]\124h\124r sur votre cible pour que les avertissements d'améliorations fonctionnent."
end

-- Blackwing Lair

L = BigWigs:NewBossLocale("Razorgore the Untamed", "frFR")
if L then
	L.start_trigger = "Sonnez l'alarme"

	L.eggs = "Comptage des œufs"
	L.eggs_desc = "Compte le nombre d'œufs détruits."
	L.eggs_message = "%d/30 œufs détruits"
end

L = BigWigs:NewBossLocale("Vaelastrasz the Corrupt", "frFR")
if L then
	L.warmup_trigger = "Trop tard, mes amis"
end

L = BigWigs:NewBossLocale("Chromaggus", "frFR")
if L then
	L.breath = "Souffles"
	L.breath_desc = "Préviens de l'arrivée des souffles."

	L.debuffs_message = "3/5 affaiblissements, prudence !"
	L.debuffs_warning = "4/5 affaiblissements, %s sur le 5ème !"
	L.bronze = "Bronze"

	L.vulnerability = "Changement de vulnérabilité"
	L.vulnerability_desc = "Préviens quand la vulnérabilité change."
	L.vulnerability_message = "Vulnérabilité : %s"
	L.detect_magic_missing = "Détection de la magie est absente de Chromaggus"
	L.detect_magic_warning = "Un Mage doit incanter \124cff71d5ff\124Hspell:2855:0\124h[Détection de la magie]\124h\124r sur Chromaggus pour que les avertissements de vulnérabilité fonctionnent."
end

L = BigWigs:NewBossLocale("Nefarian Classic", "frFR")
if L then
	L.engage_yell_trigger = "Que les jeux commencent"
	L.stage3_yell_trigger = "C'est impossible"

	L.shaman_class_call_yell_trigger = "Chamans, montrez moi"
	L.deathknight_class_call_yell_trigger = "Chevalier de la mort"
	--L.monk_class_call_yell_trigger = "Monks"
	L.hunter_class_call_yell_trigger = "Ah, les chasseurs et les stupides"

	L.warnshaman = "Chamans - Totems posés !"
	L.warndruid = "Druides - Coincés en forme de félin !"
	L.warnwarlock = "Démonistes - Arrivée d'infernaux !"
	L.warnpriest = "Prêtre - Soins blessants !"
	L.warnhunter = "Chasseurs - Arcs/Fusils cassés !"
	L.warnwarrior = "Guerriers - Coincés en posture berseker !"
	L.warnrogue = "Voleurs - Téléportés et immobilisés !"
	L.warnpaladin = "Paladins - Bénédiction de protection !"
	L.warnmage = "Mages - Arrivée des métamorphoses !"
	--L.warndeathknight = "Death Knights - Death Grip"
	--L.warnmonk = "Monks - Stuck Rolling"
	--L.warndemonhunter = "Demon Hunters - Blinded"

	L.classcall = "Appel de classe"
	L.classcall_desc = "Préviens de l'arrivée des appels de classe."

	L.add = "Morts de drakônides"
	L.add_desc = "Annonce le nombre de serviteurs tués en phase 1 avant l'atterrissage de Nefarian"
end

L = BigWigs:NewBossLocale("Blackwing Lair Trash", "frFR")
if L then
	L.wyrmguard_overseer = "Garde wyrm Griffemort / Surveillant Griffemort" -- NPC 12460 / 12461
	L.sandstorm = "Tempête de sable"

	L.target_vulnerability = "Avertissements de vulnérabilité de la cible"
	L.target_vulnerability_desc = "Lorsque votre cible est un Garde wyrm Griffemort ou un Surveillant Griffemort, affichez un avertissement pour indiquer sa vulnérabilité."
	L.target_vulnerability_message = "Vulnérabilité de la cible: %s"
	L.detect_magic_missing_message = "Détection de la magie est absente de votre cible"
	L.detect_magic_warning = "Un mage doit incanter \124cff71d5ff\124Hspell:2855:0\124h[Détection de la magie]\124h\124r sur votre cible pour que les avertissements de vulnérabilité fonctionnent."

	L.warlock = "Démoniste de l'Aile noire" -- NPC 12459
end

-- Molten Core

L = BigWigs:NewBossLocale("Ragnaros Classic", "frFR")
if L then
	L.submerge_trigger = "VENEZ, MES SERVITEURS"
	L.son = "Fils des flammes" -- NPC ID 12143
end

L = BigWigs:NewBossLocale("The Molten Core", "frFR")
if L then
	--L.bossName = "The Molten Core"
end
